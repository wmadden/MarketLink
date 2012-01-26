namespace "reco.views"

class reco.views.HandlebarsView extends Backbone.View
  initialize: ( options ) ->
    @template = Handlebars.compile( $(@templateSelector).html() )
    $(@el).addClass( @elClass )

  render: ->
    rendered = @template( @context )
    $(@el).html( rendered )
