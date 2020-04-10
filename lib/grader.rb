Question = Struct.new(:question_type, :prompt)

Choice = Struct.new(:key, :text, :correct)

def grader(question, choices, response)
    if question.question_type == "MULTIPLE_CHOICE"
        chosen_response = choices.detect { |choice| choice.key == response }
        (chosen_response && chosen_response.correct) ? 1.0 : 0.0
    else
        0.0
    end
end
