<?php

$db = new PDO("mysql:host=127.0.0.1;dbname=match", "root", "");

function showLeague()
{
    global $db;
    $statement = $db->query("SELECT DISTINCT `league` FROM team");
    while ($data = $statement->fetch()) {
        echo "<option value='$data[0]'>$data[0]</option>";
    }
}

function showPlayers()
{
    global $db;
    $statement = $db->query("SELECT `name` FROM player");
    while ($data = $statement->fetch()) {
        echo "<option value='$data[0]'>$data[0]</option>";
    }
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Antony</title>
    <script src="script.js"></script>
</head>
<body style="display: flex; flex-direction: row-reverse">

<div class="forms">
    <form action="" method="post" id="games">
        <select name="league">
            <?php
            showLeague();
            ?>
        </select>
        <input type="submit" value="Submit"><br>
    </form>
    <br>
    <form action="" method="post" id="player">
        <label>Choose the time interval:</label>
        <input type="datetime-local" name="start">
        <input type="datetime-local" name="stop">
        <input type="submit" value="Submit"><br>
    </form>
    <br>
    <form action="" method="post" id="league">
        <select name="player">
            <?php
            showPlayers();
            ?>
        </select>
        <input type="submit" value="Submit"><br>
    </form>
</div>

<div id="content" style="display: block; margin-right: 200px; padding: 20px">
</div>
</body>
</html>
