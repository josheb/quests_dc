sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 105, $x + 105, $y - 105, $y + 105);
}

sub EVENT_ENTER
{
    quest::movepc(31,-350,-396,16, 151);
}

