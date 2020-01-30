[![Build Status](https://travis-ci.com/samfolo/battleships-tech-test.svg?branch=master)](https://travis-ci.com/samfolo/battleships-tech-test)
# battleships-tech-test
Battleships – Technical Test: code quality; best practices; process.

## User Stories

```
As a player
So that I can prepare for the game
I would like to place a ship in a board location

As a player
So that I can play a more interesting game
I would like to have a range of ship sizes to choose from

As a player
So the game is more fun to play
I would like a nice command line interface that lets me enter ship positions and shots using commands (rather than using IRB to interact with objects)

As a player
So that I can create a layout of ships to outwit my opponent
I would like to be able to choose the directions my ships face in

As a player
So that I can have a coherent game
I would like ships to be constrained to be on the board

As a player
So that I can have a coherent game
I would like ships to be constrained not to overlap

As a player
So that I can win the game
I would like to be able to fire at my opponent's board

As a player
So that I can refine my strategy
I would like to know when I have sunk an opponent's ship

As a player
So that I know when to finish playing
I would like to know when I have won or lost

As a player
So that I can consider my next shot
I would like to be able to see my hits and misses so far

As a player
So that I can play against a human opponent
I would like to play a two-player game
```

## Domain Model

| Nouns         | Verbs         |
| :------------ |:--------------|
| `player` | `choose` |
| `game` | `enter ship positions` |
| `ship` | `enter shots` |
| `range of sizes` | `know of win` |
| `command line interface` | `know of loss` |
| `layout of ships` | `choose directions ships face` |
| `shot` | `constrain ships to board` |
| `human opponent` | `constrain ships not to overlap` |
| `two-player game` | `fire shots` |
| | `know when shot hits` |
| | `see hits and misses so far` |

Complex verbs, more verbs than nouns

## Class Diagrams

| Player                                 | Ship                           | Board                       | Game                | ShipCreator                            |
| :------------------------------------- | :----------------------------- | :-------------------------- | :------------------ | :------------------------------------- |
|                                        |                                |                             |                     |                                        |
| `@ships`                               | `@coordinates`                 | `@ships`                    | `@player_one`       | `@ship_types`                          |
| `@board`                               | `@damage_points (coordinates)` | `@hit_points (coordinates)` | `@player_two`       |                                        |
| `@shot_history`                        |                                |                             | `@ship_creator`     |                                        |
|                                        |                                |                             |                     |                                        |
| `#fire_at(coordinate)`                 | `#take_damage(coordinate)`     | `#render`                   | `#execute(command)` | `#create(ship, coordinate, direction)` |
| `#view_shot_history`                   | `#sunken? (private)`           |                             | `#evaluate_winner`  |                                        |
| `#log_shot(coordinate, success)`       |                                |                             |                     |                                        |
|                                        |                                |                             |                     |                                        |
| `::CANNOT_PLACE_SHIP_HERE`             |                                | `::NO_SHIPS_LEFT`           |                     | `::INVALID_SHIP_TYPE`                  |
| `::INVALID_SHOT`                       |                                |                             |                     |                                        |

Once the game has started, there will have to be a method on the game class which solely deals with commands entered via `STDIN.gets.chomp`, possibly a switch statement.

Coordinates of the ship are decided clockwise from the point where the ship is placed: (include diagram for example)

## Types of Problems

### User actions
• A user takes a shot <br/>
• A user places a ship <br/>
• A user views their shot history <br/>
• Choosing a type of ship to create <br/>

### User experience
• A user wants to see their board <br/>
• A user wants to enter a memorable command <br/>

### Logging data
• Keeping track of the shot history <br/>
• Keeping track of buoyant and sunken ships <br/>

### Evaluating games
• Choosing a winner <br/>
• Notifying the winner/loser <br/>

### Creating assets
• Creating a ship <br/>
• Starting a game with two players <br/>

I feel most confident in beginning with the `Player` class, as it appears to be the class most independent from the command line interface, mostly dealing with managing state and executing user actions.