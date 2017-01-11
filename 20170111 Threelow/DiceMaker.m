//
//  DiceMaker.m
//  20170111 Threelow
//
//  Created by Minhung Ling on 2017-01-11.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "DiceMaker.h"
#import "Dice.h"

@implementation DiceMaker

- (NSArray *) makeDice: (NSInteger) diceCount {
    NSMutableArray *diceMaker = [[NSMutableArray alloc] init];
    for (int i = 0; i < diceCount; i++) {
        diceMaker[i] = [[Dice alloc] init];
    }
    return diceMaker;
}

@end
