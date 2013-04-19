#At some point we should set up a global flag for NPC scripts that establishes a persistent DB handle so we're not logging in every time a db routine is called.
#Either that or migrate some of these functions to the server so it can use its own database link for the queries.
$db = "eqemu_database";
$user = "dbuser";
$pass = "dbpass";
$host = "localhost";

my %hotzones;
$hotzones{"airplane"} = (6);
$hotzones{"befallen"} = (1);
$hotzones{"beholder"} = (2);
$hotzones{"blackburrow"} = (1);
$hotzones{"butcher"} = (1);
$hotzones{"cauldron"} = (2);
$hotzones{"cazicthule"} = (6);
$hotzones{"commons"} = (1);
$hotzones{"crushbone"} = (2);
$hotzones{"eastkarana"} = (2);
$hotzones{"ecommons"} = (1,2);
$hotzones{"everfrost"} = (1,2,6);
$hotzones{"fearplane"} = (6);
$hotzones{"feerott"} = (1,2,3);
$hotzones{"gfaydark"} = (1);
$hotzones{"gukbottom"} = (4);
$hotzones{"guktop"} = (3);
$hotzones{"hateplaneb"} = (6);
$hotzones{"highkeep"} = (3);
$hotzones{"hole"} = (5,6);
$hotzones{"innothule"} = (1);
$hotzones{"jaggedpine"} = (4);
$hotzones{"kedge"} = (5);
$hotzones{"kerraridge"} = (4,5);
$hotzones{"kithicor"} = (1,5);
$hotzones{"lakerathe"} = (2);
$hotzones{"lavastorm"} = (2);
$hotzones{"lfaydark"} = (2);
$hotzones{"mistmoore"} = (3,4);
$hotzones{"misty"} = (1,2);
$hotzones{"najena"} = (2,3);
$hotzones{"nedaria"} = (3);
$hotzones{"northkarana"} = (2);
$hotzones{"nro"} = (1,2);
$hotzones{"oasis"} = (2,4);
$hotzones{"oot"} = (4);
$hotzones{"paw"} = (3,4);
$hotzones{"permafrost"} = (2,3,5);
$hotzones{"qey2hh1"} = (1,2);
$hotzones{"qeytoqrg"} = (1);
$hotzones{"rathemtn"} = (1,2);
$hotzones{"runnyeye"} = (2,3);
$hotzones{"soldunga"} = (3,4);
$hotzones{"soldungb"} = (4,5);
$hotzones{"southkarana"} = (2,3);
$hotzones{"sro"} = (1,2);
$hotzones{"steamfont"} = (1);
$hotzones{"tox"} = (1);
$hotzones{"unrest"} = (2,3);
$hotzones{"burningwood"} = (4);
$hotzones{"charasis"} = (5,6);
$hotzones{"chardok"} = (6);
$hotzones{"citymist"} = (4,5);
$hotzones{"dalnir"} = (3);
$hotzones{"dreadlands"} = (4);
$hotzones{"droga"} = (5,6);
$hotzones{"emeraldjungle"} = (4);
$hotzones{"fieldofbone"} = (1,2);
$hotzones{"frontiermtns"} = (3,4);
$hotzones{"kaesora"} = (4);
$hotzones{"karnor"} = (5);
$hotzones{"kurn"} = (2);
$hotzones{"lakeofillomen"} = (2,3);
$hotzones{"nurga"} = (4,5);
$hotzones{"overthere"} = (2,3,4);
$hotzones{"sebilis"} = (5,6);
$hotzones{"skyfire"} = (5);
$hotzones{"stonebrunt"} = (2,3);
$hotzones{"swampofnohope"} = (1,2,3);
$hotzones{"trakanon"} = (4,5);
$hotzones{"veeshan"} = (7);
$hotzones{"veksar"} = (6);
$hotzones{"warrens"} = (1,2);
$hotzones{"warslikswood"} = (1,2);
$hotzones{"cobaltscar"} = (4,5);
$hotzones{"crystal"} = (3,4);
$hotzones{"eastwastes"} = (3,4,5);
$hotzones{"frozenshadow"} = (3,4,5);
$hotzones{"greatdivide"} = (3,4);
$hotzones{"growthplane"} = (5,6);
$hotzones{"iceclad"} = (3,4);
$hotzones{"kael"} = (4,5,6,7);
$hotzones{"mischiefplane"} = (5,6,7);
$hotzones{"necropolis"} = (5,6);
$hotzones{"sirens"} = (6);
$hotzones{"skyshrine"} = (4,5,6,7);
$hotzones{"sleeper"} = (7);
$hotzones{"templeveeshan"} = (7);
$hotzones{"velketor"} = (5,6);
$hotzones{"wakening"} = (4,5);
$hotzones{"westwastes"} = (5,6,7);
$hotzones{"acrylia"} = (5,6);
$hotzones{"akheva"} = (6,7);
$hotzones{"dawnshroud"} = (3,4);
$hotzones{"echo"} = (3,4);
$hotzones{"fungusgrove"} = (5);
$hotzones{"griegsend"} = (5,6);
$hotzones{"grimling"} = (3,4,5);
$hotzones{"hollowshade"} = (2,3);
$hotzones{"letalis"} = (4);
$hotzones{"maiden"} = (5,6);
$hotzones{"mseru"} = (3);
$hotzones{"netherbian"} = (2,3);
$hotzones{"paludal"} = (1,2);
$hotzones{"scarlet"} = (4,5);
$hotzones{"shadeweaver"} = (1,2);
$hotzones{"ssratemple"} = (6,7);
$hotzones{"tenebrous"} = (4,5);
$hotzones{"thedeep"} = (6);
$hotzones{"thegrey"} = (4,5);
$hotzones{"twilight"} = (3,4);
$hotzones{"umbral"} = (6);
$hotzones{"vexthal"} = (6,7);
$hotzones{"ponightmare"} = (6,7);
$hotzones{"potorment"} = (7);
$hotzones{"solrotower"} = (7);
$hotzones{"dulak"} = (4,5);
$hotzones{"gunthak"} = (3,4,5);
$hotzones{"hatesfury"} = (6);
$hotzones{"nadox"} = (5,6);
$hotzones{"torgiran"} = (5,6);
$hotzones{"tipt"} = (5);
$hotzones{"eastkorlacha"} = (5,6);

sub dbNav
{
    my $ntype = shift;
    my $nval = shift;

    my $client = plugin::val('client');
    my $baseurl = "http://dungeoncrawl.us.to/eq/ak/";

    my $page = "";

    if($ntype eq "ZONE")
    {
        $page = "zone.php?name=$nval";
    }

    if($ntype eq "NPC")
    {
        $page = "npc.php?id=$nval";
    }

    $client->SendWebLink($baseurl.$page);
}

sub getHotZones
{
    my $client = plugin::val('client');

    $client->Message(315, "------------------------");

    my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) || die "Could not create db handle\n";
    my $ares = $dbh->prepare("SELECT short_name, long_name, h_level FROM zone RIGHT JOIN hotzones ON (short_name = h_shortname) WHERE hotzone = 1 AND version = 0 ORDER BY h_level, short_name");
    if(!$ares->execute())
    {
        $client->Message(315, "Error getting hotzones.");
        return;
    }

    my $cnt = 0;
    while( (my ($sn, $ln, $lv) = $ares->fetchrow_array()) )
    {
        my $l_zn = quest::saylink("%!!dbnav ZONE $sn", 1, "$sn");
        $client->Message(315, "* - ($lv) $l_zn - $ln");
        $cnt++;
    }
    $client->Message(315, "$cnt total hotzones.");
}

sub getLevelZones
{
    my $hz = shift;

    my $client = plugin::val('client');

    my $lvcalc = int($client->GetLevel()/10) + 1;
    my $lvpp = $lvcalc + 1;

    $client->Message(315, "------------------------");
    $client->Message(15, "Potential Level Zones (H) = Hotzone");
    $client->Message(315, "------------------------");

    my @zonelist;
    foreach $hzl (keys(%hotzones))
    {
        if($lvcalc ~~ $hotzones{$hzl} || $lvpp ~~ $hotzones{$hzl})
        {
            push(@zonelist, "'$hzl'");
        }
    }

    my $wstr = join(", ", @zonelist);

    my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) || die "Could not create db handle\n";
    my $ares = $dbh->prepare("SELECT short_name, long_name, hotzone FROM zone WHERE short_name IN ($wstr) ORDER BY short_name");
    if(!$ares->execute())
    {
        $client->Message(315, "Error getting hotzones.");
        return;
    }

    my $cnt = 0;
    while( (my ($sn, $ln, $hz) = $ares->fetchrow_array()) )
    {
        my $l_zn = quest::saylink("%!!dbnav ZONE $sn", 1, "$sn");

        my $hzstr = "";
        if($hz == 1) { $hzstr = "(H)"; }
        $client->Message(315, "* - $hzstr $l_zn - $ln");
        $cnt++;
    }
    $client->Message(315, "$cnt total zones.");
    $client->Message(315, "------------------------");
    $client->Message(15, "Potential Level Zones (H) = Hotzone");
    $client->Message(315, "------------------------");
}

sub doAnnounce
{
    my $client = plugin::val('client');

    my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) || die "Could not create db handle\n";
    my $ares = $dbh->prepare("SELECT i_itemid, i_enddate, i_price, i_bidstart FROM dc_itemlist WHERE i_status = 'LISTED' ORDER BY RAND() LIMIT 1");
    if(!$ares->execute())
    {
        #quest::ze(15, "Error in query");
        #$client->Message(315, "Error getting hotzones.");
        return;
    }

    if( (my ($iid, $end, $price, $minbid) = $ares->fetchrow_array()) )
    {
        #quest::ze(15, "$iid - $end - $price - $minbid");
        my $ilink = quest::varlink($iid);
        my $l_aucinfo = quest::saylink("%!!auctionhelp", 1, "More Info");
        my $buyout = "";
        if($price > 0) { $buyout = "Buyout: " . $price / 1000 . " PP"; }
        $client->Message(15, "Random Auction: $ilink $buyout - Auction Ends: $end - ($l_aucinfo)");
    }
}

sub getForumAcc
{
    my $accname = shift;

    my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) || die "Could not create db handle\n";
    my $ares = $dbh->prepare("SELECT f_forumname FROM dc_forumauth WHERE f_accname = '$accname'");
    $ares->execute();
    if( ($fname) = $ares->fetchrow_array() )
    {
        return($fname);
    }
    else
    {
        return(0);
    }
}

sub ListInventory
{
    $fname = shift;

    my $client = plugin::val('client');

    $client->Message(315, "------------------------");

    my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) || die "Could not create db handle\n";
    my $ares = $dbh->prepare("SELECT i_itemid, i_id FROM dc_itemlist WHERE i_status = 'INVENTORY' AND i_redeemed = 0 AND i_forumname = '$fname'");
    if(!$ares->execute())
    {
        $client->Message(315, "Error getting invetory list.");
        return;
    }

    my $cnt = 0;
    while( (my ($itemid, $rowid) = $ares->fetchrow_array()) )
    {
        my $vl = quest::varlink($itemid);
        my $rd = quest::saylink("redeeminventory $rowid", 1, "Redeem");
        $client->Message(315, "* - $rd - $vl");
        $cnt++;
    }
    $client->Message(315, "$cnt items in inventory.");
}

sub ListPurchases
{
    $fname = shift;

    my $client = plugin::val('client');

    $client->Message(315, "------------------------");

    my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) || die "Could not create db handle\n";
    my $ares = $dbh->prepare("SELECT i_itemid, i_id FROM dc_itemlist WHERE i_status = 'SOLD' AND i_redeemed = 0 AND i_buyer = '$fname'");
    if(!$ares->execute())
    {
        $client->Message(315, "Error getting purchase list.");
        return;
    }

    my $cnt = 0;
    while( ($itemid, $rowid) = $ares->fetchrow_array() )
    {
        my $vl = quest::varlink($itemid);
        my $rd = quest::saylink("redeempurchase $rowid", 1, "Redeem");
        $client->Message(315, "* - $rd - $vl");
        $cnt++;
    }
    $client->Message(315, "$cnt items purchased.");
}

sub RedeemInventory
{
    my $fname = $_[0];
    my $rid = $_[1];

    my $client = plugin::val('client');

    my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) || die "Could not create db handle\n";
    my $ares = $dbh->prepare("SELECT i_itemid, i_id FROM dc_itemlist WHERE i_status = 'INVENTORY' AND i_redeemed = 0 AND i_forumname = '$fname' AND i_id = '$rid'");
    if(!$ares->execute())
    {
        $client->Message(315, "Error validating inventory item.");
        return;
    }

    if( ($itemid, $rowid) = $ares->fetchrow_array() )
    {
        my $aru = $dbh->prepare("UPDATE dc_itemlist SET i_redeemed = 1 WHERE i_status = 'INVENTORY' AND i_redeemed = 0 AND i_forumname = '$fname' AND i_id = '$rowid'");
        if(!$aru->execute())
        {
            $client->Message(315, "Error updating inventory item.");
            return;
        }
        #We're validated and updated, summon the item.
        my $vl = quest::varlink($itemid);
        $client->Message(315, "You have redeemed $vl from inventory.");
        quest::summonitem($itemid);
    }
    else
    {
        $client->Message(315, "No such item found in inventory.");
    }
}

sub RedeemPurchase
{
    my $fname = $_[0];
    my $rid = $_[1];

    my $client = plugin::val('client');

    my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) || die "Could not create db handle\n";
    my $ares = $dbh->prepare("SELECT i_itemid, i_id FROM dc_itemlist WHERE i_status = 'SOLD' AND i_redeemed = 0 AND i_buyer = '$fname' AND i_id = '$rid'");
    if(!$ares->execute())
    {
        $client->Message(315, "Error validating purchased item.");
        return;
    }

    if( ($itemid, $rowid) = $ares->fetchrow_array() )
    {
        my $aru = $dbh->prepare("UPDATE dc_itemlist SET i_redeemed = 1 WHERE i_status = 'SOLD' AND i_redeemed = 0 AND i_buyer = '$fname' AND i_id = '$rowid'");
        if(!$aru->execute())
        {
            $client->Message(315, "Error updating purchased item.");
            return;
        }
        #We're validated and updated, summon the item.
        my $vl = quest::varlink($itemid);
        $client->Message(315, "You have redeemed $vl.");
        quest::summonitem($itemid);
    }
    else
    {
        $client->Message(315, "No such item found in purchase list.");
    }
}

sub GetAuctionCoinAmount
{
    my $fname = shift;

    my $client = plugin::val('client');

    my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) || die "Could not create db handle\n";
    my $ares = $dbh->prepare("SELECT a_balance FROM dc_accountstats WHERE a_forumname = '$fname'");
    if(!$ares->execute())
    {
        $client->Message(315, "Error requesting balance!");
        return(0);
    }
    ($balance) = $ares->fetchrow_array();
    return($balance);
}

sub DeductAuctionCoin
{
    my $fname = $_[0];
    my $amt = $_[1];

    my $aamt = $amt;

    my $client = plugin::val('client');

    if($amt < 1) { $client->Message(315, "Amounts must be 1 or more."); return; }

    my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) || die "Could not create db handle\n";
    my $ares = $dbh->prepare("UPDATE dc_accountstats SET a_balance = a_balance - '$amt' WHERE a_balance >= '$amt' AND a_forumname = '$fname'");
    if(!$ares->execute())
    {
        $client->Message(315, "Error updating balance!");
        return;
    }

    $pp = int($amt/1000);
    $amt = $amt - ($pp * 1000);
    $gp = int($amt/100);
    $amt = $amt - ($gp * 100);
    $sp = int($amt/10);
    $cp = $amt - ($sp * 10);

    quest::givecash($cp, $sp, $gp, $pp);
    $client->Message(315, "You have withdrawn $aamt");
}

sub AddAuctionItem
{
    my $itemid = $_[0];
    my $fname = $_[1];
    my $aname = $_[2];

    my $client = plugin::val('client');

    my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) || die "Could not create db handle\n";
    my $ares = $dbh->prepare("INSERT INTO dc_itemlist (i_forumname, i_itemid, i_status, i_startdate, i_enddate, i_price, i_buyer, i_buydate, i_redeemed) VALUES
                            ('$fname', '$itemid', 'INVENTORY', NOW(), NOW(), 0, '', '', 0)");
    if(!$ares->execute())
    {
        $client->Message(315, "Error adding item!");
        quest::summonitem($itemid);
        return;
    }
}

sub AddAuctionCoin
{
    my $totalcoin = $_[0];
    my $fname = $_[1];
    my $aname = $_[2];

    my $cp = plugin::val('$copper');
    my $sp = plugin::val('$silver');
    my $gp = plugin::val('$gold');
    my $pp = plugin::val('$platinum');

    my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) || die "Could not create db handle\n";
    my $ares = $dbh->prepare("UPDATE dc_accountstats SET a_balance = a_balance + '$totalcoin' WHERE a_forumname = '$fname'");

    if(!$ares->execute())
    {
        $client->Message(315, "Error storing coin!");
        quest::givecash($cp, $sp, $gp, $pp);
    }
}

sub cmdproc
{
    my $text = $_[0];

    my $client = plugin::val('$client');
    my $npc = plugin::val('$npc');
    my $entity_list = plugin::val('$entity_list');
    my $name = plugin::val('$name');
    my $qglobals = plugin::var('qglobals');
    my $accname = $client->AccountName();

    if($text=~/^!help/i)
    {
        my $l_serverinfo = quest::saylink("%!!serverinfo", 1, "!serverinfo");
        my $l_levelinfo = quest::saylink("%!!levelinfo", 1, "!levelinfo");
        my $l_scribespells = quest::saylink("%!!scribespells", 1, "!scribespells");
        my $l_traindiscs = quest::saylink("%!!traindiscs", 1, "!traindiscs");
        my $l_banker = quest::saylink("%!!banker", 1, "!banker");
        my $l_merchant = quest::saylink("%!!merchant", 1, "!merchant");
        my $l_augsealer = quest::saylink("%!!augsealer", 1, "!augsealer");
        my $l_hotzones = quest::saylink("%!!hotzones", 1, "!hotzones");
        my $l_lvzones = quest::saylink("%!!levelzones", 1, "!levelzones");
        my $l_randomauction = quest::saylink("%!!randomauction", 1, "!randomauction");
        my $l_randomtip = quest::saylink("%!!randomtip", 1, "!randomtip");
        my $l_activeac = quest::saylink("%!!activeachievements", 1, "!activeachievements");
        my $l_pendingac = quest::saylink("%!!pendingachievements", 1, "!pendingachievements");
        my $l_completedac = quest::saylink("%!!completedachievements", 1, "!completedachievements");
        my $l_auchelp = quest::saylink("%!!auctionhelp", 1, "!auctionhelp");
        my $l_website = quest::saylink("%!!website", 1, "!website");
        my $l_npci = quest::saylink("%!!npcinfo", 1, "!npcinfo");

        $client->Message(315, "The following commands are available:");
        $client->Message(315, "* - !account <forumid> - This will connect your login server accounts to forum accounts once the request has been made on the website.");
        $client->Message(315, "* - $l_serverinfo - This displays the server information popup that is shown to new characters.");
        $client->Message(315, "* - $l_levelinfo [level] - This displays the level message given for a certain level.  If invoked without a level it will show a list of levels with messages.");
        $client->Message(315, "* - $l_scribespells - This will scribe spells up to your level.");
        $client->Message(315, "* - $l_traindiscs - This will train disciplines up to your level.");
        $client->Message(315, "* - $l_banker - If you are a member of the Adventurer's Guild this will summon a temporary banker.");
        $client->Message(315, "* - $l_merchant - If you are a member of the Adventurer's Guild this will summon a temporary merchant.");
        $client->Message(315, "* - $l_augsealer - This will summon an augsealer for equipping or removing augs in the field.");
        $client->Message(315, "* - $l_hotzones - This will display the current hotzone list.");
        $client->Message(315, "* - $l_lvzones - This will display a thorough list of possible zones for your level.");
        $client->Message(315, "* - $l_randomauction - This will show a random auction if any items are listed.");
        $client->Message(315, "* - $l_randomtip - This will show a random tip like what you see upon entering a new zone.");
        $client->Message(315, "* - $l_activeac - This shows achievements you are currently working on.");
        $client->Message(315, "* - $l_pendingac - This shows completed achievements you can redeem.");
        $client->Message(315, "* - $l_completedac - This shows all completed achievements.");
        $client->Message(315, "* - $l_auchelp - This shows information about how to use the auction house.");
        $client->Message(315, "* - $l_website - This opens the website using the in-game browser if available.");
        $client->Message(315, "* - $l_npci - This searches the database browser for information on your current target.  It requires a client that supports the in-game browser.");
        $client->Message(315, "* - !petname <new name> - This changes the name of your pet if you have one.");
    }

    if($text =~ /^!randomtip/i)
    {
        plugin::RandomTip();
    }

    if($text =~ /^!auctionhelp/i)
    {
        my $ahelp = "The auction house can be accessed through the server website:<br>";
        $ahelp .= "<a href=\"http://dungeoncrawl.us.to\">http://dungeoncrawl.us.to</a><br>";
        $ahelp .= "First you need to register a forum account.  Then you need to make a link request from the Account Manager.<br>";
        $ahelp .= "Log into each account you have requested a link for and type the appropriate !account command to complete the link.<br>";
        $ahelp .= "Once linked you can talk to auctioneers, currently located in East Commons, Nedaria, and the Adventurer's Guild.<br>";
        $ahelp .= "You must give coin to an auctioneer in order to list or make purchases.  All revenue from listed auctions goes into your AH account.<br>";
        $ahelp .= "Coin and items given to the auctioneer can be redeemed at any time, provided the item is not currently in an active auction.<br>";
        $ahelp .= "The AH operates purely on in-game currency.";

        quest::popup("Auction House Instructions", $ahelp);
    }

    if($text =~ /^!website/i)
    {
        plugin::WebLinks();
    }

    if($text =~ /^!account/i)
    {
        ($cm, $fname) = split(/\ /, $text, 2);
        chomp($fname);
        $aname = lc($fname);

        my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) || die "Could not create db handle\n";

        my $ares = $dbh->prepare("SELECT f_accname, f_forumname, f_id FROM dc_forumauth WHERE f_accname = '$accname' AND f_approved = 0 AND f_forumname = '$fname'");
        $ares->execute();
        if( ($cacc, $cfn, $cid) = $ares->fetchrow_array() )
        {
            $client->Message(315, "Found auth row for $cacc, $cfn");
            my $cqh = $dbh->prepare("UPDATE dc_forumauth SET f_approved = 1 WHERE f_id = '$cid' LIMIT 1");
            if($cqh->execute())
            {
                my $qtext = "$accname was successfully connected to $fname<br><br>Items given to an auctioneer by any character on this account will now be available to be sold in the auction house.<br>";
                $qtext .= "Items purchased by this forum account will also be available to any character on this login server account.";
                quest::popup("Account Connect Success", $qtext);
            }
            else
            {
                quest::popup("Account Connect Failure", "An error occurred while trying to link accounts.");
            }
        }
        else
        {
            $client->Message(315, "No auth row found for $fname and $accname.");
        }
    }

    if($text =~ /^!serverinfo/i)
    {
        plugin::StartPopup();
    }

    if($text =~ /^!accountrewards/i)
    {
        plugin::AccRewards();
    }

    if($text =~ /^!scribespells/i)
    {
        $client->Message(315, "Scribing Spells...");
        quest::scribespells( $client->GetLevel() );
    }

    if($text =~ /traindiscs/i)
    {
        $client->Message(315, "Training Disciplines...");
        quest::traindiscs( $client->GetLevel() );
    }

    if($text =~ /augsealer/i)
    {
        quest::summonitem(66180);
    }

    if($text =~/^!petname/i)
    {
        my $pid = $client->GetPetID();
        my $pet = $entity_list->GetMobByID($pid);

        if($pet)
        {
            ($cm, $petname) = split(/\ /, $text, 2);
            $pet->TempName($petname);
            $client->Message(315, "Your pet name has been changed.");
            $client->Message(315, "This is a family friendly server.  Please be considerate when choosing a pet name.");
        }
    }

    if($text =~ /banker/i)
    {
        my $isa = $qglobals->{"ADVKILL"};

        if(!$isa) { $client->Message(315, "You are not a member of the Adventurer's Guild.  Visit Tarsh Lightbringer in North Karana to join."); return; }

        #maybe look at auction house account balance here?
        #$client->TakeMoneyFromPP();
        if( $qglobals->{'summonbanker'} == 1) { $client->Message(315, "You may only request a banker once every 10 minutes"); return; }
        quest::spawn2(344016, 0, 0, $client->GetX(), $client->GetY(), $client->GetZ(), $client->GetHeading());
        $client->SetGlobal('summonbanker', 1, 5, "M10");
    }

    if($text =~ /merchant/i)
    {
        my $isa = $qglobals->{"ADVKILL"};

        if(!$isa) { $client->Message(315, "You are not a member of the Adventurer's Guild.  Visit Tarsh Lightbringer in North Karana to join."); return; }

        #maybe look at auction house account balance here?
        #$client->TakeMoneyFromPP();
        if( $qglobals->{'summonmerch'} == 1) { $client->Message(315, "You may only request a merchant once every 10 minutes"); return; }
        quest::spawn2(999222, 0, 0, $client->GetX(), $client->GetY(), $client->GetZ(), $client->GetHeading());
        $client->SetGlobal('summonmerch', 1, 5, "M10");
    }

    if($text =~ /levelinfo/i)
    {
        my $cm;
        my $lv;

        if($text =~/\ /)
        {
            ($cm, $lv) = split(/\ /, $text, 2);
            if(!$lv) { $lv = 99; }
        }
        else { $lv = 99; }

        plugin::LevelInfo($lv);
    }

    if($text =~ /randomauction/i)
    {
        plugin::doAnnounce();
    }

    if($text =~ /listtest/i)
    {
        $client->Message(315, "Testing Entity List");
        my $mb = $entity_list->GetNPCByNPCTypeID(33151);

        if($mb)
        {
            $client->Message(315, "Found ");
        }
        else
        {
            $client->Message(315, "Not Found");
        }

        my @mobs = $entity_list->GetNPCList();
        $client->Message(315, "Looking for mob list");
        foreach $m (@mobs)
        {
            $client->Message(315, "Found a mob");
        }
    }

    if($text =~ /setspawntime/i)
    {
        if( $client->Admin() < 200) { return; }

        my $cm;
        my $sid;
        my $time;

        ($cm, $sid, $time) = split(/\ /, $text, 3);

        if($sid > 0 && $time > 0)
        {
            quest::updatespawntimer($sid, $time);
            $client->Message(315, "Setting spawn $sid to $time");
        }
    }

    if($text =~ /openurl/i)
    {
        my ($cm, $url) = split(/\ /, $text, 2);
        plugin::OpenURL($url);
    }

    if($text =~ /setdeity/i)
    {
        my ($cm, $dn) = split(/\ /, $text, 2);
        $client->SetDeity($dn);
    }

    if($text =~ /dbnav/i)
    {
        my ($cm, $tp, $vl) = split(/\ /, $text, 3);
        plugin::dbNav($tp, $vl);
    }

    if($text =~ /givetask/i)
    {
        my ($cm, $task) = split(/\ /, $text, 2);
        $client->AssignTask($task, 0);
    }

    if($text =~ /npcinfo/i)
    {
        my $tar = $client->GetTarget();
        if($tar)
        {
            plugin::dbNav("NPC", $tar->GetNPCTypeID());
        }
    }

    if($text =~ /hotzones/i)
    {
        plugin::getHotZones();
    }

    if($text=~ /levelzones/i)
    {
        plugin::getLevelZones();
    }

    if($text =~ /activeachievements/i)
    {
        plugin::showActiveAchievements();
    }

    if($text =~ /pendingachievements/i)
    {
        plugin::showPendingAchievements(0);
    }

    if($text =~ /completedachievements/i)
    {
        plugin::showPendingAchievements(1);
    }

    if($text =~ /resetkills/i)
    {
        $client->SetGlobal("TOTALKILLS", 0, 5, "F");
    }

    if($text =~ /acredeem/i)
    {
        plugin::redeemAchievement($text);
    }

    if($text=~/^\!wpgoto/i)
    {
        if( $qglobals->{'gatestonetime'} != 1 ) { $client->Message(315, "The Gatestone has grown cold."); return; }
        my @v = split(/\-/, $text);
        $wpstr = $qglobals->{"wpentry-$v[1]"};
        @wp = split(/\|/, $wpstr);
        $client->Message(315, "Farewell, be safe in $wp[0]");
        quest::movepc($wp[1], $wp[2], $wp[3], $wp[4]);
    }
    if($text=~/^\!cbgoto/i)
    {
        if( $qglobals->{'gatestonetime'} != 1 ) { $client->Message(315, "The Gatestone has grown cold."); return; }
        my @v = split(/\-/, $text);
        $wpstr = $qglobals->{"cbentry-$v[1]"};
        @wp = split(/\|/, $wpstr);
        $client->Message(315, "Farewell, be safe in $wp[0]");
        quest::movepc($wp[1], $wp[3], $wp[4], $wp[5]);
    }
}

return 1;
