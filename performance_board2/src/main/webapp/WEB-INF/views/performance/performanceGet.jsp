<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>공연 상세</title>
    <link href="/resources/css/common/PerformanceDetail.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
</head>
<body>
    <section>
        <div class="container">
            <div class="p-content">
                <div class="art_drop_box">
                    <nav aria-label="breadcrumb">
                        <ul class="sopt_list breadcrumb">
                            <li><span class="material-symbols-outlined">home</span></li>
                            <li><span class="separator">›</span> 공연/행사 정보</li>
                            <li><span class="separator">›</span> <c:out value="${performance.eventName}" /></li>
                        </ul>
                    </nav>
                    <div class="contents">
                        <div class="performanceDetail-header">
                            <div class="performanceDetail-img">
                                <div class="img-wrap">
                                    <img class="imgUrl" 
                                         src="<c:out value='${performance.image}' />" 
                                         alt="<c:out value='${performance.eventName}' />" />
                                </div>
                            </div>
                            <div class="performanceDetail-info">
                                <div class="title"><c:out value="${performance.eventName}" /></div>
                            	<div class="reviewLink">
	                            	<a href="${pageContext.request.contextPath}/review/reviewList?imgKey=${performance.imgKey}">
	        						리뷰 보기
	    							</a>
                            	</div>
                                <table class="performanceDetail-table">
                                    <tbody>
                                        <tr>
                                            <th>기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간</th>
                                            <td><c:out value="${performance.period}" /></td>
                                        </tr>
                                        <tr>
                                            <th>이&nbsp;용&nbsp;대&nbsp;상</th>
                                            <td><c:out value="${performance.userTrgt}" /></td>
                                        </tr>
                                        <tr>
                                            <th>분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;야</th>
                                            <td><c:out value="${performance.category}" /></td>
                                        </tr>
                                        <tr>
                                            <th>장&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
                                            <td><c:out value="${performance.place}" /></td>
                                        </tr>
                                        <tr>
                                            <th>가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;격</th>
									    <td>
									        <c:out value="${performance.paid}" />
									        <c:if test="${not empty performance.fee}">
									            &nbsp;(<c:out value="${performance.fee}" />)
									        </c:if>
									    </td>
                                        </tr>
                                        <tr>
                                            <th>홈&nbsp;페&nbsp;이&nbsp;지</th>
                                            <td>
                                                <a href="<c:out value='${performance.homePage}' />" target="_blank">
                                                    <c:out value="${performance.homePage}" />
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="btn-wrap">
                                    <c:url var="backToListUrl" value="/performance/performanceList">
									    <c:param name="pageNum" value="${cri.pageNum}" />
									    <c:param name="amount" value="${cri.amount}" />
									</c:url>
                                    <button class="btn btn-default" onclick="location.href='${backToListUrl}'">목록</button>    
                                        <!-- 등록페이지에서 필요한 값 hidden, post방식으로 넘겨주기 -->
                                        <form id="reviewForm" action="${pageContext.request.contextPath}/review/reviewRegister" method="post" style="display:inline;">
								        <input type="hidden" name="imgKey" value="${performance.imgKey}" />
								        <input type="hidden" name="title" value="${performance.eventName}" />
								        <input type="hidden" name="img" value="${performance.image}" />
								        <input type="hidden" name="category" value="${performance.category}" />
   										<input type="hidden" name="place" value="${performance.place}" />
   										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								        <button type="submit" class="btn btn-default">리뷰 작성</button>
								    	</form>
                                </div>
                            </div>
                        </div> <!-- performanceDetail-header -->
                    </div> <!-- contents -->
                </div> <!-- art_drop_box -->
            </div> <!-- p-content -->
        </div> <!-- container -->
    </section>
</body>
</html>
<%@ include file="../includes/footer.jsp" %>
