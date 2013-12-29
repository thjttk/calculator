//
//  ViewController.m
//  calculator
//
//  Created by Libra on 13-11-22.
//  Copyright (c) 2013年 Libra. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"
@interface ViewController()
@property (nonatomic) BOOL UserIsInTheMiddleOfEnteringDigit;
@property (nonatomic,strong) CalculatorBrain* brain;
@end


@implementation ViewController

@synthesize display = _display;
@synthesize UserIsInTheMiddleOfEnteringDigit = _UserIsInTheMiddleOfEnteringDigit;
@synthesize brain = _brain;

-(CalculatorBrain *) brain
{
    if(_brain == nil) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [sender currentTitle];
    NSLog(@"digit pressed = %@", digit);
    if(self.UserIsInTheMiddleOfEnteringDigit){
        self.display.text = [self.display.text stringByAppendingString:digit];
    }else {
        self.display.text = digit;
        self.UserIsInTheMiddleOfEnteringDigit = YES;
    }
}

- (IBAction)operationPressed:(UIButton *)sender
{
    if (self.UserIsInTheMiddleOfEnteringDigit) [self enterPressed];
    double result = [self.brain performOperation:sender.currentTitle];
//    self.UserIsInTheMiddleOfEnteringDigit = NO;
    self.display.text = [NSString stringWithFormat:@"%g",result];
}

- (IBAction)enterPressed
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.UserIsInTheMiddleOfEnteringDigit = NO;
    
}


@end

