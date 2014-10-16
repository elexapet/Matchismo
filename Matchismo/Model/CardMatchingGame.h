//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Petr on 08.09.14.
//  Copyright (c) 2014 Petr Elexa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initiliazer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck*)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card*)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) BOOL easyMode;

@end
