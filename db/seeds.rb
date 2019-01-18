user = User.create(first_name: "Alex", last_name: "Chao", email: "alex@chao.com", password: "password")

quiz = user.created_quizzes.create(title: "First Grade Math", description: "This quiz is suitable for children in first grade. The math is based on Common Core State Standards. This quiz challenges students to see how math can be fun!")

first_question = quiz.questions.create(title: "What is 1 + 1?", difficulty: "easy")
first_question_first_choice = first_question.choices.create(answer: 18)
first_question_second_choice = first_question.choices.create(answer: 7)
first_question_third_choice = first_question.choices.create(answer: 2, correct: true)
first_question_fourth_choice = first_question.choices.create(answer: 10)
