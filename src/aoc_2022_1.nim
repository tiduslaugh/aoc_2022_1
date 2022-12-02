# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
import std/strutils
import std/sequtils
import algorithm

proc loadFile(file: File): seq[seq[int]] =
  var line: string
  var currentBag: seq[int]
  while file.readLine(line):
    if line != "":
      currentBag.add(parseInt(line))
    else: 
      result.add(currentBag)
      currentBag = @[]

proc sum(sequence: seq[int]): int =
  return sequence.foldl(a + b)

proc findHighest(data: seq[seq[int]]): int =
  data.map(sum).max

proc findThreeHighest(data: seq[seq[int]]): int =
  data.map(sum).sorted.reversed[0..2].sum

when isMainModule:
  let f = open("input.txt")
  let data = loadFile(f)
  echo(findHighest(data))
  echo(findThreeHighest(data))
