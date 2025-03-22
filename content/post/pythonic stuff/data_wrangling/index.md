---
title: 'Data Restructuring and Formatting'
# subtitle: 'Create a beautifully simple website in under 10 minutes :rocket:'
summary: Exploring Python's data transformation and formatting capabilities, including parsing and validation, optimization and serialization, and conversion to versatile data objects such as dictionaries, lists, tuples, sets, and arrays, utilizing popular Python libraries.
authors:
- admin
tags:
- python
- data wrangling
categories: []
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

## functional programming using functional tools

Functional tools are essentially the fundamental components of functional programming, that leverages these built-in functions. What's really neat about them is that these functions not only optimize how you passed in iterables with time-complexity efficiency and memory, but also fewer lines of code to write!

<!-- ### map -->

We can use map() to iterate and transform all the elements in the iterable without using the `for loop`. map() is also written in C, so it's highly optimized. With a `for loop`, the entire list is in your system memory, while the map() outputs each item based on demand during execution. So instead of an entire list living the local system's memory, only one item is dumped into your memory.

**syntax**

```sh
map(function, iterable[n1, n2...nth])
```

#### uses cases

```sh
numbers = [2, 3, 8, 2]

def map_numbers(numbers):
    return numbers**3

triple = list(map(map_numbers, numbers))

>> [8, 27, 512, 8]

```

Another common use case is using lambda in map() function.

```sh

```

<!-- ### reduce -->

### filter

Without being said, filter() is literally to `filter` an item in an iterable to generate a new iterable.

## json

Working with JSON can be painful sometimes, particularly when the object you're trying to serialize is really massive or contains many nested objects within it and trying to untangle them into flat objects is a challenge. As a data engineer, I'v come acrossed those pain points in the past and have used many different Python libraries to parse JSON data sets ansoud the usual standard one is [`json`](https://docs.python.org/3/library/json.html) package. The other ones are [ujson](https://mpython.readthedocs.io/en/master/library/pythonStd/ujson.html), and [orjson](https://medium.com/geekculture/python-orjson-cb046b47ab8c), which I won't go into details, but you can read up on those links here.  Essentially orjson supports dataclasses, datetimes, and numpy pretty well; and ujson   allows quick conversion between Python objects and JSON data formats; if that's what you're specifically targeting at over speed, type hint or schema validation features then those are the JSON libraries you may want to check it out as well or do a quick comparison and see which fits what you're trying to do.

### json util

Data format conversion from csv to json would typically only makes sense when you're dealing with large volume of data that needs to scale for more complex data manipulation or transformation projects like a data science project that involves complex visualization tasks, while requiring those viz to be optimally performant during high I/O usages. And as you go along, you might need to revise some large data content to adjust to what you're trying to visualize or manipulate as a result for better readability and interopabiity. This makes JSON very versatile to operate as it's heterogenously friendly across various platforms and languages, because it's a universal data format. Lastly, it's much easier to devise different data structures like a hashmap or an array to improve the I/O and performance of read/write.

Let's dive into a sample yet small csv dataset where n = 1248 with 33 observations; and for the sake of this demo, my focus is  to showcase snippets of json optimization and manipulation approaches you can take!

Here is the [data source](https://zenodo.org/record/5646557#.Y9awZ9JKiEJ) that I used that you can further tinker with if you so inspired to! :)

This code should run like a charm! You can test it yourself by copying the code directly and execute, once you downloaded the data source linked above. Let me know if you find some other cool ways to serialize and optimize JSON format.

I'll continuing extending this codebase here, so check back soon!

<!-- ```py
# --8<-- "docs/code/data_parsing.py"
``` -->

![data](../assets/images/data3.png)

## msgspec

One interesting package I've recently discovered that can help speed up the serialization and schematic evolution and validation capabilities is [msgspec](https://pypi.org/project/msgspec/). It's integrated with [type annotations](https://docs.python.org/3/library/typing.html).  It supports both JSON and MessagePack, which is a faster alternative format to standard JSON modules.  If you’re parsing JSON files on a regular basis, and you’re hitting performance or memory issues, consider checking out this out!

- It's fast and friendly
- Encode messages as JSON or MessagePack
- Decode messages back into Python types
- It allows you to define schemas for the records you’re parsing
- It lets you define the fields you only care about
- Better validation messages - it lets you prescribed error type hint messages than just a 500 error message

One point I want to raise is msgspec also supports **schema evolution and validation** I find this super useful, especially when data is constantly evolving, they're nice features to have when your client data like an API suddenly decides to make changes to one of its params that you're unaware of, or it evolves, msgspec will automatically adjust to those changes between clients in your schema within your systems in the server end. And if one of those records has a missing a field within those changes made, or value has a wrong data type, like an int instead of a str, this parser will yell at ya to check it out before the parser continues processing! With standard JSON libraries, schema validation has to happen separately.

### install

```sh
pip install msgspec
```

### usage from doc

```Python
from typing import Optional, Set

import msgspec

class User(msgspec.Struct):
    """A new type describing a User"""
    name: str
    groups: Set[str] = set()
    email: Optional[str] = None
```

Encode messages as JSON or MessagePack.

```Python
>> alice = User("alice", groups={"admin", "engineering"})

>> alice
# User(name='alice', groups={"admin", "engineering"}, email=None)

>> msg = msgspec.json.encode(alice)

>> msg
# b'{"name":"alice","groups":["admin","engineering"],"email":null}'
```

Decode messages back into Python types (with optional schema validation).

```Python
>> msgspec.json.decode(msg, type=User)
# User(name='alice', groups={"admin", "engineering"}, email=None)

>> msgspec.json.decode(b'{"name":"bob","groups":[123]}', type=User)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
msgspec.ValidationError: Expected `str`, got `int` - at `$.groups[0]`
```

## pydantic

The first time I heard about pydantic was when I was listening to a python podcast "Talk Python To Me" hosted by Michael Kennedy. I was super intrigued when the creator of pydantic, Samuel Colvin, talked about what led him to this awesome creation. If you want to listen to all the cool stuff about [pydantic generation](https://talkpython.fm/episodes/show/313/automate-your-data-exchange-with-pydantic), check out the podcast as it's totally inspiring and worth your time. I promise! :)

In a nutshell, [Pydantic](https://docs.pydantic.dev/) is a data validation and parsing python module that takes advantage of type annotations by enforcing type hints at runtime. It's essentially an abstraction layer like adding those sugar-free whipped frosting on a cake, where it doesn't change the ingredients or logics used, but it will make the cake tastes extra yummy on the exterior. This frosting layer, will handle data parsing and validation features when it's integrated into your codebase.

### type annotations

[Type annotations](https://docs.python.org/3/library/typing.html) or type hints that are essentially a defined set of values or functions that gets applied during runtime. These types can be a boolean, integer, or string, or any other type hint that you can think of that is defined during runtime as an expected return value.

Pydantic supports these [standard library types](https://docs.pydantic.dev/usage/types/#standard-library-types) including many [common used types](https://docs.pydantic.dev/usage/types/#pydantic-types). I'm not going to go too deep into these topics here, but you can read up on yourself.

Also, for more detail explanations on type hints theory, which I find it pretty cool, check it out [here](https://peps.python.org/pep-0483/)!

### install

**via pip install**

```python
pip install pydantic
```

**via source**

```python
pip install git+git://github.com/pydantic/pydantic@main#egg=pydantic
# or with extras that contains email and or file support dependencies
pip install git+git://github.com/pydantic/pydantic@main#egg=pydantic[email,dotenv]
```

### usage
