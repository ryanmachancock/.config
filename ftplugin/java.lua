local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.local/share/eclipse/" .. project_name

-- Resolve jdtls from Mason install path
local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local config_os
if vim.f:lua vim.pretty_print(vim.lsp.get_active_clients({bufnr = 0}))n.has("mac") == 1 then
  config_os = "config_mac"
elseif vim.fn.has("unix") == 1 then
  config_os = "config_linux"
else
  config_os = "config_win"
end

local jar_pattern = mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"
local jar = vim.fn.glob(jar_pattern)

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", jar,
    "-configuration", mason_path .. "/" .. config_os,
    "-data", workspace_dir
  },
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
}

require("jdtls").start_or_attach(config)

