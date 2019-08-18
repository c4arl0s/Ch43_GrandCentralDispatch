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

# Threading Basics

- keywords: thread, mutex, thread-safe, main thread, 

- Most modern operating Systems support the notion of threads of execution. Each process can contain multiple threads, which all run concurrently.
- If there is just one processor core, the operating system will switch between all executing threads, much like it switches between all executing processes.
- If more than one core is available, the threads will be distributed among them, just as processes are.

- Mutex, structure which can ensure that a particular chunck of code cannot be run by multiple threads at once. 
- This is useful for ensuring correct outcomes when multiple threads access the same data simultaneously, by locking out other threads when one thread is updating a value (in whats called a critical section of your code).

### - A common concern when dealing with threads is the idea of code being thread-safe

- In cocoa Touch, UIKit objects are not thread-safe. They should be executed from within the same thread, which is commonly known as the main thread

# Units of work

- In the 10.6 realese of Mac OS X, GCD made its debut.
- This technology works not only with objective-c, but also with C and C++.
- Units of work: paintless background processing, and automatic thread management.
- One of the key concepts of GCD is the queue.
- GCD Queues are strictly first-in, firts-out (FIFO).
- Units of work are added  to a GCD queu will always be started in the order the were placed in the queue. That being said theyt may not always finish in the same order, since a GCD queue will automatically distribute its work among multiple threads, if possible.

# BLocks

- The idea behind a block is to let a particular chunk of code be treaded like any other C-language type.
- A block can be assigned to a variable, passed as an argument to a function or method, and executed.
- In this way blocks can be used as an alternative to the delegate pattern in Objective-C or to callback functions in C.

``` objective-c
// declare a block variable "loggerBlock"
void (^loggerBlock)(void);
```

``` objective-c
// assign a block 
loggerBlock = ^{NSLog(@"I am just glad they didn't call it a lambda");};
```


``` objective-c
// execute the block
loggerBlock();
```


- blocks are similar to the concept of function pointers.
- blocks can be defined in-line of your code.
- block can access variables available in the scope where it is created.
- use storage qualifier __block

``` objective-c
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
```

``` console
2019-08-17 12:05:52.056082-0500 SlowWorker[18558:2942115] I am just glad they didn't call it a lambda
2019-08-17 12:05:52.057471-0500 SlowWorker[18558:2942115] integerVariable = 0
2019-08-17 12:05:52.059486-0500 SlowWorker[18558:2942115] a == 47
```

# Improving SlowWorker

``` objective-c
- (IBAction)doWork:(id)sender
{
    NSDate *startTime = [NSDate date];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    NSString *fetchData = [self fetchSomethingFromServer];
    NSString *processedData = [self processData:fetchData];
    NSString *firstResult = [self calculateFirstResult:processedData];
    NSString *secondResult = [self calculateFirstResult:processedData];
    NSString *resultsSummary = [NSString stringWithFormat:@"First [%@]\nSecond: [%@]", firstResult, secondResult];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.resultsTextView.text = resultsSummary;
        });
    NSDate *endTime = [NSDate date];
    NSLog(@"Completed in %f seconds", [endTime timeIntervalSinceDate:startTime]);
    });
}
```

# Don’t Forget That Main Thread

``` objective-c
- (IBAction)doWork:(id)sender
{
    NSDate *startTime = [NSDate date];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    NSString *fetchData = [self fetchSomethingFromServer];
    NSString *processedData = [self processData:fetchData];
    NSString *firstResult = [self calculateFirstResult:processedData];
    NSString *secondResult = [self calculateFirstResult:processedData];
    NSString *resultsSummary = [NSString stringWithFormat:@"First [%@]\nSecond: [%@]", firstResult, secondResult];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.resultsTextView.text = resultsSummary;
        })
    NSDate *endTime = [NSDate date];
    NSLog(@"Completed in %f seconds", [endTime timeIntervalSinceDate:startTime]);
    });
}
```

# Giving Some Feedback and add a spinner to know about the process that is in the background.

``` objective-c
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
        NSString *secondResult = [self calculateFirstResult:processedData];
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

// Your app should start up, and pressing the button will make it work for about ten seconds (the sum of all those sleep amounts) before showing the results.
// During you wait, you will see that the Start Working ! button remains dar blue the entire time, never turning back to its normal color until the "work" is done.
// Tapping anywhere on the screen has no effect. In fact, the only way you can interact with your application during this time is by tapping the home button to switch away from it. This is exactly the state of affairs we want to avoid!

@end

```

![ezgif-4-627dd175a058](https://user-images.githubusercontent.com/24994818/63218815-b4a45800-c129-11e9-86b1-50c7b1b30cd6.gif)
