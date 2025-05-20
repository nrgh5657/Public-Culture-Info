<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/list.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/common.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/component/component.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/component/output.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plugin/swiper-bundle.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/token/krds_tokens.css">

	<script src="${pageContext.request.contextPath}/resources/js/component/ui-script.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugin/swiper-bundle.min.js"></script>
</head>
<style>
    .krds-tab-area.layer {
      max-width: 1400px;
      margin: 0 auto;
      padding: 0 20px;
    }
</style>

<body>
<!-- header -->
<header id="krds-header" >
	
	<!-- 헤더 컨텐츠 영역  -->
	<div class="header-in">
		<!-- 헤더 상단 기타메뉴 -->
		<div class="header-container">
			<div class="inner">
				
				<div class="header-branding">
					<h2 class="logo">
						<a href="#">
							<span class="sr-only">KRDS - Korea Movie System</span>
						</a>
					</h2>
					
					<div class="header-actions">
						<a href="#" class="btn-navi login">로그인</a>
						<button type="button" class="btn-navi join">회원가입</button>
						<div class="krds-drop-wrap my-drop">
							<button type="button" class="btn-navi my drop-btn">나의 GOV</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //헤더 상단 기타메뉴 -->
		
		<div class="krds-tab-area layer">
			<!-- tab list -->
			<div class="tab line full">
				<ul role="tablist">
					<li id="tab_login_01" role="tab" aria-selected="true" aria-controls="panel_login_01" class="active">
						<button type="button" class="btn-tab">공연/행사 정보<i class="sr-only created"> 선택됨</i></button>
					</li>
					<li id="tab_login_02" role="tab" aria-selected="false" aria-controls="panel_login_02">
						<button type="button" class="btn-tab">관람평</button>
					</li>
				</ul>
			</div>
			<!-- //tab list -->
		</div>
		<!-- //tab -->
	</div>
</header>
<!-- //header -->