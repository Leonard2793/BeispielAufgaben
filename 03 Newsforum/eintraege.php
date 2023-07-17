<?php
require("includes/config.inc.php");
require("includes/common.inc.php");
require("includes/conn.inc.php");

function zeigeEintraege($fid=null) {
	global $conn;
	
	if(is_null($fid)) {
		$w = "FIDEintrag IS NULL";
	}
	else {
		$w = "FIDEintrag=" . $fid;
	}
	
	echo('<ul>');
	$sql = "
		SELECT
			tbl_eintraege.IDEintrag,
			tbl_eintraege.Eintrag,
			tbl_eintraege.Eintragezeitpunkt,
			tbl_user.Vorname,
			tbl_user.Nachname
		FROM tbl_eintraege
		LEFT JOIN tbl_user ON tbl_eintraege.FIDUser=tbl_user.IDUser
		WHERE(
			" . $w . "
		)
		ORDER BY tbl_eintraege.Eintragezeitpunkt ASC
	";
	$eintraege = $conn->query($sql) or die("Fehler in der Query: " . $conn->error . "<br>" . $sql);
	while($eintrag = $eintraege->fetch_object()) {
		if(is_null($eintrag->Vorname) && is_null($eintrag->Nachname)) {
			$name = "Anonymous";
		}
		else {
			$name = $eintrag->Vorname . ' ' . $eintrag->Nachname;
		}
		
		echo('
			<li>
				' . $name . ' schrieb am ' . date("d.m.Y",strtotime($eintrag->Eintragezeitpunkt)) . ' um ' . date("H:i",strtotime($eintrag->Eintragezeitpunkt)) . ' Uhr:
				<div>' . $eintrag->Eintrag . '</div>
		');
		
		// ---- Antworten auf den jeweiligen Eintrag, der gerade dargestellt wird: ----
		zeigeEintraege($eintrag->IDEintrag);
		// ----------------------------------------------------------------------------
		
		echo('
			</li>
		');
	}
	echo('</ul>');
}
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
				<li><a href="eintraege_user.php">User-Einträge</a></li>
				<li><a href="eintraege_suche.php">Suche nach Einträgen</a></li>
			</ul>
		</nav>
		<?php
		zeigeEintraege(); //Aufruf der Funktion, um sämtliche Einträge darzustellen
		?>
	</body>
</html>