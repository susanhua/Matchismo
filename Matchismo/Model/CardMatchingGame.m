//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by susan hua on 14-8-9.
//  Copyright (c) 2014年 Susan hua. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
@property (nonatomic, readwrite) NSInteger score;//readwrite用在在publicly里面已经定义为readonly的情况下， @property 可以publicty和privately都为eadonly
@property (nonatomic, strong) NSMutableArray *cards;//keep track of the cards

@end

@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
        
}

-(instancetype)initWithCardCount:(NSUInteger)count
                      usingDeck :(Deck *)deck
{
    self = [super init];//super's desigated initializer初始化副类
    if (self) {
        for (int i=0; i< count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
               [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}// 重新数牌，从deck中随机抽取一张，然后在NSMutableArray中添加一张卡

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count])? self.cards [index]: nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if(!card.isMatched){//一张卡被选中后就删除了
        if(card.isChosen){
            card.chosen = NO;
        }else{//和其他选中的卡作对比
        for (Card *otherCard in self.cards){
            if(otherCard.isChosen && !otherCard.isMatched){
                int matchScore = [card match: @[otherCard]];
                if(matchScore){
                    self.score += matchScore * MATCH_BONUS;
                    otherCard.matched = YES;
                    card.matched = YES;
                }else{
                    self.score -= MISMATCH_PENALTY;
                    otherCard.chosen = NO;
                }
                break; // can only choose 2 cards for now
            }
        }
        self.score -= COST_TO_CHOOSE;
        card.chosen = YES;
        }
    }
}

@end
