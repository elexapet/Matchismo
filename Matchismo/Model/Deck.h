//
//  Deck.h
//  Matchismo
//
//  Created by Petr on 05.09.14.
//  Copyright (c) 2014 Petr Elexa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
