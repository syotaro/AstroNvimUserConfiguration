-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"]  = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    ["<leader>vf"] = { "<cmd>save ~/Desktop/memo.md<cr>", desc = "メモをサクッと作成" },
    ["<Leader>."]  = { ":<C-u>edit ~/.config/nvim/lua/user/init.lua<CR>", desc = "" },
    ["<leader>ve"] = {
      "<cmd>e " .. vim.fn.stdpath "config" .. "/lua/user/init.lua<CR>",
      desc = "Open Astronvim config",
    },
    ["n"]          = { "nzz", desc = "" },
    ["N"]          = { "Nzz", desc = "" },
    ["#"]          = { "#zz", desc = "" },
    ["1"]          = { "^", desc = "Start of line (non-blank)" },
    ["9"]          = { "$", desc = "End of line" },
    [";"]          = { ":", desc = ";でコマンド入力( ;と:を入れ替)" },
    ["<C-b>"]      = { "<LEFT>", desc = "LEFT" },
    ["<C-e>"]      = { "<ESC>$", desc = "End of line" },
    ["<C-f>"]      = { "<RIGHT>", desc = "RIGHT" },
    ["<"]          = { "<<", desc = "left indent" },
    ["<C-j>"]      = { "<C-e><DOWN>", desc = "1行スクロール" },
    ["<C-k>"]      = { "<C-Y><UP>", desc = "1行スクロール" },
    [">"]          = { ">>", desc = "right indent" },
    ["<CR>"]       = { "<ESC>o<ESC>i", desc = "ノーマルモードのまま空行を挿入" },
    ["<S-CR>"]     = { "<ESC>O<ESC>i", desc = "ノーマルモードのまま空行を挿入" },
    ["<Esc><Esc>"] = { "<CMD>nohlsearch<CR><ESC>", desc = "ハイライト削除" },
    ["d"]          = { "_d", desc = "選択部分を、ヤンクせずに削除" },
    -- ["j"]          = { "gj", desc = "折り返されたテキストでも、j/kの移動が自然に振る舞うように" },
    -- ["k"]          = { "gk", desc = "折り返されたテキストでも、j/kの移動が自然に振る舞うように" },
    ["o"]          = { "A<CR>", desc = "行末に移動して改行" },
    ["q"]          = { "<CMD>q<CR>", desc = "qだけでエディタを閉じる" },
  },
  t = {
    -- t:ターミナルモード
    ["<C-b>"] = { "<LEFT>", desc = "LEFT" },
    ["<C-f>"] = { "<RIGHT>", desc = "RIGHT" },
    ["<C-e>"] = { "<ESC>$<INS>", desc = "End of line" },
    ["<C-a>"] = { "<ESC>^<INS>", desc = "Start of line (non-blank)" },
  },
  i = {
    -- i:インサートモード
    ["<C-b>"] = { "<LEFT>", desc = "LEFT" },
    ["<C-e>"] = { "<ESC>$<INS>", desc = "End of line" },
    ["<C-a>"] = { "<ESC>^<INS>", desc = "Start of line (non-blank)" },
    ["<C-f>"] = { "<RIGHT>", desc = "RIGHT" },
    ["<C-n>"] = { "<DOWN>", desc = "DOWN" },
    ["<C-p>"] = { "<UP>", desc = "UP" },
    ["<C-h>"] = { "<BACKSPACE>", desc = "delete left character" },
    ["<C-l>"] = { "<C-t>", desc = "Right Indent" },
    ["<C-s>"] = { "<ESC><CMD>:w!<CR>", desc = "Save File" },
    ["kk"]    = { "()<LEFT>", desc = "call ()" },
  },
  c = {
    -- c:コマンドモード
    ["<C-b>"] = { "<LEFT>", desc = "LEFT" },
    ["<C-f>"] = { "<RIGHT>", desc = "RIGHT" },
    ["<C-e>"] = { "<ESC>$<INS>", desc = "End of line" },
    ["<C-a>"] = { "<ESC>^<INS>", desc = "Start of line (non-blank)" },
  },
  v = {
    -- v:ヴィジュアルモード
    ["1"]     = { "^", desc = "Start of line (non-blank)" },
    ["9"]     = { "$", desc = "End of line" },
    ["<C-b>"] = { "<LEFT>", desc = "LEFT" },
    ["<C-e>"] = { "$", desc = "End of line" },
    ["<C-f>"] = { "<RIGHT>", desc = "RIGHT" },
    ["<C-j>"] = { "<CMD>move '>+1<CR>gv-gv", desc = "Move lines of code up" },
    ["<C-k>"] = { "<CMD>move '<-2<CR>gv-gv", desc = "Move lines of code down" },
    ["<C-h>"] = { "<gv", desc = "Left Indent & v-mode continue" },
    ["<C-l>"] = { ">gv", desc = "Right Indent & v-mode continue" },
  },
  x = {
    -- x:ヴィジュアルブロックモード
    ["9"]     = { "$", desc = "Start of line (non-blank)" },
    ["1"]     = { "^", desc = "End of line" },
    ["d"]     = { '"_d', desc = "ブラックホールレジスタでyankを回避して削除削除" },
    ["p"]     = { '"_dP', desc = "ブラックホールレジスタでペースト時ヤンク回避して削除" },
    ["<C-b>"] = { "<LEFT>", desc = "LEFT" },
    ["<C-e>"] = { "$", desc = "End of line" },
    ["<C-f>"] = { "<RIGHT>", desc = "RIGHT" },
  },
}
