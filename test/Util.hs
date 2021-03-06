module Util where

import Protolude

import Player(Player)
import Coordinate(Coordinate)
import Board(Board)

import Move(move)

onlyIf :: Bool -> a -> Maybe a
onlyIf f x = if f then Just x else Nothing

tryMove :: Player -> Coordinate -> Board -> Maybe Board
tryMove me coord board = onlyIf legal newBoard where
  (legal, newBoard) = runState (move me coord) board
