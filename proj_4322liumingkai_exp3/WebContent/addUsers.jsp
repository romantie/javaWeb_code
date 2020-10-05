<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加用户</title>
</head>
<body>
 <form action="doAddUsers.jsp" method="post">
    <table border="1">
      <tr>
        <td colspan="2" align="center">用户注册</td>   
      </tr>
      <tr>
        <td>登录ID：</td>
        <td><input type="text" name="id"></td>
      </tr>
        <td>真实姓名：</td>
        <td><input type="text" name="name"></td>
      </tr>  
      <tr>
      	<td>性别</td>
      	<td>
      		<input type = "radio" name = "usex" value="男" checked="checked">男
      		<input type = "radio" name = "usex" value="女" >女
      	</td>
      </tr>  
      <tr>
        <td>Email：</td>
        <td><input type="text" name="uemail"></td>
      </tr>  
      <tr>
        <td>登录密码：</td>
        <td><input type="password" name="password"></td>
      </tr>
      <tr>
        <td colspan="2">
          &nbsp;&nbsp;<input type="submit" value="添加用户">&nbsp;&nbsp;
          <input type="reset" value="重置"> 
        </td>   
      </tr>
    </table>
  </form>
</body>
</html>