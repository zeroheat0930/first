package org.zerock.qaboard.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public int getFrom() {
		return amount * (pageNum - 1);
	}
	
	public String[] getTypeArr() {
		if (this.type == null) {
			return new String[] {};
		} else {
			return type.split("");
		}
	}
}