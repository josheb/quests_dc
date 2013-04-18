sub EVENT_LEVEL_UP
{
    plugin::LevelInfo(0);

    #Adventurer's guild quest
    my $isa = $qglobals{"ADVKILL"};
    if($client->GetLevel() > 10 && $isa != 1)
    {
        if(!$client->IsTaskCompleted(267))
        {
            $client->AssignTask(267, 0);
        }
    }
}

sub EVENT_DUEL_WIN
{
#    quest::shout2("Duel!  $losername, $loserid");
#    $client->Message(315, "-- $losername, $loserid");
}

sub EVENT_TS_SUCCESS
{
    $client->Message(315, "Success! - $tradeskill_id, $clientskill");
}

sub EVENT_TS_FAILURE
{
    $client->Message(315, "Failure! - $tradeskill_id, $clientskill");
}

sub EVENT_ENTERZONE
{
 if(defined $qglobals{"start53"} && $client->GetLevel() == 52)
 {
  quest::settimer(53, 30);
 }

 if($qglobals{"54pariah"} == 1)
 {
  quest::settimer(54, 10);
 }

 quest::settimer("announce", 600);

 #NPC Death
 if(defined $qglobals{"IZDED"})
 {
  $client->DelGlobal("IZDED");
  if($client->GetName() eq "Flowers")
  {
   $client->Message(315, "You just died!");
  }
 }

 #Environmental Death
 if(defined $qglobals{"IZDED_ENV"})
 {
  $client->DelGlobal("IZDED_ENV");
  if($client->GetName() eq "Flowers")
  {
   $client->Message(315, "You just died an environmental death!");
  }
 }

 #Duel Death
 if(defined $qglobals{"IZDED_PLAYER"})
 {
  #if($client->GetName() ne "Flowers") { return; }
  $client->Message(315, "You lost a duel!");
  $client->DelGlobal("IZDED_PLAYER");
 }

    #Soulbinder tasks
    my $taskid = plugin::GetSBTask();

    if($taskid > 0)
    {
        if(!$client->IsTaskCompleted($taskid))
        {
            $client->AssignTask($taskid, 0);
        }
    }


    plugin::RandomTip();

    if(!defined $qglobals{'newstart'})
    {
        plugin::StartPopup();
        plugin::WebLinks();
        quest::setglobal("newstart", 1, 5, "F");
    }
}

sub EVENT_COMBINE_SUCCESS {
  if (($recipe_id == 10904) || ($recipe_id == 10905) || ($recipe_id == 10906) || ($recipe_id == 10907)) {
    $client->Message(1, "The gem resonates with power as the shards placed within glow unlocking some of the stone's power. You were successful in assembling most of the stone but there are four slots left to fill, where could those four pieces be?");
  }
  if ($recipe_id == 10903) {
    if (($class eq "Bard") || ($class eq "Beastlord") || ($class eq "Paladin") || ($class eq "Ranger") ||  ($class eq "Shadowknight")) {
      quest::summonitem(67666);
      quest::summonitem(67704);
    }
    elsif (($class eq "Warrior") || ($class eq "Monk") || ($class eq "Berserker")  || ($class eq "Rogue"))  {
      quest::summonitem(67665);
      quest::summonitem(67704);
    }
    elsif (($class eq "Cleric") || ($class eq "Shaman") || ($class eq "Druid")) {
      quest::summonitem(67667);  
      quest::summonitem(67704);
    }
    elsif (($class eq "Necromancer") || ($class eq "Wizard") || ($class eq "Enchanter")  || ($class eq "Magician")) {
      quest::summonitem(67668);
      quest::summonitem(67704);
    }
    $client->Message(1,"Success");
  }
  if ($recipe_id == 10346) {
    if (($class eq "Bard") || ($class eq "Beastlord") || ($class eq "Paladin") || ($class eq "Ranger") ||  ($class eq "Shadowknight")) {
      quest::summonitem(67661);
      quest::summonitem(67704);
    }
    elsif (($class eq "Warrior") || ($class eq "Monk") || ($class eq "Berserker")  || ($class eq "Rogue"))  {
      quest::summonitem(67660);
      quest::summonitem(67704);
    }
    elsif (($class eq "Cleric") || ($class eq "Shaman") || ($class eq "Druid")) {
      quest::summonitem(67662);  
      quest::summonitem(67704);
    }
    elsif (($class eq "Necromancer") || ($class eq "Wizard") || ($class eq "Enchanter")  || ($class eq "Magician")) {
      quest::summonitem(67663);
      quest::summonitem(67704);
    }
    $client->Message(1,"Success");
  }
  if ($recipe_id == 10334) {
    if (($class eq "Bard") || ($class eq "Beastlord") || ($class eq "Paladin") || ($class eq "Ranger") ||  ($class eq "Shadowknight")) {
      quest::summonitem(67654);
      quest::summonitem(67704);
    }
    elsif (($class eq "Warrior") || ($class eq "Monk") || ($class eq "Berserker")  || ($class eq "Rogue"))  {
      quest::summonitem(67653);
      quest::summonitem(67704);
    }
    elsif (($class eq "Cleric") || ($class eq "Shaman") || ($class eq "Druid")) {
      quest::summonitem(67655);  
      quest::summonitem(67704);
    }
    elsif (($class eq "Necromancer") || ($class eq "Wizard") || ($class eq "Enchanter")  || ($class eq "Magician")) {
      quest::summonitem(67656);
      quest::summonitem(67704);
    }
    $client->Message(1,"Success");
  }
}

sub EVENT_TIMER
{
    if($timer == 53)
    {
        my $glv = $qglobals{'g53level'};
        my $qid = $client->GetItemIDAt(12);
        my $ctick = $qglobals{'g53tick'};
        if($qid != 132482 && ($glv > 1 || $ctick > 30))
        {
            my $rstxt = "Without a body to channel through I lose all power.<br>You want to be powerful don't you?<br>Keep me on your hands and we'll become unstoppable!";
            quest::popup("Gauntlets of the Accursed", $rstxt);
            $client->SetGlobal("g53level", 1, 5, "F");
            $client->SetGlobal("g53tick", 1, 5, "F");
        }
    }

    if($timer == 54)
    {
        #if we're higher than level 50, the quest is done.
        if($client->GetLevel() > 50)
        {
            quest::stoptimer(54);
            return;
        }

        if(rand(100) > 90) { $client->BuffFadeAll(); }

        if($client->GetGroup())
        {
            if(!defined $qglobals{'54gc'})
            {
                $tcount = 1;
            }
            else
            {
                $tcount = $qglobals{'54gc'};
            }

            if($tcount == 1)
            {
                $client->Message(15, "Your skin begins to burn and itch.");
                $client->Damage($client, 10, 0, 0);
                return;
            }

            if($tcount == 2)
            {
                $client->Message(15, "The Mark of the Pariah pulsates before your eyes.");
                $client->Damage($client, 30, 0, 0);
                return;
            }

            if($tcount == 3)
            {
                $client->Message(15, "You are consumed by an intense feeling of dread.");
                return;
            }

            if($tcount > 3 && $client->GetLevel() > 1)
            {
                my $curaa = $client->GetAAExp();
                $client->SetEXP(0, $curaa);
                $client->SetLevel(1);
            }

            $tcount++;
            $client->SetGlobal("54gc", $tcount, 5, "F");
            $client->BuffFadeAll();
            $client->Damage($client, 15, 0, 0);
        }
    }

    if($timer eq "announce")
    {
        plugin::doAnnounce();
    }
}
