user = User.create(first_name: "Alex", last_name: "Chao", email: "alex@chao.com", password: "password")

quiz = user.created_quizzes.create(title: "First Grade Math", description: "This quiz is suitable for children in first grade. The math is based on Common Core State Standards. This quiz challenges students to see how math can be fun!")

first_question = quiz.questions.create(title: "What is 1 + 1?", difficulty: "easy")
first_question_first_answer = first_question.answers.create(title: 18)
first_question_second_answer = first_question.answers.create(title: 7)
first_question_third_answer = first_question.answers.create(title: 2, correct: true)
first_question_fourth_answer = first_question.answers.create(title: 10)
# second_question = quiz.questions.create(title: "What is 3 + 7?", difficulty: "easy")
# third_question = quiz.questions.create(title: "What is 12 + 21?", difficulty: "medium")
# fourth_question = quiz.questions.create(title: "What is 101 + 19?", difficulty: "hard")
