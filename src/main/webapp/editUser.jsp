<%@ page import="bean.User, dao.UserDao, java.util.*" %>
<jsp:useBean id="u" class="bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u" />  

<%
	int i = UserDao.updateUser(u);
	response.sendRedirect("viewUser.jsp");
	
%>