//
//  ViewController.m
//  SlowWorker
//
//  Created by Carlos Santiago Cruz on 8/17/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//  This is an example of what exactly the state of affairs we want to avoid!
//  Giving Some Feedback and add a spinner to know about the process that is in the background

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
    
    self.activityIndicatorView.alpha = 0.0f;
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
    
    self.resultsTextView.text = @"Updating data ...";
    self.startButton.enabled = NO;
    self.startButton.alpha = 0.5f;
    self.activityIndicatorView.alpha = 1.0f;
    
    [self.activityIndicatorView startAnimating];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *fetchData = [self fetchSomethingFromServer];
        NSString *processedData = [self processData:fetchData];
        NSString *firstResult = [self calculateFirstResult:processedData];
        NSString *secondResult = [self calculateSecondResult:processedData];
        NSString *resultsSummary = [NSString stringWithFormat:@"First [%@]\nSecond: [%@]", firstResult, secondResult];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.resultsTextView.text = resultsSummary;
            
            self.startButton.enabled = YES;
            self.startButton.alpha = 1.0f;
            [self.activityIndicatorView stopAnimating];
            self.activityIndicatorView.alpha = 0.0f;
            
        });
    NSDate *endTime = [NSDate date];
    NSLog(@"Completed in %f seconds", [endTime timeIntervalSinceDate:startTime]);
    });
}

@end
