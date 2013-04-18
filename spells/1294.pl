sub EVENT_SPELL_EFFECT_CLIENT
{
    $caster = $entity_list->GetClientByID($caster_id);

    if($caster->GetLevel() == 51)
    {
        #Flat XP formula -- Fix their XP so they don't delevel
        #mod = 4;
        #float base = (check_levelm1)*(check_levelm1)*(check_levelm1);
        #mod *= 1000;
        #return(uint32(base * mod));

        #Location Globals
        #Q52_GFAY - Orc tents
        #Q52_OOT - Dock
        #Q52_SRO - Spires
        #Q52_BURNINGWOOD - Meteor
        #Q52_AKHEVA - Statue
        #Q52_TIMOROUS - Oasis

        if(!$qglobals{"Q52_GFAY"})
        {
            my $qtext = "The Focus shimmers for a moment and your mind fills with swirling images.<br><br>";
            $qtext .= "Suddenly you're standing in the midst of some orc tents near Crushbone, in Greater Faydark.";
            $qtext .= "The signs of battle are all around you in the form of discarded weapons and various corpses.  ";
            $qtext .= "You hear the battle but do not see it.  New bodies sometimes appear upon the ground, joining the ranks of the fallen.";
            $qtext .= "<br><br>The vision collapses all at once in a cloud of mist.";
            quest::popup("Next Destination", $qtext);
            return;
        }

        if(!$qglobals{"Q52_OOT"})
        {
            my $qtext = "The Focus shimmers for a moment and your mind fills with swirling images.<br><br>";
            $qtext .= "You find yourself standing on the dock in the Ocean of Tears.<br>";
            $qtext .= "Suddenly the body of gaudily-dressed wood elf appears out of nowhere and flies into a tree.  ";
            $qtext .= "You hear a sickening crunch sound as his limp body wraps around the trunk.  ";
            $qtext .= "Soon afterward you are surprised to see a large cyclops fall to the ground.";
            $qtext .= "<br><br>The vision collapses all at once in a cloud of mist.";
            quest::popup("Next Destination", $qtext);
            return;
        }

        if(!$qglobals{"Q52_SRO"})
        {
            my $qtext = "The Focus shimmers for a moment and your mind fills with swirling images.<br><br>";
            $qtext .= "You stand in the Southern Desert of Ro, next to the Wizard Spires.  ";
            $qtext .= "The largest tarantula you have ever seen erupts from the void in front of you and crashes to a halt mere inches from where you stand.  ";
            $qtext .= "An inexplicable sense of dread fills you as the vision begins to ripple before your eyes.  ";
            $qtext .= "<br><br>You lose concentration and are wrenched violently back to reality.";
            quest::popup("Next Destination", $qtext);
            return;
        }

        if(!$qglobals{"Q52_BURNINGWOOD"})
        {
            my $qtext = "The Focus shimmers for a moment and your mind fills with swirling images.<br><br>";
            $qtext .= "Trees stand all around you, lush and green.  This place could once have been the Burning Wood.  ";
            $qtext .= "The serenity of the forest is wracked with screams and fire without warning.  Charred corpses fly through the air ";
            $qtext .= "and the sky burns red.  The ground beneath you gives way and you tumble into the void below.  ";
            $qtext .= "<br><br>The vision collapses all at once in a cloud of mist.";
            quest::popup("Next Destination", $qtext);
            return;
        }

        if(!$qglobals{"Q52_AKHEVA"})
        {
            my $qtext = "The Focus shimmers for a moment and your mind fills with swirling images.<br><br>";
            $qtext .= "This place could only be Akheva.  Throngs of centi are lined up in rank and file, bowing down before you.  ";
            $qtext .= "You turn around and are met with a grotesque towering statue with glowing eyes and many arms.  ";
            $qtext .= "The halls echo with screams, nearly drowned out by the chanting.  The darkness of the sanctuary is palpable.";
            $qtext .= "<br><br>The vision collapses all at once in a cloud of mist.";
            quest::popup("Next Destination", $qtext);
            return;
        }

        if(!$qglobals{"Q52_TIMOROUS"})
        {
            my $qtext = "The Focus shimmers for a moment and your mind fills with swirling images.<br><br>";
            $qtext .= "You find yourself outside a small inn ringed by tropical plantlife and water.  A bridge descends onto the land in front of a watery cave.";
            $qtext .= "The oasis is neatly situated inside what appears to be an ancient volcanic crater.  The sky is clear and the air smells sweet. ";
            $qtext .= "You wonder what kind of horror will disturb this peaceful place, but as you explore you find no surprises, just the pleasant setting and empty beds.  ";
            $qtext .= "The passage of time is only discernable by the setting sun and you begin to wonder if you will ever return, even as part of you wants to stay forever.  ";
            $qtext .= "As night falls, the bed across from you becomes burdened with the body of an old man with a kind face and peaceful expression.";
            $qtext .= "<br><br>The vision collapses all at once in a cloud of mist.";
            quest::popup("Next Destination", $qtext);
            return;
        }

        my $expl = 51 * 51 * 51 * 4000;
        my $curxp = $caster->GetEXP();
        my $curaa = $caster->GetAAExp();

        if($curxp < $expl)
        {
            $caster->SetEXP($expl, $curaa);
        }

        $caster->SetLevel(52);
        $caster->Message(315, "Your mind is flooded with ancient knowlege.");
        $caster->Message(315, "The body you wear suddenly feels peculiar and foreign.");
    }
}
