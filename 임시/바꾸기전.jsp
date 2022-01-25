<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "user" class="user.User" scope="page" />
<jsp:setProperty name ="user" property="userID" />
<jsp:setProperty name ="user" property="userPassword" />
<jsp:setProperty name ="user" property="userName" />
<jsp:setProperty name ="user" property="userGender" />
<jsp:setProperty name ="user" property="userEmail" />



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인처리</title>
</head>
<body>
    <%@ include file="session.jsp" %><!-- 정적포함 -->
    <%
	    if(userID !=null){  //이미 로그인된사람은 회원가입 할수없도록 하는 처리. 회원가입하려면 로그아웃하고
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('이미 로그인 되어있습니다.')");
	        script.println("location.href = 'main.jsp'");
	        script.println("</script>");
	    }


       /* 유효성검사 */
       /* 널검사 */
       if(user.getUserID()==null || user.getUserPassword()==null || user.getUserName()==null
       || user.getUserGender()==null || user.getUserEmail()==null){
           PrintWriter script = response.getWriter();
           script.println("<script>");
           script.println("alert('입력이 안 된 사항이 있습니다.')");
           script.println("history.back()");
           script.println("</script>");
       }else{
	        UserDAO userDAO = new UserDAO();
	        int result = userDAO.join(user);   //회원가입 실행
            if(result == -1){      //db연결에러로 회원가입실패
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('데이터베이스 연결을 하지 못했습니다.')");
                script.println("history.back()");
                script.println("</script>");
             }

	        if(result == -2){      //중복체크로 회원가입 실패
	            PrintWriter script = response.getWriter();
	            script.println("<script>");
	            script.println("alert('이미 존재하는 아이디입니다.')");
	            script.println("history.back()");
	            script.println("</script>");
	        }
	        else {                 //회원가입 성공
	            session.setAttribute("userID", user.getUserID());   //세션값부여
	            PrintWriter script = response.getWriter();
	            script.println("<script>");
	            script.println("location.href = 'main.jsp'");
	            script.println("</script>");
	        }
       }
    %>
</body>
</html>
