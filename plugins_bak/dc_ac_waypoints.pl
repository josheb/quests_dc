%ac_waypoints = (
    5           =>  {
                    "type"      =>  "wptotal",
                    "title"     =>  "5 Waypoints",
                    "message"   =>  "You have discovered 5 waypoints!  Next milestone is at 10.",
                    "spells"    =>  [],
                    "items"     =>  [65120],
                    "titleset"  =>  0,
                    "exp"       =>  1000
                    },

    10           =>  {
                    "type"      =>  "wptotal",
                    "title"     =>  "10 Waypoints",
                    "message"   =>  "You have discovered 10 waypoints!  Next milestone is at 25.",
                    "spells"    =>  [],
                    "items"     =>  [133457],
                    "titleset"  =>  0,
                    "exp"       =>  5000
                    },

    25           =>  {
                    "type"      =>  "wptotal",
                    "title"     =>  "25 Waypoints",
                    "message"   =>  "You have discovered 25 waypoints!  Next milestone is at 30.",
                    "spells"    =>  [],
                    "items"     =>  [133454],
                    "titleset"  =>  0,
                    "exp"       =>  10000
                    },

    30           =>  {
                    "type"      =>  "wptotal",
                    "title"     =>  "30 Waypoints",
                    "message"   =>  "You have discovered 30 waypoints!  You are a master traveler.",
                    "spells"    =>  [],
                    "items"     =>  [133454],
                    "titleset"  =>  11,
                    "exp"       =>  50000
                    }
);

sub ac_waypoints
{
    my $tk = shift;
    my $client = plugin::val('client');
    my $qglobals = plugin::var('qglobals');

    my $tac = 0;
    my @aclist = ();

    foreach $k (keys(%ac_waypoints))
    {
        if($tk >= $k)
        {
            my $gv = "wptotal_".$k."_DONE";
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
