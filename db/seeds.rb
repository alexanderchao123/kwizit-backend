user = User.create(first_name: "Alex", last_name: "Chao", email: "alex@chao.com", password: "password")

quiz = user.created_quizzes.create(title: "First Grade Math", description: "This quiz is suitable for children in first grade. The math is based on Common Core State Standards. This quiz challenges students to see how math can be fun!")

first_question = quiz.questions.create(title: "What is 1 + 1?", difficulty: "easy")
first_question_first_choice = first_question.choices.create(answer: 18)
first_question_second_choice = first_question.choices.create(answer: 7)
first_question_third_choice = first_question.choices.create(answer: 2, correct: true)
first_question_fourth_choice = first_question.choices.create(answer: 10)

second_question = quiz.questions.create(title: "What is 3 + 3?", difficulty: "easy")
second_question_first_choice = second_question.choices.create(answer: 33)
second_question_second_choice = second_question.choices.create(answer: 1)
second_question_third_choice = second_question.choices.create(answer: 7)
second_question_fourth_choice = second_question.choices.create(answer: 6, correct: true)
