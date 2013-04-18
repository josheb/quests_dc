%ac_dragon_kills = (
    10           =>  {
                    "type"      =>  "DRAGONKILLS",
                    "title"     =>  "10 Dragon Kills",
                    "message"   =>  "You have slain 10 dragons!  Next milestone is at 100.",
                    "spells"    =>  [2598],
                    "items"     =>  [],
                    "titleset"  =>  0,
                    "exp"       =>  1000
                    },

    100           =>  {
                    "type"      =>  "DRAGONKILLS",
                    "title"     =>  "100 Dragon Kills",
                    "message"   =>  "You have slain 100 dragons!  Next milestone is at 1000",
                    "spells"    =>  [6880],
                    "items"     =>  [],
                    "titleset"  =>  0,
                    "exp"       =>  5000
                    },

    1000           =>  {
                    "type"      =>  "DRAGONKILLS",
                    "title"     =>  "1000 Dragon Kills",
                    "message"   =>  "You have slain 1000 dragons!  Next milestone is at 10000",
                    "spells"    =>  [],
                    "items"     =>  [],
                    "titleset"  =>  10,
                    "exp"       =>  10000
                    },

    10000           =>  {
                    "type"      =>  "DRAGONKILLS",
                    "title"     =>  "10000 Dragon Kills",
                    "message"   =>  "You have slain 10,000 dragons!  Your infamy with dragons is widely known.",
                    "spells"    =>  [],
                    "items"     =>  [133455],
                    "titleset"  =>  0,
                    "exp"       =>  50000
                    }
);

sub ac_dragon_kills
{
    my $tk = shift;
    my $client = plugin::val('client');
    my $qglobals = plugin::var('qglobals');

    my $tac = 0;
    my @aclist = ();

    foreach $k (keys(%ac_dragon_kills))
    {
        if($tk >= $k)
        {
            my $gv = "DRAGONKILLS_".$k."_DONE";
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
