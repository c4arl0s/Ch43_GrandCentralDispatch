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

