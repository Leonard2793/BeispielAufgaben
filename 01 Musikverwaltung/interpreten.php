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
	</head>
	<body>
		<nav>
			<ul>
				<li><a href="index.html">Home</a></li>
				<li><a href="alben.php">Alben</a></li>
				<li><a href="songs.php">Songs</a></li>
			</ul>
		</nav>
		<ul>
			<?php
			$sql = "
				SELECT
					*
				FROM tbl_interpreten
				ORDER BY Interpret ASC
			";
			$interpreten = $conn->query($sql) or die("Fehler in der Query: " . $conn->error . "<br>" . $sql);
			while($interpret = $interpreten->fetch_object()) {
				echo('
					<li>' . $interpret->Interpret . '
						<ul>
				');
				
				// ---- alle Alben zum Interpreten: ----
				$sql = "
					SELECT
						Albumtitel,
						Erscheinungsjahr
					FROM tbl_alben
					WHERE(
						FIDInterpret=" . $interpret->IDInterpret . "
					)
					ORDER BY Erscheinungsjahr ASC
				";
				$alben = $conn->query($sql) or die("Fehler in der Query: " . $conn->error . "<br>" . $sql);
				while($album = $alben->fetch_object()) {
					echo('
						<li>' . $album->Albumtitel . ' (' . $album->Erscheinungsjahr . ')</li>
					');
				}
				// -------------------------------------
				
				echo('
						</ul>
					</li>
				');
			}
			?>
		</ul>
	</body>
</html>