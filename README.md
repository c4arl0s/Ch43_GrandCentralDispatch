# Ch43_GrandCentralDispatch

Ch43_GrandCentralDispatch

# There is two ways to do multitasking

- Grand Central Dispatch (GCD)
- NSOperationQueue

# GCD is a lightwwight way to represent units of work that are going to be executed concurrently 

- You dont schedule these units of work.
- The system takes care of scheduling for you.
- Adding dependency among blocks can be a headache.
- canceling or suspending  a block creates extra work for you as a developer.

# What is Concurrency.

- Doing multiple things at the same time.
- Taking advantage of the number of cores available in multicore CPUs.
- Running multiple programs in parallel.

# Objectives of Concurrency

- Runnning programs in background without hogging CPU.
- Define Tasks, Define rules and let the system take the responsability of performing them.
- Improve responsiveness by ensuring that the main thread is free to respond to user events.

# Dispatch QUEUES

### - Dispatch queues allow us to execute arbitrary blocks of code either asynchronously or synchronously all Dispatch Queues are first in - first out All the tasks added to dispatch queues are started in the order were added to the dispatch queue.

# SlowWorker App

### until the work is complete, the application’s view is unresponsive. 

# ViewController.h

``` objective-c
//
//  ViewController.h
//  SlowWorker
//
//  Created by Carlos Santiago Cruz on 8/17/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UITextView *resultsTextView;

- (IBAction)doWork:(id)sender;

@end
```

# ViewController.m

``` objective-c
//
//  ViewController.m
//  SlowWorker
//
//  Created by Carlos Santiago Cruz on 8/17/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    NSString *fetchData = [self fetchSomethingFromServer];
    NSString *processedData = [self processData:fetchData];
    NSString *firstResult = [self calculateFirstResult:processedData];
    NSString *secondResult = [self calculateFirstResult:processedData];
    NSString *resultsSummary = [NSString stringWithFormat:@"First [%@]\nSecond: [%@]", firstResult, secondResult];
    self.resultsTextView.text = resultsSummary;
    NSDate *endTime = [NSDate date];
    NSLog(@"Completed in %f seconds", [endTime timeIntervalSinceDate:startTime]);
}

// Your app should start up, and pressing the button will make it work for about ten seconds (the sum of all those sleep amounts) before showing the results.
// During you wait, you will see that the Start Working ! button remains dar blue the entire time, never turning back to its normal color until the "work" is done.
// Tapping anywhere on the screen has no effect. In fact, the only way you can interact with your application during this time is by tapping the home button to switch away from it. This is exactly the state of affairs we want to avoid!

@end
```


