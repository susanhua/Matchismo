//
//  PlayingCard.m
//  Matchismo
//
//  Created by susan hua on 14-8-3.
//  Copyright (c) 2014年 Susan hua. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int) match:(NSArray *)otherCards
{
    int score = 0;
    if([otherCards count] == 1){
        PlayingCard *otherCard = [otherCards firstObject];
        if(otherCard.rank == self.rank){
            score = 4;
        } else if ([otherCard.suit isEqualToString:self.suit]){
            score = 1;
        }
    }
    
    return score = 0;
}

-(NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}//点数加上花色，@[]创建Arrey

@synthesize suit = _suit;// because we provide setter AND getter

+(NSArray *) validSuits//类方法 class method
{
    return @[@"♠️",@"♥️",@"♣️",@"♦️"];
}
- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

-(NSString *)suit
{
    return _suit? _suit: @"?";//花色是否存在，存在返回花色，不存在返回“？”
}

+(NSArray *) rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger) maxRank { return [[self rankStrings]count]-1;}//类方法内的实际变量是类，不是变量

-(void) setRank: (NSUInteger)rank
{
    if (rank<= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
@end
    
