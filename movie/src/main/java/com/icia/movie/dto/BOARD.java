package com.icia.movie.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class BOARD {
	private int		bdNum;
	private String	bdWriter;
	private String	bdTitle;
	private String	bdContent;
	private Date	bdDate;
}
