<?php
$errorMessage = ""; // Variable to hold error message
$insertionMessage = ""; // Variable to hold success message
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include 'database.php';
    
    // Retrieve form data
    $roll_number = $_POST["roll_number"];
    $lab = $_POST["lab"];
    $midsem = $_POST["midsem"];
    $project = $_POST["project"];
    $endsem = $_POST["endsem"];

    // Add logic to insert data into the marks table
    $stmt = $conn->prepare("INSERT INTO marks (lab, midsem, project, endsem, roll_number) VALUES (:lab, :midsem, :project, :endsem, :roll_number)");
    $stmt->bindParam(':lab', $lab);
    $stmt->bindParam(':midsem', $midsem);
    $stmt->bindParam(':project', $project);
    $stmt->bindParam(':endsem', $endsem);
    $stmt->bindParam(':roll_number', $roll_number);

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
    <title>Add Marks</title>
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
        Lab: <input type="number" name="lab"><br>
        Midsem: <input type="number" name="midsem"><br>
        Project: <input type="number" name="project"><br>
        Endsem : <input type="number" name="endsem"><br>
        <input type="submit" value="Submit">
    </form>
    <a href="processStudent.php"> Add Student </a>
</body>

</html>

