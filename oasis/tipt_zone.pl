sub EVENT_SPAWN
{
    quest::set_proximity($x - 40, $x + 40, $y - 40, $y + 40, $z -10, $z + 10);
}

sub EVENT_ENTER
{
    quest::movepc(289, -583, -2321, 15.5, 194);
}
