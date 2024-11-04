<?php include "model/database.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CoffeeTime - AWS Example</title>
<!-- Link to Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- Link to local CSS -->    
    <link rel="stylesheet" href="css/style.css">

<!-- Link to Bootstrap dependencies-->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<header>

</header>
<nav class="navbar navbar-expand-md navbar-dark bg-dark justify-content-between">
<div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
    </ul>
  </div>
</nav>
<div class="grid-container">
		<div class="first_row"><h2>Our Products</h2></div>
		<?php
    //prepared statement
    $sql = "SELECT * FROM coffee";
    $statement = $conn->prepare($sql); 
    $statement->execute(); 
    $result = $statement->fetchAll(); 
    $statement->closeCursor(); 
    //display the result set 
    foreach($result as $row):
      echo "<div class='item'>";
      echo "<p>Name: " . $row['coffee'] . "</p>";
      echo "<p>Roast: " . $row['roast'] . "</p>";
      echo "<p>Taste: " . $row['taste'] . "</p>";
      echo "<p>Weight: " . $row['weight'] . "g</p>";
      echo "<p>Origin: " . $row['coffee'] . "</p>";
      echo "<p>Category: " . $row['coffee'] . "</p>";
      echo "<p>Description: " . $row['description'] . "</p>";
      echo "<p>Price: $" . $row['price'] . "</p>";
      echo '<img src="' . $row['image'] . '" alt="Coffee cup from above">';
      echo "</div>";
    endforeach; 
    ?>    
</div>
<footer>
<div id="footer-left">
    <p>&copy; 2024 TAFE QLD</p>
</div>
<div id="footer-right">
  <p>Cameron Hughes</p> 
</div>
</footer>
</body>
</html>