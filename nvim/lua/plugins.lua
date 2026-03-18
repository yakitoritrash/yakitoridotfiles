-- ~/.config/nvim/lua/plugins.lua
local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
local files = vim.fn.globpath(plugin_dir, "*.lua", false, true)

local plugins = {}
for _, filepath in ipairs(files) do
  -- convert path to module name, e.g. /.../lua/plugins/catppuccin.lua -> plugins.catppuccin
  local module = filepath:match(plugin_dir .. "/(.*)%.lua$")
  module = "plugins." .. module
  local ok, spec = pcall(require, module)
  if ok then
    -- some plugin files return a list, some return a single spec
    if type(spec) == "table" and #spec > 0 then
      for _, v in ipairs(spec) do table.insert(plugins, v) end
    else
      table.insert(plugins, spec)
    end
  else
    vim.notify("Failed to load plugin module: " .. module .. "\n" .. spec, vim.log.levels.ERROR)
  end
end

return plugins

