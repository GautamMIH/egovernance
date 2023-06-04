<?php
// Database connection settings
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "nea";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get form data
    $demandTypeId = $_POST["demandTypeId"];
    $rate = $_POST["rate"];
    $effectiveDate = $_POST["effectiveDate"];
    $issuement = isset($_POST["issuement"]) ? 1 : 0;

    // Prepare and execute the SQL statement
    $stmt = $conn->prepare("INSERT INTO demand_rate (Demand_Type_ID, rate, effective_date, issuement) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("isss", $demandTypeId, $rate, $effectiveDate, $issuement);
    $stmt->execute();

    // Check if the query was successful
    if ($stmt->affected_rows > 0) {
        echo "Demand rate added successfully!";
    } else {
        echo "Error adding demand rate: " . $stmt->error;
    }

    // Close the statement
    $stmt->close();
}

// Fetch demand types from the database
$demandTypes = $conn->query("SELECT Demand_Type_ID,Description FROM demandtype");

// Close the database connection
$conn->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add Demand Rate</title>
</head>
<body>
    <h1>Add Demand Rate</h1>
    <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <label for="demandTypeId">Demand Type:</label>
        <select name="demandTypeId">
            <?php while ($row = $demandTypes->fetch_assoc()) : ?>
                <option value="<?php echo $row['Demand_Type_ID']; ?>"><?php echo $row['Description']; ?></option>
            <?php endwhile; ?>
        </select><br><br>
        <label for="rate">Rate:</label>
        <input type="text" name="rate"><br><br>
        <label for="effectiveDate">Effective Date:</label>
        <input type="date" name="effectiveDate"><br><br>
        <label for="issuement">Issuement:</label>
        <input type="checkbox" name="issuement"><br><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
