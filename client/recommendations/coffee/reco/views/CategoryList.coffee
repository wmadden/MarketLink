namespace "reco.views"

class reco.views.CategoryList extends reco.views.HandlebarsView
  initialize: ( options ) ->
    super
  
  context: ->
    {
      categories: @categories
    }

  categories: []

  templateSelector: "#CategoryList_template"
  elClass: "CategoryListView"
