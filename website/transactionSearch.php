<?php
include("config.php");
include("session.php");
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


              
       

?>

<html>
   <head>
      <title>myToyota | Search</title>
      
      <style type = "text/css">
    img {
        display: block;
        margin: 0 auto;
    }
    
        h1,h2 {
        text-align: center;
    }
    
    th, td {
    padding: 15px;
    text-align: left;
}
</style>
      
<img src="logo.png" alt="Toyota Logo" width="500" height="150">
      
      
   </head>

    <h1>myToyota Management</h1>
    <h2>Transaction Search</h2>
    
    
<body>

<form action="transactionSearch.php" method="post">
  <input type="text" name="trans_id" placeholder="Enter Trans #"><input type="submit" name="search_button" value="Search"><br>
</form>

    
<table style="width:100%">
    <thead>
            <tr>
                <th>Dealership</th>
                <th>Employee</th>
                <th>Customer</th>
                <th>Make</th>
                <th>Year</th>
                <th>Model</th>
            </tr>
    </thead>

    
    <tbody>
        <?php
        
        
        if(isset($_POST['search_button'])){ //check if form was submitted
  
     $units_sold = "SELECT * FROM sell, vehicles, employee, customer, purchase WHERE purchase.TRANSID = " . $_POST["trans_id"] . " AND purchase.VIN = sell.vin AND customer.Sin = purchase.CSIN AND sell.vin = vehicles.VIN AND sell.eid = employee.EMPID";     
       
       
         
    $result = $db->query($units_sold);
    if($result->num_rows > 0){           //check if query results in more than 0 rows
        while($row = $result->fetch_assoc()){   //loop until all rows in result are fetched
        ?>    
          <tr>
        <td><?php echo $row["dname"]?></td>
        <td><?php echo $row["Ename"]?></td>
        <td><?php echo $row["CName"]?></td>
        <td><?php echo $row["MAKE"]?></td>
        <td><?php echo $row["YEAR"]?></td>
        <td><?php echo $row["MODEL"]?></td>
  </tr>
                
                
        <?php
        
        }
        
       
    }
    else {
        echo "Error: " . $sql . "<br>" . $db->error;
    }
        
        

            }
            ?>
    </tbody>
    
    
    
  

  
</table>
    
    


</body>
</html>