sub EVENT_ENTERZONE
{
    quest::repopzone();
    quest::setglobal('53evstart', 0, 5, "H5");
    quest::setglobal('g53level', 1, 5, "F");
}
