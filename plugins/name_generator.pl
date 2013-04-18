#!/usr/bin/perl -w
# Totro.pl: generate random (fantasy) names.
# Copyright (C) 2002-2006 David A. Wheeler and Chris X. Edwards.
# This is Totro.pl, Version 1.20, 2006-04-19.
# 
# USAGE:
#  totro.pl [number [minsyl [maxsyl]]]
# Where "number" is the number of random names to generate (default:50),
# "minsyl" is the minimum number of syllables in a name (default: 2), and
# "maxsyl" is the maximum number of syllables (default: 6).
# Thus, on a Linux/Unix system,:
#    $ ./totro.pl
# is equivalent to:
#    $ ./totro.pl 50 2 6
#
# Note: Since this is a Perl program, you'll need to have Perl installed.
# You'll also need to have this program set to be executable, or pass it
# directly to Perl like this:
#    $ perl totro.pl
#
# The original program was written by David A. Wheeler in Javascript,
# and is available via http://www.dwheeler.com/totro.html
# Totro.pl is a port of Totro to Perl by Chris X Edwards xed.ch.
# This version presumes interactive command line use by the user, and has
# not been checked to see if it could be exploited if indirectly invoked
# by an untrusted user.  Do not invoke this program for untrusted users
# unless you've carefully filtered all input to it, set up the
# environment safely, and so on.
# 
# As a direct port, Totro.pl is also released under the GPL:
#
# Totro.pl is Copyright (C) 2002-2005 David A. Wheeler and Chris X. Edwards,
# and comes with ABSOLUTELY NO WARRANTY.
# Totro.pl is licensed under the
# GNU General Public License (GPL), version 2 or later.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
# History:
# * Version 1.02, 2005-01-11: Initial Perl version.
# * Version 1.20, 2006-04-19: Added vowel position and permit
#   at-middle controllable, by David A. Wheeler.  In parallel with
#   Javascript version.


# Default values...
my $NUMBER= 50; my $MINSYL= 2; my $MAXSYL= 6;

# List of possible vowels, followed by list of possible consonants.
# In both lists, duplicates increase the likelihood of that selection.
# The second parameter indicates if the syllable can occur
# at the beginning, middle, or ending of a name, and is the sum of
# the following:
#  1=can be at ending,
#  2=can be at beginning
#  4=can be in middle
# Thus, the value 7 means "can be anywhere", 6 means "beginning or middle".
# This is a binary encoding, as (middle) (beginning) (end).
# Occasionally, 'Y' will be duplicated as a vowel and a consonant.
# That's so rare that we won't worry about it, in fact it's interesting.
# There MUST be a possible vowel and possible consonant for any
# possible position; if you want to have "no vowel at the end", use
# ['',1] and make sure no other vowel includes "can be at end".

# Occasionally, 'Y' will be duplicated as a vowel and a consonant.
# That's so rare that we won't worry about it, in fact it's interesting.

# Note - an older version used the binary encoding xy,
# where x is the beginning, y is the ending, and 0=no, 1=yes (middle always ok)

#2013-01-31 - Adapted as a plugin for eqemu.
#TODO: Add library support so we can roll ogre names, elf names, etc.

my @vowels = (
 ["a", 7],  ["e", 7],  ["i", 7],  ["o", 7],  ["u", 7],
 ["a", 7],  ["e", 7],  ["i", 7],  ["o", 7],  ["u", 7],
 ["a", 7],  ["e", 7],  ["i", 7],  ["o", 7],  ["u", 7],
 ["a", 7],  ["e", 7],  ["i", 7],  ["o", 7],  ["u", 7],
 ["a", 7],  ["e", 7],  ["i", 7],  ["o", 7],  ["u", 7],
 ["a", 7],  ["e", 7],  ["i", 7],  ["o", 7],  ["u", 7],
 ["a", 7],  ["e", 7],  ["i", 7],  ["o", 7],  ["u", 7],
 ["a", 7],  ["e", 7],  ["i", 7],  ["o", 7],  ["u", 7],
 ["a", 7],  ["e", 7],  ["i", 7],  ["o", 7],  ["u", 7],
 ["a", 7],  ["e", 7],  ["i", 7],  ["o", 7],  ["u", 7],
 ["a", 7],  ["e", 7],  ["i", 7],  ["o", 7],  ["u", 7],
 ["a", 7],  ["e", 7],  ["i", 7],  ["o", 7],  ["u", 7],
 ["ae", 7], ["ai", 7], ["ao", 7], ["au", 7], ["aa", 7], 
 ["ea", 7], ["eo", 7], ["eu", 7], ["ee", 7], ["eau", 7],
 ["ia", 7], ["io", 7], ["iu", 7], ["ii", 7],
 ["oa", 7], ["oe", 7], ["oi", 7], ["ou", 7], ["oo", 7],
 ["'", 4],
 ["y", 7],
 ["ay", 7], ["ay", 7], ["ei", 7], ["ei", 7], ["ei", 7],
 ["ua", 7], ["ua", 7],
);

# List of possible consonants.

my @consonants= (
["b", 7],  ["c", 7],  ["d", 7],  ["f", 7],  ["g", 7],  ["h", 7], 
["j", 7],  ["k", 7],  ["l", 7],  ["m", 7],  ["n", 7],  ["p", 7], 
["qu", 6],  ["r", 7], ["s", 7],  ["t", 7],  ["v", 7],  ["w", 7],
["x", 7],  ["y", 7],  ["z", 7], 
# Blends, sorted by second character:
["sc", 7],
["ch", 7],  ["gh", 7],  ["ph", 7], ["sh", 7],  ["th", 7], ["wh", 6],
["ck", 5],  ["nk", 5],  ["rk", 5], ["sk", 7],  ["wk", 0],
["cl", 6],  ["fl", 6],  ["gl", 6], ["kl", 6],  ["ll", 6], ["pl", 6], ["sl", 6],
["br", 6],  ["cr", 6],  ["dr", 6],  ["fr", 6],  ["gr", 6],  ["kr", 6], 
["pr", 6],  ["sr", 6],  ["tr", 6],
["ss", 5],
["st", 7],  ["str", 6],
# Repeat some entries to make them more common.
["b", 7],  ["c", 7],  ["d", 7],  ["f", 7],  ["g", 7],  ["h", 7], 
["j", 7],  ["k", 7],  ["l", 7],  ["m", 7],  ["n", 7],  ["p", 7], 
["r", 7], ["s", 7],  ["t", 7],  ["v", 7],  ["w", 7],
["b", 7],  ["c", 7],  ["d", 7],  ["f", 7],  ["g", 7],  ["h", 7], 
["j", 7],  ["k", 7],  ["l", 7],  ["m", 7],  ["n", 7],  ["p", 7], 
["r", 7], ["s", 7],  ["t", 7],  ["v", 7],  ["w", 7],
["br", 6],  ["dr", 6],  ["fr", 6],  ["gr", 6],  ["kr", 6],
# ["x", 7], ["x", 7], ["x", 7], ["x", 7], ["x", 7], ["xx", 7], ["xx",5],
);

# Return a random value between minvalue and maxvalue, inclusive,
# with equal probability.
sub rolldie {
    my ($minvalue, $maxvalue)= @_;
    my $diff= $maxvalue-$minvalue;
    if ($diff < 0) {return;} # force correct relative sizes
    return int(rand($diff)+.5) + $minvalue;
} # end sub rolldie

# Create a random name.  It must have at least between minsyl and maxsyl
# number of syllables (inclusive).
sub GetRandomName {
    my ($minsyl, $maxsyl)= @_;
    my $genname = "";         # this accumulates the generated name.
    my $leng = plugin::rolldie($minsyl, $maxsyl); # Compute number of syllables in the name
    my $isvowel = plugin::rolldie(0, 1); # randomly start with vowel or consonant
    for my $i (1 .. $leng) { # syllable #. Start is 1 (not 0)
        my $data;
        # Pick a potential syllable until we find a good one.
        # The "extra" FINDSYLLABLE block is necessary to counter a Perl
        # bug - the "last" command doesn't work correctly in "do" blocks.
        FINDSYLLABLE: {
        do {
            if ($isvowel) {
                $data= @vowels[plugin::rolldie(0, $#vowels)];
            } else {
                $data= @consonants[plugin::rolldie(0, $#consonants)];
            }
            # Check if this syllable can occur in this part of the name.
            if ( $i == 1) { # first syllable.
                if ($$data[1] & 2) {last;}
            } elsif ($i == $leng) { # last syllable.
                if ($$data[1] & 1) {last;}
            } else { # Middle syllable
                if ($$data[1] & 4) {last;}
            }
            # If got here, it wasn't an okay pick. Try again.
        } while (1);
        }
        $genname .= $$data[0];  # Found good one, add to name.
        $isvowel= 1 - $isvowel; # Alternate between vowels and consonants.
    } # Have a complete name.
    $genname = ucfirst $genname; # Initial caps
    return $genname;
}

return 1;
