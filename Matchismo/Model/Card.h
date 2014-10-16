//
//  Card.h
//  Matchismo
//
//  Created by Petr on 05.09.14.
//  Copyright (c) 2014 Petr Elexa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic,strong) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
