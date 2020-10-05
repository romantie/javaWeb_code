<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<center>
  <h1>登录操作</h1>
  <hr>
  <form action="mlogin_check.jsp" method="post">
    <table border="1">
      <tr>
        <td colspan="2" align="center">管理员用户登录</td>   
      </tr>
      <tr>
        <td>登录ID：</td>
        <td><input type="text" name="id" ></td>
      </tr>
      <tr>
        <td>登录密码：</td>
        <td><input type="password" name="password" ></td>
      </tr>
      <tr>
        <td colspan="2">
          &nbsp;&nbsp;<input type="submit" value="登录">&nbsp;&nbsp;
          <input type="reset" value="重置">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>   
      </tr>
    </table>
  </form>
   <h5><a href="login.jsp">返回用户登录页面</a></h5>
</center>
</body>
</html>