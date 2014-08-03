//
//  PlayingCard.h
//  Matchismo
//
//  Created by susan hua on 14-8-3.
//  Copyright (c) 2014年 Susan hua. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end
