Teacup::Stylesheet.new(:quiz_view) do

  style UIButton,
    width:  270,
    height: 50

  style UILabel,
    width:  270,
    height: 50,
    textAlignment: UITextAlignmentCenter,
    textColor:  UIColor.whiteColor,
    backgroundColor: UIColor.clearColor

end

class QuizViewController < UIViewController
  stylesheet :quiz_view

  attr_reader :questions, :answers, :currentQuestionIndex

  def init
    @questions = ['What is 7 + 7?', 'What is the capital of Vermont?', 'From what is Cognac made?']
    @answers = ['14', 'Montpelier', 'Grapes']
    @currentQuestionIndex = -1
    super
  end

  def loadView
    self.view = UIView.alloc.init
  end

  layout do
    @showQuestionButton = subview(UIButton.buttonWithType(UIButtonTypeRoundedRect), 
      title:  "Show Question",
      left: 25, top: 50)

    @showAnswerButton = subview(UIButton.buttonWithType(UIButtonTypeRoundedRect),
      title:  "Show Answer",
      left: 25, top: 250)

    @questionLabel = subview(UILabel,
      left: 25, top: 100)

    @answerLabel = subview(UILabel,
      left: 25, top: 300)

    # Add our events
    @showQuestionButton.addTarget(self, action: :showQuestion, forControlEvents: UIControlEventTouchUpInside)
    @showAnswerButton.addTarget(self, action: :showAnswer, forControlEvents: UIControlEventTouchUpInside)
  end

  def showQuestion
    @currentQuestionIndex += 1
    @currentQuestionIndex = 0 if @currentQuestionIndex > (@questions.size - 1)
    @questionLabel.text = @questions[@currentQuestionIndex]
    @answerLabel.text = ''
  end

  def showAnswer
    @answerLabel.text = @answers[@currentQuestionIndex]
  end

end
