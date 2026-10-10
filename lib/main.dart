import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const QuizSparkApp());
}

class QuizSparkApp extends StatelessWidget {
  const QuizSparkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuizSpark',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF7F3FF),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

// ---------------------------------------------------------
// QUESTION MODEL
// ---------------------------------------------------------

class Question {
  final String question;
  final List<String> options;
  final String answer;

  Question({
    required this.question,
    required this.options,
    required this.answer,
  });
}

// ---------------------------------------------------------
// QUESTION BANK
// ---------------------------------------------------------

final List<Question> questionBank = [
  Question(
    question: 'What does CPU stand for?',
    options: [
      'Central Processing Unit',
      'Computer Personal Unit',
      'Central Program Utility',
      'Control Processing User',
    ],
    answer: 'Central Processing Unit',
  ),

  Question(
    question: 'Which device is used to type text into a computer?',
    options: [
      'Monitor',
      'Keyboard',
      'Printer',
      'Speaker',
    ],
    answer: 'Keyboard',
  ),

  Question(
    question: 'Which language is mainly used to style web pages?',
    options: [
      'HTML',
      'CSS',
      'C',
      'Python',
    ],
    answer: 'CSS',
  ),

  Question(
    question: 'What does HTML stand for?',
    options: [
      'Hyper Text Markup Language',
      'High Text Machine Language',
      'Hyper Tool Multi Language',
      'Home Text Markup Language',
    ],
    answer: 'Hyper Text Markup Language',
  ),

  Question(
    question: 'Which one is an operating system?',
    options: [
      'Windows',
      'Google',
      'Facebook',
      'Chrome',
    ],
    answer: 'Windows',
  ),

  Question(
    question: 'Which symbol is commonly used to start a comment in Dart?',
    options: [
      '//',
      '##',
      '<!--',
      '**',
    ],
    answer: '//',
  ),

  Question(
    question: 'Which company developed Flutter?',
    options: [
      'Microsoft',
      'Google',
      'Apple',
      'IBM',
    ],
    answer: 'Google',
  ),

  Question(
    question: 'Which of these is a programming language?',
    options: [
      'Python',
      'Windows',
      'Chrome',
      'Android',
    ],
    answer: 'Python',
  ),

  Question(
    question: 'What is the full form of RAM?',
    options: [
      'Random Access Memory',
      'Read Access Memory',
      'Run Active Memory',
      'Random Application Module',
    ],
    answer: 'Random Access Memory',
  ),

  Question(
    question: 'Which device displays information from a computer?',
    options: [
      'Keyboard',
      'Mouse',
      'Monitor',
      'Scanner',
    ],
    answer: 'Monitor',
  ),

  Question(
    question: 'Which of these is used to browse websites?',
    options: [
      'Web Browser',
      'Calculator',
      'Notepad',
      'File Manager',
    ],
    answer: 'Web Browser',
  ),

  Question(
    question: 'What does URL stand for?',
    options: [
      'Uniform Resource Locator',
      'Universal Record Link',
      'User Resource Language',
      'Uniform Read Locator',
    ],
    answer: 'Uniform Resource Locator',
  ),

  Question(
    question: 'Which one is an input device?',
    options: [
      'Printer',
      'Monitor',
      'Mouse',
      'Speaker',
    ],
    answer: 'Mouse',
  ),

  Question(
    question: 'Which one is an output device?',
    options: [
      'Keyboard',
      'Mouse',
      'Monitor',
      'Scanner',
    ],
    answer: 'Monitor',
  ),

  Question(
    question: 'What does Wi-Fi allow devices to do?',
    options: [
      'Connect wirelessly to a network',
      'Print documents only',
      'Increase screen size',
      'Charge batteries',
    ],
    answer: 'Connect wirelessly to a network',
  ),
];

// ---------------------------------------------------------
// WELCOME / LOGIN SCREEN
// ---------------------------------------------------------

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController nameController = TextEditingController();

  void startQuiz() {
    String name = nameController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your name first.'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizScreen(studentName: name),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(35),
                child: Column(
                  children: [
                    const Icon(
                      Icons.quiz,
                      size: 80,
                      color: Colors.deepPurple,
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      'QuizSpark',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Test Your Knowledge!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 35),

                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Student Name',
                        hintText: 'Enter your name',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onSubmitted: (_) => startQuiz(),
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: startQuiz,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Start Quiz',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Questions will be different each time!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------
// QUIZ SCREEN
// ---------------------------------------------------------

class QuizScreen extends StatefulWidget {
  final String studentName;

  const QuizScreen({
    super.key,
    required this.studentName,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> quizQuestions;

  int currentQuestion = 0;
  int score = 0;
  String? selectedAnswer;
  bool answered = false;

  @override
  void initState() {
    super.initState();

    // Make a copy of the question bank.
    quizQuestions = List.from(questionBank);

    // Randomize the questions.
    quizQuestions.shuffle(Random());

    // Select only 10 questions.
    quizQuestions = quizQuestions.take(10).toList();

    // Randomize the options for every question.
    for (Question question in quizQuestions) {
      question.options.shuffle(Random());
    }
  }

  void selectAnswer(String answer) {
    if (answered) return;

    setState(() {
      selectedAnswer = answer;
      answered = true;

      if (answer == quizQuestions[currentQuestion].answer) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion < quizQuestions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
        answered = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            studentName: widget.studentName,
            score: score,
            totalQuestions: quizQuestions.length,
          ),
        ),
      );
    }
  }

  Color optionColor(String option) {
    if (!answered) {
      return Colors.white;
    }

    if (option == quizQuestions[currentQuestion].answer) {
      return Colors.green.shade100;
    }

    if (option == selectedAnswer) {
      return Colors.red.shade100;
    }

    return Colors.white;
  }

  IconData? optionIcon(String option) {
    if (!answered) return null;

    if (option == quizQuestions[currentQuestion].answer) {
      return Icons.check_circle;
    }

    if (option == selectedAnswer) {
      return Icons.cancel;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    Question question = quizQuestions[currentQuestion];

    double progress =
        (currentQuestion + 1) / quizQuestions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello, ${widget.studentName}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Question ${currentQuestion + 1} of ${quizQuestions.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  LinearProgressIndicator(
                    value: progress,
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  const SizedBox(height: 30),

                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Text(
                        question.question,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  ...question.options.map(
                    (option) => Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: SizedBox(
                        width: double.infinity,
                        child: Card(
                          color: optionColor(option),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: answered &&
                                      option ==
                                          question.answer
                                  ? Colors.green
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () => selectAnswer(option),
                            child: Padding(
                              padding: const EdgeInsets.all(18),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      option,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  if (optionIcon(option) != null)
                                    Icon(
                                      optionIcon(option),
                                      color: option ==
                                              question.answer
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  if (answered)
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: nextQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          currentQuestion ==
                                  quizQuestions.length - 1
                              ? 'See Result'
                              : 'Next Question',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------
// RESULT SCREEN WITH ANIMATION
// ---------------------------------------------------------

class ResultScreen extends StatefulWidget {
  final String studentName;
  final int score;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.studentName,
    required this.score,
    required this.totalQuestions,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    scaleAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticOut,
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void playAgain() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    double percentage =
        (widget.score / widget.totalQuestions) * 100;

    String message;

    if (percentage >= 80) {
      message = 'Excellent Work! 🌟';
    } else if (percentage >= 60) {
      message = 'Great Job! 👏';
    } else if (percentage >= 40) {
      message = 'Good Effort! 👍';
    } else {
      message = 'Keep Practicing! 💪';
    }

    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: scaleAnimation,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 550),
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(35),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.celebration,
                        size: 90,
                        color: Colors.amber,
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        'Congratulations!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        'Well done, ${widget.studentName}!',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 25),

                      Text(
                        message,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30),

                      Container(
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Your Score',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              '${widget.score} / ${widget.totalQuestions}',
                              style: const TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              '${percentage.toStringAsFixed(0)}%',
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton.icon(
                          onPressed: playAgain,
                          icon: const Icon(Icons.refresh),
                          label: const Text(
                            'Play Again',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}