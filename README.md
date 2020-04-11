# Lumen Learning Code Review Assignment
## Ruby

## Instructions
Write and share your code review for the pull request in this repo.

We're interested in how you respond to code at both a technical level and a team level, so please record your thoughtful response on how to improve the code, what you believe is particularly praiseworthy in the code, and advice in general which you would offer your teammate and the creator of this pull request.

Please do not spend more than an hour on this.

**IMPORTANT**
Please do **not** modify this repo directly, including forking on GitHub or adding notes to the pull request.

Instead, use the [template](review.md) for info on how to format your code review.

It is important for our process that we can review your work without the context or association of your GitHub account/details.

## Context and Acceptance Criteria

A developer with fifteen years of experience (including three at this company), **"A"**, has been working on an assessment system. The code in this repo relates to how those assessments are graded. For each question type allowed on an assessment, there are different requirements for how the grade is calculated. Developer A has written code to generate grades for the following question types:

### MULTIPLE CHOICE

![Multiple Choice questions are represented as radio buttons, where only one answer can be selected.](images/MultipleChoice.png)

In this case, only one answer from a number of answers can be chosen. If the correct answer is chosen, return 1.0; otherwise, return 0.0.

### MULTIPLE ANSWER

![Multiple Answer questions are represented as check boxes, where mulitple answers can be selected.](images/MultipleAnswer.png)

Here, multiple answers can be chosen from a range of answers. The returned grade should be the number of correctly chosen answers divided by the number of correct answers total. So, if a user chooses 1 out of 2 correct answers, they will be given 0.5. If they had chosen 2 out of 2 correct answers, they would have been given 1.0. There is no penalty for incorrect answers.

### MULTIPLE DROP DOWN

![Multiple Drop Down questions are represented as text with embedded drop down controls, where the selected choice of the drop down completes the text.](images/MultipleDragAndDrop.png)

Here, text is shown with drop down selections for certain words. A user is able to select only one selection for each of the chosen words. The grade would be the number of correctly chosen answers out of the total number of drop down selections. If a question had 4 embedded drop down selections and a user selected all of them correctly, the total would be 1.0. If they had selected only 1 drop down selection correctly, then the total would be 0.25.

Developer A's code has been previously reviewed and is in production.

A developer with four years of experience (including one year at this company), **"B"**, has been tasked with adding a new question type:

### CLOZE DRAG AND DROP

![Cloze Drag and Drop questions are represented as text with empty targets where words need to be filled in. Below are a pool of words which can be moved to fill in the targets in the text and complete sentences.](images/ClozeDragAndDrop.png)

In this question type, the question is presented as text with a number of blanks in it. Below the question is a pool of words, typically exceeding the number of blanks in the question.

The grade will be the number of correctly placed words divided by the number of words to fill in. Thus, if a user placed all the words correctly, that user would be given a 1.0. If they had placed 2 out of 5 words correctly, they would be given a 0.4. Words which belong in the sentence, just not at the position they were placed in, will be neither credited nor penalized. The exception to this case is if the user placed all the words correctly, just not in the correct order - in that case, the user will be given a 0.5 (no matter how many words were correctly placed).

The pull request you're reviewing is intended to implement this logic.
