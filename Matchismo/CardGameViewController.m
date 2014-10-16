//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Petr on 04.09.14.
//  Copyright (c) 2014 Petr Elexa. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *modeSwitch;
@property (nonatomic) BOOL twoCardMatchMode;
@end

@implementation CardGameViewController

- (Deck*)createDeck{
    return [[PlayingCardDeck alloc]init];
}

- (CardMatchingGame *)game{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

#define LEFT_BUTTON 0

- (IBAction)switchCardMatchMode:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == LEFT_BUTTON){
        self.game.easyMode = YES;
        NSLog(@"left");
    }else{
        self.game.easyMode = NO;
        NSLog(@"right");
    }
}

- (IBAction)touchRedealButton:(UIButton *)sender {
    self.game = nil;
    [self updateUI];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI{
    for (UIButton *cardButton in self.cardButtons){
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];

        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];

}

- (NSString*)titleForCard:(Card*)card{
    return card.isChosen ? card.contents : @"";
}

- (UIImage*)backgroundImageForCard:(Card*)card{
    return [UIImage imageNamed:card.isChosen ? @"CardFront" : @"CardBack"];
}
- (IBAction)newGameButton:(UIButton *)sender {
}
@end
