<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    int qSeqno = Integer.parseInt(request.getParameter("qSeqno"));

	String url_mysql = "jdbc:mysql://localhost/wooboo?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";
    String WhereDefault = "select * from wooboo.questions where qSeqno = " + qSeqno;
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
			"qTitle" : "<%=rs.getString(3) %>",
            "qSelection1" : "<%=rs.getString(4) %>",
			"qSelection2" : "<%=rs.getString(5) %>",
			"qSelection3" : "<%=rs.getString(6) %>",
			"qSelection4" : "<%=rs.getString(7) %>",
			"qSelection5" : "<%=rs.getString(8) %>",
			"qCategory" : "<%=rs.getInt(9) %>",
			"qInsertDate" : "<%=rs.getString(10) %>",
			"qDeleteDate" : "<%=rs.getString(11) %>",
			"qImageFileName1" : "<%=rs.getString(12) %>",
			"qImageFileName2" : "<%=rs.getString(13) %>",
			"qImageFileName3" : "<%=rs.getString(14) %>",
			"qImageFileName4" : "<%=rs.getString(15) %>",
			"qImageFileName5" : "<%=rs.getString(16) %>"

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
