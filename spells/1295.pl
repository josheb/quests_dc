sub EVENT_SPELL_EFFECT_CLIENT
{
    $caster = $entity_list->GetClientByID($caster_id);

    if($caster->GetLevel() == 51)
    {
#        $caster->Message(315, "52 Spell");
        my $zid = $caster->GetZoneID();
        my $px = $caster->GetX();
        my $py = $caster->GetY();
        my $pz = $caster->GetZ();

#        $caster->Message(315, "Zone - $zid, $px, $py, $pz");

        # Greater Faydark - Orc tents outside crushbone
        my $tx = -126;
        my $ty = 1890;
        my $tz = -1;
        my $tzid = 54;
        if($zid == $tzid && $tx + 300 > $px && $tx - 300 < $px && $ty + 300 > $py && $ty - 300 < $py && $tz + 100 > $pz && $tz - 100 < $pz)
        {
            #$caster->Message(315, "Location is good");
            $caster->SetGlobal("Q52_GFAY", 1, 5, "F");
            my $qtext = "The bard was fleeing. Good riddance, I never trusted him anyway.  I met blow after blow with shield and blade but the centurion pressed on. ";
            $qtext .= "The beast was strong but foolish.  My moment arrived as he recoiled from a block that had to have sent vibrations down his arm.  ";
            $qtext .= "I thrust at his exposed belly, pressing his sword arm back with my shield.  The cut was deep and he was off balance so I stepped into his guard, intent on finishing the job.";
            $qtext .= "<br>Suddenly my hand could no longer close upon the hilt of my longsword.  I stared, transfixed, willing my fingers to grasp it again.  ";
            $qtext .= "The ground came rushing at me and we met in bitter embrace.  She was on the ground as well holding her shield with both hands.";
            $qtext .= "<br>There were dozens of them, slashing and bashing with their crude weapons.  Her shield was a ruin, splintering away with each strike until the blows finally began to meet flesh.";
            $qtext .= "I tried to cry out by my mouth was full of blood.  I'm sorry...";
            quest::popup("Spell Success!", $qtext);
            $caster->Message(315, "The Focus of Trancendence glows at it absorbs the essence from the area.");
            return;
        }

        # Ocean of Tears - The Dock
        my $tx = -9196;
        my $ty = 273;
        my $tz = 2;
        my $tzid = 69;
        if($zid == $tzid && $tx + 40 > $px && $tx - 40 < $px && $ty + 40 > $py && $ty - 40 < $py && $tz + 20 > $pz && $tz - 20 < $pz)
        {
            #$caster->Message(315, "Location is good");
            $caster->SetGlobal("Q52_OOT", 1, 5, "F");
            my $qtext = "The cool breeze off the water is invigorating.  This boat must be the slowest hulk around, but at least it's a comfortable wait.";
            $qtext .= "I wish the butch lady in the robes would quit eyeballing me.  Those 'enlightened' types never understand real art.  ";
            $qtext .= "She probably wouldn't know what end of my lute to play, not that she would even try.  Of course, even a tone-deaf mage could mash out the trash people are listening to these days.  ";
            $qtext .= "That mainstream garbage that seems to have everyone else's ear makes my stomach turn.  They're all a bunch of sellouts, like that warrior, cleric pair I ditched in the Faydark.  ";
            $qtext .= "It's not my fault that orcs don't have an ear for my music.  They just don't get me and that's their loss.";
            $qtext .= "<br>Is that screaming?  Maybe they're partying on the boat...no I see them, running on thin air across the top of the water.  Why are they waving their hands?  ";
            $qtext .= "*gasp*  He's beautiful!  I've only seen cyclops in paintings, and that horn, what a splendid sound!";
            $qtext .= "<br>I'm one of the lucky few who's ever heard him play, this trip was a good idea indeed.  ";
            $qtext .= "'Look here, I'm over here!'  What key is he in, G?  Maybe he'll let me join in!";
            $qtext .= "<br>'Here!  Over here!' *crunch*";
            quest::popup("Spell Success!", $qtext);
            $caster->Message(315, "The Focus of Trancendence glows at it absorbs the essence from the area.");
            return;
        }

        # South Ro - The Spires
        my $tx = 125;
        my $ty = -1043;
        my $tz = 8;
        my $tzid = 35;
        if($zid == $tzid && $tx + 160 > $px && $tx - 160 < $px && $ty + 160 > $py && $ty - 160 < $py && $tz + 50 > $pz && $tz - 50 < $pz)
        {
            #$caster->Message(315, "Location is good");
            $caster->SetGlobal("Q52_SRO", 1, 5, "F");
            my $qtext = "The wretched thing had been shrieking the whole time.  We cleared the last dune and I turned briefly to conjure another fireball.  ";
            $qtext .= "The other two were panting, trying to catch their breath as that eight-legged monstrosity lumbered toward us at an unnatural clip.  ";
            $qtext .= "One of its legs was flopping around, squirting some ghastly ichor and the rest of it was a charred mass of deadly horror. ";
            $qtext .= "We made our stand at the spires, lashing out with fire and arrow, but the monster drew closer.  I began to wonder if it would ever die.  ";
            $qtext .= "My head was pounding and my hands were trembling.  I was spent but I mustered one final blast, drawing on everything within me that I might die by fire rather than fangs.  ";
            $qtext .= "With a flash of light I fell too the ground but the shrieking had stopped.  With bloodshot eyes I looked up at it.  One glistening black eye fixed right upon me, ";
            $qtext .= "but behind it there was no more life.  I could hear those two idiots whooping and hollering and for that moment I wished I had the strength to join them.  ";
            $qtext .= "Instead I drew myself up to one knee and let my vision focus again.  They were kicking at the singed legs and taunting it, grinning like that fool bard who thought he might ";
            $qtext .= "give Quag a hug back at the docks.  We scarcely survived that one as well, and though I hate to admit it, that moronic maestro had provided the distraction that likely saved ";
            $qtext .= "our lives.";
            $qtext .= "<br>*crack*";
            $qtext .= "<br>At first I thought my ears were deceiving me, but then I heard it again.  It was the sound of chitin breaking, shifting.  I rose to my feet on unsteady legs and gestured at ";
            $qtext .= "the others to be silent.  It came again and I could see that they heard it as well.  I drew my dagger, knowing my channelling abilities were well and truly exhausted.  ";
            $qtext .= "Could the filthy creature live?  I prepared for it to rise up, thinking I might dash beneath it and pierce it where it was weakest.  ";
            $qtext .= "<br>I was not prepared for the horror that followed.  The thorax split all at once and a flood of vengeful children burst forth.  They were the size of a man and fast as a ";
            $qtext .= "puma.  They went for the healthiest of us first and the sight of their passing made my final decision an easy one.  ";
            $qtext .= "<br>From that old familiar place I found my fire and gathered it about me.  I could feel my flesh slipping into oblivion as I drew more and more power, but as they swarmed over me ";
            $qtext .= "I did what my teacher warned me about on my first day at the academy.  We became one with the Source and sang a song of flames until all was still and dark.";
            quest::popup("Spell Success!", $qtext);
            $caster->Message(315, "The Focus of Trancendence glows at it absorbs the essence from the area.");
            return;
        }

        # Akheva - The Statue
        my $tx = 20;
        my $ty = 250;
        my $tz = 32;
        my $tzid = 179;
        if($zid == $tzid && $tx + 70 > $px && $tx - 70 < $px && $ty + 70 > $py && $ty - 70 < $py && $tz + 30 > $pz && $tz - 30 < $pz)
        {
            #$caster->Message(315, "Location is good");
            $caster->SetGlobal("Q52_AKHEVA", 1, 5, "F");
            my $qtext = "With whip and barb she speaks<br>";
            $qtext .= "Lash our backs and feed the darkness<br>";
            $qtext .= "Strength rises as we hear the song<br>";
            $qtext .= "Hammer crushes the bones of the unworthy<br>";
            $qtext .= "Blade rends the flesh of the feeble<br>";
            $qtext .= "<br>Who sacred santuary breaks?<br>";
            $qtext .= "This world will perish in shadow!<br>";
            $qtext .= "Who beats the shield in anger?<br>";
            $qtext .= "This world will perish in shadow!<br>";
            $qtext .= "What mortal cry disturbs the silence?<br>";
            $qtext .= "This world will perish in shadow!<br>";

            quest::popup("Spell Success!", $qtext);
            $caster->Message(315, "The Focus of Trancendence glows at it absorbs the essence from the area.");
            return;
        }

        # Burning Wood - The Meteor
        my $tx = -1115;
        my $ty = -855;
        my $tz = -602;
        my $tzid = 87;
        if($zid == $tzid && $tx + 100 > $px && $tx - 100 < $px && $ty + 100 > $py && $ty - 100 < $py && $tz + 60 > $pz && $tz - 60 < $pz)
        {
            #$caster->Message(315, "Location is good");
            $caster->SetGlobal("Q52_BURNINGWOOD", 1, 5, "F");
            my $qtext = "My spear sunk deep beneath this tough grey hide.  The broad head severed tendon and muscle, causing the beast to fall in mid run.";
            $qtext .= "It thrashed violently with its good leg, its eyes glaring at me full of hate and desperation.  ";
            $qtext .= "His foamy maw gnashed at me as I approached, but the creature's fate was already sealed.  A quick slash of my Shan'Tok opened his throat ";
            $qtext .= "but he continued to flail for several moments as his blood slowly pooled and soaked into the ground.  He was fully grown, looking for ";
            $qtext .= "a mate no doubt.  Father would be proud and the meat would last for many days.  Mother could sew us all new vests from the hide and ";
            $qtext .= "the teeth and claws could be fashioned into tools and weapons.  It was a good hunt and a good kill.  With a heart full of gladness I began ";
            $qtext .= "to make the cuts just as father showed me, flaying back the skin and removing the not-meat.  ";
            $qtext .= "<br>It was early afternoon but the sky began to darken.  I looked up and saw the eery red glow, like the moon on fire, but it was in the wrong place.  ";
            $qtext .= "I hastened my efforts, glancing wearily at the dancing shadows that this strange new moon had birthed.  ";
            $qtext .= "The world began to lighten again and I looked up to see half the sky aflame.  I could feel the heat on my face and turned to run but I couldn't take my eyes off of it.  ";
            $qtext .= "It was so bright, and the roar was deafening...";

            quest::popup("Spell Success!", $qtext);
            $caster->Message(315, "The Focus of Trancendence glows at it absorbs the essence from the area.");
            return;
        }

        # Timorous Deep - The Oasis
        my $tx = -2198;
        my $ty = -11600;
        my $tz = 73;
        my $tzid = 96;
        if($zid == $tzid && $tx + 40 > $px && $tx - 40 < $px && $ty + 40 > $py && $ty - 40 < $py && $tz + 10 > $pz && $tz - 10 < $pz)
        {
            #$caster->Message(315, "Location is good");
            $caster->SetGlobal("Q52_TIMOROUS", 1, 5, "F");
            my $qtext = "The sky was bright blue and the sun was shining, but it would rain tonight.  After 342 years I had learned to read those aches and pains.  ";
            $qtext .= "I put the quill back into the inkpot and rubbed my eyes.  The innkeeper was drunk again, but his old stories and booming voice were comforting.  ";
            $qtext .= "This new researcher was curious about everything and Surtik could teach him his first lesson in fact checking.  Some of those tales had a grain of truth ";
            $qtext .= "but I had fought in more than half the battles he spoke of, and while our merry innkeeper was kindly and noble in his own way, he knew nothing of war.  ";
            $qtext .= "I smiled to myself as I gathered my parchments and filed them away.  I had spent the better part of the day copying old worn parchments onto fresh vellum, ";
            $qtext .= "now if only I could do the same for these weathered hands of mine.  The skin had grown weak and thin, nearly transparent.  These old legs were growing more frail as well.  ";
            $qtext .= "Forgetting where I left my writing chair while fumbling toward my chamber pot in the dark could be quite perilous.  ";
            $qtext .= "I refused to dwell on my infirmities, however, it simply would not do to fret over things I could do nothing about.  ";
            $qtext .= "<br>I topped off my cup with wine and slipped into bed with Koadic's Thesis on Ley Channels.  The fire was roaring healthily and for once I wasn't shivering from the ";
            $qtext .= "evening chill.  I stifled a yawn and settled in for a pleasant evening read.";

            quest::popup("Spell Success!", $qtext);
            $caster->Message(315, "The Focus of Trancendence glows at it absorbs the essence from the area.");
            return;
        }

        $caster->Message(315, "You do not find the correct energies here.");
    }
}
