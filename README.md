# Ch43_GrandCentralDispatch

1. [Grand Central Dispatch](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#1-grand-central-dispatch)
2. [Introducing SlowWorker](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#2-introducing-slowworker)
3. [Threading Basics](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#3-threading-basics)
4. [Units of Work](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#4-units-of-work)
5. [GCD: Low-Level Queueing](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#5-gcd-low-level-queueing)
6. [Becoming a Blockhead](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#6-becoming-a-blockhead)
7. [Improving SlowWorker](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#7-improving-slowworker)
8. [Don’t Forget That Main Thread](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#8-dont-forget-that-main-thread)
9. [Giving Some Feedback](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#9-giving-some-feedback)
10. [Concurrent Blocks](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#10-concurrent-blocks)
11. [Background Processing](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#11-background-processing)
12. [Application Life Cycle](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#12-application-life-cycle)
13. [State-Change Notifications](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#13-state-change-notifications)
14. [Creating State Lab](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#14-creating-state-lab)
15. [Exploring Execution States](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#15-exploring-execution-states)
16. [Making Use of Execution State Changes](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#16-making-use-of-execution-state-changes)
17. [Active  Inactive](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#17-active--inactive)
18. [Inactive  Background](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#18-inactive--background)
19. [Background  Inactive](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#19-background--inactive)
20. [Inactive  Active](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#20-inactive--active)
21. [Handling the Inactive State](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#21-handling-the-inactive-state)
22. [Handling the Background State](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#22-handling-the-background-state)
23. [Removing Resources When Entering the Background](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#23-removing-resources-when-entering-the-background)
24. [Saving State When Entering the Background](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#24-saving-state-when-entering-the-background)
25. [Requesting More Backgrounding Time](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#25-requesting-more-backgrounding-time)
26. [Grand Central Dispatch, Over and Out](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#25-requesting-more-backgrounding-time)

Ch43_GrandCentralDispatch


# 1. [Grand Central Dispatch](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 2. [Introducing SlowWorker](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 3. [Threading Basics](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 4. [Units of Work](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 5. [GCD: Low-Level Queueing](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 6. [Becoming a Blockhead](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 7. [Improving SlowWorker](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 8. [Don’t Forget That Main Thread](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 9. [Giving Some Feedback](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 10. [Concurrent Blocks](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 11. [Background Processing](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 12. [Application Life Cycle](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 13. [State-Change Notifications](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 14. [Creating State Lab](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 15. [Exploring Execution States](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 16. [Making Use of Execution State Changes](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 17. [Active  Inactive](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 18. [Inactive  Background](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 19. [Background  Inactive](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 20. [Inactive  Active](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 21. [Handling the Inactive State](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 22. [Handling the Background State](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 23. [Removing Resources When Entering the Background](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 24. [Saving State When Entering the Background](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 25. [Requesting More Backgrounding Time](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)
# 26. [Grand Central Dispatch, Over and Out](https://github.com/c4arl0s/Ch43_GrandCentralDispatch#ch43_grandcentraldispatch)


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
```

![ezgif-5-ead9ff1b0ed2](https://user-images.githubusercontent.com/24994818/63310594-0206fd80-c2c1-11e9-8704-ff81df4f7db2.gif)

```console
2019-08-19 20:14:22.003797-0500 SlowWorker[26234:3733731] I am just glad they didn't call it a lambda
2019-08-19 20:14:22.004051-0500 SlowWorker[26234:3733731] integerVariable = 0
2019-08-19 20:14:22.004187-0500 SlowWorker[26234:3733731] a == 47
2019-08-19 20:14:44.345018-0500 SlowWorker[26234:3733731] Completed in 10.004602 seconds
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

- It is imposible to write error-free, multithreaded code.
- Only a small of fraction of those who write code, nearly 5% are really up to the task of writing heavy-dty multithreaded applications.
- It is possible to implement some concurrency without too much low-level thread-twisting.
- The ideas apple is encourages us is to splitting up long-runnung tasks. The system manages the queues for us.

# GCD: Low Level Queueing

- In the 10.6 realese of Mac OS X, GCD made its debut.
- This technology works not only with objective-c, but also with C and C++.
- Units of work: paintless background processing, and automatic thread management.
- One of the key concepts of GCD is the queue.
- GCD Queues are strictly first-in, firts-out (FIFO).
- Units of work are added  to a GCD queu will always be started in the order the were placed in the queue. That being said theyt may not always finish in the same order, since a GCD queue will automatically distribute its work among multiple threads, if possible.

# Becomming a Blockhead (stupid person)

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
        NSString *fetchedData = [self fetchSomethingFromServer];
        NSString *processedData = [self processData:fetchData];
        NSString *firstResult = [self calculateFirstResult:processedData];
        NSString *secondResult = [self calculateSecondResult:processedData];
        NSString *resultsSummary = [NSString stringWithFormat:@"First [%@]\nSecond: [%@]", firstResult, secondResult];
        self.resultsTextView.text = resultsSummary;
    NSDate *endTime = [NSDate date];
    NSLog(@"Completed in %f seconds", [endTime timeIntervalSinceDate:startTime]);
    });
}
```

![Screen Shot 2019-08-19 at 8 23 29 PM](https://user-images.githubusercontent.com/24994818/63310184-54471f00-c2bf-11e9-9912-35ef715c5db2.png)

``` console
2019-08-19 20:22:12.770854-0500 SlowWorker[26369:3742032] I am just glad they didn't call it a lambda
2019-08-19 20:22:12.771087-0500 SlowWorker[26369:3742032] integerVariable = 0
2019-08-19 20:22:12.771201-0500 SlowWorker[26369:3742032] a == 47
=================================================================
Main Thread Checker: UI API called on a background thread: -[UITextView setText:]
PID: 26369, TID: 3742775, Thread name: (none), Queue name: com.apple.root.default-qos, QoS: 0
Backtrace:
4   SlowWorker                          0x0000000104b3ee37 __25-[ViewController doWork:]_block_invoke + 343
5   libdispatch.dylib                   0x00000001076e3d7f _dispatch_call_block_and_release + 12
6   libdispatch.dylib                   0x00000001076e4db5 _dispatch_client_callout + 8
7   libdispatch.dylib                   0x00000001076e77b9 _dispatch_queue_override_invoke + 1022
8   libdispatch.dylib                   0x00000001076f5632 _dispatch_root_queue_drain + 351
9   libdispatch.dylib                   0x00000001076f5fca _dispatch_worker_thread2 + 130
10  libsystem_pthread.dylib             0x0000000107acd6b3 _pthread_wqthread + 583
11  libsystem_pthread.dylib             0x0000000107acd3fd start_wqthread + 13
2019-08-19 20:22:58.759870-0500 SlowWorker[26369:3742775] [reports] Main Thread Checker: UI API called on a background thread: -[UITextView setText:]
PID: 26369, TID: 3742775, Thread name: (none), Queue name: com.apple.root.default-qos, QoS: 0
Backtrace:
4   SlowWorker                          0x0000000104b3ee37 __25-[ViewController doWork:]_block_invoke + 343
5   libdispatch.dylib                   0x00000001076e3d7f _dispatch_call_block_and_release + 12
6   libdispatch.dylib                   0x00000001076e4db5 _dispatch_client_callout + 8
7   libdispatch.dylib                   0x00000001076e77b9 _dispatch_queue_override_invoke + 1022
8   libdispatch.dylib                   0x00000001076f5632 _dispatch_root_queue_drain + 351
9   libdispatch.dylib                   0x00000001076f5fca _dispatch_worker_thread2 + 130
10  libsystem_pthread.dylib             0x0000000107acd6b3 _pthread_wqthread + 583
11  libsystem_pthread.dylib             0x0000000107acd3fd start_wqthread + 13
2019-08-19 20:22:58.812060-0500 SlowWorker[26369:3742775] Completed in 10.060935 seconds
2019-08-19 20:23:13.184545-0500 SlowWorker[26369:3742775] Completed in 10.013715 seconds
```

# Code explanation

- It does exist a preexisting global queue that is always available dipatch_get_global_queue().
- Parameters used in the code are priority and the second is unused with 0.
- It does exist two kinds of priorities: DISPATCH_QUEUE_PRIORITY_HIGH and DISPATCH_QUEUE_PRIORITY_LOW.
- The queue is then passed to the dispatch_async() function, along with the block of code that comes after.
- GCD takes the entire block and passes it to a background thread, where it will be executed one step at a time, just as when it was running in the main thread.
- Notice the variable startTime just before the block is created and then use its value at the end of the block, This doesnt seem to make sense.
### - If a block accesses any variable from the "the outside" during its execution, then some special setup happens when the block is created, allowing the block acces to those variables.
- The values contained by such variables will either be duplicated (if they are plain C types such as int or float) or retained (if they are pointers to objects) so that the valuyes they contain can be used inside the block.
- When dispatch_async is called in the second line of doWork:, and the block shown in the code is created, __**startime is actually sent a retain message**__, whose return value is assigned to what is essentially a new static variable with the same name (starTime) inside the block.
- The startTime variable needs to be static inside the block.
- __block-qualifier variables are not duplicated or retained when used inside a block.


# Don’t Forget That Main Thread

![Screen Shot 2019-08-19 at 8 27 40 PM](https://user-images.githubusercontent.com/24994818/63310318-d33c5780-c2bf-11e9-815a-b449a9082fcd.png)

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

``` console
2019-08-19 20:27:13.867832-0500 SlowWorker[26423:3746206] I am just glad they didn't call it a lambda
2019-08-19 20:27:13.868194-0500 SlowWorker[26423:3746206] integerVariable = 0
2019-08-19 20:27:13.868326-0500 SlowWorker[26423:3746206] a == 47
2019-08-19 20:27:25.230966-0500 SlowWorker[26423:3746287] Completed in 10.002183 seconds
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
```

![ezgif-5-be992f537409](https://user-images.githubusercontent.com/24994818/63311508-de918200-c2c3-11e9-9a24-f9f34126995f.gif)

``` console
2019-08-19 20:54:06.112240-0500 SlowWorker[26730:3773129] I am just glad they didn't call it a lambda
2019-08-19 20:54:06.112467-0500 SlowWorker[26730:3773129] integerVariable = 0
2019-08-19 20:54:06.112583-0500 SlowWorker[26730:3773129] a == 47
2019-08-19 20:54:41.884841-0500 SlowWorker[26730:3773182] Completed in 10.007888 seconds
```

# Concurrent Blocks

- Do some programming to make concurrent the process involved in this app, and speed up the performance.
- You dont need to be performed in sequence
- Dispatch_group. All blocks that are dispatched asynchronously withing the context of a group, via the dispatch_group_async() function, are set loose to execute as fast as they can, including being distributed to multiple threads for concurrent execution, if possible.
- We can also use dispatch_group_notify() to specify an additional block that will be executed when all blocks in the group have been run to completion.

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
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        NSString *fetchedData = [self fetchSomethingFromServer];
        NSString *processedData = [self processData:fetchedData];
        
        __block NSString *firstResult;
        __block NSString *secondResult;
        
        dispatch_group_t group = dispatch_group_create();
        
        dispatch_group_async(group, queue, ^{
            firstResult = [self calculateFirstResult:processedData];
        });
        
        dispatch_group_async(group, queue, ^{
            secondResult = [self calculateSecondResult:processedData];
        });
        
        dispatch_group_notify(group, queue, ^{
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
    });
}

// Your app should start up, and pressing the button will make it work for about ten seconds (the sum of all those sleep amounts) before showing the results.
// During you wait, you will see that the Start Working ! button remains dar blue the entire time, never turning back to its normal color until the "work" is done.
// Tapping anywhere on the screen has no effect. In fact, the only way you can interact with your application during this time is by tapping the home button to switch away from it. This is exactly the state of affairs we want to avoid!

@end
```

![ezgif-5-648eaffc9bda](https://user-images.githubusercontent.com/24994818/63312134-1b5e7880-c2c6-11e9-9b07-925d760c5ddd.gif)

``` console
2019-08-19 21:10:57.763401-0500 SlowWorker[26870:3787480] I am just glad they didn't call it a lambda
2019-08-19 21:10:57.763649-0500 SlowWorker[26870:3787480] integerVariable = 0
2019-08-19 21:10:57.763790-0500 SlowWorker[26870:3787480] a == 47
2019-08-19 21:11:46.661551-0500 SlowWorker[26870:3788025] Completed in 7.015356 seconds
```

# Background Processing.

-  This allows your apps to run in the background—in some circumstances, even after the user has pressed the home button.
-
-
-

# Remember calculateSecondResult
