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

if(isset($_GET['amt'])){
    $amt = $_GET['amt'];
}
if(isset($_GET['PayerID'])){
    $payerID = $_GET['PayerID'];
}

echo"Token: $token
PayerID: $payerID
bid: $bid";

$querybill = "UPDATE bill SET payment_status = '1' WHERE bid ='$bid'";
mysqli_query($conn, $querybill);

$insertQuery = "INSERT INTO payment (BID, PDate, PAmount, POID, Rebeat_Amt, Fine_Amt) VALUES ('$bid', 'curdate()', '$amt', '1', '0', '0')";
mysqli_query($conn, $insertQuery);

if ($conn->query($querybill) === true) {
    echo "Paid Successfully.";
} else {
    echo "Something Went Wrong: " . $conn->error;
}





?>