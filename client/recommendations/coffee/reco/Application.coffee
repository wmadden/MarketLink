namespace "reco"

class reco.Application extends Backbone.Router
  routes: {
    "categories": "categories",
    "categories/:category": "category"
  }
  
  run: ->
    @categoriesView = new reco.views.CategoryList()
    @categoryView = new reco.views.CategoryView()
    @navigate("categories")
    Backbone.history.start()
  
  categories: ->
    @showTopLevelView( @categoriesView )

  category: ( category ) ->
    @categoryView.category = category
    @showTopLevelView( @categoryView )

  showTopLevelView: (view) ->
    if @currentView?
      @currentView.remove()
    view.render()
    $("#doc").append( view.el )
    @currentView = view

reco.Application.run = () ->
  application = new reco.Application()
  application.run()
