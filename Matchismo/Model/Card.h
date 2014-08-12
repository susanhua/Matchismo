//
//  Card.h
//  Matchismo
//
//  Created by susan hua on 14-8-2.
//  Copyright (c) 2014年 Susan hua. All rights reserved.
//

#import <Foundation/Foundation.h> //与界面无关的标准的库

@interface Card : NSObject//类class:副类superclass

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;
// property declares two methods: a "setter" and a "getter" to access variables

-(int)match:(NSArray *)otherCards;//算出一个匹配度，返回一个数字

@end
