<?php

class DB
{
    private PDO $db;

    public function __construct()
    {
        $this->db = new PDO("mysql:host=127.0.0.1;dbname=match", "root", "");
    }

    public function findLeague($league)
    {
        $statement = $this->db->prepare("SELECT `name`, league, coach FROM team WHERE league=?");
        $statement->execute([$league]);
        $recall = "<table>";
        $recall .= " <tr>
         <th> Title  </th>
         <th> League </th>
         <th> Coach </th>
        </tr> ";
        while ($data = $statement->fetch()) {
            $recall .= " <tr>
             <td> {$data['name']}  </td>
             <td> {$data['league']} </td>
             <td> {$data['coach']} </td>
            </tr> ";
        }
        $recall .= "</table>";
        echo json_encode($recall);
    }

    public function findGames($start, $stop)
    {
        $statement = $this->db->prepare("
        SELECT `date`, `place`, score, a.name as 'team1', b.name as 'team2'
        FROM game INNER JOIN team as a on FID_Team1 = a.ID_Team
        INNER JOIN team as b on FID_Team2 = b.ID_Team
        WHERE `date` BETWEEN ? AND ?
    ");
        $statement->execute([$start, $stop]);
        $recall = "<table>";
        $recall .= " <tr>
         <th> Date  </th>
         <th> Place  </th>
         <th> Score </th>
         <th> Team One </th>
         <th> Team Two </th>
        </tr> ";
        while ($data = $statement->fetch()) {
            $recall .= " <tr>
             <td> {$data['date']}  </td>
             <td> {$data['place']}  </td>
             <td> {$data['score']} </td>
             <td> {$data['team1']} </td>
             <td> {$data['team2']} </td>
            </tr> ";
        }
        $recall .= "</table>";
        echo $recall;
    }

    public function findPlayer($player)
    {
        $statement = $this->db->prepare("
        SELECT player.name as 'name', a.name as 'title', league, `date`, place 
        FROM player INNER JOIN team as a ON FID_Team = ID_Team
        INNER JOIN game ON (ID_Team = FID_Team1 OR ID_Team = FID_Team2)
        WHERE  player.name = ?");
        $statement->execute([$player]);
        $recall = "<table>";
        $recall .= " <tr>
         <th> Name  </th>
         <th> Title  </th>
         <th> League </th>
         <th> Date </th>
         <th> Place </th>
        </tr> ";
        while ($data = $statement->fetch()) {
            $recall .= " <tr>
             <td> {$data['name']}  </td>
             <td> {$data['title']}  </td>
             <td> {$data['league']} </td>
             <td> {$data['date']} </td>
             <td> {$data['place']} </td>
            </tr> ";
        }
        $recall .= "</table>";
        echo $recall;
    }
}

$db = new DB();

if (isset($_POST["league"])) {
    $db->findLeague($_POST["league"]);
} elseif (isset($_POST["start"])) {
    $db->findGames($_POST["start"], $_POST["stop"]);
} elseif (isset($_POST["player"])) {
    $db->findPlayer($_POST["player"]);
}
