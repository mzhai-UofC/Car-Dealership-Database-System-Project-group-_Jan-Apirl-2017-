<?php
include("config.php");
include("session.php");
session_start();



if(isset($_POST['submit_button'])){ //check if form was submitted
    $sql = "INSERT INTO employee VALUES (" .
            $_POST["id"] . "," .
            $_POST["sin"] . ",'" . 
            $_POST["name"] . "'," . 
            $_POST["super_id"] . "," .
            $_POST["branch_no"] . ",'" . 
            $_POST["dealership"] . "')";

    if ($db->query($sql) === TRUE) {
        $empName = $_POST["name"];
        $finish ='<script>confirm("Successfuly added new hire ' . $empName . '")</script>';
        echo $finish;
        //echo "New record created successfully";
        
    }
    else {
        echo "Error: " . $sql . "<br>" . $db->error;
    }
}

?>

<html>
   <head>
      <title>myToyota | New Hire</title>
      
      <style type = "text/css">
    img {
        display: block;
        margin: 0 auto;
    }
    
        h1,h2 {
        text-align: center;
    }
</style>
      
<img src="logo.png" alt="Toyota Logo" width="500" height="150">
      
   </head>

    <h1>myToyota Management</h1>
    <h2>New employee file</h2>
    
    
<body>

<form action="newEmployee.php" method="post">
  Enter new hire information:<br>
  <input type="text" name="id" placeholder="ID">
  <input type="text" name="sin" placeholder="SIN">
  <input type="text" name="name" placeholder="Name">
  <input type="text" name="super_id" placeholder="Supervisor ID">
  <input type="text" name= "branch_no" placeholder="Branch No.">
  <input type="text" name="dealership" placeholder="Dealership">
  <input type="submit" name ="submit_button">
</form>

</body>
</html>