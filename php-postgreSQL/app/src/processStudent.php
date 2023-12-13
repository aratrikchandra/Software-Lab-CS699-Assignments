<?php
$errorMessage = ""; // Variable to hold error message
$insertionMessage = ""; // Variable to hold success message
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include 'database.php';

    // Retrieve form data
    $roll_number = $_POST["roll_number"];
    $name = $_POST["name"];
    $email = $_POST["email"];
    $password = $_POST["password"];

    // Add logic to insert data into the users table
    $stmt = $conn->prepare("INSERT INTO users (roll_number, name, email_address, password) VALUES (:roll_number, :name, :email, :password)");
    $stmt->bindParam(':roll_number', $roll_number);
    $stmt->bindParam(':name', $name);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':password', $password);

    if ($stmt->execute()) {
        $insertionMessage = "Insertion Successful";
    } else {
        $errorMessage = "Error: Insertion failed. Reason: " . $stmt->errorInfo()[2];
    }

    $conn = null; // Close the database connection
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>Add Student</title>
</head>

<body>

    <a href="index.php"> Logout</a>
        <?php if ($insertionMessage !== ""): ?>
        <p>
            <?php echo $insertionMessage; ?>
        </p>
    <?php endif; ?>
    <?php if ($errorMessage !== ""): ?>
        <p>
            <?php echo $errorMessage; ?>
        </p>
    <?php endif; ?>

    <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        Roll Number: <input type="text" name="roll_number"><br>
        Name: <input type="text" name="name"><br>
        Email: <input type="text" name="email"><br>
        Password: <input type="password" name="password"><br>
        <input type="submit" value="Submit">
    </form>
    <a href="processMarks.php"> Add Marks </a>
</body>

</html>

