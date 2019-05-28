<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/smarthome/css/style.css">
<script>
function myFunction() {
	   var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) { 
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    } 
	  }
	}
</script>
</head>
<body>
<div class="header">
    <!-- start: Header Menu Team logo -->
    <div class="logo">
       <a href="show-user.php"><img src="images\logo.png" style="float: left;width: 75px;height: 75px;margin-top: -20px;"></a>
        <span style="float:left;color:white;padding:20px 20px;position:relative;font-family: Arial;font-size: 18px;margin-top: -10px;">ISEP SMART-HOME</span>
    </div>
    <!-- end: Header Menu Team logo -->
    <ul class="top-nav" style="width: 75%;float: left;display: inline-block;">
        <?php $row = mysqli_fetch_array($results) ?>
        <li><a href="#">User Management</a></li>
        <li><a href="#">Add Admin</a></li>
        <li><a href="" >Edit FAQ</a></li>
        <li><a href="">Privacy&Terms</a></li>
        <li><img src="images\boss.png" style="margin:0px 0px 0px 280px;"></li>
        <div style="margin: 2px 2px; margin-top: -15px;">
              <!--<?php  //if (isset($_SESSION['first_name'])) : 
				$email=$_SESSION['email'];

                $sqlu ="SELECT * FROM users WHERE email='$email'";
                $q_run_user = mysqli_query($db,$sqlu);
                $user = mysqli_fetch_array($q_run_user);
			?>-->
                <strong style="font-size: large;">Sivakumar</strong>
                <small>
                    <i  style="color: #888;margin-right: 1px;"></i>
                    <button class="logout_btn"><a href="../../index.php?logout='1'" style="text-decoration: none;">logout</a></button>
                 
                </small>

        </div>
        </div>
        <?php ?>
    </ul>
</div>
	<!--<div class="content">
		 notification message -->
		<!--  <?php if (isset($_SESSION['success'])) : ?>
			<div class="error success" > --> 
				<h3>
<!-- 					<?php  
						echo $_SESSION['success']; 
						unset($_SESSION['success']);
					?> -->
				</h3>
			</div>
		<!-- <?php endif ?> -->

		<!-- user information -->
		<div class="profile_info" style="margin: -20px;">
        </div>
	<!--  <?php if (isset($_SESSION['message'])): ?>-->
		<!--<div class="msg">
			  <?php 
				echo $_SESSION['message']; 
				unset($_SESSION['message']);
			?> -->
		</div>
	<?php endif ?>

<?php $results = mysqli_query($db, "SELECT * FROM users"); ?>

<h2 style="text-align: center;margin-top: 40px;">Edit Admin/User Profile</h2>
<form method="post" action="edit-admin-profile.php" style="background-color: darkgrey;">

	<!-- <input type="hidden" name="id" value="<?php echo $id; ?>"> -->
	<div class="input-group">
		<label>ID</label>
		<input type="text" name="id" value="1">
	</div>
	<div class="input-group">
		<label>First Name</label>
		<input type="text" name="first_name" value="Sivakumar">
	</div>
	<div class="input-group">
		<label>Last Name</label>
		<input type="text" name="last_name" value="Sivasankaran">
	</div>
	<div class="input-group">
		<label>Email</label>
		<input type="text" name="email" value="sivak5692@gmail.com">
	</div>
<!-- 	<div class="input-group"> -->
<!-- 		<label>UserType</label> -->
<!-- 		<input type="text" name="type" value="User"> -->
<!-- 	</div> -->
	<!-- <div class="input-group">
			<label>User type</label>
			<select name="user_type" id="user_type" >	
				<option value="admin">Admin</option>
				<option value="user">User</option> 
			</select>
	</div> -->
	<div class="input-group">
		<label>New Password</label>
		<input type="password" placeholder="" name="pswd">
	</div>
	<div class="input-group">
		<label>Confirm Password</label>
		<input type="password" placeholder="" name="conpswd">
	</div>
	<!-- changing password for  admin and user , did them the same as sybmit_btn?-->
	<!-- <?php //include('../password_update_by_admin.php'); ?> -->
	<div class="input-group">
		<?php if ($update == true): ?>
			<button class="btn" type="submit" name="update_btn" style="background: #556B2F;" >update</button>
		<?php else: ?>
			<button class="btn" type="submit" name="save_btn" >Save</button>
		<?php endif ?>
	</div>
</form>
    </div>

    <div class="footer">
        <!--<h5 style="text-align: center; font-family: Hei; ">User Admin - 2019 � DOMISEP all rights reserved!</h5>-->
    </div>
</body>
</html>