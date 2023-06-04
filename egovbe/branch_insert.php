<?php
// Replace DB_HOST, DB_USER, DB_PASS, and DB_NAME with your database credentials
$conn = mysqli_connect("localhost", "root", "", "nea");

// Get the form data

$Name = $_POST['Name'];
$Status = $_POST['Status'];

// Insert data into the branch table
$query = "INSERT INTO branch (Name, Status) VALUES ('$Name', '$Status')";
$result = mysqli_query($conn, $query);

if ($result) {
  echo "Branch added successfully";
} else {
  echo "Error: " . mysqli_error($conn);
}

mysqli_close($conn);
?>