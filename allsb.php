<?php

$res = `grep -r -l soulbinder_say *`;

$lns = preg_split("/\n/", $res);

foreach($lns as $l)
{
    $l = rtrim($l);

    if(preg_match("/\.svn/", $l)) { continue; }

    if(preg_match("/\//", $l))
    {
        list($dir, $fl) = preg_split("/\//", $l);
        $fl = substr($fl, 0, -3);
        $fl = preg_replace("/_/", " ", $fl);
        print "\"$dir\" => \"$fl\",\n";
    }
}

?>
