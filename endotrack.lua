fn = include("lib/functions")
_midi = include("lib/_midi")
buffer = include("lib/buffer")
graphics = include("lib/graphics")

function init()
  _midi.init()
  graphics.init()
  buffer.init()
  redraw_clock_id = clock.run(redraw_clock)
end

function key(k, z)
  if z == 1 then return end
  if k == 2 then
    print("randomize function for development")
    buffer:randomize_function_for_development()
  elseif k == 3 then
    print("midi 61 mash")
  end
  graphics.screen_dirty = true
end

function redraw_clock()
  while true do
    if graphics.screen_dirty then
      redraw()
      graphics.screen_dirty = false
    end
    clock.sleep(1 / graphics.fps)
  end
end

function redraw()
  graphics:setup()
  -- graphics:draw_border()
  graphics:draw_octatrack_levels()
  graphics:draw_controller_levels()
  graphics:draw_track_numbers()
  graphics:teardown()
end