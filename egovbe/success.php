<?php 
include('dbconnect.php');

if (isset($_GET['bid'])) {
    $bid = $_GET['bid'];
    // Use the $BID variable as needed in your code
}
if (isset($_GET['token'])) {
    $token = $_GET['token'];
    // Use the $BID variable as needed in your code
}

if(isset($_GET['PayerID'])){
    $payerID = $_GET['PayerID'];
}

echo"Token: $token
PayerID: $payerID
bid: $bid";

$query = "UPDATE bill SET payment_status = '1' WHERE bid ='$bid'";
mysqli_query($conn, $query);
if ($conn->query($query) === true) {
    echo "Paid Successfully.";
} else {
    echo "Something Went Wrong: " . $conn->error;
}



?>