<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%
    request.setAttribute("tab", "performance");
%>

<%@ include file="includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<div class="login-form-area" style="max-width: 400px; margin: 100px auto;">
    <div class="login-wrap">
        <h1 class="h-tit" style="text-align: center;">로그인</h1>
        <form method="post" action="${pageContext.request.contextPath}/login">
            <div class="fieldset">
                <legend>로그인 폼</legend>

                <!-- 아이디 -->
                <div class="form-group">
                    <label for="username">아이디</label>
                    <input type="text" id="username" name="username" class="krds-input" placeholder="아이디를 입력하세요">
                </div>

                <!-- 비밀번호 -->
                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" class="krds-input" placeholder="비밀번호를 입력하세요">
                </div>

                <!-- 자동 로그인 -->
                <div class="form-group krds-check-area">
                    <div class="krds-form-check">
                        <input type="checkbox" id="remember-me" name="remember-me">
                        <label for="remember-me">자동 로그인</label>
                    </div>
                </div>

                <!-- CSRF 토큰 -->
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                <!-- 로그인 버튼 -->
                <div class="form-group">
                    <button type="submit" class="krds-btn large primary" style="width: 100%;">로그인</button>
                </div>

            </div>
        </form>
    </div>
</div>

<!-- 회원가입 메시지 -->
<c:if test="${param.joined eq 'success'}">
    <script>
        $(document).ready(function () {
            alert("회원가입이 완료되었습니다.");

        });
    </script>
</c:if>

<!-- 로그아웃 메시지 -->
<c:if test="${param.logout != null}">
    <script>
        $(document).ready(function () {
            alert("로그아웃되었습니다.");
        });
    </script>
</c:if>

<%@ include file="includes/footer.jsp" %>
