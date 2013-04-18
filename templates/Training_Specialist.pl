sub EVENT_SAY
{
 my $l_med = quest::saylink("med", 1, "Fundamental Studies");
 my $l_spells = quest::saylink("spells", 1, "Scribe Spells");
 my $l_train = quest::saylink("train", 1, "Train Disciplines");
 my $l_bard = quest::saylink("bard", 1, "Study Music");

 if($text =~/hail/i)
 {
  plugin::Whisper("Hello $name, what kind of training are you interested in today?");
  $client->Message(315, "* - $l_med");
  $client->Message(315, "* - $l_spells");
  $client->Message(315, "* - $l_train");
  $client->Message(315, "* - $l_bard");
  return;
 }
 if($text =~/med/i)
 {
  quest::addskill(31,255);
  quest::addskill(50,255);
  quest::addskill(9,255);

  quest::addskill(6,255);
  quest::addskill(7,255);
  quest::addskill(8,255);
  quest::addskill(16,255);
  quest::addskill(17,255);
  quest::addskill(25,255);
  quest::addskill(27,255);
  quest::addskill(32,255);
  quest::addskill(35,255);
  quest::addskill(339,255);
  quest::addskill(51,255);
  quest::addskill(74,255);
  return;
 }
 if($text =~/bard/i)
 {
  quest::addskill(12,255);
  quest::addskill(41,255);
  quest::addskill(49,255);
  quest::addskill(54,255);
  quest::addskill(70,255);
  return;
 }
 if($text =~/spells/i)
 {
  my $sl;
  if($ulevel < 70) { $sl = $ulevel; }
  else { $sl = 69; }
  quest::scribespells($ulevel);
  return;
 }
 if($text =~/train/i)
 {
  quest::traindiscs($ulevel);
  return;
 }
}
