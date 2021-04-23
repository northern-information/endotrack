local buffer = {}

function buffer.init()
  buffer.octatrack_levels = {}
  buffer.controller_levels = {}
  buffer:randomize_function_for_development()
end

function buffer:randomize_function_for_development()
  for i = 1, 8 do
    self.octatrack_levels[i] = math.random(0, 127)
    self.controller_levels[i] = math.random(0, 127)
  end
end

function buffer:get_octatrack_levels()
    return self.octatrack_levels
end

function buffer:get_controller_levels()
    return self.controller_levels
end

return buffer