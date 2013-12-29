//
//  CalculatorBrain.m
//  calculator
//
//  Created by Libra on 13-12-2.
//  Copyright (c) 2013年 Libra. All rights reserved.
//

#import "CalculatorBrain.h"
@interface CalculatorBrain()
@property (nonatomic,strong)  NSMutableArray * operandStack;
@end


@implementation CalculatorBrain
@synthesize operandStack = _operandStack;

-(NSArray *)operandStack
{
    if (_operandStack == Nil) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}
-(void) setOperandStack:(NSMutableArray *)operandStack
{
    _operandStack = operandStack;
}
- (void) pushOperand : (double) operand
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
    
}
-(double) popOperand
{
    NSNumber *number = [self.operandStack lastObject];
    if(number) [self.operandStack removeLastObject];
    return [number doubleValue];
}
- (double) performOperation : (NSString *) operation
{
    double result = 0.0;
    if([operation  isEqual: @"+"]){
        result = [self popOperand] + [self popOperand];
    }
    
    [self pushOperand:result];
    
    return result;
    
}
@end
