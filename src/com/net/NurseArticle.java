package com.net;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class NurseArticle implements Serializable{
	private static final long serialVersionUID = 1L;//可以忽略这个属性
	private int id;//发表文章的护工ID
	private String title;//文章的标题
	private String content;//发表的文章内容
	private Date date;//文章发表的时间
	private String[] comment=new String[10];//文章的评论
	private ArrayList<Date> commentTimeList=new ArrayList<Date>();//保存评论的时间
	private int size=0;//记录评论的数量
	
	public NurseArticle(int id, String title, String content) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.date=new Date();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String[] getComment() {
		return comment;
	}
	public void setComment(String[] comment) {
		this.comment = comment;
	}
	
	public ArrayList<Date> getCommentTimeList() {
		return commentTimeList;
	}
	public void setCommentTimeList(ArrayList<Date> commentTimeList) {
		this.commentTimeList = commentTimeList;
	}
	public void addComent(String s){
		if(size>10){
			//为简化起见,设置最大评论数为10条
			System.out.println("评论失败,已经达到最大评论数");
			return ;
		}
		comment[size++]=s;
		commentTimeList.add(new Date());
	}
	@Override
	public String toString() {
		StringBuilder sb=new StringBuilder("");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh-mm-ss");
		sb.append("文章标题:"+title+"    文章发表时间:"+sdf.format(date)+"\n内容:"+content+"   评论如下:\n");
		if(this.size==0){
			sb.append("暂无评论\n");
		}
		for(int i=0;i<this.size;i++){
			sb.append("评论时间: "+sdf.format(commentTimeList.get(i))+"\n"+comment[i]+"\n");
		}
		return sb.toString();
	}
	
}
