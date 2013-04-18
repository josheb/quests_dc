sub EVENT_COMBAT
{
    if($combat_state == 1)
    {
        quest::shout("Fear not, $name.  I will end you quickly and your essence will live on in the power of this sacred ground.");
    }
}

sub EVENT_DEATH
{
    quest::spawn2(289061, 0, 0, -1869.9, -1617.3, 107, 126);
}
