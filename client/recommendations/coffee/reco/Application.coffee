namespace "reco"

class reco.Application
  run: () ->
    # Load any models we're interested in
    # Create the first view
    alert("Hello World!")

reco.Application.run = () ->
  application = new reco.Application()
