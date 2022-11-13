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

<h1>Umówiona wizyta</h1>
<?php
   
   require_once('connect.php');
   $db = @new mysqli($host, $db_user, $db_password, $db_name);
     
   $patientId = $_SESSION['id'];
   $q = $db->prepare("SELECT appointment.date, staff.firstName, staff.lastName FROM patientappointment 
                      LEFT JOIN appointment ON patientappointment.appointment_id = appointment.id
                      LEFT JOIN staff ON appointment.staff_id = staff.id
                      WHERE patient_id = ?");
                      
   $q->bind_param("i",$patientId);
   $q->execute();
   $appointments = $q->get_result();
   while($appointment = $appointments->fetch_assoc()) {

      $staffFirstName = $appointment['firstName'];
      $staffLastName = $appointment['lastName'];
      $date = $appointment['date'];
      echo "tuning.$staffFirstName $staffLastName $date<br>";
      


   }

   echo " <a href='logout.php'>Wyloguj się!</a><br>";





?>


</body>
</html>

