require 'grader'

RSpec.describe :grader do
    context "MULTIPLE_CHOICE" do
        question = Question.new("MULTIPLE_CHOICE", "What is the answer?")
        choices = [
            Choice.new("A", "A", true),
            Choice.new("B", "B", false)
        ]

        it "should return 1.0 for correct answer" do
            expect(grader(question, choices, ["A"])).to eq(1.0)
        end

        it "should return 0.0 for incorrect answer" do
            expect(grader(question, choices, ["B"])).to eq(0.0)
        end
    end

    context "MULTIPLE_ANSWER" do
        question = Question.new("MULTIPLE_ANSWER", "What is the answer?")
        choices = [
            Choice.new("A", "A", true),
            Choice.new("B", "B", false),
            Choice.new("C", "C", true)
        ]

        it "should return 1.0 for a correct answer" do
            expect(grader(question, choices, ["A", "C"])).to eq(1.0)
        end

        it "should return 1.0 for an incorrect answer" do
            expect(grader(question, choices, ["B"])).to eq(0.0)
        end

        it "should return partial score for partially correct answer" do
            expect(grader(question, choices, ["A"])).to eq(0.5)
        end
    end
end
