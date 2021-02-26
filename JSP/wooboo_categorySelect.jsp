<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

    String category = request.getParameter("category");


	String url_mysql = "jdbc:mysql://localhost/wooboo?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";
    String WhereDefault = "select * from questions where qCategory ='" + category + "'";
    int count = 0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(WhereDefault); // &quot;
%>
  	[ 
<%
        while (rs.next()) {
            if (count == 0) {

            }else{
%>
            , 
<%           
            }
            count++;                 
%>
			{
			"qSeqno" : "<%=rs.getInt(1) %>",
			"qTitle" : "<%=rs.getString(2) %>",
			"qSelection1" : "<%=rs.getString(3) %>", 
			"qSelection2" : "<%=rs.getString(4) %>",
            "qSelection3" : "<%=rs.getString(5) %>",
            "qSelection4" : "<%=rs.getString(6) %>",
            "qSelection5" : "<%=rs.getString(7) %>",	
            "qImageFileName" : "<%=rs.getString(8) %>",
            "qCategory" : "<%=rs.getInt(9) %>",	
            "qInsertDate" : "<%=rs.getString(10) %>",
            "qDeleteDate" : "<%=rs.getString(11) %>"
			}
<%		
        }
%>
		  ]
<%		
        conn_mysql.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
	
%>
