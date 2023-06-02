<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- qnaList.jsp -->
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<style>
		html,body {
		  font-family: Helvetica, Arial, sans-serif;
		  margin: 0;
		}
		.panel-faq-container {
		  margin-bottom: -16px;
		}
		.panel-faq-title {
		  color: #00eaea;
		  cursor: pointer;
		}
		.panel-faq-answer {
		  height: 0;
		  overflow: hidden;
		  /* 변화가 시작되는 쪽에다가 transition 적용해준다 0 -> 300px 
		  왜? 닫기 버튼을 누를 때 변화가 티남 */
		  transition: all 1s;
		}
		#btn-all-close {
		  margin-bottom: 10px;
		  background-color: #726996;
		  border: none;
		  color: #fff;
		  cursor: pointer;
		  padding: 10px 25px;
		  float: right;
		}
		#btn-all-close:hover {
		  background-color: yellow;
		  color: #000;
		  transition: all 0.35s;
		}
		.active {
		  display: block;
		  /* 높이를 정해줘야지만 transition이 적용됨 */
		  height: 300px;
		}
		#pageHtml{
			margin: auto;
		}
	</style>
    <meta charset="utf-8">
    <title>SANTA - QnA</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="santa, hiking, mountain, crew, community" name="keywords">
    <meta content="korea mountain information community" name="description">

    <!-- Favicon -->
    <link href="https://cdn.discordapp.com/attachments/773565276071526454/1113669250981318728/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap" rel="stylesheet">  

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"> -->
    <link href="<%=request.getContextPath() %>/resources/bootstrap/user/lib/animate/animate.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/bootstrap/user/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/bootstrap/user/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="<%=request.getContextPath() %>/resources/bootstrap/user/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="<%=request.getContextPath() %>/resources/bootstrap/user/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
    </div>
    <!-- Spinner End -->


    <!-- Topbar Start -->
    <div class="container-fluid bg-dark text-light px-0 py-2">
        <div class="row gx-0 d-none d-lg-flex">
            <div class="col-lg-7 px-5 text-start">
                <div class="h-100 d-inline-flex align-items-center me-4">
                    <span class="fa fa-phone-alt me-2"></span>
                    <span>+012 345 6789</span>
                </div>
                <div class="h-100 d-inline-flex align-items-center">
                    <span class="far fa-envelope me-2"></span>
                    <span>info@example.com</span>
                </div>
            </div>
            <div class="col-lg-5 px-5 text-end">
                <div class="h-100 d-inline-flex align-items-center mx-n2">
                    <span>Follow Us:</span>
                    <a class="btn btn-link text-light" href=""><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-link text-light" href=""><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-link text-light" href=""><i class="fab fa-linkedin-in"></i></a>
                    <a class="btn btn-link text-light" href=""><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
        <a href="<%=request.getContextPath() %>/resources/bootstrap/user/index.html" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h1 class="m-0">Santa</h1>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="<%=request.getContextPath() %>/resources/bootstrap/user/index.html" class="nav-item nav-link">Home</a>
                <a href="<%=request.getContextPath() %>/resources/bootstrap/user/about.html" class="nav-item nav-link">About</a>
                <a href="<%=request.getContextPath() %>/resources/bootstrap/user/service.html" class="nav-item nav-link">Services</a>
                <a href="<%=request.getContextPath() %>/resources/bootstrap/user/project.html" class="nav-item nav-link">Projects</a>
                <a href="list.qna" class="nav-item nav-link">QnA</a>
                <a href="<%=request.getContextPath() %>/resources/bootstrap/user/contact.html" class="nav-item nav-link">Contact</a>
            </div>
            <a href="" class="btn btn-primary py-4 px-lg-4 rounded-0 d-none d-lg-block">Get A Quote<i class="fa fa-arrow-right ms-3"></i></a>
        </div>
    </nav>
    <!-- Navbar End -->


    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5">
            <h1 class="display-3 text-white mb-4 animated slideInDown">QnA</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item" aria-current="page">QnA</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Qna Start -->
    <div class="container-xxl py-2">
    	<!-- qna 검색 -->
    	<div class="container mb-5">
    		<form action="list.qna" method="get">
    				<!-- 검색할 카테고리 -->
    				<select name="whatColumn" class="form-select btn-primary py-2 position-relative top-0 start-0 mt-2 me-2" style="width:8%;display:inline-block;">
	    				<option value="">전체</option>
	    				<option value="계정">계정</option>
	    				<option value="크루">크루</option>
	    				<option value="게시판">게시판</option>
	    				<option value="거래/나눔">거래/나눔</option>
	    				<option value="기타">기타</option>
    				</select>
    				<!-- //검색할 카테고리 -->
    				<!-- 검색할 키워드 -->
    				<div class="position-relative w-25" style="display:inline-block;">
                	<input name="keyword" type="text" class="form-control bg-light border-light w-100 py-2 ps-4 pe-5">
                	<input value="검색" type="submit" class="btn btn-primary py-1 position-absolute top-0 end-0 mt-1 me-2">
                	<!-- <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">검색</button> -->
                	</div>
    				<!-- //검색할 키워드 -->
    		</form>
    	</div>
    	<!-- //qna 검색 -->
    	
    	<!-- qna 목록 -->
        <div class="container">
                <div class="wow fadeInUp" data-wow-delay="0.1s">
                    <p class="fs-5 fw-bold text-primary">QnA</p>
                    <h1 class="display-5 mb-5">문의하기</h1>
                    
                    <!-- qna 표 -->
					<table class="table table-bordered table-striped table-dark table-hover">
						<thead class="thead-light text-center">
					    	<tr>
					          <th>No</th>
					          <th>Category</th>
					          <th>Question</th>
					          <th>Date</th>
					    	</tr>
					    </thead>
					    <tbody class="text-center">
					      	<!-- 내용 -->
					      	<c:forEach var="qb" items="${qnaList}">
						        <tr>
						          <td>${qb.qnanum}</td>
						          <td>${qb.qnacategory}</td>
						          <td class="text-left" width="50%">
						            <div class="panel-faq-container">
						              <p class="panel-faq-title"></p>
						              <div class="panel-faq-answer">
						              	<p>Q : ${qb.qnaquestion}</p>
						              	<p>A : ${qb.qnaanswer}</p>
						              </div>
						            </div>
						          </td>
						          <td>${qb.qnadate}</td>
						        </tr>
							</c:forEach>
						<!-- //내용 -->
						</tbody>
				</table>
				<span id="pageHtml">
				${pageInfo.pageHtml}
				</span>
			<!-- 아코디언 모두 닫힘 버튼 -->
			<button id="btn-all-close">QnA ALL Close</button>
			<br>
			<!-- //qna 표 -->
            <!-- <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit sed stet lorem sit clita duo justo.</p> -->
            <!-- <a class="btn btn-primary py-3 px-4" href="">See More</a> -->
			</div>
        </div>
    </div>
    <!-- //qna 목록 -->
    <!-- Qna End -->


    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-light footer mt-5 py-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">Our Office</h4>
                    <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                    <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                    <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                    <div class="d-flex pt-2">
                        <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-youtube"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">Services</h4>
                    <a class="btn btn-link" href="">Landscaping</a>
                    <a class="btn btn-link" href="">Pruning plants</a>
                    <a class="btn btn-link" href="">Urban Gardening</a>
                    <a class="btn btn-link" href="">Garden Maintenance</a>
                    <a class="btn btn-link" href="">Green Technology</a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">Quick Links</h4>
                    <a class="btn btn-link" href="">About Us</a>
                    <a class="btn btn-link" href="">Contact Us</a>
                    <a class="btn btn-link" href="">Our Services</a>
                    <a class="btn btn-link" href="">Terms & Condition</a>
                    <a class="btn btn-link" href="">Support</a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">Newsletter</h4>
                    <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                    <div class="position-relative w-100">
                        <input class="form-control bg-light border-light w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                        <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Copyright Start -->
    <div class="container-fluid copyright py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved.
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a href="https://themewagon.com">ThemeWagon</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Copyright End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/user/lib/wow/wow.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/user/lib/easing/easing.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/user/lib/waypoints/waypoints.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/user/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/user/lib/counterup/counterup.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/user/lib/parallax/parallax.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/user/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/user/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="<%=request.getContextPath() %>/resources/bootstrap/user/js/main.js"></script>
</body>
	<script type="text/javascript">
    	  // panel-faq-container
    	  const panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체
    	  
    	  // panel-faq-answer
    	  let panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

    	  // btn-all-close
    	  const btnAllClose = document.querySelector("#btn-all-close");
    	  
    	  // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
    	  for( let i=0; i < panelFaqContainer.length; i++ ) {
    	    panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
    	      // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
    	      panelFaqAnswer[i].classList.toggle('active');
    	    });
    	  };
    	  
    	  btnAllClose.addEventListener('click', function() {
    	    // 버튼 클릭시 처리할 일  
    	    for(let i=0; i < panelFaqAnswer.length; i++) {
    	        panelFaqAnswer[i].classList.remove('active');
    	    };
    	  });
    </script>
</html>