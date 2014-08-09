//
//  CardGameViewController.m
//  Matchismo
//
//  Created by susan hua on 14-8-2.
//  Copyright (c) 2014年 Susan hua. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()


@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation CardGameViewController

-(CardMatchingGame *)game
{
    if (!_game)_game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]usingDeck:[self createDeck]];
}




-(PlayingCardDeck *)createDeck {
    return [[PlayingCardDeck alloc]init];
}



- (IBAction)touchCardButton:(UIButton *)sender
{
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];

}

-(void)updateUI
{
    for (UIButton * cardButton in self.cardButtons){
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self.titleForCard:Card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
}

-(NSString *)titleForCard: (card *)card
{
    return card.isChosen ? card.contents: @"";
}

-(UIImage *)backgroundImageForCard:(card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}
@end
