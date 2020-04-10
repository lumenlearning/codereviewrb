Question = Struct.new(:question_type, :prompt)

Choice = Struct.new(:key, :text, :correct)

def grader(question, choices, responses)
    if question.question_type == "MULTIPLE_CHOICE"
        chosen_response = choices[0].detect { |choice| choice.key == responses[0] }
        (chosen_response && chosen_response.correct) ? 1.0 : 0.0
    elsif question.question_type == "MULTIPLE_ANSWER"
        correct_responses = choices[0].select { |choice| choice.correct }
        chosen_responses = choices[0].select { |choice| choice.correct && responses.include?(choice.key) }
        chosen_responses.size.to_f / correct_responses.size.to_f
    elsif question.question_type = "MULTIPLE_DROPDOWNS"
        correct_responses = choices.to_enum(:each_with_index).collect do |dropdown_choice, index|
            current_response = responses[index]
            current_chosen_choice = dropdown_choice.detect { |choice| current_response == choice.key }
            (current_chosen_choice && current_chosen_choice.correct) ? 1.0 : 0.0
        end.inject(0) do |sum, curr_response|
            sum + curr_response
        end
        correct_responses / choices.size.to_f
    else
        0.0
    end
end
