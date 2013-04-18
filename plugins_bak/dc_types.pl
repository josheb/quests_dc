%dc_racenums = (
    'Orc'               => [54, 458],
    'Sarnak'            => [131],
    'Human'             => [1, 2, 44, 55, 67, 71, 90, 341],
    'Lizard Man'        => [51],
    'Barbarian'         => [2, 90],
    'Netherbian'        => [229],
    'Erudite'           => [3, 78, 342],
    'Pixie'             => [56],
    'Wood Elf'          => [4, 112],
    'Froglok'           => [26, 330],
    'High Elf'          => [5, 106],
    'Griffin'           => [47],
    'Dark Elf'          => [6, 77, 339],
    'Half Elf'          => [7],
    'Kobold'            => [48, 455],
    'Dwarf'             => [8, 94, 183],
    'Troll'             => [9, 92, 331, 337],
    'Minotaur'          => [53],
    'Ogre'              => [10, 93, 340],
    'Halfling'          => [11, 81],
    'Imp'               => [46],
    'Gnome'             => [12, 338],
    'Iksar'             => [128, 139],
    'Centaur'           => [16],
    'Vah Shir'          => [130, 238, 239],
    'Evil Eye'          => [21, 469],
    'Werewolf'          => [14, 454],
    'Dracnid'           => [57],
    'Spectre'           => [85],
    'Giant'             => [18, 140, 188, 189],
    'Unicorn'           => [124],
    'Wyvern'            => [157],
    'Raptor'            => [163, 200],
    'Dragon'            => [165, 184, 195, 198, 49],
    'Thought Horror'    => [214],
    'Akhevan'           => [230],
    'Blood Raven'       => [279],
    'Wurm'              => [158],
    'Shissar'           => [217],
    'Nightmare Wraith'  => [264],
);

@dc_racekeys = (
    'Orc',
    'Sarnak',
    'Human',
    'Lizard Man',
    'Barbarian',
    'Netherbian',
    'Erudite',
    'Pixie',
    'Wood Elf',
    'Froglok',
    'High Elf',
    'Griffin',
    'Dark Elf',
    'Half Elf',
    'Kobold',
    'Dwarf',
    'Troll',
    'Minotaur',
    'Ogre',
    'Halfling',
    'Imp',
    'Gnome',
    'Iksar',
    'Centaur',
    'Vah Shir',
    'Evil Eye',
    'Werewolf',
    'Dracnid',
    'Spectre',
    'Giant',
    'Unicorn',
    'Wyvern',
    'Raptor',
    'Dragon',
    'Thought Horror',
    'Akhevan',
    'Blood Raven',
    'Wurm',
    'Shissar',
    'Nightmare Wraith'
);

sub getRaceNums
{
    my $rk = shift;
    return($dc_racenums[$rk]);
}

sub getRaceKey
{
    my $lv = shift;
    return($dc_racekeys[$lv]);
}

sub isValid53
{
    my $lk = shift;
    my $tp = shift;

    foreach $rv ( @{$dc_racenums{$lk}} )
    {
        if($rv == $tp) { return(1); }
    }

    return(0);
}

return 1;
