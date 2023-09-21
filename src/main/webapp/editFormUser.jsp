<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://cdn.tailwindcss.com"></script>
<script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            clifford: '#da373d',
          }
        }
      }
    }
  </script>
<title>Editar usuário</title>
</head>
<body class="bg-gray-300">
	<%@ page import="bean.User, dao.UserDao, java.util.*" %>
	
	<%
		String id = request.getParameter("id");
		User user = UserDao.getUserById(Integer.parseInt(id));
	%>
	
	<form action="editUser.jsp" method="post" class="flex gap-4 m-8">
		<div>
			<input type="hidden" name="id" value="<%=user.getId()%>"/>
		</div>
		<div>
			<label for="name" class="block mb-2 text-sm font-medium text-gray-900">Nome</label>
  			<input type="text" name="name" value="<%=user.getName()%>" class="dark:text-white bg-gray-50 text-gray-900 text-sm rounded-lg block w-f pl-4 p-2.5 dark:bg-gray-700" />
		</div>
		<div>
			<label for="email" class="block mb-2 text-sm font-medium text-gray-900">Email</label>
  			<input type="text" name="email" value="<%=user.getEmail()%>" class="dark:text-white bg-gray-50 text-gray-900 text-sm rounded-lg block w-f pl-4 p-2.5 dark:bg-gray-700" />
		</div>
		<div class="flex items-end">
			<button type="submit" class="text-white w-32 bg-blue-700 hover:bg-blue-800 font-medium rounded-lg text-base px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700">Editar</button>
		</div>	
	</form>
</body>
</html>