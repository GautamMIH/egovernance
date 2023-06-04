<?php
// Replace DB_HOST, DB_USER, DB_PASS, and DB_NAME with your database credentials
$conn = mysqli_connect("localhost", "root", "", "nea");

// Get the form data

$BDate = $_POST['BDate'];
$BYear = $_POST['BYear'];
$BMonth = $_POST['BMonth'];
$CUSID = $_POST['CUSID'];
$Current_Reading = $_POST['Current_Reading'];
$Previous_Reading = $_POST['Previous_Reading'];
$BAmount=$_POST['BAmount'];

// Insert data into the bill table
$query = "INSERT INTO bill ( BDate, BYear, BMonth, CUSID, Current_Reading,Prev_reading,Bamount) VALUES ('$BDate', '$BYear', '$BMonth', '$CUSID', '$Current_Reading','$Previous_Reading','$BAmount')";
$result = mysqli_query($conn, $query);

if ($result) {
  echo "Bill added successfully";
} else {
  echo "Error: " . mysqli_error($conn);
}

mysqli_close($conn);
?>
