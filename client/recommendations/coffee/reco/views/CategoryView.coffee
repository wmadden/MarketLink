namespace "reco.views"

class reco.views.CategoryView extends Backbone.View
  templateSelector: "#CategoryView_template"
  elClass: "CategoryView"

  initialize: ->
    super
    @questionView = new reco.views.CategoryView.QuestionView()
    @recommendationListView = new reco.views.CategoryView.RecommendationListView()
    $(@el).append( @questionView.el )
    $(@el).append( @recommendationListView.el )

  render: ->
    super
    @questionView.render()
    @recommendationListView.render()

    @$(".QuestionView_placeholder").replaceWith( @questionView.el )
    @$(".RecommendationListView_placeholder").replaceWith( @recommendationListView.el )
