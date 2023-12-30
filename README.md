# Game1
This assembly code appears to implement a simple text-based quiz game. Let's break down the key components:

Data Section:

question1, question2: Strings representing two quiz questions.
answer1A, answer1B, answer1C, answer2A, answer2B, answer2C: Strings representing answer choices for the respective questions.
correctAnswer1, correctAnswer2: Characters representing the correct answers for the questions.
userAnswer: A variable to store the user's answer.
correctMessage, incorrectMessage: Strings for displaying feedback.
Code Section (MAIN PROC):

Initializes the data segment.
Calls procedures to display and process the first question, get user input, check the answer, and display feedback.
Repeats the process for the second question.
Terminates the program.
Question Display Procedures:

DisplayQuestion1, DisplayQuestion2: Display the respective questions and answer choices.
User Input Procedure:

GetUserInput: Takes user input and converts it to an uppercase character.
Answer Checking Procedures:

CheckAnswer1, CheckAnswer2: Compare the user's answer with the correct answer, display feedback, and jump to labels based on correctness.
Uppercase Conversion Procedure:

ConvertToUpper: Converts the user's answer to uppercase.
Feedback Display Procedure:

DisplayFeedback: A placeholder for displaying feedback. Actual feedback display logic is not implemented in this code.
In summary, the program interacts with the user by displaying questions, receiving input, checking correctness, and providing feedback. The specific feedback logic is left as a placeholder in the DisplayFeedback procedure. The code focuses on the flow of a quiz game, where users answer questions and receive feedback on their answers.
