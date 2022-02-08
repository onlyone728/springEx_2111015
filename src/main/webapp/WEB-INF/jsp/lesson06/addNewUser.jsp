<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 추가</title>
 <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>회원 정보 추가</h1>
		<form method="post" action="/lesson06/add_user">
			<div class="form-group">
				<label for="name">이름 :</label>
				<input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요.">
			</div>
			
			<div class="form-group">
				<label for="yyyymmdd">생년월일 :</label>
				<input type="text" id="yyyymmdd" name="yyyymmdd" class="form-control" placeholder="예)yyyymmdd">
			</div>
			
			<div class="form-group">
				<label for="email">메일 주소 :</label>
				<input type="text" id="email" name="email" class="form-control" placeholder="이메일 주소를 입력하세요.">
			</div>
			
			<div class="form-group">
				<label for="introduce">자기소개 :</label>
				<textarea id="introduce" name="introduce" class="form-control" rows="10"></textarea>
			</div>
			
			<input type="button" id="addBtn" class="btn btn-success" value="추가">
		</form>
	</div>
	
	<script>
	$(document).ready(function() {
		// 1) jquery의 submit 기능 이용하기
		/* $('form').on('submit', function(e){
			// e.preventDefault();	// submit이 되는 것을 막는다.
			// alert("서브밋");
			
			// validation check
			let name = $('#name').val().trim();
			if (name.length < 1) {
				alert("이름을 입력해주세요.");
				return false;
			}
			
			let yyyymmdd = $('#yyyymmdd').val().trim();
			if (yyyymmdd == '') {
				alert("생년월일을 입력해주세요.");
				return false;
			}
			
			let email = $('#email').val().trim();
			if (email.length < 1) {
				alert("이메일 주소를 입력해주세요.");
				return false;
			}
			
			// 유효성 체크 통과 -> submit
		}); */
		
		// 2) jquery의 AJAX 통신 이용하기
		// -- 버튼의 타입을 submit -> button 변경
		$('#addBtn').on('click', function() {
			// alert("추가버튼 클릭");
			// validation check
			let name = $('#name').val().trim();
			if (name.length < 1) {
				alert("이름을 입력해주세요.");
				return;
			}
			
			let yyyymmdd = $('#yyyymmdd').val().trim();
			if (yyyymmdd == '') {
				alert("생년월일을 입력해주세요.");
				return;
			}
			
			// 모두 숫자인지 확인
			if (isNaN(yyyymmdd)) {	// 숫자가 아닌 문자가 있을 때 true
				alert("숫자만 입력해주세요.");
				return;
			}
			
			let email = $('#email').val().trim();
			if (email.length < 1) {
				alert("이메일 주소를 입력해주세요.");
				return false;
			}
			
			let introduce = $('#introduce').val();
			console.log(name);
			console.log(yyyymmdd);
			console.log(email);
			console.log(introduce);
			
			// AJAX 통신 : form 태그와 상관없이 비동기로 요청(request)
			$.ajax({
				type: 'POST'
				, url: '/lesson06/add_user'
				, data: {'name':name, 'yyyymmdd':yyyymmdd, 'email':email, 'introduce':introduce}
				, success: function(data) {
					alert(data);
					location.href = "https://google.com";
					// location.reload(); // 새로고침
				}
				, complete: function(data) {	// 잘 안씀
					alert('완료');	
				}
				, error: function(e) {
					alert("error : " + e);
				}
			});
		});
		
	});
	</script>
</body>
</html>