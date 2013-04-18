#At some point we should set up a global flag for NPC scripts that establishes a persistent DB handle so we're not logging in every time a db routine is called.
#Either that or migrate some of these functions to the server so it can use its own database link for the queries.
$db = "eqemu_dc";
$user = "dc_serverman";
$pass = "svmanlikeskitties";
$host = "localhost";

sub getHotZones
{
    my $client = plugin::val('client');

    $client->Message(315, "------------------------");

    my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) || die "Could not create db handle\n";
    my $ares = $dbh->prepare("SELECT short_name, long_name FROM zone WHERE hotzone = 1 ORDER BY short_name");
    if(!$ares->execute())
    {
        $client->Message(315, "Error getting hotzones.");
        return;
    }

    my $cnt = 0;
    while( (my ($sn, $ln) = $ares->fetchrow_array()) )
    {
        $client->Message(315, "* - $sn - $ln");
        $cnt++;
    }
    $client->Message(315, "$cnt total hotzones.");
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
        my $buyout = "";
        if($price > 0) { $buyout = "Buyout: " . $price / 1000 . " PP"; }
        $client->Message(15, "Random Auction: $ilink $buyout - Auction Ends: $end");
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

    if($text =~ /help/i)
    {
        my $l_serverinfo = quest::saylink("%!!serverinfo", 1, "!serverinfo");
        my $l_levelinfo = quest::saylink("%!!levelinfo", 1, "!levelinfo");
        my $l_scribespells = quest::saylink("%!!scribespells", 1, "!scribespells");
        my $l_traindiscs = quest::saylink("%!!traindiscs", 1, "!traindiscs");
        my $l_banker = quest::saylink("%!!banker", 1, "!banker");
        my $l_merchant = quest::saylink("%!!merchant", 1, "!merchant");
        my $l_augsealer = quest::saylink("%!!augsealer", 1, "!augsealer");
        my $l_hotzones = quest::saylink("%!!hotzones", 1, "!hotzones");
        my $l_randomauction = quest::saylink("%!!randomauction", 1, "!randomauction");
        my $l_randomtip = quest::saylink("%!!randomtip", 1, "!randomtip");
        my $l_activeac = quest::saylink("%!!activeachievements", 1, "!activeachievements");
        my $l_pendingac = quest::saylink("%!!pendingachievements", 1, "!pendingachievements");
        my $l_completedac = quest::saylink("%!!completedachievements", 1, "!completedachievements");

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
        $client->Message(315, "* - $l_randomauction - This will show a random auction if any items are listed.");
        $client->Message(315, "* - $l_randomtip - This will show a random tip like what you see upon entering a new zone.");
        $client->Message(315, "* - $l_activeac - This shows achievements you are currently working on.");
        $client->Message(315, "* - $l_pendingac - This shows completed achievements you can redeem.");
        $client->Message(315, "* - $l_completedac - This shows all completed achievements.");
    }

    if($text =~ /randomtip/i)
    {
        plugin::RandomTip();
    }

    if($text =~ /account/i)
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

    if($text =~ /serverinfo/i)
    {
        plugin::StartPopup();
    }

    if($text =~ /scribespells/i)
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

    if($text =~ /hotzones/i)
    {
        plugin::getHotZones();
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
}

return 1;
