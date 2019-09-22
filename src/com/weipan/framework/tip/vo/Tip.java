package com.weipan.framework.tip.vo;

public class Tip {
	  private Integer id;
	    private String content;
	    private Integer user_id;
	    private Object create_date;

	    public Integer getId(){
	        return this.id;
	    }
	    public void setId(Integer id){
	        this.id=id;
	    }
	    public String getContent(){
	        return this.content;
	    }
	    public void setContent(String content){
	        this.content=content;
	    }
	    public Integer getUser_id(){
	        return this.user_id;
	    }
	    public void setUser_id(Integer user_id){
	        this.user_id=user_id;
	    }
	    public Object getCreate_date(){
	        return this.create_date;
	    }
	    public void setCreate_date(Object create_date){
	        this.create_date=create_date;
	    }
		@Override
		public String toString() {
			return "Tip [id=" + id + ", content=" + content + ", user_id=" + user_id + ", create_date=" + create_date
					+ "]";
		}
	    
}
