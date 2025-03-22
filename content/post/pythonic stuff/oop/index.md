---
title: OOP Design and Principles
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
projects: ["data wrangling"]
---

## what are interfaces?

Interfaces is one of the many OOP design principles in Python. You can think of interfaces as an abstraction layer. Before designing a logical layer of your code, you build a code design framework laying out how you want to map out your model in code like creating a UML. They're essentially a `blueprint` to help lay out your OOP design, ensuring it encapsulate things like duck-typing, polymorphism, inheritance, and encapsulation are efficiently optimized.

**The blueprint composition**

- defined methods
- methods are abstract where the interface defines them without any implementation

**Class design for blueprint**

- implement the interface for your model
- give concrete definitions to your abstract methods

> There are Python `formal` and `informal interfaces` that defines the blueprint, which we'll implement with a use case here.

### informal interfaces

This defines methods to get overriden.
Strict rules may not be required.
There are no enforcement put in place.
It's supposedly pythonically consistent with the language philosophy!

This may result in problems due to its loose rules (shocking!!)!

There are `metaclasses` and `virtual base classes (VBC)`. When you implement a metaclass, ensure you validate its subclasses and abstract methods are correctly inherited using `issubclass(class1(), class2()).`

For example, let's say you want to build a bike. The interfaces that consist of building a bike that you'll need:

- a bike frame
- a set of wheels
- gear
- brake
- handle bars, etc...

Here, we are creating a an informal interface - laying out the design model, and not implementation. The methods are abstract.

```py
--8<-- "docs/code/bike/bikeconfig.py"
```

Next, we are going to implement a concrete class object using formal interface to implement the bike with some style!

```py
--8<-- "docs/code/bike/bikebuild.py"
```
