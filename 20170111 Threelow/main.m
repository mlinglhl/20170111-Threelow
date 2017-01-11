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
#import "RuleChecker.h"

int main(int argc, const char * argv[]) {
    InputHandler *handler = [[InputHandler alloc] init];
    DiceMaker *diceMaker = [[DiceMaker alloc] init];
    NSInteger diceCount = 5;
    RuleChecker *referee = [[RuleChecker alloc] init];
    NSArray<Dice *> *diceHolder = [NSArray arrayWithArray:[diceMaker makeDice:diceCount]];
    BOOL keepRolling = YES;
    NSInteger score = 0;
    while (keepRolling == YES) {
        BOOL hasHeld = NO;
        score = 0;
        NSMutableString *allDice = [[NSMutableString alloc] init];
        for (Dice *dice in diceHolder) {
            score = score + [dice dieValue];
            [allDice appendString:[dice displayDie]];
        }
        BOOL keepHolding = YES;
        while (keepHolding == YES) {
            if ([referee allHeldCheck:diceHolder totalDice:diceCount] == YES) {
                keepHolding = NO;
                continue;
            }
            NSLog(@"Your current dice are %@\n Your score is %ld\nWould you like to hold any dice?", allDice, score);
            NSString *userInput = [handler handleUserInput];
            
            if ([userInput isEqualToString:@"yes"]) {
                NSLog(@"Enter a die to hold.");
                int userHoldSelection = [[handler handleUserInput] intValue ];
                if (userHoldSelection > diceHolder.count || userHoldSelection < 1) {
                    NSLog(@"Invalid number");
                }
                else if (diceHolder[userHoldSelection-1].held == YES) {
                    NSLog(@"You are already holding that die.");
                }
                else {
                    diceHolder[userHoldSelection-1].held = YES;
                    hasHeld = YES;
                }
            }
            else if ([userInput isEqualToString:@"no"]) {
                if (hasHeld == YES) {
                    keepHolding = NO;
                    continue;
                }
                else {
                    NSLog (@"You must hold at least one die for each roll.");
                    
                }
            }
            else {
                NSLog(@"Invalid selection");
            }
        }
        if ([referee allHeldCheck:diceHolder totalDice:diceCount] == YES) {
            keepRolling = NO;
            continue;
        }
        NSLog (@"Would you like to roll again?");
        NSString *userInput = [handler handleUserInput];
        if ([userInput isEqualToString:@"yes"]) {
            for (Dice *dice in diceHolder) {
                [dice rollDie];
            }
        }
        else {
            keepRolling = NO;
            continue;
        }
    }
    NSLog(@"The game is over. Your score is %li", (long)score);
}
