<?php include "connect.php"?>
<?php if (isset($_POST["clubName"])) {
?>
        <style>
                table, th, td, tr {
                border: 1px solid black;
                border-collapse: collapse;
                }
                th, td {
                padding: 15px;
                text-align: left;
                }
                table#table1 {

                background-color: #FF4A4A;
                }
        </style> 


<?php 

echo 'List of players that play for '.$_POST["clubName"].':'; 


        $sqlget = "SELECT firstName, lastName, dob, players.player_id FROM club, players, nationMap where clubName = '".$_POST["clubName"]."' AND players.player_id=nationMap.player_id AND club.club_id=nationMap.club_id";
        $sqldata = mysqli_query($dbconnect, $sqlget) or die('Error: in query "'.$sqlget.'"');

        $table = "<table id='table1'>";
        $table .= "<tr>";
        $table .= "<th>First Name</th><th>Last Name</th><th>Date of Birth</th><th>Edit</th>";
        $table .= "</tr>";
        while ($row = mysqli_fetch_array($sqldata, MYSQLI_ASSOC)) {
                $table .= "<tr>";
                $table .= "<td>".$row['firstName']."</td>";                
                $table .= "<td>".$row['lastName']."</td>";
                $table .= "<td>".$row['dob']."</td>";
		
		$table .= "<td>";
		$table .= "<a href=";
                $table .= "'update-single.php?id=";
		$table .= ($row["player_id"])."'".">Edit</a></td>";
                
		$table .= "</tr> ";
        }
        $table .=  "</table>";
        echo $table;
} else {
?>


<head>
<p>Transfer a player<p>
</head>

Choose a team to transfer from: 
<form method="post" action="transfer2.php">
<select name = "clubName">

<?php 
$selectOption = $_POST['clubName'];
$sqlget = "SELECT clubName FROM club";
$sqldata = mysqli_query($dbconnect, $sqlget) or die('Error: in query "'.$sqlget.'"');
while ($row = mysqli_fetch_array($sqldata, MYSQLI_ASSOC)) {
echo "<option value='".$row['clubName']."'>".$row['clubName'] . "</option>";
}


?>
</select>
<input type="submit" value="Submit the form"/>
</form>


<?php } ?>
<a href="index.php">Back to Main Page.</a>

