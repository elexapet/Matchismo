//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Petr on 08.09.14.
//  Copyright (c) 2014 Petr Elexa. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of Card
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck*)deck{
    self = [super init]; //super's designated initializer
    
    if (self){
        self.easyMode = YES;
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card){
                [self.cards addObject:card];
            }
            else{
                self = nil;
                break;
            }
        }
    }
    return self;
}

#define MISMATCH_PENATLY 2;
#define MATCH_BONUS 4;
#define COST_TO_CHOOSE 1;

- (void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if(card.isChosen){
            card.chosen = NO;
        }else{
            //match against other chosen cards
            for (Card *secondCard in self.cards) {
                for (Card *thirdCard in self.cards) {
                    
                }
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }else{
                        self.score -= MISMATCH_PENATLY;
                        otherCard.chosen = NO;
                    }
                    break; //can only match 2 cards for now
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}
@end
