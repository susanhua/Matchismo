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

-(instancetype)initWithCardCount: (NSUInteger)countusingDeck:(Deck *)deck;

-(void)chooseCardAtIndex: (NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
