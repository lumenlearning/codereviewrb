Question = Struct.new(:question_type, :prompt)

Choice = Struct.new(:key, :text, :correct)

def grader(question, choices, responses)
    if question.question_type == "MULTIPLE_CHOICE"
        chosen_response = choices.detect { |choice| choice.key == responses[0] }
        (chosen_response && chosen_response.correct) ? 1.0 : 0.0
    elsif question.question_type == "MULTIPLE_ANSWER"
        correct_responses = choices.select { |choice| choice.correct }
        chosen_responses = choices.select { |choice| choice.correct && responses.include?(choice.key) }
        chosen_responses.size.to_f / correct_responses.size.to_f
    else
        0.0
    end
end
