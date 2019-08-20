//
//  ViewController.m
//  SlowWorker
//
//  Created by Carlos Santiago Cruz on 8/17/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//  This is an example of what exactly the state of affairs we want to avoid!

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // declare a block variable "loggerBlock"
    void (^loggerBlock)(void);
    // assign a block
    loggerBlock = ^{NSLog(@"I am just glad they didn't call it a lambda");};
    // execute the block
    loggerBlock();
    
    // define a variable that can be changed by a block
    __block int integerVariable = 0;
    // define a block that tries to modify a variable in its scope
    void(^sillyBlock)(void) = ^{ integerVariable = 47; };
    // check the value of our variable before calling the block
    NSLog(@"integerVariable = %d", integerVariable); // outputs "a==0"
    // execute the block
    sillyBlock();
    // check the values of our variable again, after calling the block
    NSLog(@"a == %d", integerVariable); // // outputs "a==47"
    
}

- (NSString *)fetchSomethingFromServer
{
    [NSThread sleepForTimeInterval:1];
    return @"Hi there";
}

- (NSString *)processData:(NSString *)data
{
    [NSThread sleepForTimeInterval:2];
    return [data uppercaseString];
}

- (NSString *)calculateFirstResult:(NSString *)data
{
    [NSThread sleepForTimeInterval:3];
    return [NSString stringWithFormat:@"Number of chars: %d", (int)[data length]];
}

- (NSString *)calculateSecondResult:(NSString *)data
{
    [NSThread sleepForTimeInterval:4];
    return [data stringByReplacingOccurrencesOfString:@"E" withString:@"e"];
}

- (IBAction)doWork:(id)sender
{
    NSDate *startTime = [NSDate date];
    NSString *fetchedData = [self fetchSomethingFromServer];
    NSString *processedData = [self processData:fetchedData];
    NSString *firstResult = [self calculateFirstResult:processedData];
    NSString *secondResult = [self calculateSecondResult:processedData];
    NSString *resultsSummary = [NSString stringWithFormat:@"First [%@]\nSecond: [%@]", firstResult, secondResult];
    self.resultsTextView.text = resultsSummary;
    NSDate *endTime = [NSDate date];
    NSLog(@"Completed in %f seconds", [endTime timeIntervalSinceDate:startTime]);
}

// Your app should start up, and pressing the button will make it work for about ten seconds (the sum of all those sleep amounts) before showing the results.
// During you wait, you will see that the Start Working ! button remains dar blue the entire time, never turning back to its normal color until the "work" is done.
// Tapping anywhere on the screen has no effect. In fact, the only way you can interact with your application during this time is by tapping the home button to switch away from it. This is exactly the state of affairs we want to avoid!

@end
