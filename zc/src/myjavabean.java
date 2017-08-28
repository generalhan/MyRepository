import java.io.Console;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.channels.SelectableChannel;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.lang.model.type.PrimitiveType;
import javax.mail.search.FromStringTerm;
import javax.websocket.Session;

import org.apache.catalina.connector.Request;

import com.mysql.jdbc.PreparedStatement;

import demo.applist;
import demo.demo;
import demo.message;
import demo.report;
import demo.user;
import demo.page;
import chen.feedInfo;
import chen.orderDetail;
import chen.allMess;
import chen.p;
public class myjavabean {
	Connection conn;
	Statement stmt;

	public myjavabean() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://192.168.1.141:3306/zc", "zc", "123456");
			stmt = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String login(String email, String password) {
		String message = "abc";
		String sql="";
		ResultSet rs1 = null, rs2 = null;
		try {
			sql="select id,identity from user where email='"+email+"'";
			rs1 = stmt.executeQuery(sql);
			if(rs1.next()){
				sql="select id,identity from user where email='"+email+"' and password='"+password+"'";
				rs2 = stmt.executeQuery(sql);
				if(rs2.next()){
					if("root".equals(rs2.getString("identity"))){
						message="3";
						return message;
					}else{
						message="2";
						return message;
					}
				}else{
					message="1";
					return message;
				}
			}else{
				message="0";
				return message;
			}
			
//			String sql1 = "select count(0) from user where email='" + email
//					+ "'";
//			rs1 = stmt.executeQuery(sql1);
//			if (rs1.next()) {
//				int userCount = rs1.getInt(1);
//				if (0 == userCount) {
//					message = "0";
//					return message;
//				}
//				String sql2 = "select count(0) from user where email='" + email
//						+ "'and password='" + password + "'";
//				rs2 = stmt.executeQuery(sql2);
//				if (rs2.next()) {
//					int trueUserCount = rs2.getInt(1);
//					if (0 == trueUserCount) {
//						message = "1";
//						return message;
//					}
//					message = "2";
//				}
//			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return message;

	}

	
	 
	public List getDemo(String email) {
		ArrayList list = new ArrayList();
		String a = "";
		try {

			String sql = "SELECT user_order.`id` id,app_information.name app_name, DATE_FORMAT(user_order.gmt_create,'%Y-%m-%d') gmt_create , test_type.`name`, user_order.`price`, user_order.`state`"
					+ "FROM user_order, test_type, USER,app_information WHERE user_order.`user_id` = user.`id`"
					+ "AND user_order.`test_type_id` = test_type.`id`"
					+ "AND app_information.id=user_order.app_id "
					+ "AND user_order.`user_id` = (select id from user where email='"
					+ email + "')";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				demo p = new demo();
				p.setOrderID(rs.getInt("id"));
				a = rs.getString("app_name");
				if (a.indexOf("_") == -1) {
					p.setAppName(a);
				} else {
					a = a.substring(a.indexOf("_") + 1, a.length());
					p.setAppName(a);
				}

				p.setPrice(rs.getInt("price"));
				p.setName(rs.getString("name"));
				p.setCreateTime(rs.getString("gmt_create"));
				p.setState(rs.getString("state"));
				list.add(p);

				// System.out.println("profit添加成功");

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			// System.out.println("profit添加失败");

		}

		return list;
	}


	 public String phone(String mobile){
		 String message="2";
		 try{
			 String sql1="select count(0) from user where mobile='"+mobile+"'";
			 ResultSet rs1=stmt.executeQuery(sql1);
			 if(rs1.next()){
				 int userCount=rs1.getInt(1);
				 if(0<userCount){
//					 如果大于0则显示该号码已被注册过
			    	 	message = "0";
			    	 	return message;
			     }else{
			    	 message="1";
			    	 return message;
			     }
			 }
		 }catch(Exception e){
			    e.printStackTrace();
		}
			  return message; 
	 }

	 
	 public List getUser(String email){	 	
		 ArrayList list = new ArrayList();
		 try {
	 		
	 		String sql="SELECT  id,job_email,password,mobile,company,name,industry,person_size,contact,QQorWexin FROM USER WHERE email='"+email+"'";
		 	ResultSet rs=stmt.executeQuery(sql);
	 			while(rs.next()){
	 				user p=new user();
	 				p.setUserID(rs.getInt("id"));
	 				p.setName(rs.getString("name"));
	 				p.setEmail(rs.getString("job_email"));
	 				p.setPassword(rs.getString("password"));
	 				p.setMobile(rs.getString("mobile"));	 				
	 				p.setCompany(rs.getString("company"));
	 				p.setIndustry(rs.getString("industry"));
	 				p.setPersonSize(rs.getString("person_size"));
	 				p.setContact(rs.getString("contact"));
	 				p.setQQorWexin(rs.getString("QQorWexin"));
	 				list.add(p);
	 			}	
	 			
	 	
	 	} catch (Exception e) {
	 		// TODO Auto-generated catch block
	 		e.printStackTrace();	
	 	}
	 		
		return  list;
	 	}
	 public List getContacts(){	 	
		 ArrayList list = new ArrayList();
		 try {
	 		
	 		String sql="SELECT  id,email,password,mobile,company,name,industry,person_size,contact,QQorWexin FROM USER ";
		 	ResultSet rs=stmt.executeQuery(sql);
	 			while(rs.next()){
	 				user p=new user();
	 				p.setUserID(rs.getInt("id"));
	 				p.setName(rs.getString("name"));
	 				p.setEmail(rs.getString("email"));
	 				p.setPassword(rs.getString("password"));
	 				p.setMobile(rs.getString("mobile"));	 				
	 				p.setCompany(rs.getString("company"));
	 				p.setIndustry(rs.getString("industry"));
	 				p.setPersonSize(rs.getString("person_size"));
	 				p.setContact(rs.getString("contact"));
	 				p.setQQorWexin(rs.getString("QQorWexin"));
	 				list.add(p);
	 			}	
	 			
	 	
	 	} catch (Exception e) {
	 		// TODO Auto-generated catch block
	 		e.printStackTrace();	
	 	}
	 		
		return  list;
	 	}
	 public List mytest(String email){	 	
		 ArrayList list = new ArrayList();
		 String a="";
		 try {
	 		
			 String sql1="SELECT  DISTINCT(app_information.id),app_information.name,app_information.upload_time,kind,size,pack_name,version ";
			 		sql1+="FROM user_test,app_information "; 
			 		sql1+="WHERE user_test.id_app=app_information.id "; 
			 		sql1+="AND user_test.id_user=(SELECT id FROM USER WHERE email='"+email+"')";
		     ResultSet rs=stmt.executeQuery(sql1);
	 			while(rs.next()){
	 				applist p=new applist();
	 				p.setID(rs.getInt("id"));
	 				a=rs.getString("name");
	 				if(a.indexOf("_") == -1){
	 					p.setName(a);	
	 				}else{
	 					a=a.substring(a.indexOf("_")+1,a.length());	
	 					p.setName(a);
	 				}
	 				p.setTime(rs.getString("upload_time"));
                    p.setKind(rs.getString("kind"));

                    p.setPackName(rs.getString("pack_name"));
                    p.setVersion(rs.getString("version"));

	 				list.add(p);
	 				}	
	 			
	 	
	 	} catch (Exception e) {
	 		// TODO Auto-generated catch block
	 		e.printStackTrace();

	 		System.out.println("profit添加失败");		

	 	}
	 		
		return  list;
	 	}
	 
	 public List mytest3(String email){	 	
		 ArrayList list = new ArrayList();
		 String a="";
		 try {
	 		
			 String sql1="select name,id,upload_time,kind,size,pack_name,version from  app_information  where id_user=(select id from user where email='"+email+"')";
		     ResultSet rs=stmt.executeQuery(sql1);
	 			while(rs.next()){
	 				applist p=new applist();
	 				p.setID(rs.getInt("id"));
	 				a=rs.getString("name");
	 				if(a.indexOf("_") == -1){
	 					p.setName(a);	
	 				}else{
	 					a=a.substring(a.indexOf("_")+1,a.length());	
	 					p.setName(a);
	 				}	 				
	 				p.setTime(rs.getString("upload_time"));

	 				p.setKind(rs.getString("kind"));
	 				p.setSize(rs.getString("size"));
	 				p.setPackName(rs.getString("pack_name"));
	 				p.setVersion(rs.getString("version"));

	 				list.add(p);
	 			}	

	 	} catch (Exception e) {
	 		e.printStackTrace();
	 	}
	 		
		return  list;
	 	}
	 
	 
	 
	 public List mytest2(String id,String userid){	 	
		 ArrayList list = new ArrayList();
		 String a="";
		 try {
	 		
	 		String sql="SELECT file_name,app_information.name app_name,user_test.id_app id,test_type.id typeid,test_type.`name`,company,upload_time,user_test.state stateReport,pack_name,version,kind,user_test.file_url ";
	 			  sql+="FROM app_information,test_type,user_test ";
	 			  sql+="WHERE app_information.`id`=user_test.`id_app` AND test_type.`id`=user_test.`id_type` ";
	 			  sql+="AND user_test.id_app='"+id+"' ";
	 			  sql+="AND user_test.id_user=(select id from user where email='"+userid+"')";
		 	ResultSet rs=stmt.executeQuery(sql);
	 			while(rs.next()){
	 				report p=new report();
	 				a=rs.getString("app_name");
	 				if(a.indexOf("_") == -1){
	 					p.setAppName(a);	
	 				}else{
	 					a=a.substring(a.indexOf("_")+1,a.length());	
	 					p.setAppName(a);
	 				}
	 				p.setFilename(rs.getString("file_name"));
	 				p.setId(rs.getInt("id"));
	 				p.setTypeid(rs.getInt("typeid"));
	 				p.setReportName(rs.getString("name"));
	 				p.setCompany(rs.getString("company"));
	 				p.setUploadTime(rs.getString("upload_time"));
	 				p.setState(rs.getString("stateReport"));
	 				p.setPackName(rs.getString("pack_name"));
	 				p.setVersion(rs.getString("version"));
	 				p.setKind(rs.getString("kind"));
	 				p.setFile(rs.getString("file_url"));
	 				list.add(p);
	 				String kk=p.getCompany();
	 			}	
	 	} catch (Exception e) {
	 		
	 		e.printStackTrace();

	 		System.out.println("profit添加失败");		
	 	}
	 		
		return  list;
	 	}
	 
	 public String[][] createTest() {
			String[][] message = new String[1][1];
			message[0][0] = "-1";
			int i = 0;
			int a = 0;
			try {
				String sql1 = "SELECT NAME,descripe,title,img_src FROM test_type";
				ResultSet rs1 = stmt.executeQuery(sql1);

				// 查询返回数据的行数
				while (rs1.next()) {
					a++;
				}
				rs1.beforeFirst();// 把光标指向第一行数据
				String[][] name = new String[a][4];
				// 遍历数据到二位数组

				if (rs1.next()) {
					name[i][0] = rs1.getString(1);
					name[i][1] = rs1.getString(2);
					name[i][2] = rs1.getString(3);
					name[i][3] = rs1.getString(4);
					while (rs1.next()) {
						if (i > a) {
							break;
						}
						i++;
						name[i][0] = rs1.getString(1);
						name[i][1] = rs1.getString(2);
						name[i][2] = rs1.getString(3);
						name[i][3] = rs1.getString(4);
					}
					return name;

				} else {
					message[0][0] = "0";
					return message;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return message;
	 }

	 public String register(String password, String email, String mobile){
		   String message="abc";
		    Date time = new Date(System.currentTimeMillis());
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    String current = sdf.format(time);
		   try{
		    String sql1="select count(0) from user where email='"+email+"'";
		    ResultSet rs1=stmt.executeQuery(sql1);
		    if(rs1.next()){
		     int userCount=rs1.getInt(1);

		     //检测该用户是否已注册

		     if(0<userCount){
		    	 	message = "1";
		      return message;
		     }
		     String sql2="insert into user (password, mobile, email, gmt_create, gmt_modified) VALUES ('" + password +"','"+ mobile +"','" + email + "','" + current + "','" +current+ "');";
		     int rs2=stmt.executeUpdate(sql2);
		     if(rs2 == 1){
		    	  message = "0";
		       return message;
		     }		     
		    }
		   }catch(Exception e)
		   {
		    e.printStackTrace();
		   }
		   return message;		   
		  }

	public List messageManagerment(String num, String email) {
		ArrayList list = new ArrayList();

		try {
			String sql1 = "";
			String sql2 = "";
			String sql3 = "";
			if ("2".equals(num) || num == null) {
				sql1 = "select id,title,gmt_create,type,state from manager_message where id_user=(select id from user where email='"
						+ email + "') or id_user='0' ";
			} else if (num.equals("0")) {
				sql1 = "select id,title,gmt_create,type,state from manager_message where state='0' and (id_user=(select id from user where email='"
						+ email + "') or id_user=0 )";
			} else if (num.equals("1")) {
				sql1 = "select id,title,gmt_create,type,state from manager_message where state='1' and (id_user=(select id from user where email='"
						+ email + "') or id_user=0 )";
			} else if (num.equals("3")) {
				sql2 = "update manager_message set state='1' where id_user=(select id from user where email='"
						+ email + "')";
			} else if (num.equals("4")) {
				sql2 = "delete from manager_message where id_user=(select id from user where email='"
						+ email + "') ";
			} else {
				sql1 = "select * from manager_message";
			}

			// int rs3=stmt.executeUpdate(sql2);
			if (num.equals("3") || num.equals("4")) {
				stmt.executeUpdate(sql2);
				sql3 = "select id,title,gmt_create,type,state from manager_message where id_user=all or id_user=(select id from user where email='"
						+ email + "')";
				ResultSet rs3 = stmt.executeQuery(sql3);
				while (rs3.next()) {
					message m = new message();
					m.setMessage_id(rs3.getInt("id"));
					m.setTitle(rs3.getString("title"));
					m.setGmt_create(rs3.getString("gmt_create"));
					m.setType(rs3.getString("type"));
					m.setState(rs3.getString("state"));
					list.add(m);
					// System.out.println("profit添加成功");

				}
			} else {
				ResultSet rs1 = stmt.executeQuery(sql1);
				while (rs1.next()) {
					message m = new message();
					m.setMessage_id(rs1.getInt("id"));
					m.setTitle(rs1.getString("title"));
					m.setGmt_create(rs1.getString("gmt_create"));
					m.setType(rs1.getString("type"));
					m.setState(rs1.getString("state"));
					list.add(m);
					// System.out.println("profit添加成功");

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	 
	public String appDescription(String allInsert) {
		String message = "1";

		try {
			String[] arr;
			arr = allInsert.split("&");
			int num = 0;
			for (int i = 0; i < arr.length; i++) {
				int rs2 = stmt.executeUpdate(arr[i]);
				if (rs2 == 1) {
					num++;
				} else {
					return message;
				}
			}
			if (num == arr.length) {
				message = "0";
				return message;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return message;

	}


	public String appOrder(String userOrderInsert) {
		String message = "1";

		try {
			int rs2 = stmt.executeUpdate(userOrderInsert);
			if(rs2==1){
				message="0";
				return message;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return message;

	}

	public String appUpload(String saveFile,String url,String email,String kind,String size,String packageName,String versionName){
		int message=0;
		Date time = new Date(System.currentTimeMillis());
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String current = sdf.format(time);
	    	
		try{
		    
		     String sql2="insert into app_information (upload_time,file_url,name,id_user,kind,size,pack_name,version) VALUES ('" +current +"','"+ url +"','" +saveFile+"',"+"(select id from user where email='"+email+"')"+",'"+kind+"','"+size+ "','"+packageName+"','"+versionName+"');";
		     int rs2=stmt.executeUpdate(sql2);
		     String sql4="select id from app_information where name='"+saveFile+"' and file_url='"+url+"' and id_user="+"(select id from user where email='"+email+"')";
		     ResultSet rs4=stmt.executeQuery(sql4);
		     if(rs2 == 1&& (rs4.next())){
		    	 
		    	 message= rs4.getInt(1);
		       return String.valueOf(message);
		     }		     
		    
		   }catch(Exception e)
		   {
		    e.printStackTrace();
		   }
		   return String.valueOf(message);		   
	}
		
	public String sqlInsert(String sql) {
		String message = "abc";
		try {

			int rs1 = stmt.executeUpdate(sql);
			if (rs1 == 1) {
				message = "0";
				return message;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	public String returnId(String sql) {
		String message = "abc";
		try {


			ResultSet rs1 = stmt.executeQuery(sql);
			if (rs1.next()) {
				message = String.valueOf(rs1.getInt("id"));
				return message;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}


	public String updateUser(String sql) {
		String message = "abc";
		try {

			int rs1 = stmt.executeUpdate(sql);
			if (rs1 != -1) {
				message = "0";
				return message;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	public List messageDetail(String id ) {
		List list=new ArrayList();
		try {
			String sql1="select  gmt_create,title,content from manager_message where id='"+id+"'";
			ResultSet rs1= stmt.executeQuery(sql1);
			while(rs1.next()){
				list.add(rs1.getString("title"));
				list.add(rs1.getString("gmt_create"));
				list.add(rs1.getString("content"));
				list.add(id);
			}
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List returnAllOrder() {
		List list=new ArrayList();
		try {
			String a;
			String sql="SELECT a.`gmt_create`,b.`order_num`,b.`state`,d.`name` type_name,b.`id_type`,c.`name` app_name,b.`file_name`,b.`id` ";
				   sql+="FROM user_order a,user_test b,app_information c,test_type d "; 
				   sql+="WHERE a.`app_id`=c.`id`  " ;
				   sql+="AND a.`order_num`=b.`order_num` ";
				   sql+="AND b.`id_type`=d.`id`";
				   ResultSet rs=stmt.executeQuery(sql);
		 			while(rs.next()){
		 				report p=new report();
		 				a=rs.getString("app_name");
		 				if(a.indexOf("_") == -1){
		 					p.setAppName(a);	
		 				}else{
		 					a=a.substring(a.indexOf("_")+1,a.length());	
		 					p.setAppName(a);
		 				}
		 				p.setWordName(rs.getString("file_name"));
		 				p.setTypeid(rs.getInt("id_type"));
		 				p.setId(rs.getInt("id"));
		 				p.setReportName(rs.getString("type_name"));
		 				p.setOrderid(rs.getString("order_num"));
		 				p.setUploadTime(rs.getString("gmt_create"));
		 				a=rs.getString("state");
		 				if("0".equals(a)){
		 					p.setState("未测试");	
		 				}else if("1".equals(a)){
		 					p.setState("准备测试");
		 				}else if("2".equals(a)){
		 					p.setState("完成");
		 				}else{
		 					p.setState("无");
		 				}
		 					 				
		 				list.add(p);

		 			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public String querySingle(String sql) {
		String message = "abc";
		try {

			ResultSet rs1 = stmt.executeQuery(sql);
			if (rs1.next()) {
				message = "0";
				return message;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}

	public String cPhone(String email, String newPhone) {
		String message = "0";
		try {
			String sql1 = "UPDATE USER SET mobile='" + newPhone
					+ "' where email='" + email + "'";
			stmt.executeUpdate(sql1);
			message = "1";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	
//	反馈信息插入
	public String[] feedback(String title, String yourEmail,String content) {
		String[] message=new String[1];
		message[0]="0";
		Date time = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String current = sdf.format(time);
		try {
			String sql1 = "insert into feedback(email,content,gmt_create,title) values('"+yourEmail+"','"+content+"','"+current+"','"+title+"')";		
			int q = stmt.executeUpdate(sql1);
			if (q == 1) {
				message[0] = "1";
				return message;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return message;
	}
	
//	查询订单信息
	public List pageFunction(String email,int pageNum){	 	
		 ArrayList list = new ArrayList();
		 List list2=new ArrayList();
		 List list3=new ArrayList();
		 List list4 = new ArrayList();
		 List list5=new ArrayList();
		 String a="";
		 try {
			 String sql="SELECT tab_1.*, tab_2.* from ";
			 		sql+=" (SELECT user_order.id id ,app_information.name app_name, DATE_FORMAT(user_order.gmt_create,'%Y-%m-%d') gmt_create , user_order.`price`, user_order.`state`,order_num FROM user_order, USER,app_information";
			 		sql+=" WHERE user_order.`user_id` = user.`id` AND app_information.id=user_order.app_id AND user_order.`user_id` = (SELECT id FROM USER WHERE email='"+email+"'))tab_1,";
			 		sql+=" (SELECT user_test.order_num , COUNT(*) sl FROM user_order, user_test WHERE user_test.`order_num` = user_order.`order_num` GROUP BY user_test.order_num)tab_2 ";
			 		sql+=" WHERE tab_1.order_num = tab_2.order_num";
		 	ResultSet rs=stmt.executeQuery(sql);
	 			while(rs.next()){
	 				demo p=new demo();
	 				p.setOrderID(rs.getInt("id"));
	 				a=rs.getString("app_name");
	 				if(a.indexOf("_") == -1){
	 					p.setAppName(a);	
	 				}else{
	 					a=a.substring(a.indexOf("_")+1,a.length());	
	 					p.setAppName(a);
	 				}
	 			
	 				p.setPrice(rs.getInt("price"));
	 				p.setCreateTime(rs.getString("gmt_create"));
	 				p.setName(rs.getString("sl"));
	 				p.setState(rs.getString("state"));
	 				p.setOrderNum(rs.getString("order_num"));
	 				list.add(p);
	 				//实例化page类，并且计算出当前数据需要几个页面
	 				int pagesize=10;
	 				page page=new page(list.size(),pagesize);
	 				//将当前页面设置到实体类page中
	 				page.setCurPage(pageNum);
//	 				int pagesize=page.getPageSize();
//	 				int pagesize=10;
	 				int firstIndex=(pageNum-1)*pagesize;
	 				int lastIndex=pageNum*pagesize;
	 				if(lastIndex>list.size()){
	 					lastIndex=list.size();
	 				}
	 				if(firstIndex>lastIndex){
	 					firstIndex=0;
	 					page.setCurPage(1);
	 				}
	 				list2=list.subList(firstIndex, lastIndex);
	 				list3.add(page);
	 			}
	 			list4.add(list2);
	 			list4.add(list3);
	 	
	 	} catch (Exception e) {
	 		e.printStackTrace();
	 	}
		return  list4;
	 	}
	 public List mytest4(String email,int pageNum){	 	
		 ArrayList list = new ArrayList();
		 List list2=new ArrayList();
		 List list3=new ArrayList();
		 List list4=new ArrayList();
		 String a="";
		 try {
	 		

			 String sql1="select name,id,upload_time,kind,size,pack_name,version from  app_information  where id_user=(select id from user where email='"+email+"')";

		     ResultSet rs=stmt.executeQuery(sql1);
	 			while(rs.next()){
	 				applist p=new applist();
	 				p.setID(rs.getInt("id"));
	 				a=rs.getString("name");
	 				if(a.indexOf("_") == -1){
	 					p.setName(a);	
	 				}else{
	 					a=a.substring(a.indexOf("_")+1,a.length());	
	 					p.setName(a);
	 				}	 				
	 				p.setTime(rs.getString("upload_time"));
	 				p.setKind(rs.getString("kind"));
	 				p.setSize(rs.getString("size"));

	 				p.setPackName(rs.getString("pack_name"));
                    p.setVersion(rs.getString("version"));

	 				list.add(p); 
	 				int size=10;
	 				page page=new page(list.size(),size);
	 				page.setCurPage(pageNum);
//	 				int pageSize=page.getPageSize();
	 				int pageSize=10;
	 				int firstIndex=(pageNum-1)*pageSize;
	 				int lastIndex=(pageNum)*pageSize;
	 				if(lastIndex>list.size()){
	 					lastIndex=list.size();
	 				}
	 				if(firstIndex>lastIndex){
	 					firstIndex=0;
	 					page.setCurPage(1);
	 				}
	 				list2=list.subList(firstIndex, lastIndex);
	 				list3.add(page);
	 			}	
	 			list4.add(list2);
	 			list4.add(list3);
	 	
	 	} catch (Exception e) {
	 		e.printStackTrace();
	 	}
	 		
		return  list4;
	 	}
	 public List mytest5(String email,int pageNum){	 	
		 ArrayList list = new ArrayList();
		 List list2=new ArrayList();
		 List list3=new ArrayList();
		 List list4=new ArrayList();
		 String a="";
		 try {
	 		
			 String sql1="SELECT  DISTINCT(app_information.id),app_information.name,app_information.upload_time,kind,size,pack_name,version ";
			 		sql1+="FROM user_test,app_information "; 
			 		sql1+="WHERE user_test.id_app=app_information.id "; 
			 		sql1+="AND user_test.id_user=(SELECT id FROM USER WHERE email='"+email+"')";
		     ResultSet rs=stmt.executeQuery(sql1);
	 			while(rs.next()){
	 				applist p=new applist();
	 				p.setID(rs.getInt("id"));
	 				a=rs.getString("name");
	 				if(a.indexOf("_") == -1){
	 					p.setName(a);	
	 				}else{
	 					a=a.substring(a.indexOf("_")+1,a.length());	
	 					p.setName(a);
	 				}	 				
	 				p.setTime(rs.getString("upload_time"));	 
	 				p.setKind(rs.getString("kind"));

	 				p.setVersion(rs.getString("version"));
	 				p.setPackName(rs.getString("pack_name"));

	 				list.add(p);
	 				int size=6;
	 				page page=new page(list.size(),size);
	 				page.setCurPage(pageNum);
//	 				int pageSize=page.getPageSize();
	 				int pageSize=6;
	 				int firstIndex=(pageNum-1)*pageSize;
	 				int lastIndex=(pageNum)*pageSize;
	 				if(lastIndex>list.size()){
	 					lastIndex=list.size();
	 				}
	 				if(firstIndex>lastIndex){
	 					firstIndex=0;
	 					page.setCurPage(1);
	 				}
	 				list2=list.subList(firstIndex, lastIndex);
	 				list3.add(page);
	 			}	
	 			list4.add(list2);
	 			list4.add(list3);
	 	
	 	} catch (Exception e) {
	 		// TODO Auto-generated catch block
	 		e.printStackTrace();
	 	}
	 		
		return  list4;
	 	}
	 public List messageManagerment1(String num,String email,int pageNum){
		 ArrayList list = new ArrayList();
		 List list2=new ArrayList();
		 List list3=new ArrayList();
		 List list4=new ArrayList();
		   try{
			   String sql1="";
			   String sql2="";
			   String sql3="";
			   if ("2".equals(num) || num == null) {
					sql1 = "select id,title,gmt_create,type,state from manager_message where id_user=(select id from user where email='"
							+ email + "') or id_user=0 ";
				} else if (num.equals("0")) {
					sql1 = "select id,title,gmt_create,type,state from manager_message where state='0' and (id_user=(select id from user where email='"
							+ email + "') or id_user=0 )";
				} else if (num.equals("1")) {
					sql1 = "select id,title,gmt_create,type,state from manager_message where state='1' and (id_user=(select id from user where email='"
							+ email + "') or id_user=0 )";
				} else if (num.equals("3")) {
					sql2 = "update manager_message set state='1' where id_user=(select id from user where email='"
							+ email + "')";
				} else if (num.equals("4")) {
					sql2 = "delete from manager_message where id_user=(select id from user where email='"
							+ email + "') ";
				} else {
					sql1 = "select * from manager_message";
				}
			   		
				    
//				    int rs3=stmt.executeUpdate(sql2);
				    if(num.equals("3")||num.equals("4")){
				    	stmt.executeUpdate(sql2);
				    	sql3="select id,title,gmt_create,type,state from manager_message where id_user=0 or id_user=(select id from user where email='"+email+"')";
				    	ResultSet rs3=stmt.executeQuery(sql3);
				    	while(rs3.next()){
					    	message m = new message();
					    	m.setMessage_id(rs3.getInt("id"));
					    	m.setTitle(rs3.getString("title"));
					    	m.setGmt_create(rs3.getString("gmt_create"));
					    	m.setType(rs3.getString("type"));
					    	m.setState(rs3.getString("state"));
							list.add(m);		   				    						    	
					    }
				    }else{
				    	ResultSet rs1=stmt.executeQuery(sql1);
				    	while(rs1.next()){
					    	message m = new message();
					    	m.setMessage_id(rs1.getInt("id"));
					    	m.setTitle(rs1.getString("title"));
					    	m.setGmt_create(rs1.getString("gmt_create"));
					    	m.setType(rs1.getString("type"));
					    	m.setState(rs1.getString("state"));
							list.add(m);		   				    						    		
					    }
				    }
				    int size=10;
				    page page=new page(list.size(),size);
	 				page.setCurPage(pageNum);
//	 				int pageSize=page.getPageSize();
	 				int pageSize=10;
	 				int firstIndex=(pageNum-1)*pageSize;
	 				int lastIndex=(pageNum)*pageSize;
	 				if(lastIndex>list.size()){
	 					lastIndex=list.size();
	 				}
	 				if(firstIndex>lastIndex){
	 					firstIndex=0;
	 					page.setCurPage(1);
	 				}
	 				list2=list.subList(firstIndex, lastIndex);
	 				list3.add(page);
	 				list4.add(list2);
	 				list4.add(list3);
			    		     
		   }catch(Exception e)
		   {
		    e.printStackTrace();
		   }
		   return list4;		   
		  }

	 public List orderDetail(String id) {
		 List mess=new ArrayList();
		try {
		    String sql="SELECT a.company,a.email,a.mobile,b.order_num,DATE_FORMAT(b.gmt_create,'%Y-%m-%d')gmt_create FROM USER a,user_order b,app_information c WHERE a.id=b.user_id AND c.id=b.app_id AND b.id='"+id+"'";
		    ResultSet rs1=stmt.executeQuery(sql);
		    if(rs1.next()){
		    	mess.add(rs1.getString("company"));
		    	mess.add(rs1.getString("mobile"));
		    	mess.add(rs1.getString("email"));
		    	mess.add(rs1.getString("gmt_create"));
		    	mess.add(rs1.getString("order_num"));
		    	
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mess;
	}
	 public List userOrder(String id) {
		ArrayList message=new ArrayList();
		try {
		    String sql="SELECT a.name,b.price,b.state FROM user_order b,user_test c,test_type a WHERE c.id_type=a.`id` AND c.order_num=b.`order_num` AND b.`id`='"+id+"'";
			ResultSet rs1=stmt.executeQuery(sql);
			while(rs1.next()){
				orderDetail detail=new orderDetail();
				detail.setServeName(rs1.getString("name"));
				detail.setServePrice(rs1.getString("price"));
				detail.setPayState(rs1.getString("state"));
				message.add(detail);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	 public String appDestail(String sql) {
		String message="0";
		try {
			int rs1=stmt.executeUpdate(sql);
			if(rs1==1){
				message="1";
				return message;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return message;
	}
	 
	 //后台订单详情页面，显示所有用户的订单信息
	 public List allOrder(String k , int num) {
		List list=new ArrayList();
		List list2=new ArrayList();
		List list3=new ArrayList();
		List list4=new ArrayList();
		int firstIndex=0;
		int lastIndex=0;
		try {
			String sql="SELECT tab_1.*, tab_2.* from ";
	 		sql+=" (SELECT user_order.id, DATE_FORMAT(user_order.gmt_create,'%Y-%m-%d') gmt_create , user_order.`price`, user_order.`state`,order_num FROM user_order where state='"+k+"')tab_1, ";
	 		sql+=" (SELECT user_test.order_num , COUNT(*) sl FROM user_order, user_test WHERE user_test.`order_num` = user_order.`order_num` GROUP BY user_test.order_num)tab_2 ";
	 		sql+=" WHERE tab_1.order_num = tab_2.order_num";
			ResultSet rs1=stmt.executeQuery(sql);
			while(rs1.next()){
				allMess pAllMess=new allMess();
				pAllMess.setOrderNum(rs1.getString("order_num"));
				pAllMess.setTime(rs1.getString("gmt_create"));
				pAllMess.setPrice(rs1.getString("price"));
				pAllMess.setState(rs1.getString("state"));
				pAllMess.setTestTypeId(rs1.getString("sl"));
				pAllMess.setId(rs1.getInt("id"));
				list.add(pAllMess);
				int pageSize=10;
				page oPage=new page(list.size(), pageSize);
				oPage.setCurPage(num);
				firstIndex=(num-1)*pageSize;
				lastIndex=num*pageSize;
				if(firstIndex>lastIndex){
					firstIndex=0;
					oPage.setCurPage(1);
				}
				if(lastIndex>list.size()){
					lastIndex=list.size();
				}
				
				list3.add(oPage);
			}
			    list2=list.subList(firstIndex, lastIndex);
				list4.add(list2);
				list4.add(list3);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list4;
	}
//	 查看全部付款或查看全部没付款的数据
	 public List selectOrder(String k) {
		 List list=new ArrayList();
		 try {
			 String sql="SELECT b.id, DATE_FORMAT(b.gmt_create,'%Y-%m-%d') gmt_create,b.order_num,a.name,b.price,b.state FROM user_order b,user_test c,test_type a WHERE c.id_type=a.`id` AND c.order_num=b.`order_num` AND b.`id`='"+k+"'";
			 ResultSet rs1=stmt.executeQuery(sql);
			 while(rs1.next()){
					orderDetail detail=new orderDetail();
					detail.setServeName(rs1.getString("name"));
					detail.setServePrice(rs1.getString("price"));
					detail.setPayState(rs1.getString("state"));
					detail.setOrderNum(rs1.getString("order_num"));
					detail.setTime(rs1.getString("gmt_create"));
					detail.setId(rs1.getInt("id"));
					list.add(detail);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return list;
	 }
//	 更新订单的价格和付款状态
	 public String updateOrder(String orderPrice,String orderState,String orderID) {
		String message="0";
		try {
			String sql="update user_order set price='"+orderPrice+"' , state='"+orderState+"' where id='"+orderID+"'";
			int rs1=stmt.executeUpdate(sql);
			if(rs1==1){
				message="1";
				return message;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
//	 删除指定订单
	 public String deleteOrder(String orderID){
		 String message="0";
		 try {
			String sql="delete from user_order where id='"+orderID+"'";
			int rs1=stmt.executeUpdate(sql);
			if(rs1==1){
				message="1";
				return message;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return message;
	 }
//	 删除user_order订单信息后删除user_test对应的被删除掉的订单编号的数据
	 public String deleteOrder2(String orderID){
		 String message="0";
		 try {
			 String sql2="DELETE FROM user_test WHERE order_num=(SELECT order_num FROM user_order WHERE  id='"+orderID+"')";
			 int rs2=stmt.executeUpdate(sql2);
			if(rs2==0){
				message="0";
				return message;
			}else{
				message="1";
				return message;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return message;
	 }
//	 后台订单管理时间范围内查询
	 public List mh(String startTime, String endTime, String currentState, int curPage){
		 List list=new ArrayList();
		 List list2=new ArrayList();
		 List list3=new ArrayList();
		 List list4=new ArrayList();
		 int firstIndex=0;
		 int lastIndex=0;
		 try {
			String sql="SELECT tab_1.*, tab_2.* FROM ";
					sql+=" (SELECT user_order.id, DATE_FORMAT(user_order.gmt_create,'%Y-%m-%d') gmt_create , user_order.`price`, user_order.`state`,order_num FROM user_order WHERE state='"+currentState+"' AND user_order.gmt_create BETWEEN '"+startTime+"' AND '"+endTime+"')tab_1,";
					sql+=" (SELECT user_test.order_num , COUNT(*) sl FROM user_order, user_test WHERE user_test.`order_num` = user_order.`order_num` GROUP BY user_test.order_num)tab_2 ";
					sql+=" WHERE tab_1.order_num = tab_2.order_num";
			ResultSet rs1=stmt.executeQuery(sql);
			while(rs1.next()){
				allMess pAllMess=new allMess();
				pAllMess.setOrderNum(rs1.getString("order_num"));
				pAllMess.setTime(rs1.getString("gmt_create"));
				pAllMess.setPrice(rs1.getString("price"));
				pAllMess.setState(rs1.getString("state"));
				pAllMess.setTestTypeId(rs1.getString("sl"));
				pAllMess.setId(rs1.getInt("id"));
				list.add(pAllMess);
//				分页功能
				int pageSize=10;
				page oPage=new page(list.size(), pageSize);
				oPage.setCurPage(curPage);
				firstIndex=(curPage-1)*pageSize;
				lastIndex=curPage*pageSize;
				if(firstIndex>lastIndex){
					firstIndex=0;
					oPage.setCurPage(1);
				}
				if(lastIndex>list.size()){
					lastIndex=list.size();
				}
				
				list2.add(oPage);
			}
			list3=list.subList(firstIndex, lastIndex);
			list4.add(list3);
			list4.add(list2);
		 } catch (Exception e) {
			e.printStackTrace();
		}
		 return list4;
	 }
//	 检查检索的内容在数据库中是否存在
	 public String check(String way,String info){
		 String message="0";
		 try {
			 String sql="";
			if("1".equals(way)){ //用户选择的是订单搜索
				sql+="select * from user_order where order_num='"+info+"'";
			}else if("2".equals(way)){ //用户选择的是姓名搜索
				sql+="select * from user where name='"+info+"'";
			}else{ //用户选择的是手机搜索
				sql+="select * from user where mobile='"+info+"'";
			}
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()){
				message="1";
				return  message;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return message;
	 }
//	 查询出数据库中的信息并存放到list里面
	 public List search(String way, String info, int pageNum){
		 List list=new ArrayList();
		 List list2=new ArrayList();
		 List list3=new ArrayList();
		 List list4=new ArrayList();
		 int firstIndex=0;
		 int lastIndex=0;
		 try {
			 String sql="";
			 if("1".equals(way)){ //用户选择的是订单搜索
				   sql+="SELECT tab_1.price,tab_1.state,tab_1.order_num,tab_2.sl,tab_3.name,tab_3.email,tab_3.mobile,tab_3.company,tab_3.QQorWexin,tab_1.gmt_create from ";
				   sql+=" (SELECT user_order.`user_id`,DATE_FORMAT(user_order.gmt_create,'%Y-%m-%d') gmt_create , user_order.`price`, user_order.`state`,order_num FROM user_order WHERE order_num='"+info+"')tab_1, ";
				   sql+=" (SELECT user_test.order_num , COUNT(*) sl FROM user_order, user_test WHERE user_test.`order_num` = user_order.`order_num` GROUP BY user_test.order_num)tab_2, ";
				   sql+=" (SELECT user.`id`,user.`name`,user.`email`,user.`mobile`,user.`QQorWexin`,user.`company` FROM USER)tab_3 ";
				   sql+=" WHERE tab_1.order_num = tab_2.order_num AND tab_3.id=tab_1.user_id";
			 }else if("2".equals(way)){  //用户选择的是姓名搜索
				   sql+="SELECT tab_1.price,tab_1.state,tab_1.order_num,tab_2.sl,tab_3.name,tab_3.email,tab_3.mobile,tab_3.company,tab_3.QQorWexin,tab_1.gmt_create from ";
				   sql+=" (SELECT user_order.`user_id`,DATE_FORMAT(user_order.gmt_create,'%Y-%m-%d') gmt_create , user_order.`price`, user_order.`state`,order_num FROM user_order)tab_1, ";
				   sql+=" (SELECT user_test.order_num , COUNT(*) sl FROM user_order, user_test WHERE user_test.`order_num` = user_order.`order_num` GROUP BY user_test.order_num)tab_2, ";
				   sql+=" (SELECT user.`id`,user.`name`,user.`email`,user.`mobile`,user.`QQorWexin`,user.`company` FROM USER where name='"+info+"')tab_3 ";
				   sql+=" WHERE tab_1.order_num = tab_2.order_num AND tab_3.id=tab_1.user_id";
			 }else{  //用户选择的是手机搜索
				   sql+="SELECT tab_1.price,tab_1.state,tab_1.order_num,tab_2.sl,tab_3.name,tab_3.email,tab_3.mobile,tab_3.company,tab_3.QQorWexin,tab_1.gmt_create from ";
				   sql+=" (SELECT user_order.`user_id`,DATE_FORMAT(user_order.gmt_create,'%Y-%m-%d') gmt_create , user_order.`price`, user_order.`state`,order_num FROM user_order)tab_1, ";
				   sql+=" (SELECT user_test.order_num , COUNT(*) sl FROM user_order, user_test WHERE user_test.`order_num` = user_order.`order_num` GROUP BY user_test.order_num)tab_2, ";
				   sql+=" (SELECT user.`id`,user.`name`,user.`email`,user.`mobile`,user.`QQorWexin`,user.`company` FROM USER where mobile='"+info+"')tab_3 ";
				   sql+=" WHERE tab_1.order_num = tab_2.order_num AND tab_3.id=tab_1.user_id";
			 }
			 ResultSet rs1=stmt.executeQuery(sql);
			 while(rs1.next()){
				 allMess checkInfo=new allMess();
				 checkInfo.setOrderNum(rs1.getString("order_num"));
				 checkInfo.setPrice(rs1.getString("price"));
				 checkInfo.setState(rs1.getString("state"));
				 checkInfo.setSl(rs1.getInt("sl"));
				 checkInfo.setEmail(rs1.getString("email"));
				 checkInfo.setMobile(rs1.getString("mobile"));
				 checkInfo.setName(rs1.getString("name"));
				 checkInfo.setCompany(rs1.getString("company"));
				 checkInfo.setQw(rs1.getString("QQorWexin"));
				 checkInfo.setTime(rs1.getString("gmt_create"));
				 list.add(checkInfo);
//				 分页代码
				 int pageSize=1;
				 page tPage=new page(list.size(),pageSize );
				 tPage.setCurPage(pageNum);
				 firstIndex=(pageNum-1)*pageSize;
 				 lastIndex=pageNum*pageSize;
 				if(lastIndex>list.size()){
 					lastIndex=list.size();
 				}
 				if(firstIndex>lastIndex){
 					firstIndex=0;
 					tPage.setCurPage(1);
 				}
 				
 				list3.add(tPage);
			 }
			list2=list.subList(firstIndex, lastIndex);
			list4.add(list2);
			list4.add(list3);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return list4;
	 }
	 
//	 查询出每个订单对应的服务，并存放到list
	 public List a(List l){
		 List list=new ArrayList();
		 List list1=new ArrayList();
		 List list2=new ArrayList();
		 try {
			for(int i=0;i<l.size();i++){
				 allMess checkInfo=new allMess();
				 checkInfo=(allMess) l.get(i);
				 String orderNum=checkInfo.getOrderNum();
				String sql="select test_type.name,order_num from test_type,user_test where test_type.id=user_test.id_type and user_test.order_num='"+orderNum+"'";
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next()){
					allMess s=new allMess();
					s.setOrderNum(rs.getString("order_num"));
					s.setName(rs.getString("name"));
					list2.add(s);
				}
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		 return list2;
	 }
//	 查询后台反馈信息
	public List feedBackInfo(String k,int curPage){
		List list=new ArrayList();
		List list2=new ArrayList();
		List list3=new ArrayList();
		List list4=new ArrayList();
		int firstIndex=0;
		int lastIndex=0;
		try {
				String sql="SELECT state,id,email,title,content,DATE_FORMAT(gmt_create,'%Y-%m-%d') gmt_create  FROM feedback WHERE  state='"+k+"'";
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next()){
					feedInfo fInfo=new feedInfo();
					fInfo.setEmail(rs.getString("email"));
					fInfo.setContent(rs.getString("content"));
					fInfo.setTime(rs.getString("gmt_create"));
					fInfo.setId(rs.getInt("id"));
					fInfo.setState(rs.getString("state"));
					fInfo.setTitle(rs.getString("title"));
					list.add(fInfo);
//					 分页代码
					 int pageSize=10;
					 page tPage=new page(list.size(),pageSize );
					 tPage.setCurPage(curPage);
					 firstIndex=(curPage-1)*pageSize;
	 				 lastIndex=curPage*pageSize;
	 				if(lastIndex>list.size()){
	 					lastIndex=list.size();
	 				}
	 				if(firstIndex>lastIndex){
	 					firstIndex=0;
	 					tPage.setCurPage(1);
	 				}
	 				list2.add(tPage);
				}
					list3=list.subList(firstIndex, lastIndex);
					list4.add(list3);
					list4.add(list2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list4;
	} 
//	查看指定反馈表的具体某条反馈信息
	public List feedBackDetail(String feedBackID) {
		List list=new ArrayList();
		try {
			String sql="SELECT id,email,title,content,DATE_FORMAT(gmt_create,'%Y-%m-%d') gmt_create  FROM feedback where id='"+feedBackID+"'";
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()){
				list.add(rs.getString("id"));
				list.add(rs.getString("email"));
				list.add(rs.getString("title"));
				list.add(rs.getString("content"));
				list.add(rs.getString("gmt_create"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
//	更新反馈信息的状态
	public String updateFeedBackState(String feedBackID){
		String message="0";
		try {
			String sql="update feedback set state=1 where id='"+feedBackID+"'";
			int rs=stmt.executeUpdate(sql);
			if(rs==1){
				message="1";
				return message;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	
	//查询downloadApp页面信息
	public List download(String orderNum){
		List list=new ArrayList();
		int i=0;
		try {
			String sql="SELECT order_num,documentation,b.name,b.app_name,b.pack_name,b.summary,b.image1_url,b.id FROM user_order a, app_information b WHERE a.app_id=b.id AND order_num='"+orderNum+"'";
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				list.add(rs.getString("order_num"));
				list.add(rs.getString("documentation"));
				list.add(rs.getString("name"));
				list.add(rs.getString("app_name"));
				list.add(rs.getString("pack_name"));
				list.add(rs.getString("summary"));
				list.add(rs.getString("image1_url"));
				list.add(rs.getInt("id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	private SimpleDateFormat SimpleDateFormat(String string) {
		// TODO Auto-generated method stub
		return null;
	}

	public void close() {
		if (stmt != null) { // 关闭声明
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) { // 关闭连接对象
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public String url(String id){
		String message="0";
		String Path="";
		String name="";
		try {
			String sql="select name,file_url from app_information where id="+id;
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				name=rs.getString("name");
				Path=rs.getString("file_url");
			}
			return message=Path;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	
	public boolean isSameFile(String fileName1,String fileName2){  
	    FileInputStream fis1 = null;  
	    FileInputStream fis2 = null;  
	    try {  
	        fis1 = new FileInputStream(fileName1);  
	        fis2 = new FileInputStream(fileName2);  
	          
	        int len1 = fis1.available();//返回总的字节数  
	        int len2 = fis2.available();  
	          
	        if (len1 == len2) {//长度相同，则比较具体内容  
	            //建立两个字节缓冲区  
	            byte[] data1 = new byte[len1];  
	            byte[] data2 = new byte[len2];  
	              
	            //分别将两个文件的内容读入缓冲区  
	            fis1.read(data1);  
	            fis2.read(data2);  
	              
	            //依次比较文件中的每一个字节  
	            for (int i=0; i<len1; i++) {  
	                //只要有一个字节不同，两个文件就不一样  
	                if (data1[i] != data2[i]) {  
	                    System.out.println("文件内容不一样");  
	                    return false;  
	                }  
	            }  
	            System.out.println("两个文件完全相同");  
	            return true;  
	        } else {  
	            //长度不一样，文件肯定不同  
	            return false;  
	        }  
	    } catch (FileNotFoundException e) {  
	        e.printStackTrace();  
	    } catch (IOException e) {  
	        e.printStackTrace();  
	    } finally {//关闭文件流，防止内存泄漏  
	        if (fis1 != null) {  
	            try {  
	                fis1.close();  
	            } catch (IOException e) {  
	                //忽略  
	                e.printStackTrace();  
	            }  
	        }  
	        if (fis2 != null) {  
	            try {  
	                fis2.close();  
	            } catch (IOException e) {  
	                //忽略  
	                e.printStackTrace();  
	            }  
	        }  
	    }  
	    return false;  
	}  

}
