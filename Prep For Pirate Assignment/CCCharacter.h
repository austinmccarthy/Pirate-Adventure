//
//  CCCharacter.h
//  Prep For Pirate Assignment
//
//  Created by Austin McCarthy on 3/29/14.
//  Copyright (c) 2014 Austin McCarthy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCArmor.h"
#import "CCWeapon.h"

@interface CCCharacter : NSObject

@property (strong, nonatomic) CCArmor *armor;
@property (strong, nonatomic) CCWeapon *weapon;
@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
