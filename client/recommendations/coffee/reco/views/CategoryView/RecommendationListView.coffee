namespace "reco.views.CategoryView"

class reco.views.CategoryView.RecommendationListView extends reco.views.HandlebarsView
  templateSelector: "#RecommendationListView_template"
  elClass: "RecommendationListView"

  context: -> {
    recommendations: [
      {
        url: "abc",
        text: "Some Recommendation"
      },
      {
        url: "def",
        text: "Some Other Recommendation"
      }
    ]
  }
