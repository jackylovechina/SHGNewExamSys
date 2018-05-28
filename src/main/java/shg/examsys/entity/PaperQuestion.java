package shg.examsys.entity;

public class PaperQuestion {

	private Long id;
	private Long pap_id;
	private Long que_id;
	private Paper paper;
	private Question question;
	private Double value;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getPap_id() {
		return pap_id;
	}

	public void setPap_id(Long pap_id) {
		this.pap_id = pap_id;
	}

	public Long getQue_id() {
		return que_id;
	}

	public void setQue_id(Long que_id) {
		this.que_id = que_id;
	}

	public Paper getPaper() {
		return paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

}
