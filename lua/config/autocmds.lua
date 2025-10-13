local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

local lsp_hacks = augroup("lsp_hacks")

vim.api.nvim_create_autocmd(
  "FileType",
  { group = augroup("language"), pattern = { "php", "python", "json" }, command = "setlocal tabstop=4" }
)

vim.api.nvim_create_autocmd(
  "FileType",
  { group = augroup("language"), pattern = { "php", "python", "json" }, command = "setlocal softtabstop=4" }
)

vim.api.nvim_create_autocmd(
  "FileType",
  { group = augroup("language"), pattern = { "php", "python", "json" }, command = "setlocal shiftwidth=4" }
)

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  group = lsp_hacks,
  pattern = ".env*",
  callback = function(e)
    vim.diagnostic.enable(false, { bufnr = e.buf })
  end,
})
