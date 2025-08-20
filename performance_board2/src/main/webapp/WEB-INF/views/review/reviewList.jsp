<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 탭 활성화 -->
<%
    request.setAttribute("tab", "review");
%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="../includes/header.jsp" %>  

<!-- 검색창 -->
<form action="/review/reviewList" method="get" class="search-container">
<input type="hidden" name="imgKey" value="${imgKey}" />
  <div class="search-top-box">
    <div class="sch-form-wrap flex-inline">
      <div class="input-group">
        <select class="krds-form-select" name="type" title="검색 조건 선택">
		  <option value="" <c:if test="${pageMaker.cri.type == null}">selected</c:if>>--</option>
		  <option value="T" <c:if test="${pageMaker.cri.type == 'T'}">selected</c:if>>제목</option>
		  <option value="C" <c:if test="${pageMaker.cri.type == 'C'}">selected</c:if>>내용</option>
		  <option value="W" <c:if test="${pageMaker.cri.type == 'W'}">selected</c:if>>작성자</option>
		  <option value="TCW" <c:if test="${pageMaker.cri.type == 'TCW'}">selected</c:if>>전체</option>
		</select>
		
        <div class="sch-input">
          <input type="text" class="krds-input" name="keyword"
          		placeholder="검색어를 입력해주세요"
          		value="<c:out value='${pageMaker.cri.keyword}' />"
          		title="검색어 입력" />
          <button type="submit" class="krds-btn icon">
            <span class="sr-only">검색</span>
            <i class="svg-icon ico-sch"></i>
          </button>
        </div>
      </div>
        
    </div>
  </div>
</form>
<!-- //검색창 -->

<c:if test="${not empty imgKey}">
  <div style="max-width: 1200px; margin: 20px auto 20px auto; text-align: left;">
    <h3>이 공연의 리뷰 목록</h3>
  </div>
</c:if>

  	<!--20250523리뷰 작성 버튼 추가-->
    	<div class="review-register-button" style="max-width: 1200px; margin: 20px auto 0 auto; text-align: right;">
  			<button class="btn btn-primary"
          		onclick="location.href='${pageContext.request.contextPath}/review/reviewRegister'">
    			<i class="fas fa-edit"></i> 리뷰 작성
  			</button>
		</div>

<!-- 목록 -->
<div class="krds-table-wrap" style="max-width: 1200px; margin: 50px auto 0 auto;">
  <table class="tbl col data">
    <colgroup>
      <col style="width: 5%;">
      <col style="width: 5%;">
      <col style="width: 60%;">
      <col style="width: 5%;">
      <col style="width: 10%;">
      <col style="width: 5%;">
    </colgroup>
    <thead>
      <tr>
        <th scope="col">번호</th>
        <th scope="col">이미지</th>
        <th scope="col">공연/행사명</th>
        <th scope="col">작성자</th>
        <th scope="col">작성일</th>
        <th scope="col">조회수</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach var="review" items="${list}">
	      <tr>
	        <td><c:out value="${review.bno}" /></td>
	        <td><img src="${review.img}" alt="포스터" width="80"></td>
	        <td>
		        <a href="${pageContext.request.contextPath}/review/reviewGet?bno=${review.bno}
		        &pageNum=${pageMaker.cri.pageNum}
				&amount=${pageMaker.cri.amount}
				&type=${pageMaker.cri.type}
				&keyword=${pageMaker.cri.keyword}
				&imgKey=${imgKey}">
		          <c:out value="${review.title}" />
		        </a>
	      	</td>
	        <td><c:out value="${review.writer}" /></td>
	        <td><fmt:formatDate value="${review.regDate}" pattern="yyyy-MM-dd" /></td>
	        <td><c:out value="${review.readCount}" /></td>
	      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
<!-- //목록 -->

<!-- 페이징 영역 -->
<div class="krds-pagination">
	<c:if test="${pageMaker.prev}">
    	<a class="page-navi prev" href="?pageNum=${pageMaker.startPage - 1}">이전</a>
  	</c:if>

  <div class="page-links">
    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
      <a class="page-link ${pageMaker.cri.pageNum == num ? 'active' : ''}"
         href="#" data-page="${num}">
        <c:if test="${pageMaker.cri.pageNum == num}">
          <span class="sr-only">현재페이지 </span>
        </c:if>
        ${num}
      </a>
    </c:forEach>
  </div>
  
  <c:if test="${pageMaker.next}">
    <a class="page-navi next" href="?pageNum=${pageMaker.endPage + 1}">다음</a>
  </c:if>
</div>
<!-- //페이징 영역-->

<!-- 숨겨진 form 추가 -->
<form id="actionForm" action="/review/reviewList" method="get">
  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
  <input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
  <input type="hidden" name="type" value="${pageMaker.cri.type}" />
  <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}" />
    <c:if test="${not empty imgKey}">
    <input type="hidden" name="imgKey" value="${imgKey}" />
  </c:if>
</form>

<%@ include file="../includes/footer.jsp" %>

<script type="text/javascript">
  $(document).ready(function() {
    let actionForm = $("#actionForm");

    $(".page-link").on("click", function(e) {
      e.preventDefault();

      const page = $(this).data("page"); // data-page 값 읽기
      if (!page) return;

      actionForm.find("input[name='pageNum']").val(page);
      actionForm.submit(); // form으로 이동
    });
  });
</script>