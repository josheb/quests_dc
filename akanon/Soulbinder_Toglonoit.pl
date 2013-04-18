#generic soulbinder quest
sub EVENT_SAY { 
  my $taskid = plugin::GetSBTask();
  $client->Message(315, "Task: $taskid");
  $client->AssignTask(223, 0);
  plugin::soulbinder_say($text);
}

sub EVENT_ITEM {
  quest::say("I do not want this.");
  plugin::return_items(\%itemcount);
}
