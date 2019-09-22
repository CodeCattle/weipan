package com.weipan.framework.buy.vo;

import java.util.Date;

public class BuyType {
	private Integer id;
    private Integer user_id;
    private Integer type_id;
    private Date start_date;
    private Date end_date;
    private Integer money;
    private String mouthNumber;
    private String type_name;
    private String account;
    public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getMouthNumber() {
		return mouthNumber;
	}
	public void setMouthNumber(String mouthNumber) {
		this.mouthNumber = mouthNumber;
	}
	public Integer getId(){
        return this.id;
    }
    public void setId(Integer id){
        this.id=id;
    }
    public Integer getUser_id(){
        return this.user_id;
    }
    public void setUser_id(Integer user_id){
        this.user_id=user_id;
    }
    public Integer getType_id(){
        return this.type_id;
    }
    public void setType_id(Integer type_id){
        this.type_id=type_id;
    }
    public Date getStart_date(){
        return this.start_date;
    }
    public void setStart_date(Date start_date){
        this.start_date=start_date;
    }
    public Date getEnd_date(){
        return this.end_date;
    }
    public void setEnd_date(Date end_date){
        this.end_date=end_date;
    }
    public Integer getMoney(){
        return this.money;
    }
    public void setMoney(Integer money){
        this.money=money;
    }
	@Override
	public String toString() {
		return "BuyType [id=" + id + ", user_id=" + user_id + ", type_id=" + type_id + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", money=" + money + ", mouthNumber=" + mouthNumber + "]";
	}
	
}
