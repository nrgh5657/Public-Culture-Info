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

<body>
<form action="${pageContext.request.contextPath}/review/submitReview" method="post">
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
                    <img class="imgUrl" src="${review.img}" alt="${review.title}" />
                    <input type="hidden" name="img" value="${review.img}" />
                    <input type="hidden" name="imgKey" value="${review.imgKey}" />
                </div>
            </div>
            <div class="review-detail-info">
	            <table class="info-table">
	                <tr>
	                    <th>공연/행사명</th>
	                    <td colspan="3">
	                        <input class="form-control" name="title" value="${review.title}" readonly />
	                    </td>
	                </tr>
	                <tr>
	                    <th>작성자</th>
	                    <td>
	                        <input class="form-control" name="writer" value="${writer != null ? writer : ''}" />
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
	                onclick="location.href='${pageContext.request.contextPath}/performance/performanceGet/?imgKey=${review.imgKey}'">취소 
	                </button>
	                
	                    <c:url var="backToListUrl" value="/review/reviewList">
						<c:param name="pageNum" value="${cri.pageNum}" />
						<c:param name="amount" value="${cri.amount}" />
						</c:url>
	                <button type="button" class="btn btn-success" onclick="location.href='${backToListUrl}'">목록</button>
	        	</div>
        	</div>
        </div>
    </div>
</form>

<%@ include file="../includes/footer.jsp" %>
</body>
