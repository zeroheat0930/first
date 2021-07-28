<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
<script type="text/javascript">
var pageNum = '${pageNum}'; 
function dateStrings(date) {
	var d = new Date(date);
	return d.toISOString().split("T")[0];
}
function fnProductPaging(pageMaker) {
	var startPage = pageMaker.startPage;
	var endPage = pageMaker.endPage;
	var pageNum = pageMaker.startPage - 1;
	var amount = pageMaker.cri.amount;
	var productPaging = $(".pagerWrap").empty();
	
	if (pageMaker.prev) {
		
		var pre = '<button onclick="productList('+pageNum+');">Previous</button>';
		
		productPaging.append(pre);
	}
	
	for (var i = startPage; i <= endPage; i ++) {
		
		var pageCheck = pageMaker.cri.pageNum == i;
		var pageClass = '';
		
		if (pageCheck) {
			pageClass = 'on';
		} else {
			pageClass = '';
		}
		
		var now = '<button class="'+(pageMaker.cri.pageNum == i ? "on" : "")+'" id="nowPage" onclick="productList('+i+');">'+i+'</button>';
		
		productPaging.append(now);
	}
	
	if (pageMaker.next) {
		
		var next = '<button onclick="productList('+endPage+1+');">Previous</button>';
		productPaging.append(nextLink);
	} 
	
}
function productList(pnum) {
	var amount = 10;
	var productList = $("#productList").empty();
	$.ajax({
		type: "GET",
		url: "${appRoot}/user/productList2",
		data: {"pageNum":pnum, "amount":amount},
		dataType: "JSON",
		success: function(res) {
			console.log(res);
			fnProductPaging(res.pageMaker);
			
			for (var i = 0; i < res.list.length; i++) {
				
				var orderedNum;
				var checkVal = product_seq;
				$.ajax({
					type: "GET",
					url: "${appRoot}/user/orderList",
					dataType: "JSON",
					data: {"order_productseq": checkVal},
						async: false,
					success: function(res2) {
						orderedNum = res2.length;
					}
				});
				
				var product_seq = res.list[i].product_seq;
				var product_name = res.list[i].product_name;
				var product_price = res.list[i].product_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				var product_regdate = res.list[i].product_regdate;
				var product_filename = res.list[i].product_filename;
				
				/* 철수 추가 파일이름 여러개일시 한개로 */
				product_filename = product_filename.split(",");
				product_filename = product_filename[0];
				/* 철수 수정 끝*/
				
				var productTbody = '<tr>'
												  +'<td><input type="checkbox" id="product_seq" name="product_seq" value="'+product_seq+'" /></td>'
												  +'<td><img alt="상품사진" src="${appRoot }/resources/upload/'+product_filename+'">'
												  +'<a style= "color: #000;" href="${appRoot}/product/get?product_seq='+product_seq+'">&nbsp;'+product_name+'</a>'+" ["+orderedNum+"]개 주문이 들어왔습니다"+ '</td>'
												  +'<td><p>'+product_price+'원</p></td>'
												  +'<td><p>'+dateStrings(product_regdate)+'</p></td>';
				
				productList.append(productTbody);
			
			}
		}
		
	});
	
	
}
$(document).ready(function() {
	
	$("#payComplateTable").hide();
	$("#sendListTable").hide();
	$("#send_btn").hide();
	
	$('#allCheck').click(function () {
		if ($("input:checkbox[id='allCheck']").prop("checked")) {
			$("input[type=checkbox]").prop("checked", true);
		} else {
			$("input[type=checkbox]").prop("checked", false);
		}
	});	
	
	$('#allCheckOrderInfo').click(function () {
		if ($("input:checkbox[id='allCheckOrderInfo']").prop("checked")) {
			$("input[type=checkbox]").prop("checked", true);
		} else {
			$("input[type=checkbox]").prop("checked", false);
		}
	});	
	
	function dateString(date) {
		var d = new Date(date);
		return d.toISOString().split("T")[0];
	}
	
	function showList() {
		//alert(pageNum);
		//var amount = 10;
		var productList = $("#productList").empty();
		
		$.ajax({
			type: "GET",
			url: "${appRoot}/user/productList2",
			dataType: "JSON",
			//data: {"pageNum":pageNum, "amount":amount},
			success : function(res) {
				console.log(res);
				
				
				fnProductPaging(res.pageMaker);
				
				
				
				for (var i = 0; i < res.list.length; i++) {
					var product_seq = res.list[i].product_seq;
					/* 철수 수정 이걸가지고 해당하는 orderVO개수가져오기*/
					var orderedNum;
					var checkVal = product_seq;
					$.ajax({
						type: "GET",
						url: "${appRoot}/user/orderList",
						dataType: "JSON",
						data: {"order_productseq": checkVal},
 						async: false,
						success: function(res2) {
							orderedNum = res2.length;
						}
					});
					/* 철수 수정끝 */
					
					var product_name = res.list[i].product_name;
					var product_price = res.list[i].product_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					var product_regdate = res.list[i].product_regdate;
					var product_filename = res.list[i].product_filename;
					
					/* 철수 추가 파일이름 여러개일시 한개로 */
					product_filename = product_filename.split(",");
					product_filename = product_filename[0];
					/* 철수 수정 끝*/
					
					var productTbody = '<tr>'
													  +'<td><input type="checkbox" id="product_seq" name="product_seq" value="'+product_seq+'" /></td>'
													  +'<td><img alt="상품사진" src="${appRoot }/resources/upload/'+product_filename+'">'
													  +'<a style= "color: #000;" href="${appRoot}/product/get?product_seq='+product_seq+'">&nbsp;'+product_name+'</a>'+" ["+orderedNum+"]개 주문이 들어왔습니다"+ '</td>'
													  +'<td><p>'+product_price+'원</p></td>'
													  +'<td><p>'+dateString(product_regdate)+'</p></td>';
					
					productList.append(productTbody);
					
					
				}
				
			}
		});
		
	}
	
	$("#payComplateList").click(function() {
		
			var checkboxVal = $("input:checkbox[name='product_seq']:checked").val();
			var allCheckVal = $("input:checkbox[name='allCheck']:checked").val();
			
		 	if (!checkboxVal) {
				alert('체크 박스를 선택해주세요');
				return false;
			} 
		
		$(".pagerWrap").hide();
		$("#sendListTable").hide();
		$("#productTable").hide();
		$("#productPage").hide();
		$("#payComplateTable").show();
		$("#send_btn").show();
		$("#orderInfoPage").show();
		$("input:checkbox[id='allCheck']").prop("checked", false);
		$("input:checkbox[id='allCheckOrderInfo']").prop("checked", false);
		
		var check_arr = [];
		
		$("input:checkbox[name='product_seq']:checked").each(function() {
			var checkVal = $(this).val();
			check_arr.push(checkVal);
			console.log(check_arr);
			var complateList = $("#complateList").empty();
			
			$.ajax({
				type: "GET",
				url: "${appRoot}/user/orderList",
				dataType: "JSON",
				data: {"order_productseq": checkVal},
				success: function(res) {
					//alert('성공');
					console.log(res);
					
					for (var i = 0; i < res.length; i++) {
						var order_seq = res[i].order_seq;
						var order_poname = res[i].order_poname;
						var order_username = res[i].order_username;
						var order_date = res[i].order_date;
						
						var complateTbody = '<tr>'
															 +'<td><input type="checkbox" id="order_seq" name="order_seq" value="'+order_seq+'" /></td>'
															 +'<td><a style= "color: #000;" href="${appRoot}/product/get?product_seq='+checkVal+'">&nbsp;'+order_poname+'</a></td>'
															 +'<td>'+order_username+'</td>'
															 +'<td>'+dateString(order_date)+'</td>'
															 +'<tr>';
					 		complateList.append(complateTbody);
					 		
					}
					
				}
				
			});
			
		});
		
	
	});
	
	$("#send_btn").click(function() {
		var checkboxVal = $("input:checkbox[name='order_seq']:checked").val();
		var allCheckVal = $("input:checkbox[name='allCheckOrderInfo']:checked").val();
		
	 	if (!checkboxVal) {
			alert('체크 박스를 선택해주세요');
			return false;
		} 
	 	
		var check_arr = [];
	 	
	 	$("input:checkbox[name='order_seq']:checked").each(function() {
			var checkVal = $(this).val();
			check_arr.push(checkVal);
	 	});
	 	
	 	if(!confirm('발송하시겠습니까?'))	{
			return false;
		}
	 	
		location.href="${appRoot}/user/productSend?order_seq="+check_arr;
	});
	
	$("#defaultList").click(function() {
		$(".pagerWrap").show();
		$("#productTable").show();
		$("#payComplateTable").hide();
		$("#sendListTable").hide();
		$("#send_btn").hide();
		$("#orderInfoPage").hide();
		$("#productPage").show();
		$("input:checkbox[id='allCheck']").prop("checked", false);
		$("input:checkbox[id='allCheckOrderInfo']").prop("checked", false);
		$("input:checkbox[id='product_seq']").prop("checked", false);
		$("input:checkbox[id='order_seq']").prop("checked", false);
		showList();
	});
	
	$("#sendListTab").click(function() {
		$(".pagerWrap").hide();
		$("#productTable").hide();
		$("#payComplateTable").hide();
		$("#send_btn").hide();
		$("#orderInfoPage").hide();
		$("#productPage").hide();
		$("input:checkbox[id='allCheck']").prop("checked", false);
		$("input:checkbox[id='allCheckOrderInfo']").prop("checked", false);
		$("input:checkbox[id='product_seq']").prop("checked", false);
		$("input:checkbox[id='order_seq']").prop("checked", false);
		$("#sendListTable").show();
		
		var sendList = $("#sendList").empty();
		
		$.ajax({
			type: "GET",
			url: "${appRoot}/user/sendList",
			dataType: "JSON",
			success: function(res) {
				console.log(res);
				fnProductPaging(res.pageMaker);
				
				for (var i = 0; i < res.list.length; i++) {
					
					var order_seq = res.list[i].order_seq;
					var order_poname = res.list[i].order_poname;
					var order_username = res.list[i].order_username;
					var order_productseq = res.list[i].order_productseq;
					var order_date = res.list[i].order_date;
					var successDate = new Date(order_date);
					var arrivalDate = successDate.setDate(successDate.getDate() + 3);
					//alert(successDate);
					
					var sendListTbody = '<tr>'
														 +'<td>'+order_seq+'</td>'
														 +'<td><a style= "color: #000;" href="${appRoot}/product/get?product_seq='+order_productseq+'">&nbsp;'+order_poname+'</a></td>'
														 +'<td>'+order_username+'</td>'
														 +'<td>'+dateString(order_date)+'</td>'
														 +'<td>'+dateString(arrivalDate)+'</td>'
														 +'<td>'+'배송중'+'</td>'
														 +'<tr>';
						 
					sendList.append(sendListTbody);
					
					
				} 
			}
			
		});
		
	});
	
	showList();
});
</script>
<title>판매 목록</title>
</head>
<style>
#container {
    clear: both;
    position: relative;
    margin: 50px auto 0px;
    padding: 0 0 50px 0;
    width: 1000px;
    z-index: 1;
}
.table img {
	width: 70px;
	height: 70px;
}
.tablep p {
	display:table-cell
}
p {
	vertical-align: middle;
	padding-top: 18px;
} 
#send_btn {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #4a4a4a;
    padding: 0px 25px;
    margin: 0 0px;
    margin-top: -24px;
    line-height: 45px;
    float: left;
    border-radius: 3px;
}
/* 페이지 네이션 css */
.pagerWrap {
    position: relative;
    text-align: center;
    margin: 0px 0;
}
.pagerWrap button {
    width: 34px;
    height: 34px;
    color: #333;
    border: 1px solid #dedede;
    text-align: center;
    line-height: 34px;
    background: #fff;
    display: inline-block;
}
.pagerWrap button.on {
    border-color: #222222;
    background: #4a4a4a;
    color: #fff;
}
.pagerWrap button:hover {
    border-color: #4a4a4a;
    color: #4a4a4a;
}
.pagerWrap button.on:hover {
    border-color: #4a4a4a;
    color: #fff;
}
</style>
<body>
<u:mainNav/>
	<c:choose>
	<c:when test="${authUser != null }">
	<div class="container">
		<section id ="container">
		<h3><a style= "color: #000;" href="#" id="defaultList">판매 목록</a> / <a style= "color: #000;" href="#" id="payComplateList">결제완료 상품</a>
		/ <a style= "color: #000;" href="#" id="sendListTab">배송중인상품</a></h3><br>
			<button id="send_btn">발송처리</button><br>
			<table class="table table-hover" id="productTable">
				<thead>
					<tr>
						<th><input type="checkbox" name="allCheck" id="allCheck"  value=""/>&nbsp; 전체선택</th>
						<th>상품명</th>
						<th>상품금액</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody id="productList">
				
				</tbody>
			</table>
			<table class="table table-hover" id="payComplateTable">
				<thead>
					<tr>
						<th><input type="checkbox" name="allCheckOrderInfo" id="allCheckOrderInfo"  value=""/>&nbsp; 전체선택</th>
						<th>상품명</th>
						<th>구매자</th>
						<th>구매일</th>
					</tr>
				</thead>
				<tbody id="complateList">
				
				</tbody>
			</table>
			
			<table class="table table-hover" id="sendListTable">
				<thead>
					<tr>
						<th>번호</th>
						<th>상품명</th>
						<th>구매자</th>
						<th>배송시작일</th>
						<th>도착예정일</th>
						<th>수취상태</th>
					</tr>
				</thead>
				<tbody id="sendList">
				
				</tbody>
			</table>
			<!--ajax 페이징 -->
			<div class="container d-flex justify-content-center">
				<div class="pagerWrap"></div>
			</div>

		</section>
	</div>
	</c:when>
	<c:otherwise>
		<script>
			alert('로그인 사용자만 이용 가능합니다.');
			location.href="${appRoot}/main/mainPage";
		</script>
	</c:otherwise>
</c:choose>	
<u:footer/>
</body>
</html>