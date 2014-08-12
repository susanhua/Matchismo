//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by susan hua on 14-8-9.
//  Copyright (c) 2014年 Susan hua. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

//designated initializer

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;
-(void)chooseCardAtIndex: (NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
   // CardMatchingGame keeps the score, this is a readonly method, readonly means there is no setter (only a getter)

@end
