sub EVENT_SPAWN
{
    quest::shout("What have you done?  You'll kill us all!");
    quest::setnexthpevent(50);
}

sub EVENT_HP
{
    quest::shout("You fool!  I may not be able to stop you, but you will soon realize that you must stop him!");
    quest::depop();
}
