Question = Struct.new(:question_type, :prompt)

Choice = Struct.new(:key, :text, :correct, :correct_order)

def grader(question, choices, responses)
    if question.question_type == "MULTIPLE_CHOICE"
        chosen_response = choices[0].detect { |choice| choice.key == responses[0] }
        (chosen_response && chosen_response.correct) ? 1.0 : 0.0
    elsif question.question_type == "MULTIPLE_ANSWER"
        correct_responses = choices[0].select { |choice| choice.correct }
        chosen_responses = choices[0].select { |choice| choice.correct && responses.include?(choice.key) }
        chosen_responses.size.to_f / correct_responses.size.to_f
    elsif question.question_type == "MULTIPLE_DROPDOWNS"
        correct_responses = choices.to_enum(:each_with_index).collect do |dropdown_choice, index|
            current_response = responses[index]
            current_chosen_choice = dropdown_choice.detect { |choice| current_response == choice.key }
            (current_chosen_choice && current_chosen_choice.correct) ? 1.0 : 0.0
        end.inject(0) do |sum, curr_response|
            sum + curr_response
        end
        correct_responses / choices.size.to_f
    elsif question.question_type == "CLOZE_DRAG_AND_DROP"
        ccio = choices[0].sort_by { |choice| choice.correct_order }
        ccio_keys = ccio.collect { |choice| choice.key }
        if ccio_keys == responses
            1.0
        else
            all_keys_present = true
            for r in responses
                if !ccio_keys.include?(r)
                    all_keys_present = false
                end
            end
            (all_keys_present) ? 0.5 : 0.0
        end
    else
        0.0
    end
end
