fn = include("lib/functions")
graphics = include("lib/graphics")

function init()
  endotrack = {}
  endotrack.fps = 2
  endotrack.redraw_clock_id = clock.run(redraw_clock)
  redraw()
end

function redraw_clock()
  while true do
    redraw()
    clock.sleep(1 / endotrack.fps)
  end
end

function redraw()
  graphics:setup()
  graphics:draw_mixer()
  graphics:teardown()
end