%ac_orc_kills = (
    10           =>  {
                    "type"      =>  "ORCKILLS",
                    "title"     =>  "10 Orc Kills",
                    "message"   =>  "You have slain 10 orcs!  Next milestone is at 100.",
                    "spells"    =>  [2598],
                    "items"     =>  [],
                    "titleset"  =>  0,
                    "exp"       =>  1000
                    },

    100           =>  {
                    "type"      =>  "ORCKILLS",
                    "title"     =>  "100 Orc Kills",
                    "message"   =>  "You have slain 100 orcs!  Next milestone is at 1000",
                    "spells"    =>  [6880],
                    "items"     =>  [],
                    "titleset"  =>  0,
                    "exp"       =>  5000
                    },

    1000           =>  {
                    "type"      =>  "ORCKILLS",
                    "title"     =>  "1000 Orc Kills",
                    "message"   =>  "You have slain 1000 orcs!  Next milestone is at 10000",
                    "spells"    =>  [],
                    "items"     =>  [],
                    "titleset"  =>  7,
                    "exp"       =>  10000
                    },

    10000           =>  {
                    "type"      =>  "ORCKILLS",
                    "title"     =>  "10000 Orc Kills",
                    "message"   =>  "You have slain 10,000 orcs!  Your infamy with orcs is widely known.",
                    "spells"    =>  [],
                    "items"     =>  [133399],
                    "titleset"  =>  0,
                    "exp"       =>  50000
                    }
);

sub ac_orc_kills
{
    my $tk = shift;
    my $client = plugin::val('client');
    my $qglobals = plugin::var('qglobals');

    my $tac = 0;
    my @aclist = ();

    foreach $k (keys(%ac_orc_kills))
    {
        if($tk >= $k)
        {
            my $gv = "ORCKILLS_".$k."_DONE";
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
