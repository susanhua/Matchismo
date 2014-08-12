//
//  Card.m
//  Matchismo
//
//  Created by susan hua on 14-8-2.
//  Copyright (c) 2014年 Susan hua. All rights reserved.
//

#import "Card.h"

@interface Card()//()引用已经定义过的类
@end

@implementation Card

-(int)match: (NSArray *)otherCards
{
    int score = 0;
    
    for(Card *card in otherCards){//for (in 集合类)循环，从集合类导出所有的元素，放到下面的条件体中执行，每个元素一次
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }//dot notation,只能用于property [messaege receive isEqualToString:]
    }
    return score;
}
@end
