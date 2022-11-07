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
if(isset($_REQUEST['firstName']) && isset($_REQUEST['lastName']) 
            && $_REQUEST['phone']) {
                //zapisujemy na wizytę
    $q->prepare("INSERT INTO patient VALUES (NULL, ?, ?, ?)");
    $q->bind_param("sss", $_REQUEST['firstName'], $_REQUEST['lastName'], $_REQUEST['phone']);
    $q->execute();
    $patientId = $db->insert_id;
    $q->prepare("INSERT INTO patientappointment VALUES (NULL, ?, ?)");
    $q->bind_param("ii", $patientId,$appointmentId );
    $q->execute();
    echo "Zapisano na wizytę!";
    echo '<p> <a href="klient.php">Cofnij do wolnych terminów</a> </p>';
    echo '<p> <a href="logout.php">Wyloguj się!</a> </p>';
     
} else { 
    ?>
        <form action="appointment.php">
        Imię: <input type="text" name="firstName">
        Nazwisko: <input type="text" name="lastName">
        Telefon: <input type="text" name="phone">
        <input type="hidden" value="<?php echo $appointmentId ?>" name="id">
        <input type="submit" value="Zapisz wizytę">
        </form>
    <?php

}
?>

    
</body>
</html>