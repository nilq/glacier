export game = {
  objects: {} -- game objects of the world
}



camera = require "game/camera"
bar    = require "game/sexybar"
level  = require "game/level"
grid   = require "game/grid"


sprites = {
  player: love.graphics.newImage "res/ninja.png"
}



game.spawn = (object) =>
  @objects[#@objects + 1] = object


game.load = =>
  @objects = {}

  @camera  = camera.make 0, 0, 3, 3, 0
  @world   = lib.bump.newWorld!
  @grid    = grid.make!

  @sprites = sprites

  @bar     = bar.make!

  @bar\add({ sprite: sprites.player, make: (require "game/objects")["block"].make })

  level\load "res/levels/0.png", @


game.update = (dt) =>
  for object in *@objects
    object\update dt if object.update

  @bar\update dt

game.draw = =>
  @camera\set!

  @grid.draw!

  for object in *@objects
    object\draw! if object.draw

  if @bar.current
    with love.graphics
      .setColor 1, 1, 1

      mouse_x = @camera\left! + love.mouse.getX! / @camera.sx
      mouse_y = @camera\top!  + love.mouse.getY! / @camera.sy

      .draw @bar.current.sprite, mouse_x - mouse_x % @grid.block_scale, mouse_y - mouse_y % @grid.block_scale


  @camera\unset!

  @bar\draw!


game.press = (key) =>
  for object in *@objects
    object\press key if object.press


game.release = (key) =>
  for object in *@objects
    object\release key if object.release

game.click = (x, y, button, is_touch) =>
  @bar\click x, y, button, is_touch

game
