<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/message-converter/assets/css/user.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/message-converter/assets/js/jquery/jquery-1.9.0.js"></script>
<script>
$( function() {
	
	$( "#join-form" ).submit( function() {
		// 이름 체크
		
		// 이메일 사용여부
		if( $( "#email-checked" ).is( ":visible" ) == false ) {
			alert( "이메일 중복 여부를 확인 해 주세요." );
			return false;
		}
		
		// 패쓰워드 체크
		
		return true;
	});
	
	$( "#email" ).change( function() {
		$( "#check-email" ).show();
		$( "#email-checked" ).hide();
	});
	
	$( "#check-email" ).click( function() {
		var email = $( "#email" ).val();
		if( email == "" ) {
			alert( "이메일이 비어 있습니다." );
			return;
		}
		
		var postData = "email=" + email;
		  $.ajax( {
			    url : "/message-converter/api/checkEmail",
			    type: "post",
//			    dataType: "json",
			    data: postData,
//			    contentType: "application/json",
			    success: function( response ){
			    	if( response.result == false  ) {
			    		// 사용가능
			    		$( "#check-email" ).hide();
			    		$( "#email-checked" ).show();
			    	} else {
			    		alert( response.data );
			    	}
			    	console.log( response );
			    },
			    error: function( jqXHR, status, e ){
			       console.error( status + " : " + e );
			    }

			   });
	});
});
</script>
</head>
<body>
	<div id="user">
		
		<h2 class="content-title">회원가입</h2>
		<form id="join-form" method="post" action="join">
			<div class="input-set">
				<input type= "hidden" name="a" value="join">
				
				<label class="block-label" for="name">이름</label>
				<input id="name" name="name" type="text" value="">
	
				<label class="block-label" for="email">이메일</label>
				<input id="email" name="email" type="text" value="">
				<img src="/message-converter/assets/images/check.png" id="email-checked" style="width:18px;display:none"/>
				<input id="check-email" type="button" value="id 중복체크">
						
				<label class="block-label">패스워드</label>
				<input name="password" type="password" value="">
						
				<fieldset>
					<legend>성별</legend>
					<label>여</label> <input type="radio" name="gender" value="female" checked="checked">
					<label>남</label> <input type="radio" name="gender" value="male">
				</fieldset>
						
				<fieldset>
					<legend>약관동의</legend>
					<input type="checkbox" name="agree_prov" value="y">
					<label>서비스 약관에 동의합니다.</label>
				</fieldset>
			</div>
			<div class="button-set">
				<a href="#" class="button">취소</a>
				<input type="submit" value="가입하기" class="button blue">
			</div>
		</form>
	</div>
</body>
</html>	