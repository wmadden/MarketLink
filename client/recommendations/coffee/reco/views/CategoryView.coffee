namespace "reco.views"

class reco.views.CategoryView extends Backbone.View

  initialize: ->
    @questionView = new reco.views.CategoryView.QuestionView()
    @recommendationsView = new reco.views.CategoryView.RecommendationsView()
    $(@el).append( @questionView.el )
    $(@el).append( @recommendationsView.el )

  render: ->
    @questionView.render()
    @recommendationsView.render()
