class Game < ApplicationRecord

  def Game.generate
    Game.create!(
      game_id: generate_id,
      x: rand(100) + 1,
      y: rand(100) + 1,
      completed: false
    )
  end

  def guess(guessed_x, guessed_y)
    xclue = clue(guessed_x, x)
    yclue = clue(guessed_y, y)
    if xclue == '=' && yclue == '='
      update_attribute(:completed, true)
    end
    {
      x: xclue,
      y: yclue
    }
  end

  def clue(guess, actual)
    if actual > guess
      'higher'
    elsif actual < guess
      'lower'
    elsif actual == guess
      'right'
    end
  end

  def Game.generate_id
    opts = 'bcdfghjlkmnpqrstvwxyz'
    20.times.map {
      opts[rand(opts.length)]
    }.join
  end

end
