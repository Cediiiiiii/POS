<?php
// Database connection details
$servername = "127.0.0.1";
$username = "root";
$password = "";
$database = "pos";

// Connect to the database
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die(json_encode(["status" => "error", "message" => "Database connection failed: " . $conn->connect_error]));
}

// Log the script execution
file_put_contents('log.txt', "delete_from_stock.php called\n", FILE_APPEND);

// Check if the request is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $itemId = isset($_POST['id']) ? intval($_POST['id']) : 0;

    // Log received data
    file_put_contents('log.txt', "Received POST data: " . print_r($_POST, true) . "\n", FILE_APPEND);

    if ($itemId <= 0) {
        echo json_encode(["status" => "error", "message" => "Invalid item ID."]);
        exit;
    }

    try {
        // Delete the item
        $stmt = $conn->prepare("DELETE FROM stock WHERE id = ?");
        $stmt->bind_param("i", $itemId);

        if (!$stmt->execute()) {
            throw new Exception("Failed to delete the item.");
        }

        echo json_encode(["status" => "success", "message" => "Item deleted successfully."]);
        $stmt->close();
    } catch (Exception $e) {
        echo json_encode(["status" => "error", "message" => $e->getMessage()]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid request method."]);
}

$conn->close();
?>
