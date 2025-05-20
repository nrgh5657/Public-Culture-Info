<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>  

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
		  <c:forEach var="performance" items="${list}">
			  <tr>
			    <td><c:out value="${performance.bno}" /></td>
			    <td><img src="<c:out value='${performance.image}' />" alt="포스터" width="80"></td>
			    <td><c:out value="${performance.category}" /></td>
			    <td>
			      <a href="/event/detail?no=<c:out value='${performance.bno}' />">
			        <c:out value="${performance.title}" />
			      </a>
			    </td>
			    <td><c:out value="${performance.location}" /></td>
			    <td><c:out value="${performance.period}" /></td>
			  </tr>
		  </c:forEach>
		  

		</tbody>
	</table>
</div>