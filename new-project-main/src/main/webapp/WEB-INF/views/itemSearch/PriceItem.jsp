<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <title>paging</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="/resources/css/itemlist.css" />
  <script type="text/javascript" src="/resources/js/itemSearch.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> <!-- ajax 사용시 필수 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <meta charset="UTF-8">
   <title>상품 목록</title>
</head>
<body>
<div class="checkbox">
    
        <label for="color">
       		<input type="radio" name="color" value="블랙"> 블랙
           	<input type="radio" name="color" value="그레이"> 그레이
           	<input type="radio" name="color" value="차콜"> 차콜
           	<input type="radio" name="color" value="베이지"> 베이지
           	<input type="radio" name="color" value="그레이프"> 그레이프
           	<input type="radio" name="color" value="네이비"> 네이비
           	<input type="radio" name="color" value="코코아"> 코코아
           	<input type="radio" name="color" value="브라운"> 브라운
           	<input type="radio" name="color" value="카키"> 카키
           	<input type="radio" name="color" value="옐로우">옐로우
           	<input type="radio" name="color" value="그린">그린
           	<input type="radio" name="color" value="블루">블루
           	<input type="radio" name="color" value="바이올렛">바이올렛
           	<input type="radio" name="color" value="화이트">화이트
           	<input type="radio" name="color" value="올리브">올리브
           	<input type="radio" name="color" value="오렌지">오렌지
           	<input type="radio" name="color" value="아보카도">아보카도
           	<input type="radio" name="color" value="아이보리">아이보리
           	<input type="radio" name="color" value="레몬">레몬
           	<input type="radio" name="color" value="머스타드">머스타드
           	<input type="radio" name="color" value="코랄">코랄
            <input type="radio" name="color" value="크림">크림
            <input type="radio" name="color" value="라임">라임
           	<input type="radio" name="color" value="카멜">카멜
           	<input type="radio" name="color" value="망고">망고
           	<input type="radio" name="color" value="핑크">핑크
           	<input type="radio" name="color" value="레드">레드
           	<input type="radio" name="color" value="민트">민트
           	<input type="radio" name="color" value="초코">초코
           	<input type="radio" name="color" value="퍼플">퍼플
           	<input type="radio" name="color" value="오트밀">오트밀
        </label>
        <br>   
    <form action="/item/color" method="get">    
		<div class="search">
		  <input type="text" class="searchinput" placeholder="검색어 입력">
		</div>
        <input type="submit" value="검색">
    </form>
    <div class="container">    
  <ul class="nav justify-content-end">
    <li class="nav-item">
      <a class="nav-link" href="#">높은 가격순</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">낮은 가격순</a>
    </li>

  </ul>
</div>
</div>

    <div id="itemlist" class="prdlist_rollup">
            <c:forEach var="item" items="${list}">
                <li class="item">
                    <div class="box">
                        <div class="prdImg">
                            <a href="">
                                <img src="<c:url value='${item.mainImg}'/>" class="MS_prod_img_m thumb">
                            </a>
                        </div>
                        <div class="prd_info_box" id="prd_info_boxs" onclick="location.href='';" >
                            <div class="name">
                                <a href="">
                                    <font color="007cd8"><b>${item.itemName}</b></font>
                                </a>
                            </div>
                            <div class="list_info">
                                <ul>
                                    <li class="cash"><class="price" id="sale">${item.sale}원</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
            </c:forEach>
    </div>
  </body>
    
    <!-- 페이징처리 -->
    <div class="pull-right">
        <ul class="pagination">
            <c:if test="${pageMaker.prev}">
                <li class="page-item"><a class="page-link" href="?pageNum=${pageMaker.startPage - 1}&color=${selectedColor}">Previous</a></li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}" varStatus="loop">
                <li class="page-item ${pageMaker.pageNum == num ? 'active' : ''}">
                    <a class="page-link" href="?pageNum=${num}&color=${selectedColor}">${num}</a>
                </li>
            </c:forEach>

            <c:if test="${pageMaker.next}">
                <li class="page-item"><a class="page-link" href="?pageNum=${pageMaker.endPage + 1}&color=${selectedColor}">Next</a></li>
            </c:if>
          </ul>
    </div>
    <!-- /페이징처리 -->
    
<%--           <form id="actionForm" action="" method="get">
          	<input type="hidden" name="total" value="${pageMaker.total}">
          	<input type="hidden" name="itemName" value="${pageMaker.itemName}">
          	<input type="hidden" name="color" value="${selectedColor}">
          </form>   --%>
</html>
