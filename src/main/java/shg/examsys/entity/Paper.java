package shg.examsys.entity;

public class Paper extends PageEntity{

	private Long id;
	private Long exam_id;
	private String name;
	private Double totalScore;
	private Integer singleChoiceCount;
	private Integer multiChoiceCount;
	private Integer blankCount;
	private Integer judgeCount;
	private Integer descriptionCount;
	private Double singleChoiceValue;
	private Double multiChoiceValue;
	private Double blankValue;
	private Double judgeValue;
	private Double descriptionValue;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getExam_id() {
		return exam_id;
	}

	public void setExam_id(Long exam_id) {
		this.exam_id = exam_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(Double totalScore) {
		this.totalScore = totalScore;
	}

	public Integer getSingleChoiceCount() {
		return singleChoiceCount;
	}

	public void setSingleChoiceCount(Integer singleChoiceCount) {
		this.singleChoiceCount = singleChoiceCount;
	}

	public Integer getMultiChoiceCount() {
		return multiChoiceCount;
	}

	public void setMultiChoiceCount(Integer multiChoiceCount) {
		this.multiChoiceCount = multiChoiceCount;
	}

	public Integer getBlankCount() {
		return blankCount;
	}

	public void setBlankCount(Integer blankCount) {
		this.blankCount = blankCount;
	}

	public Integer getJudgeCount() {
		return judgeCount;
	}

	public void setJudgeCount(Integer judgeCount) {
		this.judgeCount = judgeCount;
	}

	public Integer getDescriptionCount() {
		return descriptionCount;
	}

	public void setDescriptionCount(Integer descriptionCount) {
		this.descriptionCount = descriptionCount;
	}

	public Double getSingleChoiceValue() {
		return singleChoiceValue;
	}

	public void setSingleChoiceValue(Double singleChoiceValue) {
		this.singleChoiceValue = singleChoiceValue;
	}

	public Double getMultiChoiceValue() {
		return multiChoiceValue;
	}

	public void setMultiChoiceValue(Double multiChoiceValue) {
		this.multiChoiceValue = multiChoiceValue;
	}

	public Double getBlankValue() {
		return blankValue;
	}

	public void setBlankValue(Double blankValue) {
		this.blankValue = blankValue;
	}

	public Double getJudgeValue() {
		return judgeValue;
	}

	public void setJudgeValue(Double judgeValue) {
		this.judgeValue = judgeValue;
	}

	public Double getDescriptionValue() {
		return descriptionValue;
	}

	public void setDescriptionValue(Double descriptionValue) {
		this.descriptionValue = descriptionValue;
	}

}
