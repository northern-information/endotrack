local graphics = {}

function graphics:draw_border()
  self:rect(0, 0, 128, 64, 15)
  self:rect(1, 1, 126, 62, 0)
end

function graphics:draw_mixer()
  -- self:draw_border()
  for i = 1, 8 do
    local top_row_height = 5
    local x = (i - 1) * 16
    local w = 14
    local octatrack_level = util.linlin(0, 127, 1, 64 - top_row_height, math.random(0, 127))
    self:text(x, top_row_height, i, 15)
    self:rect(x, top_row_height + 1, w, 64, 15)
    self:rect(x, octatrack_level, 14, 2, 0)
    -- self:rect(x + w, y, 16 - w, 64, 0)
  end
  

end

-- northern information
-- graphics library

function graphics.init()
  screen.aa(0)
  screen.font_face(0)
  screen.font_size(8)
end

function graphics:setup()
  screen.clear()
end

function graphics:teardown()
  screen.update()
end

function graphics:mlrs(x1, y1, x2, y2, l)
  screen.level(l or 15)
  screen.move(x1, y1)
  screen.line_rel(x2, y2)
  screen.stroke()
end

function graphics:mls(x1, y1, x2, y2, l)
  screen.level(l or 15)
  screen.move(x1, y1)
  screen.line(x2, y2)
  screen.stroke()
end

function graphics:rect(x, y, w, h, l)
  screen.level(l or 15)
  screen.rect(x, y, w, h)
  screen.fill()
end

function graphics:circle(x, y, r, l)
  screen.level(l or 15)
  screen.circle(x, y, r)
  screen.fill()
end

function graphics:text(x, y, s, l)
  screen.level(l or 15)
  screen.move(x, y)
  screen.text(s)
end

function graphics:text_right(x, y, s, l)
  screen.level(l or 15)
  screen.move(x, y)
  screen.text_right(s)
end

function graphics:text_center(x, y, s, l)
  screen.level(l or 15)
  screen.move(x, y)
  screen.text_center(s)
end

return graphics