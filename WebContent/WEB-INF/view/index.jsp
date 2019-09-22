<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt"  prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
	      <base href="${pageContext.request.contextPath }/">
	      <meta charset="utf-8">
		  <meta http-equiv="X-UA-Compatible" content="IE=edge">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		
		  <title>个人微盘主页</title>
		  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
		  <link rel="stylesheet" href="resources/person/font-awesome-4.5.0/css/font-awesome.min.css">              
		  <link rel="stylesheet" href="resources/person/css/bootstrap.min.css">
		  <link rel="stylesheet" type="text/css" href="resources/person/slick/slick.css"/>
		  <link rel="stylesheet" type="text/css" href="resources/person/slick/slick-theme.css"/>
		  <link rel="stylesheet" href="resources/person/css/tooplate-style.css">
		  <link rel="stylesheet" href="resources/person/css/magnific-popup.css">

      </head>

      <body>
        <div class="parallax-window" data-parallax="scroll" data-image-src="resources/person/img/bg-img-01.jpg">
          <section class="container tm-page-1-content">
            <div class="row">
              <div class="col-md-6 ml-auto tm-text-white">
                <header><h1>个人微盘</h1></header>
                <p>您可以通过个人微盘轻松地进行照片、视频、文档等文件的网络上传、同步和分享。空间大、速度快、安全稳固。加入会员行列享受更多特权，更有海量正版资源共享，工作学习娱乐一“盘”搞定！</p>
              </div>
            </div>

          </section>
        </div>


        <div id="tm-section-2" class="parallax-window" data-parallax="scroll" data-image-src="resources/person/img/bg-img-02.jpg">
          <section class="container tm-page-1-content tm-page-2">
            <div class="row">
              <article class="col-md-6 tm-article tm-bg-white-transparent">
                <header><h2 >超大空间</h2></header>
                <b>会员享受2T超大空间，无限存储文件，实现随时随地携带</b>
              </article>

              <article class="col-md-6 tm-article tm-bg-white-transparent">
                <header><h2>大文件上传</h2></header>
                <b>实现超大文件上传以及一流的下载速度</b>
              </article>
            </div>
          </section>
        </div>
        <div id="tm-section-3" class="parallax-window" data-parallax="scroll" data-image-src="resources/person/img/bg-img-03.jpg">
          <section class="container tm-page-1-content">
            <div class="row1">
              <div class="col-xl-6 col-md-8 ml-auto">
                <article class="tm-bg-white-transparent-page3">
                  <header><h5 class="tm-bg-white">会员享有的十大特权</h5></header>
                  <p class="tm-bg-white2">拥有强大的上传以及下载功能，无限的分享特权等等</p>
                </article>
              </div>
            </div>
          </section>
        </div>
        <div id="tm-section-4" class="parallax-window" data-parallax="scroll" data-image-src="resources/person/img/bg-img-04.jpg">

          <div class="row tm-page-4-content">
            <article  class="col-xs-6 col-md-4 tm-bg-white-transparent">
              <header><h3>一流的程序设计</h3></header>
              <p>保证个人信息的安全，全方位维护个人信息</p>
            </article>
            <article class="col-xs-6 col-md-4 tm-bg-white-transparent">
              <header><h3>全方位的功能体验</h3></header>
              <p>给用户以全方位的体验，让用户完全舒心、放心</p>
            </article>
            <article class="col-xs-6 col-md-4 tm-bg-white-transparent">
              <header><h3>惠民的价格</h3></header>
              <p>以最舒心的价格带来最好的用户体验</p>
            </article>
          </div>
        </div>
        <div class="parallax-window" data-parallax="scroll" data-image-src="resources/person/img/bg-img-05.jpg">
          <div class="container">
            <div class="row">
              <div class="tm-img-container">
                <div class="tm-img-slider">
                    <a class="image-link" href="resources/person/img/gallery-img-01.jpg"><img src="resources/person/img/gallery-img-01-tn.jpg" alt="Image" class="tm-slider-img"></a>
                    <a class="image-link" href="resources/person/img/gallery-img-02.jpg"><img src="resources/person/img/gallery-img-02-tn.jpg" alt="Image" class="tm-slider-img"></a>
                    <a class="image-link" href="resources/person/img/gallery-img-03.jpg"><img src="resources/person/img/gallery-img-03-tn.jpg" alt="Image" class="tm-slider-img"></a>  
                    <a class="image-link" href="resources/person/img/gallery-img-04.jpg"><img src="resources/person/img/gallery-img-04-tn.jpg" alt="Image" class="tm-slider-img"></a>
                    <a class="image-link" href="resources/person/img/gallery-img-05.jpg"><img src="resources/person/img/gallery-img-05-tn.jpg" alt="Image" class="tm-slider-img"></a>
                    <a class="image-link" href="resources/person/img/gallery-img-06.jpg"><img src="resources/person/img/gallery-img-06-tn.jpg" alt="Image" class="tm-slider-img"></a>          
                </div>
              </div>
            </div>
          </div>
        </div>  
          <script src="resources/person/js/jquery-1.11.3.min.js"></script>
          <script src="resources/person/js/parallax.min.js"></script>
     
          <script type="text/javascript" src="resources/person/slick/slick.min.js"></script> 
          
          <script src="resources/person/js/jquery.magnific-popup.min.js"></script>
          
          <script>

            function setCarousel() {
              var slider = $('.tm-img-slider');
              if (slider.hasClass('slick-initialized')) {
                slider.slick('destroy');
              }
              if($(window).width() > 991){
                  // Slick carousel
                  slider.slick({
                    dots: true,
                    infinite: true,
                    slidesToShow: 4,
                    slidesToScroll: 1
                  });
                }
                else {
                 slider.slick({
                  dots: true,
                  infinite: true,
                  slidesToShow: 2,
                  slidesToScroll: 1
                });
               }
             }

             $(document).ready(function(){

              setCarousel();
              $('.tm-img-slider').magnificPopup({
                delegate: 'a', // child items selector, by clicking on it popup will open
                type: 'image'

              });
              $(window).resize(function() {
                setCarousel();
              });
            });

          </script>
        </body>
        </html>