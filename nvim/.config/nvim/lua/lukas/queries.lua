local embedded_html = vim.treesitter.query.parse(
    "rust",
    [[
(macro_invocation
  (identifier) @identifier (#eq? @identifier "html")

  (token_tree) @html_block)
    ]]
)

local embedded_html_long = vim.treesitter.query.parse(
    "rust",
    [[
(macro_invocation
  (scoped_identifier
    path: (identifier) @path (#eq? @path "html_to_string_macro")
    name: (identifier) @name (#eq? @name "html"))

  (token_tree) @html_block)
    ]]
)

local get_root = function(bufnr)
    local parser = vim.treesitter.get_parser(bufnr, "rust", {})
    local tree = parser:parse()[1]
    return tree:root()
end

local run_formatter = function(text)
    local split = vim.split(text, "\n")
    local result = table.concat(vim.list_slice(split, 2, #split - 1), "\n")

    local j = require("plenary.job"):new {
        command = "prettier",
        args = { "--parser", "html" },
        writer = result,
    }
    return j:sync()
end

local format_html_macro = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    if vim.bo[bufnr].filetype ~= "rust" then
        return
    end

    local root = get_root(bufnr)

    local changes = {}
    for id, node in embedded_html:iter_captures(root, bufnr, 0, -1) do
        local name = embedded_html.captures[id]
        if name == "html_block" then
            local range = { node:range() }
            local indentation = string.rep(" ", range[2])

            local formatted = run_formatter(vim.treesitter.get_node_text(node, bufnr))

            for idx, line in ipairs(formatted) do
                formatted[idx] = indentation .. line
            end

            table.insert(changes, 1, {
                start = range[1] + 1,
                final = range[3],
                formatted = formatted,
            })
        end
    end
    for _, change in ipairs(changes) do
        vim.api.nvim_buf_set_lines(bufnr, change.start, change.final, false, change.formatted)
    end
end

vim.api.nvim_create_user_command("FormatHtmlMacro", format_html_macro, {})
