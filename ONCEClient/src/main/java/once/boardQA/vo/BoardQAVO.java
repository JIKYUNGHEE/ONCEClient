package once.boardQA.vo;

import lombok.Data;

@Data
public class BoardQAVO {

	private int boardNo;
	
	private String title;
	private String content;
	
	private int memNo;
	private int staffNo;
	
	private int viewCnt;
	private String regDate;
	
	private String category1;
	private String category2;
	private String category3;
	
	private int family;
	private String writer;
}
