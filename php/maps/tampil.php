<?php
$link = mysqli_connect('localhost', 'root', '') or die('Cannot connect to the DB');
mysqli_select_db($link, 'db_lokasi')  or die("Could not select examples"); 
$query = "SELECT * FROM testcrud";
$result =  mysqli_query($link,$query) or die('Errorquery: '.$query);
$rows = array();
while ($r = mysqli_fetch_assoc($result)) {
$rows[] = $r;
}
$data = "{user:".json_encode($rows)."}";
echo $data;
?>
?>