<?
require_once("include/main.php");
require_once($config["Path"]["class"]."/aktivitas.class.php");

Fejlec();
if(!$jatekos["Belepve"])
	Hiba("Nem vagy belépve");

$kivalasztva = $jatekos["Kivalasztva"];

$leaderrang = 2;

if($kivalasztva == 0)
	Hiba("Nincs karakter kiválasztva - Ezt a Karakter lapon teheted meg");

$kivalasztva = $jatekos["Kivalasztva"] - 1;

if($jatekos["Karakter"][$kivalasztva]["Hitman"] == 0) Hiba("Nem vagy hitman!");

$show = false;

if($_SERVER["REQUEST_METHOD"] == "POST")
{
	$muvelet = $_POST["muvelet"];
	if($muvelet == "felvetel")
	{
		$show = 1;
		$nev = str_replace(" ", "", $_POST["nev"]);
		if(strlen($nev) < 4 || strlen($nev) > 20)
			$uzenet = "Hibás név - Minimum 4, maximum 20 karakter";
		//elseif(!RolePlayNev($nev))
		//	$uzenet = "Hibás név - Nem RolePlay név!";
		elseif(!SzovegAnalizalas($nev))
			$uzenet = "Hibás név - Engedélyezett karakterek: Magyar ABC, Számok, Speciális karakterek: '.', '_', '[', ']'";
		else
		{
			$sql = mysql_query("SELECT ID, Nev, Hitman, Online FROM playerek WHERE nev LIKE '%".$nev."%'");
			if(mysql_num_rows($sql) == 0)
				$uzenet = "Nincs ilyen játékos";
			elseif(mysql_num_rows($sql) > 1)
				$uzenet = "Több találat is van, pontosíts!";
			else
			{
				$player = mysql_fetch_array($sql);
				if($player["Online"] != 0)
					$uzenet = "Ez a játékos jelenleg Online! Jelenleg csak InGame tudod felvenni";
				elseif($player["Hitman"] >= "1,0")
					$uzenet = "Ez a játékos már Hitman";
				elseif($player["Hitman"] != "0,0")
					$uzenet = "Ez a játékos már Hitman";
				else
				{
					mysql_query("UPDATE playerek SET Hitman='1,0', HitmanNev='Ujonc' WHERE ID='".$player["ID"]."'");
					$uzenet = $player["Nev"] . " felvéve Hitmannek";
					$nev = "";
				}
			}
		}
	}
	elseif($muvelet == "kirug")
	{
		$nevek = $_POST["nevek"];
		if(count($nevek) > 0)
		{
			$szoveg = ""; $db = 0;
			foreach($nevek as $player)
			{
				if(is_numeric($player))
				{
					$p_sql = mysql_query("SELECT Nev FROM playerek WHERE ID='".$player."' AND Hitman >='1'");
					if(mysql_num_rows($p_sql) == 1)
					{
						$p = mysql_fetch_array($p_sql); mysql_free_result($p_sql);
						mysql_query("UPDATE playerek SET Hitman='0,0' WHERE ID='".$player."'");
						if($db > 0) $szoveg .= ", ";
						$db++;
						$szoveg .= $p["Nev"];
					}
				}
			}
			if($db > 0)
				echo Felhivas($db . " játékos kirúgva: ". $szoveg);
		}
	}
	elseif($muvelet == "rang")
	{
		$nev = $_POST["nev"]; $rang = $_POST["rang"];
		if(is_numeric($nev) && is_numeric($rang))
		{
			$sql = mysql_query("SELECT Nev, Hitman FROM playerek WHERE ID='".$nev."'");
			if(mysql_num_rows($sql) == 1)
			{
				$player = mysql_fetch_array($sql); mysql_free_result($sql);
				if($player["Hitman"] == $rang)
					$uzenet = "Minek adsz neki ugyanolyan rangot, mint amilyen most van?";
				else
				{
					mysql_query("UPDATE playerek SET Hitman='".$rang.",0' WHERE ID='".$nev."'");
					$uzenet = $player["Nev"] . " régi rangja: <u>".str_replace($player["Hitman"], "",$player["Hitman"]-1+1)."</u>, új rangja: <u>".$rang."</u>";
				}
			}
		}
	}
}
if(isset($uzenet)) echo Felhivas($uzenet);
?>
<style type="text/css">
	table
	{
		border-spacing:0px;
	}
	table.frakcio tr td
	{
		border: 2px outset #888;
		padding: 0px;
		text-align:center;
		vertical-align: middle;
		height: 22px;
		overflow: hidden;
	}
	tr.cim td
	{
		padding: 5px;
	}
	td.clear, table.clear tr td, tr.clear td{border: none;}
	.left
	{
		text-align: left;
	}
	.adat
	{
		font-weight:bold;
		text-align:left;
	}
	.adat_ertek
	{
		text-align:right;
	}
	.reg tr td
	{
		border: none;
	}
	td.cim
	{
		color:white;
		font-weight:bold;
		border-bottom: 2px solid grey;
	}
	tr.noborder td
	{
		border-top:none;
		border-bottom: 2px solid grey;
	}
</style>

<script type="text/javascript">
	function Klikk(felvetel)
	{
		if(felvetel)
		{
			document.getElementById("felvetel").style.display = "block";
			document.getElementById("rang").style.display = "none";
		}
		else
		{
			document.getElementById("felvetel").style.display = "none";
			document.getElementById("rang").style.display = "block";
		}
	}
</script>
<center>

	<h1>HITMAN</h1>

<?
	if($jatekos["Karakter"][$kivalasztva]["Hitman"] >= $leaderrang)
	{
?>

	<table width=60% align=center><tr><td>
		<h2>Director</h2>
		<table width=100% class="clear" align=center>
			<tr>
				<td width="22%">
					<span class="left">
					<input type="radio" name="akcio" value="felvesz" onClick="Klikk(true)" <? echo ($show == 1 ? "checked" : ""); ?>> <b>Felvétel</b><br>
					<input type="radio" name="akcio" value="rang" onClick="Klikk(false)" <? echo ($show == 2 ? "checked" : ""); ?>> <b>Rang</b><br>
					</span>
				</td>
				<td width="78%">
					<div id="felvetel" style="display:<? echo ($show == 1 ? "block" : "none"); ?>">
						<form method="POST"><input type="hidden" name="muvelet" value="felvetel">
						<input type="text" name="nev" value="<? echo ($show == 1 ? $nev : "Neve"); ?>" onClick="if(this.value=='Neve')this.value='';">
						<input type="submit" value="Felvesz" style="padding:1px">
						<br><font size=1>Mj.: Elég ha a név egy részét írod be</font>
						</form>
					</div>
					<div id="rang" style="display:<? echo ($show == 2 ? "block" : "none"); ?>">
						<?
							$sql = mysql_query("SELECT ID, Nev, Hitman FROM playerek WHERE Hitman>='1' AND Hitman < '".$leaderrang."' AND Online!='1' ORDER BY Nev ASC");
							if(mysql_num_rows($sql) != 0)
							{
								echo '<form method="POST"><input type="hidden" name="muvelet" value="rang"><select name="nev">';
								while($p = mysql_fetch_array($sql))
									echo "<option value='".$p["ID"]."'>".$p["Nev"]." [".str_replace($p["Hitman"], "",$p["Hitman"]-1+1)."]</option>";
								echo'
									</select>
									<select name="rang" style="text-align:center">
										<option value="0">Kirúg</option>
										<option value="1">Hitman</option>
										<option value="2">Director</option>
									</select>
									<input type="submit" value="Végrehajt" style="padding:1px">
									</form>
								';
							}
							else
								echo "Nincs tag";
							mysql_free_result($sql);
						?>
					</div>
				</td>
			</tr>

		</table>

	</td></tr></table>
	<br><br>

<? }
$sql = mysql_query("SELECT ID, Nev, Hitman, Online, Admin FROM playerek WHERE Hitman >= '1' ORDER BY Hitman DESC, Nev ASC");
echo "Összesen <b>".mysql_num_rows($sql)."</b> tag van<br><br>";
?>

	<form method="POST"><input type="hidden" name="muvelet" value="kirug">
	<table width="70%" align="center" class="frakcio">

		<tr class="cim">
			<td width="30%" class="cim">Név</td>
			<td width="15%" class="cim">Rang</td>
			<td width="30%" class="cim">Utolsó Belépés</td>
			<td width="15%" class="cim" title="Aktivitás">Akt.</td>
			<td width="10%" class="cim">Kirúg</td>
		</tr>
<?
	$sql = mysql_query("SELECT ID, Nev, Hitman, Online, Admin, UtoljaraAktiv, HitmanNev FROM playerek WHERE Hitman>='1' ORDER BY Hitman DESC, Nev ASC");
	$darab = 0;
	$ma = date("Y-m-d");
	$tegnap = date("Y-m-d", time()-86400);
	$tegnapelott = date("Y-m-d", time()-172800);
	$unix = time();
	while($player = mysql_fetch_array($sql))
	{
		if($player["ID"] != $jatekos["Karakter"][$kivalasztva]["ID"]) $darab++;
		
		$monthActivity = 0;
		if($player['UtoljaraAktiv'] >= (time() - 86400 * 30))
		{
			$mysql -> query('SELECT Month FROM ig_activity_index WHERE UID="'.$player['ID'].'"');
			if($mysql -> num())
			{
				$data = $mysql -> assoc();
				$monthActivity = $data['Month'];
			}
		}
		
		echo'<tr class="noborder '.($monthActivity >= (30 * 3600 * 7) ? 'uberActive' : ($monthActivity >= (30 * 3600 * 5) ? 'hyperActive' : '')).'">
			
			<td>'.($jatekos["Karakter"][$kivalasztva]["Hitman"] >= $leaderrang ? $player["Nev"] : $player["HitmanNev"]).'</td>
			<td>'.($player["Hitman"] >= $leaderrang ? "<b>Director</b>" : str_replace($player["Hitman"], "",$player["Hitman"]-1+1)).'</td>
			<td>';
			
			if($player["Online"] == "1") echo '<b style="color:cyan">Online</b>';
			else
			{
				if($player["UtoljaraAktiv"] > 0)
				{
					$uo = date("Y-m-d H:i", $player["UtoljaraAktiv"]);
					$uo_e = explode(" ", $uo);
					$color = "#ff1515";
					if(($unix - $player["UtoljaraAktiv"]) < 86400) $color = "#0cf800";
					elseif(($unix - $player["UtoljaraAktiv"]) < 172800) $color = "#fff208";
					elseif(($unix - $player["UtoljaraAktiv"]) < 604800) $color = "#f86f00";

					if($uo_e[0] == $ma)
						echo "<b style='color:$color'>Ma ".$uo_e[1]."</b>";
					elseif($uo_e[0] == $tegnap)
						echo "<b style='color:$color'>Tegnap ".$uo_e[1]."</b>";
					elseif($uo_e[0] == $tegnapelott)
						echo "<b style='color:$color'>Tegnap előtt ".$uo_e[1]."</b>";
					else
						echo "<b style='color:$color'>".$uo."</b>";
				}
				else
					echo "<i>~2010-08-19 17:00 előtt</i>";
			}

			echo'</td>
			<td> ';

			echo $_stat -> ActivityIndex($player["ID"], $player["UtoljaraAktiv"]);

			echo'</td>
			<td> ';

			if($jatekos["Karakter"][$kivalasztva]["Hitman"] >= $leaderrang)
			{
			echo($player["Online"] == 0 && $player["ID"] != $jatekos["Karakter"][$kivalasztva]["ID"] && $player["Hitman"] < $leaderrang ||
				 $player["Online"] == 0 && $player["ID"] != $jatekos["Karakter"][$kivalasztva]["ID"] && $player["Hitman"] >= $leaderrang && $jatekos["Admin"] > $player["Admin"] ? '<label for="'.$player["ID"].'_id"><center><input type="checkbox" name="nevek[]" id="'.$player["ID"].'_id" value="'.$player["ID"].'"></center></label>' : '');
			}
		echo'</td></tr>';
	}
	mysql_free_result($sql);
	if($darab > 0 && $jatekos["Karakter"][$kivalasztva]["Hitman"] >= $leaderrang)
	{
		echo'
			<tr class="clear">
				<td colspan="4" style="border: 0px"></td><td style="border: 0px"><input type="submit" style="padding:1px" value="Kirúg"></td>
			</tr>
		';
	}
		/*<tr class="noborder">
			<td>Tom_Denem</td>
			<td>7</td>
			<td>Ma 14:46</td>
			<td><img src="img/torol.png" class="kez" onclick="alert('Hamarosan...')"></td>
		</tr>
		<tr class="noborder">
			<td>Tom_Deigen</td>
			<td>5</td>
			<td>Tegnap 4:46</td>
			<td><img src="img/torol.png" class="kez" onclick="alert('Hamarosan...')"></td>
		</tr>*/
?>

	</table></form>

</center>

<? Lablec(); ?>