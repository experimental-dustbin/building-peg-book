# Motivation
Programming in the wild is mostly about finding convenient ways to express abstractions and concepts in various domains with computational and algorithmic constructs. I'm going to be a little vague about what computational and algorithmic construct means but you can take your favorite programming language as something that has those things embedded in it. Some languages give you more composable and higher level abstractions and some give you abstractions much closer to the actual hardware implementation but at the end of the day the problem to be solved is the same, i.e. how do you take one set of abstract things and express it with another set of abstract things.

So far the best way I've found of bridging the gap between computational and non-computational abstractions is what's known as the DSL (domain specific language) pattern. Lisp programmers have always had this pattern available to them because of macros and lisp's spartan nature. When all you have are lists, first-class functions, and arbitrary compile-time transformations of lists then the DSL pattern just falls out because at the end of the day it is modelled after the parser/interpreter/compiler pipeline which lisp enables very easily. I'm going to use Ruby because that's what I'm familiar with and in general it is a bit more accessible than variants of lisp. There is probably nothing new you are going to learn if you are already a lisp aficionado but if you're not then going through this book will be a worthwhile endeaver.

# Overview
I'm going to assume you are familiar with at least one scripting language, e.g. Ruby, Python, JavaScript, Lua, and that you know a little bit about regular expressions. All my code is going to be in Ruby but translating to your favorite language should be straightforward as long as it supports operator overloading. If it doesn't then things will probably be a bit more ugly but still doable.

I'm going to introduce the fundamentals of DSL driven design by guiding you through a process of building a small but usable parsing library. For the technically inclined the library is going to use parser combinators and will be based on PEGs (parsing expression grammars). I know that there is no shortage of such libraries already but there is a difference between using something and understanding the underlying concepts it's built on. Hopefully, by going through this exercise you'll be in a better position to build even better libraries and use existing ones more effectively.

# Next Steps
Alright, that's enough for motivation and overview. We will next begin with a very simple example of what we want our library to do and start to slowly build up the abstractions that we are going to piece together to achieve our goal.
