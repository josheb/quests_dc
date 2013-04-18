sub auctioneer_say
{
    my $client = plugin::val('client');
    my $npc = plugin::val('npc');
    my $zonesn = plugin::val('zonesn');
    my $zoneln = plugin::val('zoneln');
    my $zoneid = plugin::val('zoneid');
    my $qglobals = plugin::var('qglobals');

    my $name = plugin::val('name');

    my $text = shift;

    my $fname = plugin::getForumAcc($client->AccountName());
    if(!$fname)
    {
        my $qtext = "This login account is not tied to a forum account.<br><br>";
        $qtext .= "To use the Auction House you must create a forum account at http://dungeoncrawl.us.to.  Once that is done follow the link on the forum to ";
        $qtext .= "tie login accounts to your forum account.  When you've made requests for all your accounts, log into the game with each account and type<br>";
        $qtext .= "/auction #account [forum username]<br>";

        quest::popup("Account Is Not Linked", $qtext);
        return;
    }

    if($text=~/hail/i)
    {
        plugin::ClientSay("Hello $name.  How can I assist you?");
        my $l_redeem_p = quest::saylink("redeem purchases", 1, "I would like to redeem purchases.");
        my $l_redeem_i = quest::saylink("redeem inventory", 1, "I would like to redeem inventory.");
        my $l_redeem_c = quest::saylink("redeem coin", 1, "I would like to redeem coin.");

        $client->Message(315, "* - $l_redeem_p");
        $client->Message(315, "* - $l_redeem_i");
        $client->Message(315, "* - $l_redeem_c");
        return;
    }

    if($text=~/redeeminventory/i)
    {
        my ($cm, $rid) = split(/\ /, $text);
        chomp($rid);
        $rid = int($rid);
        plugin::RedeemInventory($fname, $rid);
        return;
    }

    if($text=~/redeempurchase/i)
    {
        ($cm, $rid) = split(/\ /, $text);
        chomp($rid);
        $rid = int($rid);
        plugin::RedeemPurchase($fname, $rid);
        return;
    }

    if($text=~/redeem purchases/i)
    {
        plugin::ListPurchases($fname);
        return;
    }

    if($text=~/redeem inventory/i)
    {
        plugin::ListInventory($fname);
        return;
    }

    if($text=~/redeem coin/i)
    {
        #get the coin amount for their account
        my $totalcoin = GetAuctionCoinAmount($fname);
        plugin::ClientSay("You have $totalcoin in your account.");
        $client->Message(315, "Redeem by saying 'getcoin <amount>'");
        return;
    }

    if($text=~/getcoin/i)
    {
        my($cm, $amt) = split(/\ /, $text);
        chomp($text);
        my $totalcoin = GetAuctionCoinAmount($fname);

        if($amt > $totalcoin)
        {
            $client->Message(315, "Your balance is $totalcoin.  You can not withdraw $amt");
        }
        else
        {
            plugin::DeductAuctionCoin($fname, $amt);
        }
        return;
    }
}

sub auctioneer_item
{
    my $client = plugin::val('client');
    my $npc = plugin::val('npc');
    my $zonesn = plugin::val('zonesn');
    my $zoneln = plugin::val('zoneln');
    my $zoneid = plugin::val('zoneid');
    my $qglobals = plugin::var('qglobals');

    my $at1 = plugin::val('$item1_attuned');
    my $at2 = plugin::val('$item2_attuned');
    my $at3 = plugin::val('$item3_attuned');
    my $at4 = plugin::val('$item4_attuned');

    my $it1 = plugin::val('$item1');
    my $it2 = plugin::val('$item2');
    my $it3 = plugin::val('$item3');
    my $it4 = plugin::val('$item4');

    my $ic1 = plugin::val('$item1_charges');
    my $ic2 = plugin::val('$item2_charges');
    my $ic3 = plugin::val('$item3_charges');
    my $ic4 = plugin::val('$item4_charges');

    my $itemcount = plugin::var('itemcount');
    my ($cp, $sp, $gp, $pp) = (plugin::val('$copper'), plugin::val('$silver'), plugin::val('$gold'), plugin::val('$platinum'));
    my $totalcoin = $cp + (10 * $sp) + (100 * $gp) + (1000 * $pp);

    my $fname = plugin::getForumAcc($client->AccountName());
    if(!$fname)
    {
        $client->Message(315, "This login account is not linked to a forum account.");
        plugin::returnUnusedItems();
        return;
    }

    for(my $ix = 1; $ix < 5; $ix++)
    {
        #Couldn't get the dynamic variable names to work as documented, whatever.
        if($ix == 1) { $ci = $it1; $ca = $at1; $cc = $ic1; }
        if($ix == 2) { $ci = $it2; $ca = $at2; $cc = $ic2; }
        if($ix == 3) { $ci = $it3; $ca = $at3; $cc = $ic3; }
        if($ix == 4) { $ci = $it4; $ca = $at4; $cc = $ic4; }

        if($ci == 0) { next; }
        my $vl = quest::varlink($ci);
        my $norent = $npc->GetItemStat($ci, "norent");
        my $nodrop = $npc->GetItemStat($ci, "nodrop");
        my $notransfer = $npc->GetItemStat($ci, "notransfer");
        my $attune = $npc->GetItemStat($ci, "attuneable");
        my $charges = $npc->GetItemStat($ci, "maxcharges");
        my $click = $npc->GetItemStat($ci, "clickeffect");

        #$client->Message(315, "$ix - $ci - $ca - $cc");

        my $rej = 0;
        #Sometimes the click effect rolls back to a very high number
        if($click > 0 && $click < 50000)
        {
            if($charges < 255 && $charges != $cc) { $rej = "CHARGES"; }
        }
        #Nodrop, attuneable will flag as no drop -- norent and nodrop appear to be backwards
        if(!$norent || !$nodrop || $notransfer) { $rej = "NODROP"; }
        #Attuneable but not attuned
        if($attune && $ca != 1) { $rej = 0; }
        if($attune && $ca == 1) { $rej = "NODROP"; }

        if($rej eq "CHARGES")
        {
            $client->Message(315, "You can not sell an item that is missing charges.");
            #quest::summonitem($ci, $cc);
            $client->SummonItem($ci, $cc, $ca);
            next;
        }
        if($rej eq "NODROP")
        {
            $client->Message(315, "You can not sell an item that can not be traded.");
            #quest::summonitem($ci, $cc);
            $client->SummonItem($ci, $cc, $ca);
            next;
        }
        #Add the item to vendor inventory.
        plugin::AddAuctionItem($ci, $fname, $client->AccountName());
        $client->Message(315, "Received Item: $vl");
    }
    #Add the coin to vendor balance
    plugin::AddAuctionCoin($totalcoin, $fname, $client->AccountName());
    $client->Message(315, "Received $totalcoin in coin.");
}

return 1;
