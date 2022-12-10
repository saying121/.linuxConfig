vim.keymap.set({'x','o','n'},'m','<Plug>(leap-forward-to)')
vim.keymap.set({'x','o','n'},'M','<Plug>(leap-backward-to)')
vim.keymap.set({'x','o','n'},'gm','<Plug>(leap-cross-window)')
require('flit').setup {
  keys = { f = 'f', F = 'F', t = 't', T = 'T' },
  -- A string like "nv", "nvo", "o", etc.
  labeled_modes = "v",
  multiline = true,
  -- Like `leap`s similar argument (call-specific overrides).
  -- E.g.: opts = { equivalence_classes = {} }
  opts = {}
}
