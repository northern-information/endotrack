local _midi = {}

function _midi.init()
  _midi.active_controller = 1 -- for when more adaptors are added
  _midi.controller = midi.connect(n)
  _midi.controller.event = function(data)
    local faders = _midi.adaptors[_midi.active_controller].faders
    for fader_index, fader_code in ipairs(faders) do
      if data[2] == fader_code then
        buffer:set_controller_level(fader_index, data[3])
        graphics.screen_dirty = true
      end
    end
  end
  _midi.adaptors = {}
  _midi:register_all_adaptors()
end

function _midi:register_all_adaptors()
  for k, file in pairs(fn.scan_directory(_path.code .. "endotrack/adaptors")) do
    include("adaptors/" .. string.gsub(file, ".lua", ""))
  end
end

function _midi:register_adaptor(adaptor)
  self.adaptors[#self.adaptors + 1] = adaptor
end

return _midi