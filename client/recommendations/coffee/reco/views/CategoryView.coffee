namespace "reco.views"

class reco.views.CategoryView extends Backbone.View
  templateSelector: "#CategoryView_template"
  elClass: "CategoryView"

  initialize: ->
    super
    @questionView = new reco.views.CategoryView.QuestionView()
    @recommendationsListView = new reco.views.CategoryView.RecommendationsListView()
    $(@el).append( @questionView.el )
    $(@el).append( @recommendationsListView.el )

  render: ->
    super
    @questionView.render()
    @recommendationsListView.render()

    @$(".QuestionView_placeholder").replaceWith( @questionView.el )
    @$(".RecommendationsListView_placeholder").replaceWith( @recommendationsListView.el )
