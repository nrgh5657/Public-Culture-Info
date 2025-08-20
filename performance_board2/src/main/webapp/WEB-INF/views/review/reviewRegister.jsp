<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>

<link rel="stylesheet" href="../resources/css/review/reviewRegister.css">
<link rel="stylesheet" href="../resources/css/common/bootstrap.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
     integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />

<body>																						<!-- 등록시 내용 체크 함수 호출 -->
<form action="${pageContext.request.contextPath}/review/submitReview" method="post" onsubmit="return checkForm()">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <div class="contents">
        <nav aria-label="breadcrumb">
            <ul class="sopt_list breadcrumb">
                <li><span class="material-symbols-outlined">home</span></li>
                <li><span class="separator"></span>공연/행사 관람평</li>
            </ul>
        </nav>
        <div class="reivewDetail-header">
            <div class="reivewDetail-img">
                <div class="img-wrap">
                    <c:choose>
						  <c:when test="${not empty review.img}">
						    <img class="imgUrl" src="${review.img}" alt="${review.title}" />
						  </c:when>
						  <c:otherwise>
						    <img class="imgUrl" src="https://www.kstagefesta.kr/html/_img/main/main_sec02_bg02.png" alt="이미지 없음" />
						  </c:otherwise>
 					</c:choose>
                    <input type="hidden" name="img" value="${review.img}" />
                    <input type="hidden" name="imgKey" value="${review.imgKey}" />
                    <button type="button" id="selectPerformanceBtn" class="btn btn-default">공연 선택</button>
                </div>
                
            </div>
            <div class="review-detail-info">
	            <table class="info-table">
	                <tr>
	                    <th>공연/행사명</th>
	                    <td colspan="3">
	                        <input class="form-control" name="title" value="${review.title}" />
	                    </td>
	                </tr>
	                <tr>
	                    <th>작성자</th>
	                    <td>
	                        <input class="form-control" name="writer" value='<sec:authentication property="principal.username"/>' readonly="readonly">
	                    </td>
	                    <th>분류</th>
	                    <td>
	                        <input class="form-control" name="category" value="${review.category}" readonly/>
	                    </td>
	                </tr>
	                <tr>
	                    <th>장소</th>
	                    <td>
	                        <input class="form-control" name="place" value='${review.place}' readonly />
	                    </td>
	                    <th>작성일</th>
	                    <td>
	                        <fmt:formatDate value="${review.regDate}" pattern="yyyy-MM-dd" var="formattedRegDate" />
	    					<input class="form-control" value="${formattedRegDate}" readonly />
	                    </td>
	                </tr>
	                <tr>
	                    <th colspan="4">내용</th>
	                </tr>
	                <tr>
	                    <td colspan="4">
	                        <textarea class="form-control" name="content" rows="10">${content != null ? content : ''}</textarea>
	                    </td>
	                </tr>
	            </table>
        
	            <div class="buttons">
	                <button type="submit" class="btn btn-default">등록</button>
	                
	                <button type="button" class="btn btn-info"
	                onclick="goBackOrRedirect('${review.imgKey}')">취소 
	                </button>
	                
	                    <c:url var="backToListUrl" value="/review/reviewList">
						</c:url>
	                <button type="button" class="btn btn-success" onclick="location.href='${backToListUrl}'">목록</button>
	        	</div>
        	</div>
        </div>
    </div>
</form>


<!-- 공연 선택 모달 -->
<div id="performanceModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>공연 목록</h2>
    <div id="performanceList">
      <!-- 공연 리스트는 나중에 이곳에 동적으로 채워짐 -->
    </div>
  	
  	<div id="performancePagination" style="margin-top: 10px; text-align: center;">
  	<!-- 페이지 번호 버튼들이 여기에 생성됨 -->
  	</div>
  </div>
  
</div>

<!-- 취소 버튼 조건에 따라 다른 곳으로 이동 -->
<script>
  function goBackOrRedirect(imgKey) {
    if (!imgKey) {
      location.href = '${pageContext.request.contextPath}/review/reviewList'; // imgKey 없을 때
    } else {
      location.href = '${pageContext.request.contextPath}/performance/performanceGet/?imgKey=' + encodeURIComponent(imgKey);
    }
  }
</script>



<!-- 등록 내용 체크 스크립트 -->
	<script>
	function checkForm() {
	    const title = document.querySelector('input[name="title"]').value.trim();
	    const writer = document.querySelector('input[name="writer"]').value.trim();
	    const content = document.querySelector('textarea[name="content"]').value.trim();
	
	    if (!title) {
	        alert("공연/행사명을 입력해주세요.");
	        return false;
	    }
	    if (!writer) {
	        alert("작성자를 입력해주세요.");
	        return false;
	    }
	    if (!content) {
	        alert("내용을 입력해주세요.");
	        return false;
	    }
	    return true;
	}
	</script>


<!--모달 js-->
<script src="../resources/css/review/reviewRegister.css"></script>
<script src="../resources/js/performanceModal.js"></script>




<%@ include file="../includes/footer.jsp" %>
</body>
