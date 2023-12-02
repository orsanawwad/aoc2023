defmodule Day2Test do
  use ExUnit.Case
  # doctest Day2

  test "test AOC 2023 Day 1" do
    assert Day2.part1("test.txt") == 8
    assert Day2.part1("input.txt") == 2720
    assert Day2.part2("test.txt") == 2286
    assert Day2.part2("input.txt") == 71535
  end

  test "test AOC 2023 Day 1 Refactor" do
    assert Day2Refactor.part1("test.txt") == 8
    assert Day2Refactor.part1("input.txt") == 2720
    assert Day2Refactor.part2("test.txt") == 2286
    assert Day2Refactor.part2("input.txt") == 71535
  end
end
