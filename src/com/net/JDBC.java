package com.net;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.sql.Blob;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

public class JDBC{

	public static void main(String[] args) {
		 
//		//这个方法就是返回所有的护工信息,前端将返回的String类型的数据处理之后再显示出来
		System.out.println(showAllInfo());
//		//通过输入姓名进行模糊查询检索护工的信息，也是返回String类型的数据,处理之后再显示在页面中
		System.out.println(showInfoByName("秀"));
		
		/*
		 * ******************************
		*这个方法注意了,这个里面有一个存储照片的方法，所以编译的时候,你需要用你的电脑上的一个照片的位置替换他
		***********************************
		**********************************
		*/
		uploadPicture();//上传照片,这个是将你们上传照片之后,用上传在服务器上的路径传入为参数，以便存储在数据库中
		System.out.println(userRegister("17745146929","123456"));//测试数据
		
		//护工id为1的发表文章
		publishArticle(1,"健康护理","关于如何照料半自理的老人");
		//对ID号为1的护工发表的文章进行评论,这个方法会输出的文章的相关信息,包括评论
		addComment(1,"这个文章的护理知识我试了,感觉没有实际作用啊");
		addComment(1,"好的谢谢分享了,我感觉对我姥姥的身体很有帮助");
		addComment(1,"也不知道到底有没有作用");
		
		//按照价格从低到高排序显示所有护工的信息
		showAllInformationSortPrice();
		
		//按照好评率从高到低显示所有护工的信息
		showAllInformationSortRate();
	}
	@SuppressWarnings("unused")
	public static String showAllInfo(){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBk","root","root");
			stmt=(Statement) con.createStatement();
			String seleStr="SELECT * FROM nurse";
			rs=(ResultSet) stmt.executeQuery(seleStr);
			//如果在前端需要显示的话,调用这个方法，然后返回一个sb字符串就行了
			StringBuilder sb=new StringBuilder();
			//这个WHILE循环就是利用jdbc从数据库中查询数据,然后再添加在字符串sb后面
			while(rs.next()){
				try {
					sb.append(rs.getString("name")+" "+rs.getString("sex")+" "+rs.getInt("age")+
							" 价格:"+rs.getInt("price")+"/天  "+rs.getString("phoneNumber")
							+"工龄:"+rs.getInt("workAge")+" 好评率为:"+rs.getDouble("rate")
				+"%"+" 地址:"+rs.getString("address")+" 简介:"+rs.getString("information"));
					Object obj=rs.getObject("addressList");
					sb.append(" 通讯录:"+obj+"\n");
					//这个利用字节流从数据库中读取照片
					Blob blob=(Blob) rs.getBlob("photo");
					/*
					 * 如果使用AJAx应该是类似的,将byte[]转换为照片显示出来
					 * JSP页面的代码显示
					 * response.setContextType("image/jpg");
					 * OutputStream outs=response.getOutputStream();
					 * outs.write(bs);
					 * outs.flush();
					 */
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			//这个语句就是返回查询的结果，前端将信息分离处理之后显示
			return sb.toString();
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally{
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
		return null;
	}

	
	//显示所有的护工信息,通过价格由低到高
	@SuppressWarnings("unused")
	public static void showAllInformationSortPrice(){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBk","root","root");
			stmt=(Statement) con.createStatement();
			String seleStr="SELECT * FROM nurse order by price";
			rs=(ResultSet) stmt.executeQuery(seleStr);
			
			//这个while循环就是讲数据库中的所有护工排序
			//这个while循环就是讲数据库中的所有护工排序
			while(rs.next()){
				Blob blob=rs.getBlob("photo");
				/*
				 * 利用JSP或者AJAX显示护工的照片,代码省略.......
				 */
				System.out.println(rs.getString("name")+" "+
				" 价格:"+rs.getInt("price")+"/天  "+" 护工等级:"+rs.getString("workLevel")
				+"工龄:"+rs.getInt("workAge")+" 好评率为:"+rs.getDouble("rate")
				+"%"+" 简介:"+rs.getString("information"));
			}	
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally{
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
	}

	//显示所有的护工信息,通过好评率优先
		@SuppressWarnings("unused")
		public static void showAllInformationSortRate(){
			Connection con=null;
			Statement stmt=null;
			ResultSet rs=null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBk","root","root");
				stmt=(Statement) con.createStatement();
				String seleStr="SELECT * FROM nurse order by rate";
				rs=(ResultSet) stmt.executeQuery(seleStr);
				
				
				//这个while循环就是讲数据库中的所有护工排序
				while(rs.next()){
					Blob blob=rs.getBlob("photo");
					/*
					 * 利用JSP或者AJAX显示护工的照片,代码省略.......
					 */
					System.out.println(rs.getString("name")+" "+
					" 价格:"+rs.getInt("price")+"/天  "+" 护工等级:"+rs.getString("workLevel")
					+"工龄:"+rs.getInt("workAge")+" 好评率为:"+rs.getDouble("rate")
					+"%"+" 简介:"+rs.getString("information"));
				}	
			} catch (ClassNotFoundException e1) {
				e1.printStackTrace();
			} catch (SQLException e1) {
				e1.printStackTrace();
			} finally{
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			
			}
		}
	
	//输入护工姓名之后模糊查询数据库中信息,如输入"秀"之后就可以查询到"张秀萍"
	public static String showInfoByName(String name){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBk","root","root");
			stmt=(Statement) con.createStatement();
			String seleStr="SELECT * FROM nurse where name like'%"+name+"%'";
			rs=(ResultSet) stmt.executeQuery(seleStr);
			//如果在前端需要显示的话,调用这个方法，然后返回一个sb就行了
			StringBuilder sb=new StringBuilder();
			while(rs.next()){
				try {
					sb.append(rs.getString("name")+" "+rs.getString("sex")+" "+rs.getInt("age")+
							" 价格:"+rs.getInt("price")+"/天  "+rs.getString("phoneNumber")
							+"工龄:"+rs.getInt("workAge")+" 好评率为:"+rs.getDouble("rate")
				+"%"+" 地址:"+rs.getString("address")+" 简介:"+rs.getString("information")+"\n");
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return sb.toString();
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally{
			
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
		return null;
		
	}

	public static void uploadPicture(){
		if(storePicture(1,"C:\\Users\\lxj\\Desktop\\1.jpg")){
			System.out.println("上传照片成功");
		}else{
			System.out.println("上传照片失败,请重试");//这是测试照片,在调用这个方法是参数应该改为注册时上传照片的位置
		}
	}
	//这个方法是将id为*的nurse的照片上传之后位置在file的照片存储在数据库中
	private static boolean storePicture(int id,String file){
		Connection con=null;
		PreparedStatement ps=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBk","root","root");
			FileInputStream fis = new FileInputStream(file);
			ps = (PreparedStatement) con.prepareStatement("update "
                      + "nurse set photo=? where id='"+id+"'");
            ps.setBinaryStream(1,fis,(int)file.length());
            ps.executeUpdate();
            return true;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	/*实现了用户的验证登陆和注册，在登陆页面,输入用户名之后验证姓名和密码从数据库中验证
	是否存在此用户,如果存在但是密码出错就提示....,没有此用户就提示让其注册,
	护工和用户的用户名和密码存储在同一个表中,方便验证,这个表请参照login表,这个表有type和typeId,就可以关联到具体的护工或者用户
	*/
	public static boolean userRegister(String userName,String passWord){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBk","root","root");
			stmt=(Statement) con.createStatement();
			String seleStr="SELECT * FROM login where userName="+"'"+userName+"'" ;
			rs=(ResultSet) stmt.executeQuery(seleStr);
			//进入if语句表示还没有这个用户
			if(!rs.next()){
				String sql = "insert into login(userName,passWord) values(?,?)";
		        // 创建一个 PreparedStatement 对象来将参数化的 SQL 语句发送到数据库。
		        PreparedStatement ptmt = (PreparedStatement) con.prepareStatement(sql);
		        ptmt.setString(1,userName);
		        ptmt.setString(2,passWord);
		        // 在此 PreparedStatement 对象中执行 SQL 语句
		        ptmt.execute();
				System.out.println("注册成功");
			}else{
				if(rs.getString("passWord").equals(passWord)){
					System.out.println("登陆成功");
				}else{
					System.out.println("用户名或者密码错误");
				}
			}
			return true;
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally{
			
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
		return false;
	}

	//先传入发表文章的唯一标识护工的id,就代表这个护工想要发表文章,文章内容为str
	public static void publishArticle(int id,String title,String str){
		NurseArticle nurseArticle=new NurseArticle(id,title,str);
		Connection con=null;
		Statement stmt=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBk","root","root");
			stmt=(Statement) con.createStatement();
			String sql = "insert into nurseArticle(comment) values(?)";
		    // 创建一个 PreparedStatement 对象来将参数化的 SQL 语句发送到数据库。
		    PreparedStatement ptmt = (PreparedStatement) con.prepareStatement(sql);
		    ptmt.setObject(1,nurseArticle);
		    // 在此 PreparedStatement 对象中执行 SQL 语句
		    ptmt.execute();
			System.out.println("文章存储到数据库成功");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally{
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	//id表示发表文章的护工,str代表评论内容
	public static void addComment(int idOfNurse,String str){
		Connection con=null;
		PreparedStatement ps=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBk","root","root");
			stmt=(Statement)con.createStatement();
			String seleStr="SELECT * FROM nurseArticle";
			rs=(ResultSet) stmt.executeQuery(seleStr);
			//如果在前端需要显示的话,调用这个方法，然后返回一个sb就行了
			NurseArticle nurseArticle=null;
			int idInDatabase=0;
			while(rs.next()){
				Blob blob=rs.getBlob("comment");
				byte[] b=blob.getBytes(1, (int) blob.length());
				ByteArrayInputStream bis=new ByteArrayInputStream(b);
				ObjectInputStream ois=new ObjectInputStream(bis);
				nurseArticle=(NurseArticle) ois.readObject();
				idInDatabase=rs.getInt("id");
				if(nurseArticle.getId()==idOfNurse){
					System.out.println(nurseArticle);
					nurseArticle.addComent(str);//将评论的内容添加到对象中，下一步就是将添加评论之后的对象添加回原来的位置
					ps = (PreparedStatement) con.prepareStatement("update "
		                      + "nurseArticle set comment=? where id='"+idInDatabase+"'");
		            ps.setObject(1,nurseArticle);
		            System.out.println(nurseArticle);
		            ps.executeUpdate();
		            break;//添加到数据库之后就可以结束循环了
				}
			}
			
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
	}
	
	

}
