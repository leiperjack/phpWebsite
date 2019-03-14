<?php include "connect.php" ?>
<?php
echo $_GET["club_id"];
$id = $_GET["id"];
echo $id;
$sqlget = "SELECT firstName, lastName, clubName FROM players, club, nationMap WHERE nationMap.club_id=club.club_id AND players.player_id=nationMap.player_id AND nationMap.player_id=".$_GET["id"];
$sqldata= mysqli_query($dbconnect, $sqlget);

while ($row = mysqli_fetch_array($sqldata)){
	echo "Choose team for ";
	echo $row["firstName"];
	echo " ";
	echo $row["lastName"];
	echo " to transfer to: ";

	//echo print_r($row);

}
?>
<form method="get" action="update-single.php?id=".$GET["id"]>
<select name = "club_id">
<
<?php 
$selectOption = $_GET['club_id'];
$sqlget = "SELECT clubName, club_id FROM club";
$sqldata = mysqli_query($dbconnect, $sqlget) or die('Error: in query "'.$sqlget.'"');
while ($row = mysqli_fetch_array($sqldata, MYSQLI_ASSOC)) {
echo "<option value='".$row['club_id']."'	>".$row['clubName'] . "</option>";
} 
?>
</select>
<input type="submit" value="Submit the form"/>
</form>
