//
//  PlayingCard.h
//  Matchismo
//
//  Created by Petr on 05.09.14.
//  Copyright (c) 2014 Petr Elexa. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
