class QuizViewController < UIViewController

  attr_reader :questions, :answers, :currentQuestionIndex

  def init
    @questions = ['What is 7 + 7?', 'What is the capital of Vermont?', 'From what is Cognac made?']
    @answers = ['14', 'Montpelier', 'Grapes']
    @currentQuestionIndex = -1
    super
  end

  def loadView
    self.view = QuizView.alloc.init
  end

  def viewDidLoad
    @showQuestionButton = UIButton.buttonWithType UIButtonTypeRoundedRect
    @showQuestionButton.setTitle 'Show Question', forState: UIControlStateNormal
    @showQuestionButton.frame = [[25, 50], [270, 50]]
    @showQuestionButton.addTarget(self, action: :showQuestion, forControlEvents: UIControlEventTouchUpInside)
    view.addSubview(@showQuestionButton)

    @questionLabel = UILabel.new
    @questionLabel.textAlignment = UITextAlignmentCenter
    @questionLabel.frame = [[25, 150], [270, 50]]
    @questionLabel.textColor = UIColor.whiteColor
    @questionLabel.backgroundColor = UIColor.clearColor
    view.addSubview(@questionLabel)

    @showAnswerButton = UIButton.buttonWithType UIButtonTypeRoundedRect
    @showAnswerButton.setTitle 'Show Answer', forState: UIControlStateNormal
    @showAnswerButton.frame = [[25, 250], [270, 50]]
    @showAnswerButton.addTarget(self, action: :showAnswer, forControlEvents: UIControlEventTouchUpInside)
    view.addSubview(@showAnswerButton)

    @answerLabel = UILabel.new
    @answerLabel.textAlignment = UITextAlignmentCenter
    @answerLabel.frame = [[25, 350], [270, 50]]
    @answerLabel.textColor = UIColor.whiteColor
    @answerLabel.backgroundColor = UIColor.clearColor
    view.addSubview(@answerLabel)
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
