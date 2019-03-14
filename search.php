<?php include "templates/header.php" ?>
<h2> Shows Database </h2>

<?php  


if (isset($_POST["Text1"]))
{
        include('connect.php');
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
echo 'You searched for: '.$_POST["Text1"]; 


        $sqlget = "SELECT distinct clubName, nickname, founded, stadiumName FROM club, stadia, stadiumMap where city = '".$_POST["Text1"]."' AND club.club_id=stadiumMap.club_id and stadia.stadium_id=stadiumMap.stadium_id ";
        $sqldata = mysqli_query($dbconnect, $sqlget) or die('Error: in query "'.$sqlget.'"');


        $table = "<table id='table1'>";
        $table .= "<tr>";
        $table .= "<th>Team Name</th><th>Nickname</th><th>Stadium Name</th><th>Year Founded</th>";
        $table .= "</tr>";

        while ($row = mysqli_fetch_array($sqldata, MYSQLI_ASSOC)) {
                $table .= "<tr>";
                $table .= "<td>".$row['clubName']."</td>";                
                $table .= "<td>".$row['nickname']."</td>";
                $table .= "<td>".$row['stadiumName']."</td>";
                $table .= "<td>".$row['founded']."</td>";
                $table .= "</tr> ";
        }
        $table .=  "</table>";
        echo $table;


} else { ?>


<form method= action="search.php">
        <label> Enter the name of a city:</label>
         <textarea name="Text1" id="Text1" cols="40" rows="1"></textarea>
        <input type="submit" value="Submit">
</form>


<?php } ?>

<p><a href="search.php">Search for a Different Location.</a></p>
<p><a href="index.php">Back to Main Page.</a></p>

