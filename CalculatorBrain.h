//
//  CalculatorBrain.h
//  calculator
//
//  Created by Libra on 13-12-2.
//  Copyright (c) 2013年 Libra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void) pushOperand : (double) operand;
- (double) performOperation : (NSString *) operation;

@end
