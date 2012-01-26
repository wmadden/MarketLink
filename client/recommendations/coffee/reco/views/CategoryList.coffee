namespace "reco.views"

class reco.views.CategoryList extends reco.views.HandlebarsView
  initialize: ( options ) ->
    super
  
  context: ->
    {
      categories: @categories
    }

  categories: []

  templateSelector: "#CategoryListView_template"
  elClass: "CategoryListView"
