<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<style>
	#btn_add {
    display: inline-block !important;
    padding: 8px 10px;
    font-size: 12px;
    text-decoration: none;
    vertical-align: middle;
    cursor: pointer;
    border-radius: 5px;
    -webkit-transition-duration: 0.2s;
    -webkit-transition-timing-function: ease;
    transition-duration: 0.2s;
    transition-timing-function: ease;
    margin-left: 387px;
    margin-top: 30px;
    }
    
    #remove-btn {
    display: inline-block !important;
    padding: 8px 10px;
    font-size: 12px;
    text-decoration: none;
    vertical-align: middle;
    cursor: pointer;
    border-radius: 5px;
    -webkit-transition-duration: 0.2s;
    -webkit-transition-timing-function: ease;
    transition-duration: 0.2s;
    transition-timing-function: ease;
    margin-top: 30px;
    
    }
    #footdiv {
    width: 1000px;
    padding: 0 30px 30px 30px;
    text-align: center;
    color: gray;
    white-space: pre-line;
  	bottom:0;
	}
	
}
</style>

<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/default.css?ver=1155">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/skin/board/qna/style.css?v2">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/board.common.css?ver=1155">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/js/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/mobile.css?ver=1155">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/contents.css?ver=1155">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/plugin/featherlight/featherlight.min.css?ver=1155">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script>
	 $(document).ready(function() {
		$("#remove-btn").click(function(e) {
			e.preventDefault();
	 
			// #modify-form 의 action attr 값을 바꿔야함.
	 		
			$("#modify-form").attr("action", '${appRoot }/rev/remove');
			var remove = confirm('정말 삭제하시겠습니까?');
			if (remove) {
			$("#modify-form").submit();
			}
		});
	}); 
	
	 /* $(document).ready(function() {
			$("#btn_add").click(function(e) {
				e.preventDefault();
				
				var modify = confirm('정말 수정하시겠습니까?');
				if (modify) {
					$("#modify-form").submit();
				}
			})
		}); */
	
</script>

<script>
$(document).ready(function(){
	$('#btn_add').click(function(){
			var revArr = ["rev_title","rev_content"];
			//입력 값 널 체크
			for(var i=0;i<revArr.length;i++){
				//alert(arr[i]);
				if($.trim($('#'+revArr[i]).val()) == ''){
					alert('제목 또는 내용 을 모두 입력해 주세요.');
					$('#'+revArr[i]).focus();
					return false;
				} 
			}
			//전송
			$("#modify-form").submit();
	});
});
</script>
<title>구매후기글 수정</title>
</head>
<body>
<u:mainNav></u:mainNav>
<c:choose>
	<c:when test="${authUser.user_grade == 0 || authUser.user_nickname eq RevBoard.rev_writer}">
	<div class="container mt-5" style="width: 1000px">
	<h3>게시글 수정</h3><br>
	<c:url value="/rev/modify" var="modifyLink">
					<c:param name="rev_seq" value="${RevBoard.rev_seq }" />
					<c:param name="pageNum" value="${cri.pageNum }" />
					<c:param name="amount" value="${cri.amount }" />
					<c:param name="type" value="${cri.type }"/>
					<c:param name="keyword" value="${cri.keyword }"/>
				</c:url>
			
	<form id="modify-form" action="${modifyLink}" method="post" enctype="multipart/form-data">
    <c:if test="${errors.noCategory }">
	<!-- <small class="form-text text-muted">
			카테고리를 입력하세요
	</small> -->
	</c:if>
	<%-- <input type="text" name="rev_category" class="form-group" value="${category }"/> --%> 
	
	<div class="bo_w_tit write_div">
        <label for="wr_subject" class="sound_only">카테고리<strong>필수</strong></label>
        
        <div id="autosave_wrapper write_div" style="margin-bottom:8px;">
            <select name="rev_category" class="form-control required" style="width:160px;" >
				<option value="${RevBoard.rev_category }">카테고리 선택</option>
				<option value="1">마스크</option>
				<option value="2">악세사리</option>
				<option value="3">소독제</option>
				<option value="4">진단키트</option>

			</select>
         </div>
        
    </div>
    <div class="bo_w_tit write_div" style="margin-bottom:8px;">
        <label for="wr_subject" class="sound_only">제목<strong>필수</strong></label>
        
        <div id="autosave_wrapper write_div">
            <input type="text" name="rev_title" id="rev_title" value="<c:out value="${RevBoard.rev_title }" />" maxlength="50" id="wr_subject" required="" class="frm_input full_input required" size="50" maxlength="255" placeholder="제목">
                    </div>
        
    </div>

    <div class="write_div">
        <label for="wr_content" class="sound_only">내용<strong>필수</strong></label>
        <div class="wr_content ">
                        <span class="sound_only">웹에디터 시작</span>
<textarea name="rev_content" id="rev_content" class="rm_input full_input required" required maxlength="1000" style="width:100%;height:300px" placeholder="내용을 입력해 주세요."><c:out value="${RevBoard.rev_content }" /></textarea>
<span class="sound_only">웹 에디터 끝</span>                    </div>
        <input type="text" name="rev_writer" class="form-group" value="${authUser.user_id }" hidden/>
    </div>

	<div class="bo_w_info mt-3"><b>사진선택</b></div>
     <div class = "inputArea">
	<label for="revImg"></label>
	 <div class="select_img"><img src="" /></div>
	 
 	
							<div class = "input_wrap">
								
						
							<!--이미지첨부시작  -->
							<label for="input3">파일이름</label>
							<input type="text" value="${preFileNames }" name ="preFileNames" hidden="hidden">							
							<div class = "input_wrap">
								 <input type="file" name="upload" id="input_imgs" multiple="multiple" accept="image/*"/>
							</div>
							<div class="imgs_wrap">
								<c:forEach items="${fileNamesList }" var="product_img">	
									<div>
										<img width="500" src="${appRoot }/resources/upload/${product_img }"/>
									</div>
								</c:forEach>
							</div>
							<script>
							  
							  $("#input_imgs").on("change", handleImgFileSelect);
							  //이미지셀렉트
							  function handleImgFileSelect(e){
									//이미지 정보를 초기화
									$(".imgs_wrap").empty();
									
									var files = e.target.files;
									var filesArr = Array.prototype.slice.call(files);
								
									filesArr.forEach(function(f){
										if(!f.type.match("image.*")){
											
											// 이전에 쓰던 모달창 복붙한거로나오게
											var message = "그림파일형석만 허용됩니다";
											function checkModal(message){
												if (message && history.state == null) {
													$("#myModal .modal-body p").html(message)
													$("#myModal").modal("show");
												}
											}
											checkModal(message);
											
											return;
										}
										
										var reader = new FileReader();
										reader.onload = function(e){
											
											 var html = "<div><img width=\"150\" src=\""+e.target.result+"\"></div>";
											$(".imgs_wrap").append(html);
										
										}
										reader.readAsDataURL(f);
									});
							 }
						 	</script>
						 	
					</div>
        
                
                <input type="hidden" value="${RevBoard.rev_seq }" name="rev_seq">
                <input type="hidden" value="${cri.pageNum }" name="pageNum" /> 
				<input type="hidden" value="${cri.amount }" name="amount" /> 
				<input type="hidden" value="${cri.type }" name="type" /> 
				<input type="hidden" value="${cri.keyword }" name="keyword" />
					
    				<c:if test="${ authUser.user_nickname eq RevBoard.rev_writer || authUser.user_grade == 0}">
						<button id="btn_add" type="submit" class="btn_submit btn-secondary" style="border: thin;">수정 완료</button> 
						<button id="remove-btn" type="submit" class="btn_submit btn-secondary" style="border: thin;">글 삭제</button>
					</c:if>
   					
					
		
   		
    </div>
    </form>
</div>
    <footer>
    	<div class="container">
    		<section id="container1">
    		
			<div id="footdiv">
			
				<!-- div class="container1" style="margin-left:100px;width:100%;"> -->
					사업자명 : BCD쇼핑몰 ㅣ 사업자 번호 : 123-45-78901 ㅣ 개인정보관리책임자 : 이원석
					주소 : 서울특별시 마포구 신촌로 176 5층 501호ㅣ 전화 : 0507-1409-1711안내ㅣ 메일 : lws3793@naver.com
				<!-- </div> -->
			</div>
			</section>
    	</div>
		</footer> 
    </c:when>
    <c:otherwise>
    		<script type="text/javascript">
    			alert('관리자나 작성자만 접근가능합니다');
    			location.href='${appRoot}/rev/list';
    		</script>
    </c:otherwise>
    </c:choose>		
</body>
</html>