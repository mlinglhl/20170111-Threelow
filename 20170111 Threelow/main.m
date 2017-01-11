//
//  main.m
//  20170111 Threelow
//
//  Created by Minhung Ling on 2017-01-11.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputHandler.h"
#import "DiceMaker.h"

int main(int argc, const char * argv[]) {
    InputHandler *handler = [[InputHandler alloc] init];
    DiceMaker *diceMaker = [[DiceMaker alloc] init];
    NSInteger diceCount = 5;
    NSMutableString *allDice = [[NSMutableString alloc] init];
    NSArray<Dice *> *diceHolder = [NSArray arrayWithArray:[diceMaker makeDice:diceCount]];
    BOOL keepRolling = YES;
    while (keepRolling == YES) {
        NSInteger score = 0;
        for (int i = 0; i < 5; i++) {
            score = score + [diceHolder[i] dieValue];
            [allDice appendString:[diceHolder[i] displayDie]];
        }
        BOOL keepHolding = YES;
        while (keepHolding = YES) {
            NSLog(@"Your current dice are %@.\n Your score is %ld.\nWould you like to hold any dice?", allDice, score);
            NSString *userInput = [handler handleUserInput];
            
            if ([userInput isEqualToString:@"yes"]) {
                NSLog(@"Enter a die to hold.");
                NSInteger *userHoldSelection = [[handler handleUserInput] intValue ];
                if (userHoldSelection > diceHolder.count || userHoldSelection < 0) {
                    NSLog(@"Invalid number");
                }
            }
            else if ([userInput isEqualToString:@"no"]) {
                keepHolding = NO;
                continue;
            }
            else {
                NSLog(@"Invalid selection");
            }
        }
    }
}
