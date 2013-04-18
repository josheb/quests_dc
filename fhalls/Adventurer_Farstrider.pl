sub EVENT_SAY
{
    if($client->GetLevel() < 50)
    {
        plugin::ClientSay("I'm sorry, $name.  You're not yet ready to experience the things I can show you.");
        return;
    }

    if($text=~/hail/i)
    {
        my $l_bot = quest::saylink("bothunder", 1, "Bastion of Thunder");
        my $l_cod = quest::saylink("codecay", 1, "Crypt of Decay");
        my $l_air = quest::saylink("poair", 1, "The Plane of Air");
        my $l_dis = quest::saylink("podisease", 1, "The Plane of Disease");
        my $l_inn = quest::saylink("poinnovation", 1, "The Plane of Innovation");
        my $l_jus = quest::saylink("pojustice", 1, "The Plane of Justice");
        my $l_val = quest::saylink("povalor", 1, "The Plane of Valor");
        my $l_wat = quest::saylink("powater", 1, "The Plane of Water");
        my $l_tac = quest::saylink("potactics", 1, "The Plane of Tactics");
        my $l_nightmare = quest::saylink("nightmare", 1, "Plane of Nightmare");
        my $l_torment = quest::saylink("torment", 1, "Plane of Torment");
        my $l_solro = quest::saylink("solrotower", 1, "Tower of Solusek Ro");

        plugin::ClientSay("Hello $name.  I can guide you to some very dangerous places if you're up for the challenge.");
        $client->Message(315, "Where would you like to go?");
        $client->Message(315, "* - $l_torment");
        $client->Message(315, "* - $l_nightmare");
        $client->Message(315, "* - $l_solro");
        $client->Message(315, "* - $l_bot");
        $client->Message(315, "* - $l_cod");
    }

    if($text=~/bothunder/i)
    {
        quest::zone("bothunder");
    }

    if($text=~/codecay/i)
    {
        quest::zone("codecay");
    }

    if($text=~/torment/i)
    {
        quest::zone("potorment");
    }

    if($text=~/nightmare/i)
    {
        quest::zone("ponightmare");
    }

    if($text=~/solrotower/i)
    {
        quest::zone("solrotower");
    }

    if($text=~/sctest/i)
    {
        $client->Message(315, "Score test");
        my $score = plugin::GetScore($npc);
        $client->Message(315, "Score: $score");
    }
}
