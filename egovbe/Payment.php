<html>
    <head>
        <title>Bill Payment</title>
        <link rel="stylesheet" href="style.css" type="text/css">
    <script src="https://www.paypal.com/sdk/js?client-id=Ac4Cw-WEpZx6fxQv0X2bSrdrmFuPnVyhZOfhShxJbrPPB1NQsaVPnM3KxC7pBNp7yNzlINzeItGndo8m"></script>
    </head>

<body>
    <form method="POST" action="">
    <label for="bid">BID:</label>
    <input type="text" name="bid" id="bid" required><br><br>
    <input type="submit" name="submit" value="search">
    </form>
    <?php
if (isset($_POST['submit'])) {
    include('dbconnect.php');
    $bid = $_POST['bid'];
    $querybil = "SELECT  Bamount, payment_status FROM bill WHERE BID = '$bid'";
    $result = mysqli_query($conn, $querybil);
    $row = mysqli_fetch_assoc($result);
    $Bamt = $row['Bamount'];
    $PS = $row['payment_status'];

    if($PS == 1){
        echo"Already paid  </body></html>";
    }
    elseif($PS == 0) {
        echo"Bill Amount: $Bamt";
    }  
}
    ?>

    <form action="process_payment.php" method="post">
    <input type="hidden" name="bid" value="<?php echo $bid; ?>">
    <input type="hidden" name="amount" value="<?php echo $Bamt; ?>">
    <input type="hidden" name="description" value="Payment for Bill <?php echo $bid; ?>">
    <input type="hidden" name="currency" value="USD">
    <input type="hidden" name="return_url" value="http://example.com/payment_success.php?$bid">
    <input type="hidden" name="cancel_url" value="http://example.com/payment_cancel.php">
    <?php
    if($PS == 0) {

    echo'<button type="submit">Pay with PayPal</button>';
    }
    ?>
</form>
</body>

</html>

