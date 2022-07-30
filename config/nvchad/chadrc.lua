local M = {}

M.plugins = {
   user = require "custom.plugins",
   override = require "custom.plugins.configs",
}

return M
