local currentResource = GetCurrentResourceName()

package = {}

package.loaded = {
  string    = string,
  debug     = debug,
  package   = package,
  _G        = _G,
  io        = io,
  os        = os,
  table     = table,
  math      = math,
  coroutine = coroutine,
}

package.config = [[
\
;
?
!
-
]]

loadfile = function(name)

  local code = LoadResourceFile(currentResource, name)

  if code == nil then
    return nil
  else
    return load(code)
  end

end

function require(name)


  if package.loaded [name] ~= nil then
    return package.loaded[name]
  end

  local code = LoadResourceFile(currentResource, '__lib/' .. name)               -- lib/foo.bar

  if code == nil then
    code = LoadResourceFile(currentResource, '__lib/' .. name .. '.lua')         -- lib/foo.bar.lua
  end

  if code == nil then
    
    local path = string.gsub(name, '[\\.]', '/')
    code       = LoadResourceFile(currentResource, '__lib/' .. path)             -- lib/foo/bar

    if code == nil then
      code = LoadResourceFile(currentResource, '__lib/' .. path .. '/init.lua')  -- lib/foo/bar/init.lua
    end

    if code == nil then
      code = LoadResourceFile(currentResource, '__lib/' .. path .. '.lua')       -- lib/foo/bar.lua
    end

  end

  if code == nil then
    error('Module ' .. name .. ' not found')
    return nil
  end

  local stub = 'local __STUB = function(...)' .. "\n" .. code .. "\n" .. 'end' .. "\n" .. 'return __STUB(\'' .. name .. '\')'

  package.loaded[name] = load(stub)()

  return package.loaded[name]
 
end
