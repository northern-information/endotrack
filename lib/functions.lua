local fn = {}

function fn.scan_directory(directory)
  local i, t, popen = 0, {}, io.popen
  local pfile = popen('ls -a "' .. directory .. '"')
  for filename in pfile:lines() do
    if filename ~= "." and filename ~= ".." then
      i = i + 1
      t[i] = filename
    end
  end
  pfile:close()
  return t
end

function rerun()
  norns.script.load(norns.state.script)
end

function r()
  rerun()
end

return fn