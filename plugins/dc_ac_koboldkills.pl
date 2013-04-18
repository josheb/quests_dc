%ac_kobold_kills = (
    10           =>  {
                    "type"      =>  "KOBOLDKILLS",
                    "title"     =>  "10 Kobold Kills",
                    "message"   =>  "You have slain 10 kobolds!  Next milestone is at 100.",
                    "spells"    =>  [2598],
                    "items"     =>  [],
                    "titleset"  =>  0,
                    "exp"       =>  1000
                    },

    100           =>  {
                    "type"      =>  "KOBOLDKILLS",
                    "title"     =>  "100 Kobold Kills",
                    "message"   =>  "You have slain 100 kobolds!  Next milestone is at 1000",
                    "spells"    =>  [6880],
                    "items"     =>  [],
                    "titleset"  =>  0,
                    "exp"       =>  5000
                    },

    1000           =>  {
                    "type"      =>  "KOBOLDKILLS",
                    "title"     =>  "1000 Kobold Kills",
                    "message"   =>  "You have slain 1000 kobolds!  Next milestone is at 10000",
                    "spells"    =>  [],
                    "items"     =>  [],
                    "titleset"  =>  8,
                    "exp"       =>  10000
                    },

    10000           =>  {
                    "type"      =>  "KOBOLDKILLS",
                    "title"     =>  "10000 Kobold Kills",
                    "message"   =>  "You have slain 10,000 kobolds!  Your infamy with kobolds is widely known.",
                    "spells"    =>  [],
                    "items"     =>  [40684],
                    "titleset"  =>  0,
                    "exp"       =>  50000
                    }
);

sub ac_kobold_kills
{
    my $tk = shift;
    my $client = plugin::val('client');
    my $qglobals = plugin::var('qglobals');

    my $tac = 0;
    my @aclist = ();

    foreach $k (keys(%ac_kobold_kills))
    {
        if($tk >= $k)
        {
            my $gv = "KOBOLDKILLS_".$k."_DONE";
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
