package dto;

import java.util.Date;

public class Member {
 
	private int mem_id;
	private String email;
	private String pwd;
	private String name;
	private int money;
	private Date join_date;
	
	public int getMem_id() {
		return mem_id;
	}
	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	} 
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	@Override
	public String toString() {
		return "loginUser [mem_id=" + mem_id + ", email=" + email + ", pwd=" + pwd + ", name=" + name + ", money=" + money
				+ ", join_date=" + join_date + "]";
	}
	
	
	
	
}
