//
//  Deck.m
//  Matchismo
//
//  Created by susan hua on 14-8-3.
//  Copyright (c) 2014年 Susan hua. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong,nonatomic) NSMutableArray *card;
@end


@implementation Deck

-(NSMutableArray *)cards
{
    if(!_card) _card = [[NSMutableArray alloc] init];
    return _card;
}

-(void)addcard:(Card *) card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}
-(void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

-(Card *)drawRandomCard
{
    Card *randomCard = nil;
    
    if ([self.cards count]){
        unsigned index = arc4random()%[self.cards count];
        randomCard = self.cards [index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}
@end
