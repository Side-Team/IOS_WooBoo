<%@page import="java.sql.*"%> 
<%@ page language="java" contentType="text/html;charset=UTF-8" 
pageEncoding="UTF-8"%>


 <% 
       String url_mysql = "jdbc:mysql://aws-wooboo.ccsntmql93pq.ap-northeast-2.rds.amazonaws.com/wooboo?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 	    String id_mysql = "wooboo"; 
        String pw_mysql = "qwer1234"; 

        String WhereDefault ="select qTitle from questions  order by qInsertDate desc limit 3"; 

        int count = 0;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); 
        Connection conn_mysql =DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql= conn_mysql.createStatement();
        ResultSet rs =stmt_mysql.executeQuery(WhereDefault); // &quot; 
%> 
    [
<% 
        while (rs.next()) { 
                if(count == 0) {

        }else{ 
%> 
        , 
<% 
        }
         count++; 

%> 
        { 
            "title" : "<%=rs.getString(1) %>"
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
