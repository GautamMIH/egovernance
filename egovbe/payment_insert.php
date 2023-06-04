<?php
// Assuming you have already established a database connection
$conn = mysqli_connect("localhost", "root", "", "nea");

// Fetch payment options from the payment_option table
$query = "SELECT POID, Name FROM payment_option";
$result = mysqli_query($conn, $query);

// Create an array to store payment options
$options = array();
while ($row = mysqli_fetch_assoc($result)) {
    $options[$row['POID']] = $row['Name'];
}

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve form data
    $bid = $_POST['BID'];
    $pDate = $_POST['PDate'];
    $pAmount = $_POST['PAmount'];
    $poid = $_POST['POID'];
    $rebeatAmt = $_POST['Rebeat_Amt'];
    $fineAmt = $_POST['Fine_Amt'];

    // Insert the data into the payment table
    $insertQuery = "INSERT INTO payment (BID, PDate, PAmount, POID, Rebeat_Amt, Fine_Amt) VALUES ('$bid', '$pDate', '$pAmount', '$poid', '$rebeatAmt', '$fineAmt')";
    $insertResult = mysqli_query($conn, $insertQuery);

    if ($insertResult) {
        echo "Payment added successfully.";
    } else {
        echo "Error adding payment: " . mysqli_error($connection);
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add Payment</title>
</head>
<body>
    <h2>Add Payment</h2>
    <form action="" method="post">
        <label for="BID">BID:</label>
        <input type="text" name="BID" id="BID" required><br><br>
        
        <label for="PDate">PDate:</label>
        <input type="date" name="PDate" id="PDate" required><br><br>
        
        <label for="PAmount">PAmount:</label>
        <input type="text" name="PAmount" id="PAmount" required><br><br>
        
        <label for="POID">POID:</label>
        <select name="POID" id="POID" required>
            <?php foreach ($options as $poid => $optionName): ?>
                <option value="<?php echo $poid; ?>"><?php echo $optionName; ?></option>
            <?php endforeach; ?>
        </select><br><br>
        
        <label for="Rebeat_Amt">Rebeat Amount:</label>
        <input type="text" name="Rebeat_Amt" id="Rebeat_Amt"><br><br>
        
        <label for="Fine_Amt">Fine Amount:</label>
        <input type="text" name="Fine_Amt" id="Fine_Amt"><br><br>
        
        <input type="submit" value="Add Payment">
    </form>
</body>
</html>




