#Ardent Proc Spell
#These should all be buffs.

@sp_1 = ();

sub EVENT_SPELL_EFFECT_NPC
{
   my $cl = $entity_list->GetClientByID($caster_id);
   if($cl)
   {

   }
}

sub EVENT_SPELL_EFFECT_CLIENT
{
   my $cl = $entity_list->GetClientByID($caster_id);
   if($cl)
   {

   }
}
