<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 탭 활성화 -->
<%
    request.setAttribute("tab", "performance");
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

<div class="krds-table-wrap" style="max-width: 1200px; margin: 50px auto 0 auto;">
	<table class="tbl col data">
		<colgroup>
            <col style="width: 5%;">
            <col style="width: 10%;">
            <col style="width: 10%;">
            <col>
            <col style="width: 20%;">
            <col style="width: 20%;">
		</colgroup>
		<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">이미지</th>
            <th scope="col">분류</th>
            <th scope="col">공연/행사명</th>
            <th scope="col">장소</th>
            <th scope="col">기간</th>
		</tr>
		</thead>
		<tbody>
		  <c:forEach var="performance" items="${performanceList}" varStatus="status">
			  <tr>
			    <td>${(pageMaker.cri.pageNum - 1) * pageMaker.cri.amount + status.index + 1}</td>
			    <td><img src="<c:out value='${performance.image}' />" alt="포스터" width="80"></td>
			    <td><c:out value="${performance.category}" /></td>
			    <td>
			    <a href="${pageContext.request.contextPath}/performance/performanceGet?imgKey=${performance.imgKey}">
    			<c:out value="${performance.eventName}" />
				</a></td>
			    <td><c:out value="${performance.place}" /></td>
			    <td><c:out value="${performance.period}" /></td>
			  </tr>
		  </c:forEach>
		</tbody>
	</table>
</div>

<!-- 페이징 영역 -->
<div class="krds-pagination">

  <!-- 이전 버튼 -->
  <c:if test="${pageMaker.prev}">
    <a class="page-navi prev" href="?pageNum=${pageMaker.startPage - 1}">이전</a>
  </c:if>

  <!-- 페이지 번호 -->
  <div class="page-links">
    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
      <a class="page-link ${pageMaker.cri.pageNum == num ? 'active' : ''}"
         href="?pageNum=${num}">
        <c:if test="${pageMaker.cri.pageNum == num}">
          <span class="sr-only">현재페이지 </span>
        </c:if>
        ${num}
      </a>
    </c:forEach>
  </div>

  <!-- 다음 버튼 -->
  <c:if test="${pageMaker.next}">
    <a class="page-navi next" href="?pageNum=${pageMaker.endPage + 1}">다음</a>
  </c:if>

</div>
<!-- //페이징 영역-->


<%@ include file="../includes/footer.jsp" %>