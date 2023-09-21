<%@ page import="bean.User, dao.UserDao, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="u" class="bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u" />  

<%
	UserDao.insertUser(u);
	response.sendRedirect("viewUser.jsp");
	
%>