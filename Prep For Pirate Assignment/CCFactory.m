//
//  CCFactory.m
//  Prep For Pirate Assignment
//
//  Created by Austin McCarthy on 3/25/14.
//  Copyright (c) 2014 Austin McCarthy. All rights reserved.
//

#import "CCFactory.h"
#import "CCTile.h"

@implementation CCFactory

-(NSArray *)tiles
{
    CCTile *tile1 = [[CCTile alloc] init];
    tile1.headline = @"Time to cast off!";
    tile1.story = @"Ah hoy, matey! We are off to search for the cursed treasure of One Eyed Jack. Are you brave enough to be our captain... or ye' be yella?";
    tile1.backgroundImage = [UIImage imageNamed:@"00.jpg" ];
    CCWeapon *knife = [[CCWeapon alloc] init];
    knife.name = @"Knife";
    knife.damage = 30;
    tile1.weapon = knife;
    tile1.actionButtonName = @"Take Knife";
    tile1.tileUsed = NO;
    tile1.boss = 1;

    
    CCTile *tile2 = [[CCTile alloc] init];
    tile2.headline = @"One lucky (sea) dog";
    tile2.story = @"You find a ghost ship floating adrift filled with armor and ice cold Zimas";
    tile2.backgroundImage = [UIImage imageNamed:@"001.jpg" ];
    CCArmor *armor1 = [[CCArmor alloc] init];
    armor1.name = @"Steel";
    armor1.health = 15;
    tile2.actionButtonName = @"Take Armor";
    tile2.tileUsed = NO;
    tile2.boss = 1;
    
    CCTile *tile3 = [[CCTile alloc] init];
    tile3.headline = @"A little slap and tickle";
    tile3.story = @"You take the crew to a secret pirate pleasure island for a little R & R.";
    tile3.backgroundImage = [UIImage imageNamed:@"002.jpg" ];
    tile3.healthEffect = 12;
    tile3.actionButtonName = @"Stop At The Dock";
    tile3.tileUsed = NO;
    tile3.boss = 1;
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    CCTile *tile4 = [[CCTile alloc] init];
    tile4.headline = @"Polly want a cracker?";
    tile4.story = @"You have found a parrot can be used in your armor slot! Parrots are a great defender and are fiercly loyal to their captain.";
    tile4.backgroundImage = [UIImage imageNamed:@"10.jpg" ];
    CCArmor *parrotArmor = [[CCArmor alloc] init];
    parrotArmor.health = 20;
    parrotArmor.name = @"Parrot";
    tile4.actionButtonName = @"Adopt Parrot";
    tile4.tileUsed = NO;
    tile4.boss = 1;
    
    CCTile *tile5 = [[CCTile alloc] init];
    tile5.headline = @"Yo dog, I heard you like guns?";
    tile5.story = @"You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.backgroundImage = [UIImage imageNamed:@"11.jpg" ];
    CCWeapon *pistolWeapon = [[CCWeapon alloc] init];
    pistolWeapon.name = @"Pistol";
    pistolWeapon.damage = 17;
    tile5.actionButtonName = @"Take Pistol";
    tile5.tileUsed = NO;
    tile5.boss = 1;
    
    CCTile *tile6 = [[CCTile alloc] init];
    tile6.headline = @"Moonwalk the plank";
    tile6.story = @"You have been captured by pirates and are ordered to walk the plank.";
    tile6.backgroundImage = [UIImage imageNamed:@"112.jpg" ];
    tile6.healthEffect = -22;
    tile6.actionButtonName = @"Make Yo Mama Joke";
    tile6.tileUsed = NO;
    tile6.boss = 1;

    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    CCTile *tile7 = [[CCTile alloc] init];
    tile7.headline = @"Antibully PSA in the making...";
    tile7.story = @"You sight a pirate battle off the coast.";
    tile7.backgroundImage = [UIImage imageNamed:@"20.jpg" ];
    tile7.healthEffect = 20;
    tile7.actionButtonName = @"Help Fellow Pirates";
    tile7.tileUsed = NO;
    tile7.boss = 1;
    
    CCTile *tile8 = [[CCTile alloc] init];
    tile8.headline = @"Nom nom nom";
    tile8.story = @"The legend of the deep, the mighty kraken appears.";
    tile8.backgroundImage = [UIImage imageNamed:@"21.jpg" ];
    tile8.healthEffect = -46;
    tile8.actionButtonName = @"Abandon Ship";
    tile8.tileUsed = NO;
    tile8.boss = 1;
    
    CCTile *tile9 = [[CCTile alloc] init];
    tile9.headline = @"Praise Jah, Pastafari";
    tile9.story = @"You stumble upon a hidden cave of pirate treasure, an old pack of gum, and fully working Nokia 3310";
    tile9.backgroundImage = [UIImage imageNamed:@"22.jpg" ];
    tile9.healthEffect = 20;
    tile9.actionButtonName = @"Take Treasure";
    tile9.tileUsed = NO;
    tile9.boss = 1;
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    CCTile *tile10 = [[CCTile alloc] init];
    tile10.headline = @"Suprise Motherf*cker!";
    tile10.story = @"A group of pirates attempts to board your ship.";
    tile10.backgroundImage = [UIImage imageNamed:@"030.jpg" ];
    tile10.healthEffect = -15;
    tile10.actionButtonName = @"Defend Ship";
    tile10.tileUsed = NO;
    tile10.boss = 1;
    
    CCTile *tile11 = [[CCTile alloc] init];
    tile11.headline = @"Team Zissou approved";
    tile11.story = @"In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed:@"31.jpg" ];
    tile11.healthEffect = -7;
    tile11.actionButtonName = @"Swim Deeper";
    tile11.tileUsed = NO;
    tile11.boss = 1;
    
    CCTile *tile12 = [[CCTile alloc] init];
    tile12.story = @"Your final faceoff with the fearsome pirate boss, One Eyed Jack. DUN DUN DUNNNNNN!";
    tile12.backgroundImage = [UIImage imageNamed:@"32.jpg" ];
    tile12.healthEffect = -15;
    tile12.actionButtonName = @"Fight!";
    tile12.boss = 0;
    
    NSMutableArray *fourthColumn = [[NSMutableArray alloc] init];
    [fourthColumn addObject:tile10];
    [fourthColumn addObject:tile11];
    [fourthColumn addObject:tile12];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return tiles;
}

-(CCCharacter *)character
{
    CCCharacter *character = [[CCCharacter alloc] init];
    character.health = 100;
    
    CCArmor *armor = [[CCArmor alloc] init];
    armor.name = @"Cloak";
    armor.health = 0;
    character.armor = armor;
    
    CCWeapon *weapon = [[CCWeapon alloc] init];
    weapon.name = @"Fists";
    weapon.damage = 10;
    character.weapon = weapon;
    
    return character;
}

-(CCBoss *)boss
{
    CCBoss *boss = [[CCBoss alloc] init];
    boss.health = 65;
    
    return boss;
}


@end
