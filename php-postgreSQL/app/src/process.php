<?php
include 'database.php';

// Simulated admin credentials
$admin_username = 'admin';
$admin_password = 'admin';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $roll_number = $_POST["roll_number"];
    $password = $_POST["password"];

    if ($roll_number === $admin_username && $password === $admin_password) {
        header("Location: processStudent.php");
        exit();
    } else {
        // Check if the user exists in the database
        $stmt = $conn->prepare("SELECT * FROM users WHERE roll_number = :roll_number AND password = :password");
        $stmt->bindParam(':roll_number', $roll_number);
        $stmt->bindParam(':password', $password);
        $stmt->execute();
        
        if ($stmt->rowCount() > 0) {
            // User exists and is not an admin
            $stmtMarks = $conn->prepare("SELECT * FROM marks WHERE roll_number = :roll_number");
            $stmtMarks->bindParam(':roll_number', $roll_number);
            $stmtMarks->execute();

            if ($stmtMarks->rowCount() > 0) {
                // Display marks as an unordered list
                $marks = $stmtMarks->fetch(PDO::FETCH_ASSOC);
               	echo '<a href="index.php"> Logout</a>';
                echo "<h2>Marks for Roll Number: $roll_number</h2>";
                echo "<ul>";
                echo "<li>Lab: " . $marks['lab'] . "</li>";
                echo "<li>Midsem: " . $marks['midsem'] . "</li>";
                echo "<li>Project: " . $marks['project'] . "</li>";
                echo "<li>Endsem: " . $marks['endsem'] . "</li>";
                echo "</ul>";
            } else {
                echo "No marks found for Roll Number: " . $roll_number;
            }
        } else {
        
        	echo '<a href="index.php"> Logout</a>';
            // User not found, show login failed message
            echo "<p>Login Failed</p>";
        }
    }
}
?>

