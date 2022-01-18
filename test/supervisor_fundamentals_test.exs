defmodule SupervisorFundamentalsTest do
  use ExUnit.Case
  doctest SupervisorFundamentals

  test "greets the world" do
    assert SupervisorFundamentals.hello() == :world
  end
end
