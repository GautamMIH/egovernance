<?php
// Replace DB_HOST, DB_USER, DB_PASS, and DB_NAME with your database credentials
$conn = mysqli_connect("localhost", "root", "", "nea");

// Get the form data

$Description = $_POST['Description'];
$Status = $_POST['Status'];

// Insert data into the demandtype table
$query = "INSERT INTO demandtype (Description, Status) VALUES ('$Description', '$Status')";
$result = mysqli_query($conn, $query);

if ($result) {
  echo "Demand Type added successfully";
} else {
  echo "Error: " . mysqli_error($conn);
}

mysqli_close($conn);
?>
