<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
 <!-- Compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script>
$(document).ready(function() {
	
	$("#resultPw").hide();
	$("#notFind").hide();
	$("#phone-success").hide(); 
	$("#phone-danger").hide();
	$("#null").hide();
	$("#okay").hide();
	
	$("#btn_search").click(function() {
		var user_id = $("#user_id").val();
		var user_phone = $("#user_phone").val();
		
		$.ajax({
		    type: "GET",
		    url: "${appRoot}/user/findUserPw",
		    dataType : "json",
		    data: {"user_id" : user_id , "user_phone" : user_phone},
		    success: function(res) {
	    		
		    	$("#notFind").hide();
					
					location.href='${appRoot}/user/modifyPw?user_id='+res.user_id;
					
		    },
		    error : function(error) {
		    	$("#notFind").show();
		    }
		});
	});
	
	// 휴대폰 인증 관련 AJAX 
	$("#user_phone").keyup(function() { 
		$("#btn_search").attr("disabled", "disabled"); 
	}); 	
	
	$('#phoneCheck').click(function() {
		var user_id = $("#user_id").val();
		var user_phone = $('#user_phone').val();
		
		$.ajax({
		    type: "GET",
		    url: "${appRoot}/user/sendCheckSMS",
		    dataType: "JSON",
		    data: {
		        "user_id": user_id, "user_phone" : user_phone
		    },
		    success: function(res) {
		    	console.log(res);
		    	if (res == 0) {
		    		$("#okay").show();
		    		$("#null").hide();
		    	}
		    	
		    	if (res == 2) {
						$("#null").show();
						$("#okay").hide();
		    	}
		    }
		});
	});
	
	//인증번호 확인
	$('#confirmPhone').click(function() {
		var phoneConfirm = $('#phoneConfirm').val();		
		$.ajax ({
			type: "GET",
			url: "${appRoot}/user/authentication",
			dataType : "json",
			data: { "phoneConfirm" : phoneConfirm},
			success: function(res) {
				if(res == 0) {
					$("#user_phone").attr("readonly", true);
					$("#phoneConfirm").attr("readonly", true);
					$("#phone-success").show(); 
					$("#phone-danger").hide();
					$("#btn_search").removeAttr("disabled"); 
				} else {
					$("#phone-success").hide(); 
					$("#phone-danger").show(); 
					$("#btn_search").attr("disabled", "disabled"); 
				} 
		 }
			
		});
	 
  });
	
	
});
</script>
<title>비밀번호 찾기</title>
</head>
<style>
html, body {
    height: 100%;
}
.medium-small {
    font-size: 0.9rem;
    margin: 0;
    padding: 0;
}
.login-form {
    width: 450px;
}
.login-form-text {
    text-transform: uppercase;
    letter-spacing: 2px;
    font-size: 0.8rem;
}
.login-text {
    margin-top: -6px;
    margin-left: -6px !important;
}
.margin {
    margin: 0 !important;
}
.pointer-events {
  pointer-events: auto !important;
}
.input-field >.material-icons  {
  padding-top:10px;
}
.input-field div.error{
    position: relative;
    top: -1rem;
    left: 3rem;
    font-size: 0.8rem;
    color:#FF4081;
    -webkit-transform: translateY(0%);
    -ms-transform: translateY(0%);
    -o-transform: translateY(0%);
    transform: translateY(0%);
}
.col {
    -ms-flex-preferred-size: 0;
    flex-basis: 1;
    -ms-flex-positive: 1;
    flex-grow: 1;
    max-width: 101%;
}
#btn_search {
	background-color:#fff;
	color:black;
}
#btn_close {
	background-color:#fff;
	color:black;
}
#btn_search:hover {
	background: #e0e0e0;
}
#btn_close:hover {
	background: #e0e0e0;
}
#phoneCheck {
		background-color:#fff;
		color:black;
    margin-left: 321px;
    margin-top: -36px;
}
#confirmPhone {
		background-color:#fff;
		color:black;
		margin-left: 321px;
    margin-top: -36px;
}
</style>
<body>
<div class="container">
<h4>비밀번호 찾기</h4>
	<div class="row margin">
	  <div class="input-field col s12">
	    <!-- <i class="mdi-social-person-outline prefix"></i> -->
	    <i class="material-icons prefix">portrait</i>
	    <input type="text" id="user_id" name="user_id" placeholder="아이디" >
	  </div>
  </div>
  
  <div class="row margin">
     <div class="input-field col s12">
       <!-- <i class="mdi-social-person-outline prefix"></i> -->
       <i class="material-icons prefix">phone_android</i>
       <input type="text" style="margin-bottom: 0rem;" id="user_phone" name="user_phone" placeholder="휴대폰 번호 '-' 제외"/>
     	 <button type="button" id="phoneCheck" class="btn waves-effect col s3">인증하기</button>
     </div>
   </div>
   
   <div style="margin-left:51px;">
     <small class="text-primary" id="okay">인증번호가 전송되었습니다.</small>
   </div>
   <div style="margin-left:51px;">
     <small class="text-danger" id="null">일치하는 정보가 없습니다.</small>
   </div>
   
   <div class="row margin">
     <div class="input-field col s12">
       <!-- <i class="mdi-social-person-outline prefix"></i> -->
       <i class="material-icons prefix">vpn_key</i>
       <input type="text" style="margin-bottom: 0rem;" id="phoneConfirm" name="phoneConfirm" placeholder="인증번호를 입력해주세요"/>
     	 <button type="button" id="confirmPhone" class="btn waves-effect col s3">확인</button>
     </div>
   </div>
   
   <div style="margin-left:51px;">
     <small class="text-primary" id="phone-success">인증되었습니다.</small> 
		 <small class="text-danger" id="phone-danger">인증 번호가 일치하지 않습니다.</small>
	 </div>

	<br />
	<div class="row margin">
   	<button type="button" id="btn_search" class="btn waves-effect waves-light col s3">search</button>&nbsp;&nbsp;
   	<button type="button" id="btn_close" class="btn waves-effect waves-light col s3" onclick="window.close()">close</button>
	 </div>
</div>
</body>
</html>