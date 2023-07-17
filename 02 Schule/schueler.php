<?php
require("includes/config.inc.php");
require("includes/common.inc.php");
require("includes/conn.inc.php");

ta($_POST);
?>
<!doctype html>
<html lang="de">
	<head>
		<title>Schule</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/common.css">
	</head>
	<body>
		<h1>Schule</h1>
		<nav>
			<ul>
				<li><a href="index.html">Startseite</a></li>
				<li><a href="klassen.php">Klassen</a></li>
				<li><a href="raeume.php">Räume</a></li>
			</ul>
		</nav>
		<form method="post">
			<label>
				Nachname:
				<input type="text" name="NN">
			</label>
			<label>
				Vorname:
				<input type="text" name="VN">
			</label>
			<input type="submit" value="filtern">
		</form>
		<ul>
		<?php
		$where = "";
		if(count($_POST)>0) {
			//das Formular wurde abgeschickt
			$arr = [];
			if(strlen($_POST["NN"])>0) {
				//es soll nach dem Nachnamen gefiltert werden
				/*
				"
					WHERE(
						Nachname LIKE '%Müller%'
					)
				"
				*/
				$arr[] = "Nachname LIKE '%" . $_POST["NN"] . "%'";
			}
			if(strlen($_POST["VN"])>0) {
				//es soll nach dem Vornamen gefiltert werden
				/*
				"
					WHERE(
						Vorname LIKE '%Tim%'
					)
				*/
				$arr[] = "Vorname LIKE '%" . $_POST["VN"] . "%'";
			}
			ta($arr);
			if(count($arr)>0) {
				$where = "
					WHERE(
						" . implode(" AND ",$arr) . "
					)
				";
			}
			ta($where);
		}
		
		$sql = "
			SELECT
				Vorname,
				Nachname
			FROM tbl_schueler
			" . $where . "
			ORDER BY Nachname ASC, Vorname ASC
		";
		ta($sql);
		$schuelerliste = $conn->query($sql) or die("Fehler in der Query: " . $conn->error . "<br>" . $sql);
		while($schueler = $schuelerliste->fetch_object()) {
			echo('
				<li>' . $schueler->Nachname . ' ' . $schueler->Vorname . '</li>
			');
		}
		?>
		</ul>
	</body>
</html>