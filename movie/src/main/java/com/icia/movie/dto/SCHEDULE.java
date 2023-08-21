package com.icia.movie.dto;

import lombok.Data;

@Data
public class SCHEDULE extends INFO{
	private int msNumber;
	private String msName;
	private String msStartTime;
	private String msEndTime;
	private String msDate;
	private String msTheater;
	private String mtTheater;
	private String mtKind;
	private int mtSeats;
	private int mtCommon;
	private int mtChild;
}
