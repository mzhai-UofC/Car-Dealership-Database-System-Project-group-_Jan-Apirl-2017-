<?php
include("config.php");
include("session.php");




?>
<html">
   
   <head>
      <title>myToyota | Customer</title>
      
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
   
   <body>
       <h1>myToyota Customer</h1>
      <h2>Welcome, Andrew Lata! | <a href ="logout.php">Sign Out</a></h2>
   </body>
   
          <style>
       table, td, th{
           border: 1px solid black;
       }
       
       table{
           border-collapse: collapse;
           width: 50%;          
       }
       
       th{
           text-align: left;
       }
           
        </style>
   

   
</html>
    

<?php
    session_start();
    $cust = 900000004;  //hardcoded customer sin
   
    $query = $db->query("SELECT p.TRANSID, p.VIN, v.PRICE, v.MAKE, v.MODEL, v.YEAR FROM purchase AS p, vehicles AS v WHERE v.VIN = p.VIN AND p.CSIN = $cust");
    echo "Customer Purchase History<br><br>";
    
		echo '<table cellpadding="0" cellspacing="0" class="db-table">';
                echo '<tr><th>TRANSID</th><th>VIN</th><th>Price</th><th>Make</th><th>Model</th><th>Year</th></tr>';
	if(mysqli_num_rows($query)) {

		while($row = mysqli_fetch_row($query)) {
			echo '<tr>';
			foreach($row as $key=>$value) {
				echo '<td>',$value,'</td>';
			}
			echo '</tr>';
		}
		echo '</table><br />';
	}
        
  
   $query2 = $db-> query("SELECT LEASE, FINANCE FROM contracts WHERE CSIN = $cust");
   
   if($query2->num_rows>0){
       while($row=$query2->fetch_assoc()){
           echo "You are on a ".$row["LEASE"]." year lease<br>";
           echo "Your finance amount dropped to $".$row["FINANCE"]."<br><br>";
       }
   }
  
  
    
?>


<html>
<body>

<form action="customer.php" method="post">
  Want to update your phone number?<br>
  Fill out your new number below:<br>
  <input type="text" name="phone" placeholder="New Phone#">
  <input type="submit" name ="submit_button">
</form>

    <?php
    if(isset($_POST['submit_button'])){ //check if form was submitted
    $phone = $_POST["phone"];
    $sin = 900000004;
    
    $sql = "UPDATE customer SET phone = $phone WHERE Sin = $sin";   //hardcode sin   
    
    
    if ($db->query($sql) === TRUE) {
        $cphone = $_POST["phone"];
        echo "Updated phone number to " . $cphone;
    }
    else {
        echo "Error: " . $sql . "<br>" . $db->error;
    }
}
    ?>
    
</body>
</html>


