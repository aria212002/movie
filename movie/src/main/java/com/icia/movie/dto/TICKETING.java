package com.icia.movie.dto;

import lombok.Data;

@Data
public class TICKETING extends SCHEDULE{
	private int  mtNumber;
	private int mtsNumber;
	private String  mtName;
	private String  mtSeat;
	private int  mtCount;
	private int  mtPrice;
	private String  mtPayment;
	private String  mtId;
	
	
	private String  miAge;
}
