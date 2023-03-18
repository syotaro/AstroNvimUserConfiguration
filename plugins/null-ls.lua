return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- cspell start
    local cspell_config_dir = '~/.cspell'
    local cspell_data_dir = '~/.cspell'
    local cspell_files = {
      config = vim.call('expand', cspell_config_dir .. '/cspell.json'),
      user = vim.call('expand', cspell_data_dir .. '/custom-dictionary-user.txt'),
    }
    local cspell_append = function(opts)
      local word = opts.args
      if not word or word == "" then
        -- 引数がなければcwordを取得
        word = vim.call('expand', '<cword>'):lower()
      end

      -- bangの有無で保存先を分岐
      local dictionary_name = 'user'

      -- shellのechoコマンドで辞書ファイルに追記
      io.popen('echo ' .. word .. ' >> ' .. cspell_files[dictionary_name])

      -- 追加した単語および辞書を表示
      vim.notify(
        '"' .. word .. '" is appended to ' .. dictionary_name .. ' dictionary.',
        vim.log.levels.INFO,
        {}
      )
      -- cspellをリロードするため、現在行を更新してすぐ戻す
      if vim.api.nvim_get_option_value('modifiable', {}) then
        vim.api.nvim_set_current_line(vim.api.nvim_get_current_line())
        vim.api.nvim_command('silent! undo')
      end
    end

    vim.api.nvim_create_user_command(
      'CSpellAppend',
      cspell_append,
      { nargs = '?', bang = true }
    )
    -- cspell end

    local null_ls = require "null-ls"
    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- cspell start
    local cspell_custom_actions = {
      name = 'append-to-cspell-dictionary',
      method = null_ls.methods.CODE_ACTION,
      filetypes = {},
      generator = {
        fn = function(_)
          -- 現在のカーソル位置
          local lnum = vim.fn.getcurpos()[2] - 1
          local col = vim.fn.getcurpos()[3]

          -- 現在行のエラーメッセージ一覧
          local diagnostics = vim.diagnostic.get(0, { lnum = lnum })

          -- カーソル位置にcspellの警告が出ているか探索
          local word = ''
          local regex = '^Unknown word %((%w+)%)$'
          for _, v in pairs(diagnostics) do
            if v.source == "cspell" and
                v.col < col and col <= v.end_col and
                string.match(v.message, regex) then
              -- 見つかった場合、単語を抽出
              word = string.gsub(v.message, regex, '%1'):lower()
              break
            end
          end

          -- 警告が見つからなければ終了
          if word == '' then
            return
          end

          -- cspell_appendを呼び出すactionのリストを返却
          return {
            {
              title = 'Append "' .. word .. '" to user dictionary',
              action = function()
                cspell_append({ args = word })
              end
            }
          }
        end
      }
    }
    null_ls.register(cspell_custom_actions)
    -- cspell end

    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier.with({
        -- filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact", "json", "yaml", "markdown" },
      }),
      null_ls.builtins.diagnostics.textlint.with({
        filetypes = { "markdown", "html" },   -- textlintの対象
      }),
      null_ls.builtins.diagnostics.cspell.with({
        filetypes = { "markdown", "text", "json", "yaml", "html", "css", "scss", "less", "javascript",
          "javascriptreact", "typescript", "typescriptreact", "lua", "python", "rust", "dockerfile", "vim", "toml",
          "php", "ruby", "vue" },
        extra_args = { "--config", vim.fn.expand("~/.cspell/cspell.json") },
      }),
      null_ls.builtins.code_actions.cspell,

    }
    return config -- return final config table
  end,
}
