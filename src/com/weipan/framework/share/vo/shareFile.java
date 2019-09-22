package com.weipan.framework.share.vo;

public class shareFile {
	    private Integer id;
	    private String title;
	    private String path;
	    private Integer user_id;
	    private String user_name;
	    private String  photo;
	    

	    public String getUser_name() {
			return user_name;
		}
		public void setUser_name(String user_name) {
			this.user_name = user_name;
		}
		public String getPhoto() {
			return photo;
		}
		public void setPhoto(String photo) {
			this.photo = photo;
		}
		public Integer getId(){
	        return this.id;
	    }
	    public void setId(Integer id){
	        this.id=id;
	    }
	    public String getTitle(){
	        return this.title;
	    }
	    public void setTitle(String title){
	        this.title=title;
	    }
	    public String getPath(){
	        return this.path;
	    }
	    public void setPath(String path){
	        this.path=path;
	    }
	    public Integer getUser_id(){
	        return this.user_id;
	    }
	    public void setUser_id(Integer user_id){
	        this.user_id=user_id;
	    }
}
