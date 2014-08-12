//
//  Deck.h
//  Matchismo
//
//  Created by susan hua on 14-8-3.
//  Copyright (c) 2014年 Susan hua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void) addCard:(Card *)card atTop:(BOOL)atTop;//往最上面或者最下面添加一张卡
-(void) addCard:(Card *)card;//随意添加一张卡（只有一个参数）

-(Card *) drawRandomCard;

@end
