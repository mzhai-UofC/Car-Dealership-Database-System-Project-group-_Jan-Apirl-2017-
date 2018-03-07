<?php
include("config.php");
include("session.php");

if(isset($_POST['submit_button'])){ //check if form was submitted
    $sql1 = "INSERT INTO sell VALUES (" .
            $_POST["eid"] . "," .
            $_POST["vin"] . ")";
    
    $sql2 = "INSERT INTO purchase VALUES (" .
            $_POST["sin"] . "," .
            $_POST["vin"] . "," .
            $_POST["transid"] . ")";
    
    $sql3 = "INSERT INTO customer(Sin,CName,eid) VALUES (".
            $_POST["sin"] . ",'" .
            $_POST["CName"] . "'," .
            $_POST["eid"] . ")";

    $sql4 = "INSERT INTO contracts VALUES (" .
            $_POST["DESCRIPTION"] . "," .
            $_POST["sin"] . ",'" .          //sql on github in text, should be int and DEFAULT NULL?
            $_POST["WARRANTY"] . "'," .          //sql on github in text, should be int and DEFAULT NULL?
            $_POST["LEASE"] . "," .      
            $_POST["FINANCE"] . ")";
    
 if ($db->query($sql1) === TRUE) {
     if ($db->query($sql2) === TRUE) {
         if ($db->query($sql3) === TRUE) {
             if ($db->query($sql4) === TRUE) {
                $finish ='<script>confirm("Submission complete. Congratulations on the sale!")</script>';
                echo $finish;
             }
             else {
                 echo "Error: " . $sql4 . "<br>" . $db->error;
             }
         }
         else {
             echo "Error: " . $sql3 . "<br>" . $db->error;
         }
    }
    else {
        echo "Error: " . $sql2 . "<br>" . $db->error;
    }
 }
 else {
    echo "Error: " . $sql1 . "<br>" . $db->error;
}
}

?>

<html>
    
    <head>
        <title>myToyota | New Sale</title>
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
    
<h1>myToyota | New Sale</h1>

</head>
<body>

<form action="newPurchase.php" method="post">
  Enter new purchase information:<br>
  <input type="text" name="eid" placeholder="Employee ID">
  <input type="text" name="vin" placeholder="VIN">
  <input type="text" name="sin" placeholder="Customer SIN">
  <input type="text" name="CName" placeholder="Customer Name">
  <input type="text" name="DESCRIPTION" placeholder="Contract Description">
  <input type="text" name="WARRANTY" placeholder="Warranty">
  <input type="text" name="LEASE" placeholder="Lease">
  <input type="text" name="FINANCE" placeholder="Finance">
  <input type="text" name="transid" placeholder="Transaction #">


  <input type="submit" name ="submit_button">
</form>

</body>
</html>