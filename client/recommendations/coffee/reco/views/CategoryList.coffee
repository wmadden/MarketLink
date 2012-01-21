namespace "reco.views"

class reco.views.CategoryList extends Backbone.View
  initialize: ( options ) ->
    @template = Handlebars.compile( $("#CategoryList_template").html() )
    @context = {
      categories: ["Food", "Brothels"]
    }

  render: () ->
    rendered = @template( @context )
    $(@el).append( rendered )
    
