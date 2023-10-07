package math;

public class checkAnswer {

    private int correct = 0;
    private int wrong = 0;

    public checkAnswer() {
    }

    public boolean checkAnswer(int userAnswer, int rand1, int rand2) {
        int correctAnswer = rand1 + rand2;

        return userAnswer == correctAnswer;
    }

    public int getCorrect() {
        return correct;
    }

    public int getWrong() {
        return wrong;
    }

    public void incrementCorrect() {
        correct++;
    }

    public void incrementWrong() {
        wrong++;
    }
}
