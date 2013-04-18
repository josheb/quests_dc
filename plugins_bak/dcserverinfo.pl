sub StartPopup
{
        my $wtxt = "<c \"#00FF00\">Welcome to Dungeon Crawl - Classic Hybrid!</c><br><br>
<c \"#FF0000\">Getting Started:</c><br>
&nbsp; &nbsp; &nbsp; <c \"#FF0000\">IF YOU DON'T READ ANYTHING ELSE<br>
&nbsp; &nbsp; &nbsp; READ THIS: Type !help in chat for essential<br>
&nbsp; &nbsp; &nbsp; commands.<br>
&nbsp; &nbsp; &nbsp;<br>
&nbsp; &nbsp; &nbsp; <c \"#FFFFF\">Consider what tradeskills would<br>
&nbsp; &nbsp; &nbsp; useful for your class and start<br>
&nbsp; &nbsp; &nbsp; gathering materials for new gear.<br>
&nbsp; &nbsp; &nbsp; You should also hail the soulbinder for<br>
&nbsp; &nbsp; &nbsp; your area to set your first waypoint.<br>
<c \"#FF0000\">Server Information:</c><br>
&nbsp; &nbsp; &nbsp; <c \"#FFFFF\">Forums, DB browser, <br>
&nbsp; &nbsp; &nbsp; and character browser can be found at:</c><br>
&nbsp; &nbsp; &nbsp; <c \"#FFFFF\"><a href=\"http://dungeoncrawl.us.to\">http://dungeoncrawl.us.to</a></c><br>
<br>
<c \"#FF0000\">Server Features:</c><br>
&nbsp; &nbsp; &nbsp; <c \"#FFFFF\"> - Classic gameplay up to Luclin with some twists.</c><br>
&nbsp; &nbsp; &nbsp; <c \"#FFFFF\"> - Every stat is meaningful and influences your<br>
&nbsp; &nbsp; &nbsp; melee abilities, spells, and other<br>
&nbsp; &nbsp; &nbsp; character attributes.<br>
&nbsp; &nbsp; &nbsp; - Enhanced Boss/Named mob drops<br>
&nbsp; &nbsp; &nbsp; We have tagged over 2400 boss and named NPC's<br>
&nbsp; &nbsp; &nbsp; that have a slight chance to drop additional<br>
&nbsp; &nbsp; &nbsp;  equipment.<br>
&nbsp; &nbsp; &nbsp; These can be identified by boss tags that resemble<br>
&nbsp; &nbsp; &nbsp; [++========]<br>
&nbsp; &nbsp; &nbsp; The plus symbols indicate the boss difficulty on<br>
&nbsp; &nbsp; &nbsp; a scale from 1 to 10.<br>
&nbsp; &nbsp; &nbsp; Additional drops have been tuned to be reasonably<br>
&nbsp; &nbsp; &nbsp; rare and at a quality level that doesn't<br>
&nbsp; &nbsp; &nbsp; trivialize existing drops.<br>
&nbsp; &nbsp; &nbsp; - Global Rare Drops<br>
&nbsp; &nbsp; &nbsp; All regular NPC's have a 1% chance to drop<br>
&nbsp; &nbsp; &nbsp; addition items at a reduced quality level.<br>
&nbsp; &nbsp; &nbsp; - Waypoint Travel<br>
&nbsp; &nbsp; &nbsp; Soulbinders have a limited set of teleports.<br>
&nbsp; &nbsp; &nbsp; Hailing a soulbinder will establish a waypoint<br>
&nbsp; &nbsp; &nbsp; that you can travel to from any other soulbinder.<br>
<c \"#FF0000\">Server Rules:</c><br>
<c \"#FFFFF\">
 - Play nice, don't be a jerk, etc.  The etiquette for games like this should be known well enough by now that you have no excuse for not minding your manners.
<br>
 - Avoid profanity and sexual innuendo in public channels (ooc, shout, etc).
<br>
 - Report bugs, don't exploit them.
<br>
 - If you think an item is overpowered or broken, report it using /bug or by posting on the forum.  We only remove items under the most extreme of circumstances.
<br>
</c>
<br>
<c \"#00FF00\">We hope you enjoy your time playing here.  Feedback and suggestions are always welcome so please let us know how we can improve.</c><br>
";

        quest::popup("Welcome to Dungeon Crawl - Classic Hybrid", $wtxt);
}

sub LevelInfo
{
    my $forcelv = shift;
    my $client = plugin::val('client');
    my $showlvs = 0;

    if($forcelv < 1) { $forcelv = $client->GetLevel(); }
    else { $showlvs = 1; }

    if($forcelv == 2)
    {
        my $l_scribe = quest::saylink("%!!scribespells", 1, "!scribespells");
        my $l_help = quest::saylink("%!!help", 1, "!help");
        $client->Message(13, "----------------------------------------");
        $client->Message(315, "Have you visited a soulbinder yet?  Soulbinders can teleport you to a small set of standard locations.");
        $client->Message(315, "Hailing a soulbinder also establishes a waypoint, allowing you teleport between soulbinders you have discovered.");
        $client->Message(315, "You may also be ready to scribe new spells.  Type $l_scribe to do this at any time.");
        $client->Message(315, "Type $l_help for a complete list of chat commands.");
        $client->Message(13, "----------------------------------------");
        return;
    }

    if($forcelv == 3)
    {
        $client->Message(13, "----------------------------------------");
        $client->Message(315, "Congratulations on level 3!  There are over 2000 boss and named mobs that are flagged for bonus loot.");
        $client->Message(315, "It won't drop every time at lower levels but it is much more likely than bonus drops on unremarkable NPC's.");
        $client->Message(13, "----------------------------------------");
        return;
    }

    if($forcelv == 4)
    {
        $client->Message(13, "----------------------------------------");
        $client->Message(315, "You're making steady progress.  You can visit the website for news, updates, and hotzone information.");
        $client->Message(315, "There are also links to the forums and database browser.  If you are curious about an item, quest, or NPC, head to the DB browser and look it up.");
        $client->Message(315, "http://dungeoncrawl.us.to");
        $client->Message(13, "----------------------------------------");
        return;
    }

    if($forcelv == 5)
    {
        $client->Message(13, "----------------------------------------");
        $client->Message(315, "You're moving up in the world!  Many tradeskill items have been improved and are a good way to get some gear at these lower levels.");
        $client->Message(13, "----------------------------------------");
        return;
    }

    if($forcelv == 8)
    {
        $client->Message(13, "----------------------------------------");
        $client->Message(315, "Have you been to an Auctioneer yet?  They can be found in Nedaria and East Commons tunnel.");
        $client->Message(315, "With a linked forum account you can access the Auction House through the website to buy and sell items.");
        $client->Message(13, "----------------------------------------");        
        return;
    }

    if($forcelv == 12)
    {
        $client->Message(13, "----------------------------------------");
        $client->Message(315, "You're making good progress.  When you get the chance, you should visit Tarsh Lightbringer in North Karana at the gypsy camp.");
        $client->Message(13, "----------------------------------------");
        return;
    }

    if($forcelv == 16)
    {
        $client->Message(13, "----------------------------------------");
        $client->Message(315, "If you haven't traveled to Nedaria's Landing yet, you might consider making the trip soon.");
        $client->Message(315, "The region has a soulbinder and houses a tradeskill hub.  In addition to that, it's a great place to level.");
        $client->Message(315, "You can get there by taking the teleport gem in Surefall Glade to Jaggedpine, then heading southwest through the gnoll cave.");
        $client->Message(13, "----------------------------------------");
        return;
    }

    if($forcelv == 20)
    {
        $client->Message(13, "----------------------------------------");
        $client->Message(315, "Don't be afraid to politely ask for buffs.  Many high level characters are happy to help out someone who's dilligently leveling.");
        $client->Message(13, "----------------------------------------");
        return;
    }

    if($forcelv == 50)
    {
        $client->Message(13, "----------------------------------------");
        $client->Message(315, "Excellent work, you are now a force to be reckoned with!");
        $client->Message(315, "Levels beyond 50 are done by quest.  You can find out what you need for 51 by visiting Tiraela Silvermane in the East Commons tunnel.");
        $client->Message(13, "----------------------------------------");
        return;
    }

    if($forcelv == 51)
    {
        $client->Message(13, "----------------------------------------");
        $client->Message(315, "Congratulations!  You now have access to AA's.  Don't forget to set your experience contribution on your character window.");
        $client->Message(13, "----------------------------------------");
        return;
    }

    if($forcelv == 52)
    {
        $client->Message(13, "----------------------------------------");
        $client->Message(315, "More AA's are available to you now.  You might consider looking at the Planar Power line to get greater stat contributions above the regular stat cap.");
        $client->Message(13, "----------------------------------------");
        return;
    }

    if($forcelv == 70)
    {
        $client->Message(13, "----------------------------------------");
        $client->Message(315, "You shouldn't be this high level!");
        $client->Message(13, "----------------------------------------");
        return;
    }        

    if($showlvs == 1)
    {
        my $l_two = quest::saylink("%!#levelinfo 2", 1, "Level 2");
        my $l_three = quest::saylink("%!#levelinfo 3", 1, "Level 3");
        my $l_four = quest::saylink("%!#levelinfo 4", 1, "Level 4");
        my $l_five = quest::saylink("%!#levelinfo 5", 1, "Level 5");
        my $l_eight = quest::saylink("%!#levelinfo 8", 1, "Level 8");
        my $l_twelve = quest::saylink("%!#levelinfo 12", 1, "Level 12");
        my $l_sixteen = quest::saylink("%!#levelinfo 16", 1, "Level 16");
        my $l_twenty = quest::saylink("%!#levelinfo 20", 1, "Level 20");
        my $l_fifty = quest::saylink("%!#levelinfo 50", 1, "Level 50");
        my $l_fifty1 = quest::saylink("%!#levelinfo 51", 1, "Level 51");
        my $l_fifty2 = quest::saylink("%!#levelinfo 52", 1, "Level 52");
        $client->Message(13, "----------------------------------------");
        $client->Message(315, "Level messages exist for these levels:");
        $client->Message(315, "$l_two");
        $client->Message(315, "$l_three");
        $client->Message(315, "$l_four");
        $client->Message(315, "$l_five");
        $client->Message(315, "$l_eight");
        $client->Message(315, "$l_twelve");
        $client->Message(315, "$l_sixteen");
        $client->Message(315, "$l_twenty");
        $client->Message(315, "$l_fifty");
        $client->Message(315, "$l_fifty1");
        $client->Message(315, "$l_fifty2");
        $client->Message(13, "----------------------------------------");
    }
}

sub RandomTip
{
 my $client = plugin::val('client');

 my $l_help = quest::saylink("%!!help", 1, "!help");
 my $l_scribe = quest::saylink("%!!scribespells", 1, "!scribespells");
 my $l_train = quest::saylink("%!!traindiscs", 1, "!traindiscs");
 my $l_bank = quest::saylink("%!!banker", 1, "!banker");
 my $l_merch = quest::saylink("%!!merchant", 1, "!merchant");
 my $l_serverinfo = quest::saylink("%!!serverinfo", 1, "!serverinfo");
 my $l_levelinfo = quest::saylink("%!!levelinfo", 1, "!levelinfo");

 my @tips = (
    "Some people just want to watch the world burn.",
    "Does this quest script make me look fat?",
    "Be thoughtful when choosing a character name, surname, or custom pet name.  This is a family-friendly server and profanity or racial slurs in names or public chat will not be tolerated.",
    "Visit our website at http://dungeoncrawl.us.to",
    "Why is the rum gone?  WHY IS THE RUM GONE!?",
    "Fear is the mind killer.",
    "Your stats are meaningful here.  They can influence melee damage, haste, spell damage, pet strength, and other factors.",
    "Do not feed the orcs.",
    "Gnomes are delicious.",
    "Feel free to use our forums to find information, post suggestions, bug reports, or just say hello.  http://dungeoncrawl.us.to",
    "Be kind and respectful when speaking in public chat or interacting with other players.",
    "Oh hi. So, how are you holding up?  Because I'M A POTATO!",
    "When was the last time you set a bixie on fire?",
    "This was a triumph. I'm making a note here, huge success.",
    "Meddle not in the affairs of the dragon; for you are crunchy and taste good with ketchup.",
    "Bards can use /melody to twist songs and get improved song effects through charisma and int stats.",
    "Melee damage is greatly improved by your strength and dexterity.",
    "Archery, throwing, and backstab damage is greatly improved by your dexterity.",
    "Raising your class' casting stat will improve your spell effects and raising dexterity will reduce cast times.",
    "Your agility affects natural haste.",
    "Quest text and NPC conversation is very important.  Please take time to read it carefully.",
    "Looking for a group?  You can group with anyone [ (CurrentLevel / 2) + 1 + CurrentLevel ] and still gain experience.",
    "The server database browser can be found at http://dungeoncrawl.us.to/eq/ak",
    "The character and bazaar browser can be found at http://dungeoncrawul.us.to/eq/cb",
    "The AC of your shield or boots factors into the damage your bashes and kicks do.",
    "Most named NPC's have a chance to drop additional items.",
    "Soulbinders can transport to various places around the world.  Hailing a Soulbinder will establish a waypoint that lets you travel between Soulbinders that you have discovered.",
    "You can read additional information about the server by typing $l_serverinfo", 
    "Miss a level message?  You can see any level message with $l_levelinfo [level]",
    "Several chat commands are available to players.  Type $l_help for a complete list.",
    "You can scribe spells up to your level by typing $l_scribe in chat.",
    "You can train disciplines up to your level by typing $l_train in chat.",
    "If you are a member of the Adventurer's Guild you can type $l_bank or $l_merch to summon a temporary NPC."
    );

    my $tip = quest::ChooseRandom(@tips);
    $client->Message(13, "----------------------------------------");
    $client->Message(259, "$tip");
    $client->Message(13, "----------------------------------------");
}

return 1;
