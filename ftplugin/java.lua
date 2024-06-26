-- Followed guide fmund here https://sookocheff.com/post/vim/neovim-java-ide/
local home = os.getenv("HOME")
local lsp_attach = require("user.lsp-on-attach")
local jdtls = require("jdtls")

local local_share_dir = home .. "/.local/share"
local jdtls_dir = local_share_dir .. "/nvim/mason/packages/jdtls"
local plugins_dir = jdtls_dir .. "/plugins"
local eclipse_dir = local_share_dir .. "/eclipse"
local java_install_dir = "/opt/homebrew/opt"

-- File types that signify a Java project's root directory. This will be
-- used by eclipse to determine what constitutes a workspace
local root_markers = { "gradlew", "mvnw", "pom.xml", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)

-- eclipse.jdt.ls stores project specific data within a folder. If you are working
-- with multiple different projects, each project must use a dedicated data directory.
-- This variable is used to configure eclipse to use the directory name of the
-- current project found using the root_marker as the folder for project specific data.
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local eclipse_workspace = eclipse_dir .. "/" .. project_name

local cmd = {
  "java",
  "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  "-Dosgi.bundles.defaultStartLevel=4",
  "-Declipse.product=org.eclipse.jdt.ls.core.product",
  "-Dlog.protocol=true",
  "-Dlog.level=ALL",
  "-Xmx4g",
  "--add-modules=ALL-SYSTEM",
  "--add-opens",
  "java.base/java.util=ALL-UNNAMED",
  "--add-opens",
  "java.base/java.lang=ALL-UNNAMED",
  -- If you use lombok, download the lombok jar and place it in ~/.local/share/eclipse
  "-javaagent:"
  .. jdtls_dir
  .. "/lombok.jar",
  -- The jar file is located where jdtls was installed. This will need to be updated
  -- to the location where you installed jdtls
  "-jar",
  plugins_dir .. "/org.eclipse.equinox.launcher_1.6.800.v20240304-1850.jar",

  -- The configuration for jdtls is also placed where jdtls was installed. This will
  -- need to be updated depending on your environment
  "-configuration",
  jdtls_dir .. "/config_mac",

  -- Use the workspace_folder defined above to store data for this project
  "-data",
  eclipse_workspace,
}

local config = {
  flags = {
    debounce_text_changes = 80,
  },
  on_attach = lsp_attach.java, -- We pass our on_attach keybindings to the configuration map
  root_dir = root_dir,        -- Set the root directory to our found root_marker
  -- Here you can configure eclipse.jdt.ls specific settings
  -- These are defined by the eclipse.jdt.ls project and will be passed to eclipse when starting.
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      home = java_install_dir .. "/openjdk@17",
      -- formatting is handled by null-ls "google-java-format" tool that is installed via homebrew
      -- format = {
      -- 	-- settings = {
      -- 	-- 	url = eclipse_dir .. "/eclipse-java-google-style.xml",
      -- 	-- 	profile = "GoogleStyle",
      -- 	-- },
      -- },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" }, -- Use fernflower to decompile library code
      -- Specify any completion options
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },
      -- Specify any options for organizing imports
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      -- How code generation should act
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
      -- If you are developing in projects with different Java versions, you need
      -- to tell eclipse.jdt.ls to use the location of the JDK for your Java version
      -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
      -- And search for `interface RuntimeOption`
      -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
      configuration = {
        runtimes = {
          {
            name = "JavaSE-17",
            path = java_install_dir .. "/openjdk@17/libexec/openjdk.jdk/Contents/Home",
            default = true,
          },
          {
            name = "JavaSE-11",
            path = java_install_dir .. "/openjdk@11/libexec/openjdk.jdk/Contents/Home",
          },
        },
      },
    },
  },
  -- here is what is passed to the command line to execute jdtls.
  -- Note that eclipse.jdt.ls must be started with a Java version of 17 or higher
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  -- for the full list of options
  cmd = cmd,
}

-- Finally, start jdtls. This will run the language server using the configuration we specified,
-- setup the keymappings, and attach the LSP client to the current buffer
jdtls.start_or_attach(config)
