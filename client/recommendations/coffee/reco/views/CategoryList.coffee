namespace "reco.views"

class reco.views.CategoryList extends reco.views.HandlebarsView
  initialize: ( options ) ->
    super
    @context = {
      categories: [
        {
          name: "Food",
          path: "#categories/food"
        },
        {
          name: "Brothels",
          path: "#categories/brothels"
        }]
    }

  templateSelector: "#CategoryList_template"
  elClass: "CategoryListView"
