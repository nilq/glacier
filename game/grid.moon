make = ->
  grid = {
    block_scale: 20
  }

  grid.draw = =>

    with game.camera
      love.graphics.setLineWidth(1 / .sx)
      love.graphics.setColor(0, 0, 0)

      --Vertical lines
      offset = \left! % grid.block_scale

      for i = 0, \width! / grid.block_scale do
        --Top point
        --Each line is slitghly more to the right than previous one
        x1, y1 = \left! - offset + i * grid.block_scale, \top!
        --Bottom point
        x2, y2 = x1, \bot!
        --Line from top to bottom
        love.graphics.line x1, y1, x2, y2

      --Horizontal lines
      offset = \top! % grid.block_scale

      for i = 0, \height! / grid.block_scale do
        --Left point     each line is slitghly lower than the previous one
        x1, y1 = \left!, \top! - offset + i * grid.block_scale
        --Right point
        x2, y2 = \right!, y1
        --Draw line from left to right
        love.graphics.line x1, y1, x2, y2

  grid

{
  :make
}