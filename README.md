## War or Peace Project

  ```
  ╭╮╭╮╭┳━━━┳━━━╮╭━━━┳━━━╮╭━━━┳━━━┳━━━┳━━━┳━━━╮
  ┃┃┃┃┃┃╭━╮┃╭━╮┃┃╭━╮┃╭━╮┃┃╭━╮┃╭━━┫╭━╮┃╭━╮┃╭━━╯
  ┃┃┃┃┃┃┃╱┃┃╰━╯┃┃┃╱┃┃╰━╯┃┃╰━╯┃╰━━┫┃╱┃┃┃╱╰┫╰━━╮
  ┃╰╯╰╯┃╰━╯┃╭╮╭╯┃┃╱┃┃╭╮╭╯┃╭━━┫╭━━┫╰━╯┃┃╱╭┫╭━━╯
  ╰╮╭╮╭┫╭━╮┃┃┃╰╮┃╰━╯┃┃┃╰╮┃┃╱╱┃╰━━┫╭━╮┃╰━╯┃╰━━╮
  ╱╰╯╰╯╰╯╱╰┻╯╰━╯╰━━━┻╯╰━╯╰╯╱╱╰━━━┻╯╱╰┻━━━┻━━━╯  
```
## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Status](#status)
* [Contact](#contact)

## General info
This project is a Ruby implementation of the card game 'War.' It is fully automated and prints out the results of each turn until the end of the game.

## Technologies
Project is created with:
* Ruby version: 2.5.3

## Setup
To run this game, save a copy of this repository locally. Then, run it using ruby in the MacOS application 'Terminal':
(note: '$' is not typed)

```
$ cd ../war_or_peace
$ ruby war_or_peace_runner.rb
```

## Features
List of features ready and TODOs for future development
* Takes three arrays of suits, ranks, values, then creates a ranks_and_value_hash, finally iterating to generate a standard deck of playing card objects
* Displays the results of each turn as well as the number of cards in the turn winner's hand
* Runs up to a million turns before calling a draw
* First time to create a project of this size, with multiple classes/test files, runner file, setup methods for minitest

To-do list:
* Improve functionality: when turn.winner is set to the string "No Winner," creates an error tied to line 76 in game.rb
* Refactoring, including deleting comments in code
* Additional refactoring

## Status
Project is: _completed_

## Contact
Created by
* [@joemecha](https://github.com/joemecha)


![Mastermind title image](/images/spg_zk.jpg "War and Peace Image")
