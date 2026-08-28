local fs = require("santoku.fs")
local vendor = require("santoku.make.vendor")

local vendored = {
  {
    file = "deps/sundown/sundown-37728fb2d7137ff7c37d0a474cb827a8d6d846d8.tar.gz",
    url = "https://github.com/vmg/sundown/archive/37728fb2d7137ff7c37d0a474cb827a8d6d846d8.tar.gz",
    sha256 = "1819a8f5725077e54586c426b93c5537f9b371dc0b9588ab776e909abf3e00ca",
  },
}

local include = {}
for i = 1, #vendored do
  include[i] = vendored[i].file
end

local env = {

  name = "santoku-markdown",
  version = "2.2.0-1",
  license = "MIT",
  public = true,

  rules = {
    include = include,
  },

  dependencies = {
    "lua == 5.1",
    "santoku >= 2.0.0, < 3.0.0",
  },

  test = {
    dependencies = {
      "luacov >= 0.15.0-1",
    }
  },

  configure = function (submake, envs)
    for i = 1, #vendored do
      local v = vendored[i]
      local dest = fs.join(envs.root.build_dir, v.file)
      submake.target({ dest }, { "make.lua" }, function ()
        vendor.fetch(v, dest)
      end)
    end
  end,

}

env.homepage = "https://github.com/birchpointswe/lua-" .. env.name
env.tarball = env.name .. "-" .. env.version .. ".tar.gz"
env.download = env.homepage .. "/releases/download/" .. env.version .. "/" .. env.tarball

return {

  env = env,
}
