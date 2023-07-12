# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN

  def test_create
    assert { Stack.new.instance_of?(Stack) }
  end

  def test_push
    stack = Stack.new
    stack.push!(1)

    assert { stack.to_a.size == 1 }

    stack.push!(2)

    assert { stack.to_a.size == 2 }

    stack.push!(3)

    assert { stack.to_a.size == 3 }
    assert { stack.to_a == [1, 2, 3] }
  end

  def test_pop
    stack = Stack.new([1, 2, 3])

    expected_element = stack.to_a.last

    assert { expected_element == stack.pop! }
  end

  def test_empty
    empty_stack = Stack.new

    assert { empty_stack.empty? }
    assert { empty_stack.to_a.empty? }
  end

  def test_clear
    stack = Stack.new([2])
    stack.clear!

    assert { stack.to_a.empty? }
    assert { stack.empty? }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
