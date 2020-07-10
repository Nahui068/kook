package kook;

import java.sql.Timestamp;

public class MemberDTO {
		private String id;							// ID (아이디)
		private String pw;						// Password (비밀번호)
		private String pw_ck;				// Password 재입력 
		private Timestamp reg;			// 등록일자
		private String gender;				// Gender (성별)
		private String name;					// Name (이름)
		private String birth;					// Day of Birth (생년월일) 		// DAO에서 Set
		private String birth_y;				// Birth-Year
		private String birth_m;				// Birth-Month
		private String birth_d;				// Birth-Day
		private String ph;						// 휴대폰 통신사
		private String phNum;				// Full 휴대폰번호						// DAO에서 Set
		private String ph_no1;				// 휴대폰번호 앞자리
		private String ph_no2;				// 휴대폰번호 가운데자리
		private String ph_no3;				// 휴대폰번호 뒷자리
		private String email;					// Full 이메일주소						// DAO에서 Set
		private String email_id;			// Email - ID (이메일주소 앞자리)
		private String email_adr;			// Email - Address (이메일주소 뒷자리)
		private String adrNum;				// Address Number (우편번호)
		private String adr;						// Simply Address ( -도, -시 주소)
		private String address1;			// Address1 (도로명주소 등 상세주소1)
		private String address2;			// Address2
		private String sweet;					// 단맛
		private String sour;					// 신맛
		private String salty;					// 짠맛
		private String spicy;					// 매운맛
		private String non_spicy;			// 안매운맛
		private String soft;						// 부드러운
		private String fresh;					// 싱싱한
		private String hot;						// 뜨거운
		private String cool;					// 시원한
		private String light;					// 담백한
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getPw() {
			return pw;
		}
		public void setPw(String pw) {
			this.pw = pw;
		}
		public String getPw_ck() {
			return pw_ck;
		}
		public void setPw_ck(String pw_ck) {
			this.pw_ck = pw_ck;
		}
		public Timestamp getReg() {
			return reg;
		}
		public void setReg(Timestamp reg) {
			this.reg = reg;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getBirth() {
			return birth;
		}
		public void setBirth(String birth) {
			this.birth = birth;
		}
		public String getBirth_y() {
			return birth_y;
		}
		public void setBirth_y(String birth_y) {
			this.birth_y = birth_y;
		}
		public String getBirth_m() {
			return birth_m;
		}
		public void setBirth_m(String birth_m) {
			this.birth_m = birth_m;
		}
		public String getBirth_d() {
			return birth_d;
		}
		public void setBirth_d(String birth_d) {
			this.birth_d = birth_d;
		}
		public String getPh() {
			return ph;
		}
		public void setPh(String ph) {
			this.ph = ph;
		}
		public String getPhNum() {
			return phNum;
		}
		public void setPhNum(String phNum) {
			this.phNum = phNum;
		}
		public String getPh_no1() {
			return ph_no1;
		}
		public void setPh_no1(String ph_no1) {
			this.ph_no1 = ph_no1;
		}
		public String getPh_no2() {
			return ph_no2;
		}
		public void setPh_no2(String ph_no2) {
			this.ph_no2 = ph_no2;
		}
		public String getPh_no3() {
			return ph_no3;
		}
		public void setPh_no3(String ph_no3) {
			this.ph_no3 = ph_no3;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getEmail_id() {
			return email_id;
		}
		public void setEmail_id(String email_id) {
			this.email_id = email_id;
		}
		public String getEmail_adr() {
			return email_adr;
		}
		public void setEmail_adr(String email_adr) {
			this.email_adr = email_adr;
		}
		public String getAdrNum() {
			return adrNum;
		}
		public void setAdrNum(String adrNum) {
			this.adrNum = adrNum;
		}
		public String getAdr() {
			return adr;
		}
		public void setAdr(String adr) {
			this.adr = adr;
		}
		public String getAddress1() {
			return address1;
		}
		public void setAddress1(String address1) {
			this.address1 = address1;
		}
		public String getAddress2() {
			return address2;
		}
		public void setAddress2(String address2) {
			this.address2 = address2;
		}
		public String getSweet() {
			return sweet;
		}
		public void setSweet(String sweet) {
			this.sweet = sweet;
		}
		public String getSour() {
			return sour;
		}
		public void setSour(String sour) {
			this.sour = sour;
		}
		public String getSalty() {
			return salty;
		}
		public void setSalty(String salty) {
			this.salty = salty;
		}
		public String getSpicy() {
			return spicy;
		}
		public void setSpicy(String spicy) {
			this.spicy = spicy;
		}
		public String getNon_spicy() {
			return non_spicy;
		}
		public void setNon_spicy(String non_spicy) {
			this.non_spicy = non_spicy;
		}
		public String getSoft() {
			return soft;
		}
		public void setSoft(String soft) {
			this.soft = soft;
		}
		public String getFresh() {
			return fresh;
		}
		public void setFresh(String fresh) {
			this.fresh = fresh;
		}
		public String getHot() {
			return hot;
		}
		public void setHot(String hot) {
			this.hot = hot;
		}
		public String getCool() {
			return cool;
		}
		public void setCool(String cool) {
			this.cool = cool;
		}
		public String getLight() {
			return light;
		}
		public void setLight(String light) {
			this.light = light;
		}
		
		
		
}
