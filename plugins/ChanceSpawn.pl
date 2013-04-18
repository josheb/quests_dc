# Usage: plugin::ChanceSpawn(NPCID, PLevel, LevelDiff, Chance) 
# NPCID - Mob to spawn
# PLevel - level of player triggering (Optional: Defaults to a variable set)
# LevelDiff - Maximum difference between Mob's level and Player's Level (Optional: Defaults to a variable set)
# Chance - Customizable chance, uses formula if omitted.

sub ChanceSpawn {
## DBI STUFF
use DBI;
my $confile = "eqemu_config.xml"; #default
my $db = "eq";
my $user = "eq";
my $pass = "eq";
my $host = "localhost";

open(F, "<$confile") or die "Unable to open config: $confile\n";
my $indb = 0;

while(<F>) {
   s/\r//g;
   if(/<database>/i) {
      $indb = 1;
   }
   next unless($indb == 1);
   if(/<\/database>/i) {
      $indb = 0;
      last;
   }
   if(/<host>(.*)<\/host>/i) {
      $host = $1;
   } elsif(/<username>(.*)<\/username>/i) {
      $user = $1;
   } elsif(/<password>(.*)<\/password>/i) {
      $pass = $1;
   } elsif(/<db>(.*)<\/db>/i) {
      $db = $1;
   }
}
if(!$db || !$user || !$pass || !$host) {
   die "Invalid database info, missing one of: host, user, password, database\n";
}
my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) || die "Could not create db handle\n";
## End DBI stuff
## Variables, set these to customize how the script works

$DefPLevel = 70;    # Default player level
$DefLevelDiff = 3;	# Default level difference
$MinChance = 10;  	# Minimum chance
$MaxChance = 25;	# Maximum chance
$LevelMult = 5;		# Mult per level difference

## End Variables

	$npc = plugin::val('$npc');

	my $NPCID = $_[0];
	my $PLevel = $_[1];
	my $LevelDiff = $_[2];
	my $Chance = $_[3];
	my $SpawnX = $npc->GetX();
	my $SpawnY = $npc->GetY();
	my $SpawnZ = $npc->GetZ();	
	my $SpawnH = $npc->GetHeading();
		
	my $Holder = $dbh->prepare("SELECT level FROM npc_types WHERE id = $NPCID");
	$Holder->execute();
	$Record = $Holder->fetch();
	$MLevel = @$Record[0];
	$TargLevel = $MLevel-$LevelDiff;

	if ( !$PLevel ) {
		$PLevel = $DefPLevel;
	}
	if ( !$LevelDiff ) {
		$LevelDiff = $DefLevelDiff;
	}
	if ( !$Chance ) {
		if ( $PLevel >= $TargLevel ) {
			$Chance = $MinChance + $LevelMult * ($PLevel - $TargLevel);
			$Chance = ($Chance, $MaxChance)[$Chance < $MaxChance];
		}
		else {
			$Chance = 0;
		}
	}
	if ( $Chance > 100 ) {
		$Chance = 100;
	}

	$Rolled = int(rand(100));
	if ( $Rolled <= $Chance ) {
		if ( $PLevel >= ($MLevel-$LevelDiff) ) {
			quest::spawn2($NPCID,0,0,$SpawnX,$SpawnY,$SpawnZ,$SpawnH);
			quest::emote("staggers and reemerges as a Fabled version of themselves, eager to continue the fight.");# Comment out if using for something other than fabled, or change.
		}
	}
}
return 1;