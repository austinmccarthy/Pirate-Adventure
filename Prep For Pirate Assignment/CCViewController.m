//
//  CCViewController.m
//  Prep For Pirate Assignment
//
//  Created by Austin McCarthy on 3/23/14.
//  Copyright (c) 2014 Austin McCarthy. All rights reserved.
//

#import "CCViewController.h"
#import "CCFactory.h"
#import "CCTile.h"


@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CCFactory *factory = [[CCFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.boss = [factory boss];
    
    self.currentPoint = CGPointMake(0, 0);
    
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// This method makes the status bar text white
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)updateTile
{
    CCTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];

    if (tileModel.boss == 1){
        if(tileModel.tileUsed == NO){
            self.actionButton.enabled = YES;
            self.actionButton.alpha = 1;
        } else{
            self.actionButton.enabled = NO;
            self.actionButton.alpha = .25;
        }
    }
    else if (tileModel.boss == 0){
        self.actionButton.enabled = YES;
        self.actionButton.alpha = 1;
    }
    
    [UIView transitionWithView:self.view duration:.75 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        
        CCTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
        
        self.storyHeadlineLabel.text = tileModel.headline;
        self.storyDetailsLabel.text = tileModel.story;
        self.backgroundImageView.image = tileModel.backgroundImage;
        self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
        self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
        self.armorLabel.text = self.character.armor.name;
        self.weaponLabel.text = self.character.weapon.name;
        [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
        
        if (self.character.health <= 0){
            self.healthLabel.text = @"0";
        }
        
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)actionButtonPressed:(UIButton *)sender
{
    CCTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthEffect];
    [self.actionButton setTitle:@"Use Compass" forState:UIControlStateDisabled];

    if (tile.boss != 0 && tile.tileUsed == NO){
        self.actionButton.enabled = NO;
        self.actionButton.alpha = .25;
        tile.tileUsed = YES;
    }
    
    if(tile.boss == 0){
        self.boss.health = self.boss.health - self.character.damage;
    }
    
    if(self.character.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Game Over" message:@"You have died, would you like to restart the game?" delegate: nil cancelButtonTitle:@"Play Again" otherButtonTitles: nil];
        [alertView show];
        self.character = nil;
        self.boss = nil;
        [self viewDidLoad];
    }
    
    if(self.boss.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Game Over" message:@"You have defeated One Eyed Jack and captured his treasure! ARRRGH!" delegate:nil cancelButtonTitle:@"Play Again" otherButtonTitles: nil];
        [alertView show];
        self.character = nil;
        self.boss = nil;
        [self viewDidLoad];
    }
    
    [self updateTile];
}

- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Reset Game?" message:@"Would you like to reset the game? All progress will be lost." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Reset", nil];
    
    [alertView show];

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1){
        self.character = nil;
        self.boss = nil;
        [self viewDidLoad];
    }
}

-(void)updateButtons
{
    [self updateEastButton];
    [self updateNorthButton];
    [self updateWestButton];
    [self updateSouthButton];
}

-(void)enableCompassButton:(UIButton *)compassButton
{
    compassButton.enabled = YES;
    compassButton.alpha = 1;
}

-(void)disableCompassButton:(UIButton *)compassButton
{
    compassButton.enabled = NO;
    compassButton.alpha = .25;
    
}

-(BOOL)canGoWest
{
    return self.currentPoint.x > 0;
}

- (void)updateWestButton
{
    if(self.canGoWest){
        [self enableCompassButton:self.westButton];
    }else{
        [self disableCompassButton:self.westButton];
    }
}

-(BOOL)canGoSouth
{
    return self.currentPoint.y > 0;
}

-(void)updateSouthButton
{
    if(self.canGoSouth){
        [self enableCompassButton:self.southButton];
    }else{
        [self disableCompassButton:self.southButton];
    }
}

-(BOOL)canGoEast
{
    return self.currentPoint.x < 3;
}

-(void)updateEastButton
{
    if (self.canGoEast){
        [self enableCompassButton:self.eastButton];
    }else{
        [self disableCompassButton:self.eastButton];
    }
}

-(BOOL)canGoNorth
{
    return self.currentPoint.y < 2;
}

-(void)updateNorthButton
{
    if (self.canGoNorth){
        [self enableCompassButton:self.northButton];
    }else{
        [self disableCompassButton:self.northButton];
    }
}

-(void)updateCharacterStatsForArmor:(CCArmor *)armor withWeapons:(CCWeapon *)weapon withHealthEffect:(int)healthEffect
{
    if (armor != nil){
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
        NSLog(@"updateArmor!");
    }
    else if (weapon != nil){
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
        NSLog(@"updateWeapon!");

    }
    else if (healthEffect != 0){
        self.character.health = self.character.health + healthEffect;
    }else{
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
}

@end
