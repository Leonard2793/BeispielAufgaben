<?php
require("includes/config.inc.php");
require("includes/common.inc.php");
require("includes/conn.inc.php");
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
				<li><a href="schueler.php">Schüler</a></li>
				<li><a href="raeume.php">Räume</a></li>
			</ul>
		</nav>
		<ul>
		<?php
		$sql = "
			SELECT
				tbl_klassen.IDKlasse,
				tbl_klassen.Bezeichnung AS bezKlasse,
				tbl_raeume.Bezeichnung AS bezRaum,
				tbl_lehrer.Vorname,
				tbl_lehrer.Nachname
			FROM tbl_klassen
			LEFT JOIN tbl_raeume ON tbl_klassen.FIDRaum=tbl_raeume.IDRaum
			LEFT JOIN tbl_lehrer ON tbl_klassen.FIDKV=tbl_lehrer.IDLehrer
			ORDER BY bezKlasse ASC
		";
		$klassen = $conn->query($sql) or die("Fehler in der Query: " . $conn->error . "<br>" . $sql);
		while($klasse = $klassen->fetch_object()) {
			echo('
				<li>Klasse ' . $klasse->bezKlasse . ': Raum ' . $klasse->bezRaum . ', KV ' . $klasse->Vorname . ' ' . $klasse->Nachname . '
					<ul>
			');
			
			// ---- Schüler je Klasse: ----
			$sql = "
				SELECT
					Vorname,
					Nachname
				FROM tbl_schueler
				WHERE(
					FIDKlasse=" . $klasse->IDKlasse . "
				)
				ORDER BY Nachname ASC, Vorname ASC
			";
			$schuelerliste = $conn->query($sql) or die("Fehler in der Query: " . $conn->error . "<br>" . $sql);
			while($schueler = $schuelerliste->fetch_object()) {
				echo('
					<li>' . $schueler->Nachname . ' ' . $schueler->Vorname . '</li>
				');
			}
			// ----------------------------
			
			echo('
					</ul>
				</li>
			');
		}
		?>
		</ul>
	</body>
</html>