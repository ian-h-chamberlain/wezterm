---@meta wezterm

---@module 'config'
local config

---@return Config
--- Returns a config builder object that can be used to define your configuration.
function config_builder() end

return {
    config_builder = config_builder,
}
