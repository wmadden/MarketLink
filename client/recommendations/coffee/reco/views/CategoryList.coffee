namespace "reco.views"

class reco.views.CategoryList extends Backbone.View
  initialize: ( options ) ->
    @template = Handlebars.compile( $("#CategoryList_template").html() )
    @context = {
      categories: [
        {
          name: "Food",
          path: "#category/food"
        },
        {
          name: "Brothels",
          path: "#category/brothels"
        }]
    }
    $(@el).addClass("CategoryList")

  render: () ->
    rendered = @template( @context )
    $(@el).append( rendered )
