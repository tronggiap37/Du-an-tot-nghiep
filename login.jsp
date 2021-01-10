<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<title>Admin Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- Style -->
<link rel="stylesheet" href="../../css/style1.css" type="text/css"
	media="all" />
</head>
<body>
	<!-- login form -->
	<section class="w3l-login">
		<div class="overlay">
			<div class="wrapper">
				<div class="logo">
					<a class="brand-logo" href="#">Quản lý hệ thống</a>
				</div>
				<div class="form-section">
					<h3>Đăng Nhập</h3>
					<h6>Tiếp tục đăng nhập với chúng tôi</h6>
					<form action="login.htm" method="post" class="signin-form">
						<div class="form-input">
							<input type="text" name="username" placeholder="Username"
								required="required" autofocus>
						</div>
						<div class="form-input">
							<input type="password" name="password" placeholder="Password"
								required=required>
						</div>
						<button class="btn btn-primary theme-button mt-4">Đăng
							Nhập</button>
					</form>

				</div>
			</div>
		</div>
		<div id='stars'></div>
		<div id='stars2'></div>
		<div id='stars3'></div>
		<p>&copy; BBestcare hệ thống dịch vụ chăm sóc trẻ em chuyên nghiệp</p>
	</section>
</body>

</html>