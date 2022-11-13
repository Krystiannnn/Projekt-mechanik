<?php

	session_start();
	
	if (!isset($_SESSION['zalogowany']))
	{
		header('Location: index.php');
		exit();
	}
	
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php

require_once('connect.php');
$db = @new mysqli($host, $db_user, $db_password, $db_name);

$appointmentId = $_REQUEST['id'];
$q = $db->prepare("SELECT * FROM appointment WHERE id = ?");
$q->bind_param("i", $appointmentId);
if($q && $q->execute()) {
    //mamy tylko jedno takie spotkanie
    $appointment = $q->get_result()->fetch_assoc();
    $appointmentDate = $appointment['date'];
    $appointmentTimestamp = strtotime($appointmentDate);
    echo "Zapis na wizytę w terminie ".date("j.m H:i", $appointmentTimestamp)."<br>";
}

    //powracający pacjent
    $q = $db->prepare("SELECT * FROM patient WHERE user = ?");
    $q->bind_param("s", $_SESSION['user']);
    $q->execute();
    $patientResult = $q->get_result();
   
    if($patientResult->num_rows == 1) ;{
        //znaleziono pacjenta
       
        $patient = $patientResult->fetch_assoc();
        $patientId = $_SESSION['id'];
        $q->prepare("INSERT INTO patientappointment VALUES (NULL, ?, ?)");
        $q->bind_param("ii", $patientId, $appointmentId);
        $q->execute();
        echo "Zapisano na wizytę!";} 

echo '<p> <a href="viewAppointments.php">Moje konto</a> </p>';
echo '<p> <a href="logout.php">Wyloguj się!</a> </p>';
 
?>

    
</body>
</html>
