namespace "reco"

class reco.Application extends Backbone.Router
  routes: {
    "/": "rootRoute",
    "/categories": "categoriesRoute",
    "/categories/:category": "categoryRoute"
  }
  
  run: ->
    @categoriesView = new reco.views.CategoryList()
    @categoriesView.categories = @categories
    @categoryView = new reco.views.CategoryView()
    Backbone.history.start()
  
  categories: [
    {
      name: "Food",
      path: "#/categories/food"
    },
    {
      name: "Brothels",
      path: "#/categories/brothels"
    }
  ]

  rootRoute: ->
    @navigate("/categories", "categoriesRoute")

  categoriesRoute: ->
    @showTopLevelView( @categoriesView )

  categoryRoute: ( category ) ->
    @categoryView.category = category
    @showTopLevelView( @categoryView )

  showTopLevelView: (view) ->
    if @currentView?
      @currentView.remove()
    view.render()
    $("#bd").html( view.el )
    @currentView = view

reco.Application.run = () ->
  application = new reco.Application()
  application.run()
