<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    int questions_qSeqno = Integer.parseInt(request.getParameter("questions_qSeqno"));

	String url_mysql = "jdbc:mysql://localhost/wooboo?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";
    String WhereDefault = "select count(*), (select count(*) from wooboo.select_question where sqSelection = 1)as cnt1, (select count(*) from wooboo.select_question where sqSelection = 2)as cnt2, (select count(*) from wooboo.select_question where sqSelection = 3)as cnt3, (select count(*) from wooboo.select_question where sqSelection = 4)as cnt4, (select count(*) from wooboo.select_question where sqSelection = 5)as cnt5 from wooboo.select_question where questions_qSeqno = " + questions_qSeqno;

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
			"count" : "<%=rs.getInt(1) %>",
            "cnt1" : "<%=rs.getInt(2) %>",
			"cnt2" : "<%=rs.getInt(3) %>",
			"cnt3" : "<%=rs.getInt(4) %>",
			"cnt4" : "<%=rs.getInt(5) %>",
			"cnt5" : "<%=rs.getInt(6) %>"



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
