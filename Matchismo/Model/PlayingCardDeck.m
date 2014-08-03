//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by susan hua on 14-8-3.
//  Copyright (c) 2014年 Susan hua. All rights reserved.
//

#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

-(instancetype) init
{
    self = [super init];
    if(self){
        for (NSString *suit in [PlayingCard validSuits]){
            for(NSUInteger rank = 1; rank<= [PlayingCard maxRank]; rank++){
            PlayingCard *card = [[PlayingCard alloc]init];
            card.rank = rank;
            card.suit = suit;
            [self addCard:card];
        }
    }
}
    return self;
}

@end
