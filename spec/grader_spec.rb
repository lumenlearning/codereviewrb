require 'grader'

RSpec.describe :grader do
    context "MULTIPLE_CHOICE" do
        question = Question.new("MULTIPLE_CHOICE", "What is the answer?")
        choices = [[
            Choice.new("A", "A", true),
            Choice.new("B", "B", false)
        ]]

        it "should return 1.0 for correct answer" do
            expect(grader(question, choices, ["A"])).to eq(1.0)
        end

        it "should return 0.0 for incorrect answer" do
            expect(grader(question, choices, ["B"])).to eq(0.0)
        end
    end

    context "MULTIPLE_ANSWER" do
        question = Question.new("MULTIPLE_ANSWER", "What is the answer?")
        choices = [[
            Choice.new("A", "A", true),
            Choice.new("B", "B", false),
            Choice.new("C", "C", true)
        ]]

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

    context "MULTIPLE_DROPDOWNS" do
        question = Question.new("MULTIPLE_DROPDOWNS", "For {dropdown1}, then {dropdown2}")
        choices = [
            [
                Choice.new("A", "A", true),
                Choice.new("B", "B", false)
            ],
            [
                Choice.new("C", "C", false),
                Choice.new("D", "D", true)
            ]
        ]

        it "should return 1.0 for a correct answer" do
            expect(grader(question, choices, ["A", "D"])).to eq(1.0)
        end

        it "should return 1.0 for an incorrect answer" do
            expect(grader(question, choices, ["B", "C"])).to eq(0.0)
        end

        it "should return partial score for partially correct answer" do
            expect(grader(question, choices, ["A", "C"])).to eq(0.5)
        end
    end

    context "CLOZE_DRAG_AND_DROP" do
        question = Question.new("CLOZE_DRAG_AND_DROP", "For {target1}, then {target2}.")
        choices = [[
            Choice.new("A", "A", true, 1),
            Choice.new("B", "B", true, 2)
        ]]

        it("should return 1.0 if responses match correct choices in order") do
            expect(grader(question, choices, ["A", "B"])).to eq(1.0)
        end

        it("should return 0.5 if responses are out of order") do
            expect(grader(question, choices, ["B", "A"])).to eq(0.5)
        end
    end
end
