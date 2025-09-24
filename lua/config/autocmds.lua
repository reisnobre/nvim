local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

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
