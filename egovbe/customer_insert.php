<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
</head>
<body>

<?php
include("dbconnect.php");

// Fetch Branch_ID values from the branch table
$branchQuery = "SELECT Branch_ID,Name FROM branch";
$branchResult = $conn->query($branchQuery);

// Fetch Demand_Type_ID values from the demandtype table
$demandTypeQuery = "SELECT Demand_Type_ID,Description FROM demandtype";
$demandTypeResult = $conn->query($demandTypeQuery);
?>

<form method="POST" action="">
    <!-- <label for="scno">SCNO:</label>
    <input type="text" name="scno" id="scno" required><br><br>

    <label for="cusid">CUSID:</label>
    <input type="text" name="cusid" id="cusid" required><br><br> -->

    <label for="fullname">Full Name:</label>
    <input type="text" name="fullname" id="fullname" required><br><br>

    <label for="address">Address:</label>
    <input type="text" name="address" id="address" required><br><br>

    <label for="mobileno">Mobile No:</label>
    <input type="text" name="mobileno" id="mobileno" required><br><br>

    <label for="dob">DOB:</label>
    <input type="date" name="dob" id="dob" required><br><br>

    <label for="branch">Branch:</label>
    <select name="branch" id="branch" required>
        <?php
        while ($row = $branchResult->fetch_assoc()) {
            echo "<option value='" . $row['Branch_ID'] . "'>" . $row['Name'] . "</option>";
        }
        ?>
    </select><br><br>

    <label for="demandtype">Demand Type:</label>
    <select name="demandtype" id="demandtype" required>
        <?php
        while ($row = $demandTypeResult->fetch_assoc()) {
            echo "<option value='" . $row['Demand_Type_ID'] . "'>" . $row['Description'] . "</option>";
        }
        ?>
    </select><br><br>

    <input type="submit" name="submit" value="Add Customer">
</form>

<?php
// Process the form submission
if (isset($_POST['submit'])) {
    // $scno = $_POST['scno'];
    // $cusid = $_POST['cusid'];
    $fullname = $_POST['fullname'];
    $address = $_POST['address'];
    $mobileno = $_POST['mobileno'];
    $branchID = $_POST['branch'];
    $demandTypeID = $_POST['demandtype'];
    $dob = $_POST['dob'];

    // Insert the customer data into the database
    $insertQuery = "INSERT INTO customer ( FullName, Address, MobileNo, Branch_ID, Demand_Type_ID, dob) VALUES ( '$fullname', '$address', '$mobileno', '$branchID', '$demandTypeID', '$dob')";
    if ($conn->query($insertQuery) === TRUE) {
        echo"New customer added successfully!";
      } else {
      echo "Error: " . $insertQuery . "<br>" . $conn->error;
      }
      }
      ?>
      </body>
      </html>
