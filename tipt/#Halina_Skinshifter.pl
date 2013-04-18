sub EVENT_SPAWN
{
    quest::shout("I live on in the flesh of my brothers!  Turn back now and you may be spared.");
}

sub EVENT_DEATH
{
    quest::spawn2(289062, 0, 0, 1165.6, 2234, 703, 192);
}
