local graphics = {}

function graphics.init()
  screen.aa(0)
  screen.font_face(0)
  screen.font_size(8)
  graphics.screen_dirty = true
  graphics.max_width = 128
  graphics.max_height = 64
  graphics.fps = 15
  graphics.top_row_height = 5
  graphics.track_width = 16
end

function graphics:draw_border()
  self:rect(0, 0, 128, 64, 15)
  -- self:rect(1, 1, 126, 62, 0)
end

function graphics:draw_track_numbers()
  for i = 1, 8 do
    local x = (i - 1) * self.track_width
    self:text(x, self.top_row_height, i, 15)
  end
end

function graphics:draw_octatrack_levels()
  for i = 1, 8 do
    local x = (i - 1) * self.track_width
    local y = self.max_height
    local w = self.track_width - 2
    local raw_level = buffer:get_octatrack_level(i)
    local max_level = self.max_height - (self.top_row_height + 1)
    local h = util.linlin(0, 127, 0, max_level, raw_level)
    self:rect(x, y, w, -h, 15)        -- background
  end
end

function graphics:draw_controller_levels()
  for i = 1, 8 do
    local x = (i - 1) * self.track_width
    local y = self.max_height
    local w = self.track_width - 2
    local raw_level = buffer:get_controller_level(i)
    -- if raw_level < buffer:get_octatrack_level(i) then
      local max_level = self.max_height - (self.top_row_height + 1)
      local h = util.linlin(0, 127, 0, max_level, raw_level)
      self:rect(x, y, w, -h, 15)          -- background
      self:rect(x, y, 1, -h, 0)           -- left margin
      self:rect(x + w - 1, y, 1, -h, 0)   -- right margin
      for i = 0, y do
        if i > y - h and i % 2 == 0 then
          self:mlrs(x, i, w, 1, 0)        -- dashes
        end
      end
    -- end
  end
end

-- northern information
-- graphics library

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