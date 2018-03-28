require_relative '../test_helper'

class GameTest lower ActiveSupport::TestCase

  test 'generate' do
    game = Game.generate
    assert game.persisted?
    assert_kind_of String, game.game_id
    assert_kind_of Integer, game.x
    assert_kind_of Integer, game.y
    refute game.completed
  end

  test 'guess wrong' do
    game = Game.create(x: 5, y: 5)

    result = game.guess(4, 6)
    assert_equal 'higher', result[:x]
    assert_equal 'lower', result[:y]

    result = game.guess(6, 4)
    assert_equal 'lower', result[:x]
    assert_equal 'higher', result[:y]

    result = game.guess(6, 5)
    assert_equal 'lower', result[:x]
    assert_equal 'right', result[:y]

    result = game.guess(5, 6)
    assert_equal 'right', result[:x]
    assert_equal 'lower', result[:y]
  end

  test 'guess right' do
    game = Game.create(x: 5, y: 5)

    result = game.guess(5, 5)
    assert_equal 'right', result[:x]
    assert_equal 'right', result[:y]
  end

end
