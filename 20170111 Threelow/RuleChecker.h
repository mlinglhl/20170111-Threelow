//
//  RuleChecker.h
//  20170111 Threelow
//
//  Created by Minhung Ling on 2017-01-11.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuleChecker : NSObject
-(BOOL) allHeldCheck: (NSArray *) diceHolder totalDice:(NSInteger) totalDice;
@end
