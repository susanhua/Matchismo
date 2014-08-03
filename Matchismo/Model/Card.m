//
//  Card.m
//  Matchismo
//
//  Created by susan hua on 14-8-2.
//  Copyright (c) 2014年 Susan hua. All rights reserved.
//

#import "Card.h"

@interface Card()
@end

@implementation Card

-(int)match: (NSArray *)otherCards
{
    int score = 0;
    
    for(Card *card in otherCards){
        if([card.contents isEqualToString:self.contents]){score = 1;
        }
    }
    return score;
}
@end
