sub EVENT_SPAWN
{
    quest::set_proximity($x - 20, $x + 20, $y - 60, $y + 60, $z -10, $z + 10);
}

sub EVENT_ENTER
{
    quest::movepc(289, 1700.5, 2190, 730, 190);
}
