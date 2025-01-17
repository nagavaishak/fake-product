<%@page import="com.util.product.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FAKE PRODUCT IDENTIFICATION </title>

 <!-- Googlw Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Raleway:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,700,900" rel="stylesheet">
        
    

<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   
   <link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">


	<%
	
	int no=Utility.parse(request.getParameter("no"));
	System.out.println("value is >>>>>"+no);
	
	%>
	
	
	
</head>
<body>


<div class="limiter">

		<!--Header-->
        <header class="header">
        
            <div class="header-overlay">
                
                <div class="container">
                
                <div class="row">
                    
                        <div class="col-md-12">
                        
                            <!--logo-->
                            <div class="logo text-center">
                                
                            </div>
                        </div>
                    </div>
               
               <br><br>
                    <div class="row">
                    
                        <div class="col-md-12">
                            <div class="header-text">
                                <!-- Title & Description -->
                                <h1> FAKE PRODUCT IDENTIFICATION </h1>
                            </div>                          
                        </div>                    
                    </div>                
                </div>            
            </div>        
        </header>


	<br><br><br>

		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="images/img-01.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" name = "f1" action = "<%= request.getContextPath() %>/AdminLogin" method="post" >
					<span class="login100-form-title">
					  Login
					</span>		

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="adminId" placeholder="Id">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
				<div class="container-login100-form-btn">
    <input type="submit" name = "login" class="login100-form-btn" value="user"></input>
    <br>
    <input type="submit" name = "login"  class="login100-form-btn" value="admin"></input>
</div>

				</form>
			
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							<a href="jsp/admin/ScanQRCode.jsp" target="_blank">Verify Product</a>
						</button>
						
			</div>
		</div>
	</div>
	
</body>


<%
if(no==1)
{
%>

<script type="text/javascript">

alert('');

</script>
<% 
	
}

if(no==2)
{
%>

<script type="text/javascript">

alert('Login Failure,give proper Userid and Password');

</script>
<% 
	
}
if(no==4)
{
%>

<script type="text/javascript">

alert('User Logout successfully');

</script>
<% 
	
}

%>


</html>