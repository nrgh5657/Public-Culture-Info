<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%
    request.setAttribute("tab", "performance");
%>

<%@ include file="includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 회원가입 폼 -->
<div class="login-form-area" style="max-width: 500px; margin: 100px auto;">
    <div class="login-wrap">
        <h1 class="h-tit" style="text-align: center;">회원가입</h1>
        <form method="post" action="${pageContext.request.contextPath}/join" onsubmit="return validateForm()">
            <div class="fieldset">

                <!-- 아이디 -->
				<div class="form-group">
				    <label for="username">아이디</label>
				    <div style="display: flex; gap: 10px;">
				        <input type="text" id="username" name="username"
				               class="krds-input" placeholder="아이디를 입력하세요"
				               required style="flex: 1;" />
				        
				        <button type="button" class="krds-btn secondary"
				                onclick="checkUsername()">
				            중복확인
				        </button>
				    </div>
				</div>

                <!-- 비밀번호 -->
                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" class="krds-input" 
                           placeholder="비밀번호를 입력하세요" required minlength="8">
                </div>

                <!-- 이메일 -->
                <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" id="email" name="email" class="krds-input" 
                           placeholder="이메일을 입력하세요">
                </div>

                <!-- hidden 필드 -->
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <input type="hidden" id="idChecked" value="false">

                <!-- 가입 버튼 -->
                <div class="form-group" style="margin-top: 20px;">
                    <button type="submit" class="krds-btn large primary" style="width: 100%;">가입하기</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- 아이디 중복 체크 & 폼 검증 -->
<script>
    function checkUsername() {
        const username = document.getElementById("username").value;
        if (!username) {
            alert("아이디를 입력하세요.");
            return;
        }

        fetch("${pageContext.request.contextPath}/checkUsername?username=" + encodeURIComponent(username))
            .then(response => response.text())
            .then(result => {
                if (result === "available") {
                    alert("사용 가능한 아이디입니다.");
                    document.getElementById("idChecked").value = "true";
                } else {
                    alert("이미 사용 중인 아이디입니다.");
                    document.getElementById("idChecked").value = "false";
                }
            });
    }

    function validateForm() {
        const idChecked = document.getElementById("idChecked").value;
        if (idChecked !== "true") {
            alert("아이디 중복 확인을 해주세요.");
            return false;
        }
        return true;
    }
</script>

<%@ include file="includes/footer.jsp" %>
