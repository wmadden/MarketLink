namespace "reco.views.CategoryView"

class reco.views.CategoryView.QuestionView extends reco.views.HandlebarsView
  templateSelector: "#QuestionView_template"
  elClass: "QuestionView"

  context: ->
    {
      question: { 
        text: "Some question?",
        possibleResponses: [
          {
            polarity: "positive",
            text: "Yes"
          },
          {
            polarity: "negative",
            text: "No"
          },
          {
            text: "Maybe"
          }
        ]
      }
    }
