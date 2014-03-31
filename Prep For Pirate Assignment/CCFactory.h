//
//  CCFactory.h
//  Prep For Pirate Assignment
//
//  Created by Austin McCarthy on 3/25/14.
//  Copyright (c) 2014 Austin McCarthy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCCharacter.h"
#import "CCBoss.h"

@interface CCFactory : NSObject

-(NSArray *)tiles;
-(CCCharacter *)character;
-(CCBoss *)boss;

@end
