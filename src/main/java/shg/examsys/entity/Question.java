package shg.examsys.entity;

public class Question {

	private long id;
	private long conType_id;
	private long queType_id;
	private String questionContent;
	private String choiceA;
	private String choiceB;
	private String choiceC;
	private String choiceD;
	private String standardAnswer;
	private boolean orderly;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getConType_id() {
		return conType_id;
	}

	public void setConType_id(long conType_id) {
		this.conType_id = conType_id;
	}

	public long getQueType_id() {
		return queType_id;
	}

	public void setQueType_id(long queType_id) {
		this.queType_id = queType_id;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public String getChoiceA() {
		return choiceA;
	}

	public void setChoiceA(String choiceA) {
		this.choiceA = choiceA;
	}

	public String getChoiceB() {
		return choiceB;
	}

	public void setChoiceB(String choiceB) {
		this.choiceB = choiceB;
	}

	public String getChoiceC() {
		return choiceC;
	}

	public void setChoiceC(String choiceC) {
		this.choiceC = choiceC;
	}

	public String getChoiceD() {
		return choiceD;
	}

	public void setChoiceD(String choiceD) {
		this.choiceD = choiceD;
	}

	public String getStandardAnswer() {
		return standardAnswer;
	}

	public void setStandardAnswer(String standardAnswer) {
		this.standardAnswer = standardAnswer;
	}

	public boolean isOrderly() {
		return orderly;
	}

	public void setOrderly(boolean orderly) {
		this.orderly = orderly;
	}

}