<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Cookie[] cookies = request.getCookies();
	String id = null;
	String pwd = null;
	if(cookies!=null){
		for(int i = 0; i < cookies.length; i++){
			if(cookies[i].getName().equals("mrCookie")){
				id = cookies[i].getValue().split("#")[0];
				pwd = cookies[i].getValue().split("#")[1];
			}
		}
	}else{
		id="";
		pwd="";
	}
%>


<center>
  <h1>登录操作</h1>
  <hr>
  <form action="login_check.jsp" method="post">
    <table border="1">
      <tr>
        <td colspan="2" align="center">用户登录</td>   
      </tr>
      <tr>
        <td>登录ID：</td>
        <td><input type="text" name="id" value="<%=id%>"></td>
      </tr>
      <tr>
        <td>登录密码：</td>
        <td><input type="password" name="password" value="<%=pwd%>"></td>
      </tr>
      <tr>
        <td colspan="2">
          &nbsp;&nbsp;<input type="submit" value="登录">&nbsp;&nbsp;
          <input type="reset" value="重置">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="checkbox" name="remember" checked>记住我	 
        </td>   
      </tr>
    </table>
  </form>
   <h5>如果尚未注册，请先点击<a href="register.jsp">这里</a>进行注册！</h5>
    <h5>如果您是管理员，可点击<a href="mlogin.jsp">这里</a>进入！</h5>
</center>
</body>
</html>