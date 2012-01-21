namespace "reco"

class reco.Application
  run: () ->
    # Load any models we're interested in
    # Create the first view
    @categoryList = new reco.views.CategoryList()
    @categoryList.render()
    $("#doc").append( @categoryList.el )

reco.Application.run = () ->
  application = new reco.Application()
  application.run()
