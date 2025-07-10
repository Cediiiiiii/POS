<?php
session_start();
include 'db.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $repassword = $_POST['repassword'];

    if ($password !== $repassword) {
        echo "<script>alert('Passwords do not match'); window.location.href = 'index.html';</script>";
        exit();
    }

    $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

    $stmt = $conn->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
    $stmt->bind_param("ss", $username, $hashedPassword);

    if ($stmt->execute()) {
        echo "<script>alert('Registration successful'); window.location.href = 'index.html';</script>";
    } else {
        echo "<script>alert('Error during registration'); window.location.href = 'index.html';</script>";
    }
    $stmt->close();
    $conn->close();
}
?>
