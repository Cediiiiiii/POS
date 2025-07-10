<?php
session_start();
include 'db.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $stmt = $conn->prepare("SELECT password FROM users WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($hashedPassword);
        $stmt->fetch();

        if (password_verify($password, $hashedPassword)) {
            $_SESSION['username'] = $username;
            echo "<script>window.location.href = 'billing.html';</script>";
        } else {
            echo "<script>alert('Incorrect password'); window.location.href = 'index.html';</script>";
        }
    } else {
        echo "<script>alert('User not found'); window.location.href = 'index.html';</script>";
    }

    $stmt->close();
    $conn->close();
}
?>
