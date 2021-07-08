<?php
   session_start();   
   include 'db/config.php';   
   include 'server.php';
?>

<!DOCTYPE html>
<html>
   <head>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel = "icon" href = "C:\xampp\htdocs\aaa\logo.png" type = "image/x-icon"> 
      <title>CompanyLogin</title>
      <link rel="stylesheet" type="text/css" href="C:\xampp\htdocs\aaa\css/style (1).css">
   </head>

   <body>
    <div class="header">
         <h2>Login</h2>
      </div>

      <form method="post" action="login.php">
         <?php if (isset($_SESSION['error'])) : ?>
         <div class="error danger" >
            <h3>
               <?php 
                  echo $_SESSION['error']; 
                  unset($_SESSION['error']);
                  ?>
            </h3>
         </div>
         <?php endif ?>

         <div class="input-group">
            <label>Company_Name</label>
            <input type="text" name="Company_Name" required>
         </div>

         <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" required>
         </div>

         <div class="input-group">
            <button type="submit" class="btn" name="login_user">Login</button>
            <button type="submit" class="btn" onClick="history.back()">Back</button>
         </div>
         Not yet a register? <a href="register.php">Sign up</a>
         </p>
      </form>
      
   </body>
</html>
<?php
   if (isset($_POST['login_user'])) {
   
       $Company_Name=$_POST['Company_Name'];
       $password = md5($_POST['password']);
      
       $results = mysqli_query($con, " select Company_Name from server where Company_Name = '".$Company_Name."'and  password= '".$password."'");     
   
       if (mysqli_num_rows($results) > 0) {
   
         $_SESSION['Company_Name'] = $Company_Name;
         $_SESSION['success'] = "You are now logged in";
           header('location: index1.php');
       }else {
        $_SESSION['error']= "Invalide password or company name";
           //echo "<script> alert('Wrong Company_Name/password combination'); </script>";
           header('location: login.php');
       }
   }
   
?>
