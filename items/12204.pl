sub EVENT_ITEM_TICK
{
    if( $qglobals{'s12204time'} == 1 )
    {
        return;
    }
    my $waittime = (int(rand(5)) + 1) * 30;
    $client->SetGlobal('s12204time', 1, 5, "S$waittime");

    #Basic baby things here
    my @actions = (
        "Baby Joseph Sayer begins sobbing softly.",
        "Baby Joseph Sayer has crapped his pants.",
        "Baby Joseph Sayer begins to shriek and cry.",
        "Baby Joseph Sayer longs for home."
    );

    my @chatter = (
        "What a great idea, let's stuff a baby into a sack full of sharp objects.",
        "You probably shouldn't tell Marton Sayer that you toted his kid around in a bag.",
        "You're a lousy babysitter and a horrible person.",
        "Why not just pull the kid out of the sack and slap him around a little?",
        "Why do you hate babies so much?"
    );

    $client->Message(315, quest::ChooseRandom(@actions) );

    #Who puts a baby in a sack?
    if($invslot > 250)
    {
        $client->Message(315, quest::ChooseRandom(@chatter) );
    }
}
