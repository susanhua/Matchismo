//
//  CardGameViewController.m
//  Matchismo
//
//  Created by susan hua on 14-8-2.
//  Copyright (c) 2014年 Susan hua. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;

@end

@implementation CardGameViewController


-(Deck *)deck{
    if(!_deck)_deck = [self createDeck];
    return _deck;
}

-(PlayingCardDeck *)createDeck {
    return [[PlayingCardDeck alloc]init];
}

-(void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([[sender currentTitle] length]) {
        [sender setBackgroundImage:[UIImage imageNamed: @"CardBack"] forState:UIControlStateNormal];
         [sender setTitle: @"" forState:UIControlStateNormal];
        } else {
            Card *card = [self.deck drawRandomCard];
    [sender setBackgroundImage:[UIImage imageNamed: @"CardFront"] forState:UIControlStateNormal];
     [sender setTitle: card.contents forState:UIControlStateNormal];
       }
    self.flipCount++;
}

@end
