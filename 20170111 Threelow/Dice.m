//
//  Dice.m
//  20170111 Threelow
//
//  Created by Minhung Ling on 2017-01-11.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        _value = arc4random_uniform(6)+1;
        _held = NO;
    }
    return self;
}

- (void) rollDie {
    if (self.held == NO) {
        self.value = arc4random_uniform(6)+1;
    }
}

- (NSString *) displayDie {
    switch (self.value) {
        case 1:
            return [NSString stringWithFormat:@"⚀ "];
        case 2:
            return [NSString stringWithFormat:@"⚁ "];
        case 3:
            return [NSString stringWithFormat:@"⚂ "];
        case 4:
            return [NSString stringWithFormat:@"⚃ "];
        case 5:
            return [NSString stringWithFormat:@"⚄ "];
        case 6:
            return [NSString stringWithFormat:@"⚅ "];
    }
    return [NSString stringWithFormat:@"Error"];
}

- (NSInteger) dieValue {
    switch (self.value) {
        case 1:
            return 1;
        case 2:
            return 2;
        case 3:
            return 0;
        case 4:
            return 4;
        case 5:
            return 5;
        case 6:
            return 6;
    }
    return 0;
}

@end
