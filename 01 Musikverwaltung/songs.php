<?php
require("includes/config.inc.php");
require("includes/common.inc.php");
require("includes/conn.inc.php");

ta($_POST);
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
				<li><a href="alben.php">Alben</a></li>
				<li><a href="interpreten.php">Interpreten</a></li>
			</ul>
		</nav>
		<form method="post">
			<label>
				Songtitel (nur Anfangsbuchstaben notwendig):
				<input type="search" name="Titel">
			</label>
			<input type="submit" value="filtern">
		</form>
		<ul>
			<?php
			/*
			alle Songs:
				SELECT
					tbl_songs.Songtitel,
					tbl_alben.Albumtitel,
					tbl_alben.Erscheinungsjahr,
					tbl_interpreten.Interpret
				FROM tbl_songs
				INNER JOIN tbl_alben ON tbl_alben.IDAlbum=tbl_songs.FIDAlbum
				INNER JOIN tbl_interpreten ON tbl_alben.FIDInterpret=tbl_interpreten.IDInterpret
				ORDER BY tbl_songs.Songtitel ASC, tbl_alben.Albumtitel ASC
			
			gefiltert: zB. mit einem Titel beginnend mit "T"
				SELECT
					tbl_songs.Songtitel,
					tbl_alben.Albumtitel,
					tbl_alben.Erscheinungsjahr,
					tbl_interpreten.Interpret
				FROM tbl_songs
				INNER JOIN tbl_alben ON tbl_alben.IDAlbum=tbl_songs.FIDAlbum
				INNER JOIN tbl_interpreten ON tbl_alben.FIDInterpret=tbl_interpreten.IDInterpret
				WHERE(
					Songtitel LIKE 'T%'
				)
				ORDER BY tbl_songs.Songtitel ASC, tbl_alben.Albumtitel ASC
			*/
			
			$where = "";
			if(count($_POST)>0) {
				if(strlen($_POST["Titel"])>0) {
					//ja, User will nach einem Titel suchen, denn das Suchfeld ist nicht leer
					$where = "
						WHERE(
							Songtitel LIKE '" . $_POST["Titel"] . "%'
						)
					";
				}
			}
			
			$sql = "
				SELECT
					tbl_songs.Songtitel,
					tbl_alben.Albumtitel,
					tbl_alben.Erscheinungsjahr,
					tbl_interpreten.Interpret
				FROM tbl_songs
				INNER JOIN tbl_alben ON tbl_alben.IDAlbum=tbl_songs.FIDAlbum
				INNER JOIN tbl_interpreten ON tbl_alben.FIDInterpret=tbl_interpreten.IDInterpret
				" . $where . "
				ORDER BY tbl_songs.Songtitel ASC, tbl_alben.Albumtitel ASC
			";
			ta($sql);
			$songs = $conn->query($sql) or die("Fehler in der Query: " . $conn->error . "<br>" . $sql);
			while($song = $songs->fetch_object()) {
				echo('
					<li>
						' . $song->Songtitel . ' aus dem Album ' . $song->Albumtitel . ' (' . $song->Erscheinungsjahr . ') von ' . $song->Interpret . '
					</li>
				');
			}
			?>
		</ul>
	</body>
</html>