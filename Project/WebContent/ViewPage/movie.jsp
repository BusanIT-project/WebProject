<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="Reply.ReplyDao"%>
<%@ page import="Reply.ReplyDTO"%>
<%@ page import="Reply.ReplyUserDTO"%>
<jsp:useBean id="dto" class="Reply.ReplyDTO" scope="page"></jsp:useBean>
<jsp:useBean id="dto2" class="Reply.ReplyUserDTO" scope="page"></jsp:useBean>
<jsp:useBean id="userDTO" class="Movie.UserDTO" scope="page"></jsp:useBean>

<%  
		request.setCharacterEncoding("UTF-8");
		
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		ReplyDao dao = ReplyDao.getInstance();
		
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/swiper.min.css" />
<link rel="stylesheet" href="DmStyle.css">
<link type="text/css" rel="stylesheet" href="style.css" />
<script type="text/javascript" src="../js/swiper.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>
</head>
<style>
body::before {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-image: url(../images/endgame3.jpg);
	background-repeat: no-repeat;
	background-position: center;
	background-size: 100%;
	-webkit-filter: blur(5px);
	-o-filter: blur(5px);
	-ms-filter: blur(5px);
	filter: blur(5px);
	z-index: -1;
	content: "";
	-webkit-filter: blur(5px);
}

.contents {
	width: 980px;
	height: 500px;
	border: 1px solid red;
	margin: 0 auto;
}

</style>

<body>
	
	<div id="header">
		<!-- �׺���̼� -->
		<% if(userID != null) {
	%>
		<nav class="clearfix">
			<ul class="clearfix">
				<li onclick="location.href='../ViewPage/main.jsp'"><a href="#">HOME</a></li>
				<li onclick="location.href='../Movie/logoutAction.jsp'"><a
					href="#">�α׾ƿ�</a></li>
				<li onclick="location.href='../Movie/memberJoin.jsp'"><a
					href="#">ȸ������</a></li>
				<li onclick="location.href='../ViewPage/movie.jsp'"><a
					href="#">MOVIE</a></li>
				<li onclick="location.href='../ViewPage/ost.jsp'"><a href="#">OST</a></li>
				<li><a href="#">LOCATION</a></li>
			</ul>
			<a href="" id="trigger"></a>
		</nav>
		<% } else { %>
		<nav class="clearfix">
			<ul class="clearfix">
				<li onclick="location.href='../ViewPage/main.jsp'"><a href="#">HOME</a></li>
				<li onclick="location.href='../Movie/login.jsp'"><a href="#">�α���</a></li>
				<li onclick="location.href='../Movie/memberJoin.jsp'"><a
					href="#">ȸ������</a></li>
				<li onclick="location.href='../ViewPage/movie.jsp"><a
					href="#">MOVIE</a></li>
				<li onclick="location.href='../ViewPage/ost.jsp'"><a href="#">OST</a></li>
				<li><a href="#">LOCATION</a></li>

			</ul>
			<a href="" id="trigger"></a>
		</nav>

		<% } %>
	</div>
	<section id="container">
		<!-- Swiper -->
		<div class="contents">
			<div class="swiper-container gallery-top">
				<div class="swiper-wrapper">
					<div class="swiper-slide"
					style="background-image: url(../images/greenteck.jpg)"
					onclick="location.href='detailMovie.jsp'">
					</div>
					<div class="swiper-slide" style="background-image: url()"></div>
					<div class="swiper-slide" style="background-image: url()"></div>
					<div class="swiper-slide" style="background-image: url()"></div>
					<div class="swiper-slide" style="background-image: url()"></div>
					<div class="swiper-slide" style="background-image: url()"></div>
					<div class="swiper-slide" style="background-image: url()"></div>
					<div class="swiper-slide" style="background-image: url()"></div>
					<div class="swiper-slide" style="background-image: url()"></div>
					<div class="swiper-slide" style="background-image: url()"></div>
				</div>
				<!-- Add Arrows -->
				<div class="swiper-button-next swiper-button-white"></div>
				<div class="swiper-button-prev swiper-button-white"></div>
			</div>
			<div class="swiper-container gallery-thumbs">
				<div class="swiper-wrapper">
					<div class="swiper-slide"
						style="background-image: url(../images/greenteck.jpg)"></div>
					<div class="swiper-slide"
						style="background-image: url(../images/greenteck.jpg)"></div>
					<div class="swiper-slide"
						style="background-image: url(../images/greenteck.jpg)"></div>
					<div class="swiper-slide"
						style="background-image: url(../images/greenteck.jpg)"></div>
					<div class="swiper-slide"
						style="background-image: url(../images/greenteck.jpg)"></div>
					<div class="swiper-slide"
						style="background-image: url(../images/greenteck.jpg)"></div>
					<div class="swiper-slide"
						style="background-image: url(../images/greenteck.jpg)"></div>
					<div class="swiper-slide"
						style="background-image: url(../images/greenteck.jpg)"></div>
					<div class="swiper-slide"
						style="background-image: url(../images/greenteck.jpg)"></div>
					<div class="swiper-slide"
						style="background-image: url(../images/greenteck.jpg)"></div>
				</div>
			</div>
		</div>
	</section>
	<script>
		var galleryThumbs = new Swiper('.gallery-thumbs', {
			spaceBetween : 10,
			slidesPerView : 4,
			loop : true,
			freeMode : true,
			loopedSlides : 5, //looped slides should be the same
			watchSlidesVisibility : true,
			watchSlidesProgress : true,
		});

		var galleryTop = new Swiper('.gallery-top', {
			spaceBetween : 10,
			loop : true,
			loopedSlides : 5, //looped slides should be the same
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			thumbs : {
				swiper : galleryThumbs,
			},
		});
		
		
		function idFind() {
		      location.href = 'http://localhost/Project/ViewPage/detailMovie.jsp';
		   }
		
	</script>
</body>
</html>