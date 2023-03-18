-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- set to true or false etc.
    -- relativenumber = true, -- sets vim.opt.relativenumber
    -- number = true, -- sets vim.opt.number
    -- spell = false, -- sets vim.opt.spell
    -- signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    -- wrap = false, -- sets vim.opt.wrap
    -- ambiwidth = "single", -- https://github.com/rbtnn/vim-ambiwidth
    autoread = true,                -- ファイルが他で変更されている場合に自動的に読み直します
    backspace = "indent,eol,start", -- インサートモード中の BS、CTRL-W、CTRL-U による文字削除を柔軟にする
    backup = false,
    clipboard = "unnamedplus",      -- クリップボードを共有する
    hidden = true,
    hlsearch = true,
    list = true, -- 不可視文字表示
    mouse = "a",
    number = true,
    relativenumber = false,
    ruler = false,
    scrolloff = 8,
    shiftwidth = 2,
    showcmd = true,
    sidescrolloff = 8,
    spell = false, -- sets vim.opt.spell
    swapfile = false,
    tabstop = 2,
    undofile = false,
    whichwrap = "b,s,h,l,[,],<,>", -- カーソルを行頭、行末で止まらないようにする
    wildmenu = true,               -- コマンドラインで補完候補をメニュー表示する
    wrap = false,
    writebackup = false,
    -- autoindent = true, -- ファイル保存時に、自動でインデントを揃える
    encoding = "utf-8",
    fenc = "utf-8", -- ファイルのエンコーディングを指定
    -- helplang = "ja",
    -- shell = "fish",
    -- smartindent = true, -- ファイル保存時に、自動でインデントを揃える
    -- title = true,
    -- AstroNVIMでデフォルト設定されているので、あえてやらないでいいやつ
    ---- listchars = "tab:▸ ,trail:_,extends:>,precedes:<,nbsp:%", -- " 不可視文字の表示形式
    ---- signcolumn = "true", signcolumnは常に有効にして、ファイル開く直後のガタつき予防
    ---- laststatus = 2,
    ---- cmdheight = 0, -- nvim0.8以降でサポート。かっこいい
    ---- background = "dark", --デフォルト有効になっている

  },
  g = {
    mapleader = " ",                   -- sets vim.g.mapleader
    autoformat_enabled = true,         -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true,                -- enable completion at start
    autopairs_enabled = true,          -- enable autopairs at start
    diagnostics_mode = 3,              -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true,              -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true,   -- disable notifications when toggling UI elements
    diagnostics_enabled = true,        -- enable diagnostics at start
    status_diagnostics_enabled = true, -- enable diagnostics in statusline
    copilot_assume_mapped = true,
    copilot_filetypes = {
      ["*"] = true,
      ["php"] = true,
    },
    vim_markdown_folding_disabled = 1,     -- 折り畳みを無効化
    vim_markdown_conceal_code_blocks = 0,  --   "構文隠蔽無効化
    vim_markdown_conceal = 0,              --   "構文隠蔽無効化
    vim_markdown_frontmatter = 1,          --   "frontmatterを強調表示
    vim_markdown_new_list_item_indent = 2, -- "listのインデントのスペースの数を4から2へ
    vim_markdown_folding_style_pythonic = 1,
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
