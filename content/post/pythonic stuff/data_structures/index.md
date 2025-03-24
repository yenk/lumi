---
title: 'Data Structures & Algorithms'
summary: Exploring Python's data transformation and formatting capabilities, including parsing and validation, optimization and serialization, and conversion to versatile data objects such as dictionaries, lists, tuples, sets, and arrays, utilizing popular Python libraries.
authors:
- admin
tags:
- python
- data wrangling
categories: [data engineering, python]
date: "2016-04-20T00:00:00Z"
lastmod: "2019-04-17T00:00:00Z"
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal point options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
image:
  # caption: 'Image credit: [**Unsplash**](https://unsplash.com/photos/CpkOjOcXdUY)'
  focal_point: "featured.png"
  preview_only: true

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

# data structures & algorithms

In programing, data structures play such a pivotal role in everything we implement from data to software that you just can't avoid not talking about it or learning about it as much as you can! Obviously, so relevant that students are often required to digest as a full semester college course idn CS. Let's get to this now!

![data structures](../assets/images/da.png)

## data structures and sequence types

A quick intro on a few really important data structures that are being used across the board. I won't dive into these as there are lots of great docs and tutorials everywhere.

- lists (mutable in "[]") - super versatile and interoperable for various data types you're trying to manipulate/parse.

- dictionaries (aka hashmaps depending on which language you're using) - be wary of hash collision, otherwise key:value pairs are awesome ways to optimize data retrieval.

- sets (mutable in "()") - great for identifying unique elements via data intersection, union, and any interoperations between datasets such as merging 2 joined lists without dups.

- tuples (immutable in "()") - useful when you have a dataset that shouldn't be changed, or use it like a dictionary except without a dict.key() format as a lookup value.  It's also more memory efficient than a list.

- str (immutable), unicode points to store textual data

- range (immutable), sequential numbers of generated executaion. Typically use to identify the total length (len) of an array to iterate on.

### common techniques & manipulations

```py
--8<-- "docs/code/data_structures.py"
```

### time and space complexity snapshot

Algorithms are measured by time and space complexity. This denoted by Big O (Lambda) notation. Big O expresses runtime complexity, and how quickly algorithms grow relative and/or proportional to input size, n. It also represents the # of steps it takes to find a solution.

Time complexity is measured based on the function of the input size, which can affect the time it'll take for the algorithm to execute efficiently.

Space complexity is measured by the memory the algorithm needs to run.

- O(1) - constant. Input size is irrelevant.
    - Examples:
        - Finding an element in a hash table, where the value is not size dependent.
        - Finding a min value, where an array takes a constant time, only if element is sorted.
    - Tips:
        - if an array is unsorted, it's not constant time, as it needs to linearly scan over each element to find the min value.

- O(n) - linear. This is semi-efficient, depending on how your algorithm is designed. It can be efficient if it's a sorted array for instance.

- O(logn) - logarithmic. The most efficient.
    - Example: Binary search tree is the perfect example that uses this time/space complexity.

- O(n^2) - quadratic. The least effficient.
    - Examples:
        - Finding duplicate values in a list, where each item has to be checked twice.

- O(2^n) - exponential. This is very inefficient. Runtime increases with size n as input.

## popular data structure algorithms

Pretty much many coding interviews revolves around DSA on Linkedlist (doubly and singly), binary search tree (sorted and unsorted BST), stacks (LIFO), queues (FIFO with enqueues and dequeues), sorting algorithm, searching algorithm, merging algorithm, depth-first search algorithm (DFS), and bread-first search algorithm (BFS).  

I'm going to dive deeper into each of one of these DSA's. Some common algorithm implementations and example use cases, as well as ones I was asked during interviews at Google, and Meta.

### linked list (doubly vs singly)

In pretty much every interview questions, it involves some kind of linked lists questions. Single linked list, doubly linkedlist, hash table using linked lists if you have a hash collision, that is. And then there are questions about arrays vs linked lists, which is better data structure to solve a particular algorithm? What are the pros and cons between them? What are their time and space complexity representations?

In simple terms, linked lists are essentially blocks (nodes) that are chained, or connected into a sequential structure forming a list. At the beginning of the list, is the head node, connected by a pointer to the next node, and this gets repeated until the node reaches a null, then we know its at its tail end and stops.

We know that linked lists is a very popular data structure as it's highly applicable in many real world examples. Let me provide some context here:

- New York subway train stations (doubly linked lists)
- Greyhound Amtrak (doubly linked lists)
- One way flights with multiple connections (singly linked lists)
- Cycling using the a single path trail, stopping in between peaks through the Switzerland's Alps,
until you reached Eiger. (singly linked lists)

#### time-space complexity

Linkedlist has a time-space complexity of O(n). Every pointer has to loop through each node from the linkedlist' head node until it reaches to the tail node to get to a `null` value.

#### basic implementation

```py
--8<-- "docs/code/linked_list.py"
```

#### common leetcode algorithms

```py
# remove an element in a linked list using linked list methods

def remove_element(nums, val):
    # Initialize the index variable to 0
    i = 0
    
    # Iterate through the array using a while loop
    while i < len(nums):
        # Check if the current element is equal to the given value
        if nums[i] == val:
            # If equal, remove the element in-place using pop()
            nums.pop(i)
        else:
            # If not equal, increment the index to move to the next element
            i += 1
    
    # Return the new length of the modified array
    return len(nums)
```

### sorted BST

Binary search is a very popular tree data structure particularly when you have a ginormous dataset, and you want to find a element that matches a specific target (e.g. the min or max value in an array), and assuming is already sorted for this to work because it helps eliminate 1/2 of the search possibilities for comparison between left and right side of the array.

The array can be split up into two halves, in repeated 1/2 intervals between left and right, where the bisection is at midpoint to find the target.

The # of comparisons will be smaller as you iterate through the array and chop it off when it doesn't match that target element between each 1/2 intervals during the search. It uses a "logarithm" search or "binary chop."

It's fast at O(logn) because we know it has to be sorted first as it finds the index of the target value in a sorted array. Then compares the target value to the middle element of array [A].

#### time-space complexity
- worst complexity: O(logn)
- best complexity: O(logn)
- space complexity: O(1) - constant time

#### basic implementation

You can use Python's BST's `bisect(lst, item)` module to find left or right index of the item in the list.
You can also use BST's `insort(lst, item)` module to insert item to left or right index of the list.

`bisect_right(lst, item)`: finds index of item in list, if contains duplicates, returns right most index.

`bisect_left(lst, item)`: returns left most possible index, generates index of existing item.

`insort_right(lst, item)`: inserts item at right most index.

`insort_left(lst, item)`: inserts item at left most index.

#### pitfalls to avoid

There are two pitfalls you want to avoid when implementing BST.

1. **integer overflow** - if left and right of the [A] are large, this causes overflow. You can calculate offset to fix it.

```python

def binary_search(elem, item):
    middle = (left + right) // 2 # may cause overflow

def binary_search(elem, item):
    middle = left + (right - left) // 2 # can't overflow as offset already calculated here!
```

2. **stack overlow** - too many recursive calls, puts local variables onto stack of your PC's memory. You want to consider recursion depth limits, python it's 3000!

3. **dex-mod parameter** - recursive binary search algorithm doesn't store its original index of the list as you iterate through the 1/2 repeated intervals in the list. This can happen when after first recursion, the index of each new sliced interval remains at 0, as it iterates through the 2nd recursion, it never gets updated!

To fix this, you can adjust for a sub-list indexing by adding a cumulator, and discard on left of the list. A "dex-mode" parameter can be created to track indices during slicing.

#### common leetcode algorithms

### queues (FIFO - first in first out)

A great example is waiting in queue for a roller coaster ride! The first person in queue gets to ride first(dequeue), and the last person in queue will go last (enqueue)

#### time-space complexity

#### basic implementation with enqueue vs dequeue

Implementation is based on either dequeuing (removing element) or enqueueing (inserting element)

- **dequeue**: element is removed at the beginning of the queue. Supports O(1) time complexity as it's a constant. Can access, insert, remove element from beginning or end of the list with O(1).

```py
--8<-- "docs/code/queue.py"
```

```py
from collections import dequeue

dequeue (['a', 'b', 'c'])
>>> llist.append('f')
```

- **enqueue**: element is inserted at the end of the queue

Essentially, a queue data structure allows us to manage elements that can shrink and grow from one end to the other end. It uses both ends of the queue to "simulate" movement in one direction or FIFO.

A pointer must be maintain to capture the node at the front of the queue or "dequeueing."

#### common leetcode algorithms

### stacks (LIFO - last in first out)

The perfect example is looking at a stack cookies separated into five separate trays with a gap between them as we don't want to rush those yummy cookies!

- tray 1 (first top level): contains chocolate chip cookies
- tray 2: contains almond cookies
- tray 3: contains peanut butter cookies
- tray 4: contains pistachio cookies
- tray 5 (the lowest level): contains pecan cookides

#### time-space complexity

#### basic implementation

How do I implement a stack algorithm so that I can get to the pistachio cookies from tray 4?

To do this, you are required to first remove tray 1, as it's a FIFO algorithm. And iteratively loop through each lower level until you get to the desired tray 4. 

In this data structure, you'll have to first remove top element to access the next element at the top. Last item inserted, is first one to get removed.

To remove top node, change head pointer, until there's a "None" value left to iterate on.

```py
--8<-- "docs/code/stack.py"
```

#### common leetcode algorithms

### sorting algorithms
#### common leetcode algorithms

### searching algorithms
#### common leetcode algorithms


### merging algorithms
#### common leetcode algorithms

### testing