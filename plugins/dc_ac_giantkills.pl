%ac_giant_kills = (
    10           =>  {
                    "type"      =>  "GIANTKILLS",
                    "title"     =>  "10 Giant Kills",
                    "message"   =>  "You have slain 10 giants!  Next milestone is at 100.",
                    "spells"    =>  [2598],
                    "items"     =>  [],
                    "titleset"  =>  0,
                    "exp"       =>  1000
                    },

    100           =>  {
                    "type"      =>  "GIANTKILLS",
                    "title"     =>  "100 Giant Kills",
                    "message"   =>  "You have slain 100 giants!  Next milestone is at 1000",
                    "spells"    =>  [6880],
                    "items"     =>  [],
                    "titleset"  =>  0,
                    "exp"       =>  5000
                    },

    1000           =>  {
                    "type"      =>  "GIANTKILLS",
                    "title"     =>  "1000 Giant Kills",
                    "message"   =>  "You have slain 1000 giants!  Next milestone is at 10000",
                    "spells"    =>  [],
                    "items"     =>  [],
                    "titleset"  =>  9,
                    "exp"       =>  10000
                    },

    10000           =>  {
                    "type"      =>  "GIANTKILLS",
                    "title"     =>  "10000 Giant Kills",
                    "message"   =>  "You have slain 10,000 giants!  Your infamy with giants is widely known.",
                    "spells"    =>  [],
                    "items"     =>  [133456],
                    "titleset"  =>  0,
                    "exp"       =>  50000
                    }
);

sub ac_giant_kills
{
    my $tk = shift;
    my $client = plugin::val('client');
    my $qglobals = plugin::var('qglobals');

    my $tac = 0;
    my @aclist = ();

    foreach $k (keys(%ac_giant_kills))
    {
        if($tk >= $k)
        {
            my $gv = "GIANTKILLS_".$k."_DONE";
            if( !defined $qglobals->{$gv} )
            {
                push(@aclist, $k);
            }
        }
    }
    $tac = @aclist;
    return($tac);
}


return 1;
