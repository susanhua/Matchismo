//
//  Deck.m
//  Matchismo
//
//  Created by susan hua on 14-8-3.
//  Copyright (c) 2014年 Susan hua. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;// storege to keep the cards in, NSMUtableArray可改变的，添加减少，排序
@end


@implementation Deck

-(NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];//把自动生成的覆盖掉，使self.card可以运用，从来创建一个实际对象，初始化实际对象
    return _cards;
}

-(void)addCard:(Card *) card atTop:(BOOL)atTop//函数名atCard: atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];//插入一张卡，在什么位置插入
    }else{
        [self.cards addObject:card];//self.cards is an NSMutableArray
    }
}
-(void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

-(Card *)drawRandomCard//随机抽取一张卡
{
    Card *randomCard = nil;
    
    if ([self.cards count]){
        unsigned index = arc4random()%[self.cards count];//生成伪随机数，count取个数
        randomCard = self.cards [index];
        [self.cards removeObjectAtIndex:index];//把使用过的卡去除掉
    }
    return randomCard;
}
@end
