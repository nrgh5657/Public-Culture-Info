<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 탭 활성화 -->
<%
    request.setAttribute("tab", "performance");
%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="includes/header.jsp" %>  


    <div class="login-form-area" style="max-width: 400px; margin: 100px auto;">
    <div class="login-wrap" style="text-align: center;">
      <h1 class="h-tit">로그아웃</h1>
      <p style="margin: 20px 0; font-size: 16px;">성공적으로 로그아웃되었습니다.</p>
      
	  <!-- 다시 로그인 버튼 -->
      <form method="get" action="${pageContext.request.contextPath}/customLogin">
      	<button type="submit" class="krds-btn large primary" style="width: 100%;">다시 로그인</button>
      </form>

    </div>
  </div>
  
<%@ include file="includes/footer.jsp" %>