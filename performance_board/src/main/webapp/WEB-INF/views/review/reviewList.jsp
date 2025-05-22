<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 탭 활성화 -->
<%
    request.setAttribute("tab", "review");
%>
<%@ include file="../includes/header.jsp" %>  

<!-- 검색창 -->
<div class="search-container">
  <div class="search-top-box">
    <div class="sch-form-wrap flex-inline">
      <div class="input-group">
        <select class="krds-form-select" title="카테고리 선택">
          <option value="">전체</option>
          <option value="공연">공연</option>
          <option value="전시">전시</option>
        </select>
        <div class="sch-input">
          <input type="text" class="krds-input" placeholder="검색어를 입력해주세요" title="검색어 입력">
          <button type="button" class="krds-btn icon">
            <span class="sr-only">검색</span>
            <i class="svg-icon ico-sch"></i>
          </button>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- //검색창 -->

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
		        <a href="${pageContext.request.contextPath}/review/reviewGet?bno=${review.bno}">
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
      <c:choose>
        <c:when test="${pageMaker.cri.pageNum == num}">
          <a class="page-link active" href="?pageNum=${num}">
            <span class="sr-only">현재페이지 </span>${num}
          </a>
        </c:when>
        <c:otherwise>
          <a class="page-link" href="?pageNum=${num}">${num}</a>
        </c:otherwise>
      </c:choose>
    </c:forEach>
  </div>
  
  <c:if test="${pageMaker.next}">
    <a class="page-navi next" href="?pageNum=${pageMaker.endPage + 1}">다음</a>
  </c:if>
</div>
<!-- //페이징 영역-->
<%@ include file="../includes/footer.jsp" %>