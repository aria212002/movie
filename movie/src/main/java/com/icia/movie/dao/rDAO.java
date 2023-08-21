package com.icia.movie.dao;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.movie.dto.INFO;
import com.icia.movie.dto.SCHEDULE;
import com.icia.movie.dto.TICKETING;




@Repository
public class rDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public List<INFO> msList() {

		return sql.selectList("info.msList");
	}
	public List<SCHEDULE> msTime(SCHEDULE schedule) {
		
		return sql.selectList("schedule.msTime",schedule);
	}
	public SCHEDULE seat(int msNumber) {

		return sql.selectOne("schedule.seat", msNumber);
	}
	public int seatCheck(int mtsNumber) {
		return sql.selectOne("ticketing.seatCheck", mtsNumber);
	}
	public int reserve(TICKETING ticketing) {

		return sql.insert("ticketing.reserve", ticketing);
	}
	public int maxMtNumber() {

		return sql.selectOne("ticketing.maxMtNumber");
	}
	public List<String> reservedSeat(int mtsNumber) {

		return sql.selectList("ticketing.reservedSeat",mtsNumber);
	}
	public void reserveDel(int mtNumber) {

		sql.delete("ticketing.reserveDel", mtNumber);
	}
	public void successPay(int mtNumber) {
		sql.update("ticketing.successPay", mtNumber);
		
	}
	public String callId(int mtNumber) {
		
		return sql.selectOne("ticketing.callId",mtNumber);
	}
	
	public void reserveDel2(int mtNumber) {
		sql.delete("ticketing.reserveDel2", mtNumber);
	}
	
	public void reserveDel3(int mtNumber) {
		sql.delete("ticketing.reserveDel3", mtNumber);
	}
	
	// msInfo : 영화이름으로 영화 시작시간 가져오기
	public List<SCHEDULE> msInfo(String msName) {
		return sql.selectList("schedule.msInfo", msName);
		
	}


}
