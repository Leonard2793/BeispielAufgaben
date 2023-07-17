<?php
require("includes/config.inc.php");
require("includes/common.inc.php");
require("includes/conn.inc.php");
?>
<!doctype html>
<html lang="de">
	<head>
		<title>Musikverwaltung</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/common.css">
	</head>
	<body>
		<nav>
			<ul>
				<li><a href="index.html">Home</a></li>
				<li><a href="interpreten.php">Interpreten</a></li>
				<li><a href="songs.php">Songs</a></li>
			</ul>
		</nav>
		<ul>
			<?php
			$sql = "
				SELECT
					tbl_alben.IDAlbum,
					tbl_alben.Albumtitel,
					tbl_alben.Erscheinungsjahr,
					tbl_interpreten.Interpret
				FROM tbl_alben
				INNER JOIN tbl_interpreten ON tbl_alben.FIDInterpret=tbl_interpreten.IDInterpret
				ORDER BY tbl_alben.Erscheinungsjahr DESC
			";
			$alben = $conn->query($sql) or die("Fehler in der Query: " . $conn->error . "<br>" . $sql);
			while($album = $alben->fetch_object()) {
				echo('
					<li>
						"' . $album->Albumtitel . '" von ' . $album->Interpret . ' (' . $album->Erscheinungsjahr . '):
						<ul>
				');
				
				// ---- ermittle alle Songs für das jeweilige Album: ----
				$sql = "
					SELECT
						Songtitel
					FROM tbl_songs
					WHERE(
						FIDAlbum=" . $album->IDAlbum . "
					)
					ORDER BY Reihenfolge ASC
				";
				$songs = $conn->query($sql) or die("Fehler in der Query: " . $conn->error . "<br>" . $sql);
				while($song = $songs->fetch_object()) {
					echo('
						<li>' . $song->Songtitel . '</li>
					');
				}
				// ------------------------------------------------------
				
				echo('		
						</ul>
					</li>
				');
			}
			?>
		</ul>
	</body>
</html>