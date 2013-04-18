sub WebLinks
{
    my $client = plugin::val('client');
    $client->SendWebLink("http://dungeoncrawl.us.to");
}

sub OpenURL
{
    my $url = shift;
    my $client = plugin::val('client');

    $client->SendWebLink($url);
}

return 1;
