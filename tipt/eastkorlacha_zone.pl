sub EVENT_SPAWN
{
    quest::set_proximity($x - 120, $x + 120, $y - 120, $y + 120, $z -60, $z + 60);
}

sub EVENT_ENTER
{
    quest::movepc(363, 107.7, -19.5, 25, 57);
}
