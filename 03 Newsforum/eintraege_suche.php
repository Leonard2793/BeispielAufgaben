<?php
require("includes/config.inc.php");
require("includes/common.inc.php");
require("includes/conn.inc.php");

ta($_POST);
?>
<!doctype html>
<html lang="de">
	<head>
		<title>Newsforum</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/common.css">
	</head>
	<body>
		<h1>Newsforum</h1>
		<nav>
			<ul>
				<li><a href="index.html">Startseite</a></li>
				<li><a href="eintraege.php">Einträge</a></li>
				<li><a href="eintraege_user.php">User-Einträge</a></li>
			</ul>
		</nav>
		<form method="post">
			<label>
				Suchtext:
				<input type="search" name="S">
			</label>
			<input type="submit" value="suchen">
		</form>
		<ul>
			<?php
			if(count($_POST)>0 && strlen($_POST["S"])>0) {
				$w = "
					WHERE(
						tbl_eintraege.Eintrag LIKE '%" . $_POST["S"] . "%'
					)
				";
			}
			else {
				$w = "";
			}
			
			$sql = "
				SELECT
					tbl_eintraege.Eintrag,
					tbl_eintraege.Eintragezeitpunkt,
					tbl_user.Vorname,
					tbl_user.Nachname
				FROM tbl_eintraege
				LEFT JOIN tbl_user ON tbl_user.IDUser=tbl_eintraege.FIDUser
				" . $w . "
				ORDER BY tbl_eintraege.Eintragezeitpunkt ASC
			";
			ta($sql);
			$eintraege = $conn->query($sql) or die("Fehler in der Query: " . $conn->error . "<br>" . $sql);
			while($eintrag = $eintraege->fetch_object()) {
				if(is_null($eintrag->Vorname) && is_null($eintrag->Nachname)) {
					$name = "Anonymous";
				}
				else {
					$name = $eintrag->Vorname . " " . $eintrag->Nachname;
				}
				
				echo('
					<li>
						' . $name .' schrieb am ' . date("d.m.Y",strtotime($eintrag->Eintragezeitpunkt)) . ' um ' . date("H:i",strtotime($eintrag->Eintragezeitpunkt)) . ' Uhr:
						<div>' . $eintrag->Eintrag . '</div>
					</li>
				');
			}
			?>
		</ul>
	</body>
</html>