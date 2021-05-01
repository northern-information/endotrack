local buffer = {}

function buffer.init()
  buffer.octatrack_levels = {}
  buffer.controller_levels = {}
  buffer.is_synced = {}
  for i = 1, 8 do
    buffer.octatrack_levels[i] = 0
    buffer.controller_levels[i] = 0
    buffer.is_synced[i] = true
  end
  buffer:randomize_function_for_development()
end

function buffer:run_logic(i)
  local ol = self:get_octatrack_level(i)
  local cl = self:get_controller_level(i)
  if ol > cl then
    self.is_synced[i] = false
    print("octa greater than controller")
  elseif ol < cl then
    self.is_synced[i] = false
    print("octa less than controller")
  elseif ol == cl then
    self.is_synced[i] = true
    print("octa equals controller")
  else
    print("???")
  end
end

function buffer:randomize_function_for_development()
  for i = 1, 8 do
    self.octatrack_levels[i] = math.random(0, 127)
    self.controller_levels[i] = math.random(0, 127)
    self:run_logic(i)
  end
end

function buffer:get_octatrack_levels()
  return self.octatrack_levels
end

function buffer:set_octatrack_level(i, l)
  self.octatrack_levels[i] = l
  self:run_logic(i)
end

function buffer:get_octatrack_level(i)
  return self.octatrack_levels[i]
end

function buffer:get_controller_levels()
  return self.controller_levels
end

function buffer:set_controller_level(i, l)
  self.controller_levels[i] = l
  self:run_logic(i)
end

function buffer:get_controller_level(i)
  return self.controller_levels[i]
end

return buffer