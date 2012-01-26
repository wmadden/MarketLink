namespace "reco.views"

class reco.views.CategoryView extends Backbone.View
  templateSelector: "#CategoryView_template"
  elClass: "CategoryView"

  initialize: ->
    super
    @questionView = new reco.views.CategoryView.QuestionView()
    @recommendationsView = new reco.views.CategoryView.RecommendationsView()
    $(@el).append( @questionView.el )
    $(@el).append( @recommendationsView.el )

  render: ->
    super
    @questionView.render()
    @recommendationsView.render()
