//
//  RuleChecker.m
//  20170111 Threelow
//
//  Created by Minhung Ling on 2017-01-11.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "RuleChecker.h"
#import "Dice.h"

@implementation RuleChecker

-(BOOL) allHeldCheck: (NSArray *) diceHolder totalDice:(NSInteger) totalDice {
    NSInteger counter = 0;
    for (Dice *dice in diceHolder)
    {
        if (dice.held == YES) {
            counter ++;
        }
    }
    if (totalDice > counter) {
        return NO;
    }
    else {
        return YES;
    }
}

@end
