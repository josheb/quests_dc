sub AccRewards
{
    my $client = plugin::val('$client');
    my $name = plugin::val('$name');
    my $qglobals = plugin::var('qglobals');
    my $accname = $client->AccountName();

}

return 1;
