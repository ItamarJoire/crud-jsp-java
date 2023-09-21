<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ page import="bean.User, dao.UserDao, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
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
		<title>Visualização</title>
	</head>
	<body class="bg-gray-300">
	
		<%
		  List<User> list = UserDao.getAllUser();
		  request.setAttribute("list", list);
		%>
		
		<div class="relative overflow-x-auto m-8">
		    <table class="w-f text-base text-left text-gray-500 dark:text-gray-400">
		        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
		            <tr>
		                <th scope="col" class="px-6 py-3">Nome</th>
		                <th scope="col" class="px-6 py-3">Email</th>
		                <th scope="col" class="px-6 py-3"></th>
		                <th scope="col" class="px-6 py-3"></th>
		            </tr>
		        </thead>
		        <tbody>
		          <c:forEach items="${list}" var="user">
		            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
		                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
		                    ${user.getName()}
		             
		                    
		                </th>
		                <td class="px-6 py-4">${user.getEmail()}</td>        
		                <td class="px-6 py-4">
		                  <a href="editFormUser.jsp?id=${user.getId()}" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Editar</a>
		                </td>
		                <td  class="px-6 py-4">
		                    <a href="removeUser.jsp?id=${user.getId()}" class="font-medium text-red-600 dark:text-red-500 hover:underline">Excluir</a>
		                </td>
		            </tr>
		          </c:forEach>
		          <tr>
		          	<td class="my-4 flex justify-end">
		          		 <a href="insertFormUser.jsp">
			   				<button type="button" class="text-white w-32 bg-blue-700 hover:bg-blue-800 font-medium rounded-lg text-base px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700">Adicionar</button>
						</a>
		          	</td>
		          </tr>
		        </tbody>
		    </table>		
		</div>
	</body>
</html>