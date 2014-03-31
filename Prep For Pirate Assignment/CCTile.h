//
//  CCTile.h
//  Prep For Pirate Assignment
//
//  Created by Austin McCarthy on 3/25/14.
//  Copyright (c) 2014 Austin McCarthy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCWeapon.h"
#import "CCArmor.h"

@interface CCTile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) NSString *headline;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) CCWeapon *weapon;
@property (strong, nonatomic) CCArmor *armor;
@property (nonatomic) int healthEffect;
@property (nonatomic) int boss;

@property (nonatomic) BOOL tileUsed;

@end
