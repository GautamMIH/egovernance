<?php
include('dbconnect.php');
// Include PayPal SDK dependencies
require 'vendor/autoload.php';

use PayPalCheckoutSdk\Core\PayPalHttpClient;
use PayPalCheckoutSdk\Core\SandboxEnvironment;
use PayPalCheckoutSdk\Orders\OrdersCreateRequest;

// PayPal API credentials
$clientId = "AWI6y3MLgRctZy40Yv8OwmKJNhij_UiYt1qjAPBvKXURNddZF7CcNpNw9FPW_DhbxRwWkLYWkd9sSmtW";
$clientSecret = "EIgK61Hnsb971ii8mefbaJfPfzALWcoJrzmlISzoBqW7Lo4SCEE5gcWryJSDQkJgeqSyArXDLX3SqTa1";

// Set up PayPal API client
$environment = new SandboxEnvironment($clientId, $clientSecret);
$client = new PayPalHttpClient($environment);

// Retrieve form data

$bid = $_POST['bid'];
$amount = $_POST['amount'];





// Create PayPal order request
$returnUrl = 'http://localhost/egovbe/success.php?bid=' . urlencode($bid);
$request = new OrdersCreateRequest();
$request->prefer('return=representation');
$request->body = [
    "intent" => "CAPTURE",
    "purchase_units" => [[
        "amount" => [
            "currency_code" => "USD",
            "value" => $amount,
        ]
    ]],
    
    "application_context" => [
        "return_url" => $returnUrl, // Replace with your success URL
        "cancel_url" => "http://localhost/egovbe/searchcustomer.php" // Replace with your cancel URL
    ]
];

try {
    // Create PayPal order
    $response = $client->execute($request);

    // Get PayPal order ID
    $orderId = $response->result->id;

    // Update the payment ID and payment status in the database
    $updateQuery = "UPDATE bill SET payment_id = '$orderId', payment_status = 'Pending' WHERE BID = '$bid'";
    $conn->query($updateQuery);

    // Redirect to PayPal for payment authorization
    header("Location: " . $response->result->links[1]->href);
    exit;
} catch (Exception $e) {
    // Handle any errors
    echo "Error: " . $e->getMessage();
}
?>
