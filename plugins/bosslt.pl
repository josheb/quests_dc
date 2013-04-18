use POSIX;

sub GetLootTable
{
my $lx = shift;
    
my @ltid;

$ltid[0] = 131223;
$ltid[1] = 131224;
$ltid[2] = 131225;
$ltid[3] = 131226;
$ltid[4] = 131227;
$ltid[5] = 131228;
$ltid[6] = 131229;
$ltid[7] = 131230;
$ltid[8] = 131231;
$ltid[9] = 131232;
$ltid[10] = 131233;
$ltid[11] = 131234;
$ltid[12] = 131235;
$ltid[13] = 131236;
$ltid[14] = 131237;
$ltid[15] = 131238;
$ltid[16] = 131239;
$ltid[17] = 131240;
$ltid[18] = 131241;
$ltid[19] = 131242;
$ltid[20] = 131243;
$ltid[21] = 131244;
$ltid[22] = 131245;
$ltid[23] = 131246;
$ltid[24] = 131247;
$ltid[25] = 131248;
$ltid[26] = 131249;
$ltid[27] = 131250;
$ltid[28] = 131251;
$ltid[29] = 131252;
$ltid[30] = 131253;
$ltid[31] = 131254;
$ltid[32] = 131255;
$ltid[33] = 131256;
$ltid[34] = 131257;
$ltid[35] = 131258;
$ltid[36] = 131259;
$ltid[37] = 131260;
$ltid[38] = 131261;
$ltid[39] = 131262;
$ltid[40] = 131263;
$ltid[41] = 131264;
$ltid[42] = 131265;
$ltid[43] = 131266;
$ltid[44] = 131267;
$ltid[45] = 131268;
$ltid[46] = 131269;
$ltid[47] = 131270;
$ltid[48] = 131271;
$ltid[49] = 131272;
$ltid[50] = 131273;
$ltid[51] = 131274;
$ltid[52] = 131275;
$ltid[53] = 131276;
$ltid[54] = 131277;
$ltid[55] = 131278;
$ltid[56] = 131279;
$ltid[57] = 131280;
$ltid[58] = 131281;
$ltid[59] = 131282;
$ltid[60] = 131283;
$ltid[61] = 131284;
$ltid[62] = 131285;
$ltid[63] = 131286;
$ltid[64] = 131287;
$ltid[65] = 131288;
$ltid[66] = 131289;
$ltid[67] = 131290;
$ltid[68] = 131291;
$ltid[69] = 131292;
$ltid[70] = 131293;
$ltid[71] = 131294;
$ltid[72] = 131295;
$ltid[73] = 131296;
$ltid[74] = 131297;
$ltid[75] = 131298;
$ltid[76] = 131299;
$ltid[77] = 131300;
$ltid[78] = 131301;
$ltid[79] = 131302;
$ltid[80] = 131303;
$ltid[81] = 131304;
$ltid[82] = 131305;
$ltid[83] = 131306;
$ltid[84] = 131307;
$ltid[85] = 131308;
$ltid[86] = 131309;
$ltid[87] = 131310;
$ltid[88] = 131311;
$ltid[89] = 131312;
$ltid[90] = 131313;
$ltid[91] = 131314;
$ltid[92] = 131315;
$ltid[93] = 131316;
$ltid[94] = 131317;
$ltid[95] = 131318;
$ltid[96] = 131319;
$ltid[97] = 131320;
$ltid[98] = 131321;
$ltid[99] = 131322;
$ltid[100] = 131323;

return($ltid[$lx]);
}

sub max ($$) { $_[$_[0] < $_[1]] }
sub min ($$) { $_[$_[0] > $_[1]] }

sub GetScore
{
    my $n = shift;

#    quest::shout("Scoring!");
#    my $alv = $n->GetLevel();
#    quest::shout("ALV: $alv");
    my $lv = plugin::min(70, $n->GetLevel());
#    quest::shout("CLV: $lv");
    my $basedmg = ($lv*2)*(1+($lv / 100)) - ($lv / 2);
    my $minx = 0;
    my $basehp = 0;
    my $hpcontrib = 0;
    my $dmgcontrib = 0;
    my $spccontrib = 0;
    my $hp = $n->GetMaxHP();
    my $mindmg = $n->GetMinDMG();
    my $maxdmg = $n->GetMaxDMG();
    my $final;

#    quest::shout("Initialized!");

    if($lv < 46)
    {
        $minx = ceil( (($lv - ($lv / 10)) - 1) );
        $basehp = ($lv * 10) + ($lv * $lv);
    }
    else
    {
        $minx = ceil( (($lv - ($lv / 10)) - 1) - (( abs(45 - $lv) ) / 2) );
        $basehp = ($lv * 10) + (($lv * $lv) * 4);
    }

#    quest::shout("Special Attacks!");
    if($hp > $basehp)
    {
        $hpcontrib = int( ($hp / $basehp) * 1.5 );
        if($hpcontrib > 5) { $hpcontrib = 5; }

        if($maxdmg > $basedmg)
        {
            $dmgcontrib = ceil( (($maxdmg / $basedmg) * 1.5) );
        }

        if($n->HasNPCSpecialAtk("E")) { $spccontrib++; }    #Enrage
        if($n->HasNPCSpecialAtk("F")) { $spccontrib++; }    #Flurry
        if($n->HasNPCSpecialAtk("R")) { $spccontrib++; }    #Rampage
        if($n->HasNPCSpecialAtk("r")) { $spccontrib++; }    #Area Rampage
        if($n->HasNPCSpecialAtk("S")) { $spccontrib++; }    #Summon
        if($n->HasNPCSpecialAtk("T")) { $spccontrib += 2; } #Triple
        if($n->HasNPCSpecialAtk("Q")) { $spccontrib += 3; } #Quad
        if($n->HasNPCSpecialAtk("U")) { $spccontrib += 5; } #Unslowable
        if($n->HasNPCSpecialAtk("L")) { $spccontrib++; }    #Innate Dual Wield
    }

#    quest::shout("Spells!");
    if($n->GetNPCSpellsID() > 12)
    {
        if($lv < 16) { $spccontrib++; }
        else { $spccontrib += floor($lv/15); }
    }

#    quest::shout("Final computations!");
    $final = $minx + $hpcontrib + $dmgcontrib + $spccontrib;
    $final = plugin::max(1, $final);
    $final = plugin::min(100, $final);
    return(int($final));
}

return 1;
