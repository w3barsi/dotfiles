local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"
local dropdown = require "telescope.themes".get_dropdown()

function enter(prompt_bufnr)
    local selected = action_state.get_selected_entry()
    local cmd = 'colorscheme ' .. selected[1]
    vim.cmd(cmd)

    local init = vim.fn.expand("~/.config/nvim/plugin/sets.vim")
    local job_cmd = "sed -i '$d' " .. init .. " && echo '" .. cmd .. "' >> " .. init
    vim.fn.jobstart(job_cmd)

    actions.close(prompt_bufnr)
end

function next_color(prompt_bufnr)
    actions.move_selection_next(prompt_bufnr)
    local selected = action_state.get_selected_entry()
    local cmd = 'colorscheme ' .. selected[1]
    vim.cmd(cmd)
end

function prev_color(prompt_bufnr)
    actions.move_selection_previous(prompt_bufnr)
    local selected = action_state.get_selected_entry()
    local cmd = 'colorscheme ' .. selected[1]
    vim.cmd(cmd)
end

local colors = vim.fn.getcompletion("", "color")
local opts = {
    finder = finders.new_table (colors),
    sorter = sorters.get_generic_fuzzy_sorter({}),

    attach_mappings = function(prompt_bufnr, map)
        map("i", "<CR>", enter)
        map("i", "<UP>", prev_color)
        map("i", "<DOWN>", next_color)

        return true
    end
}

local colors = pickers.new(dropdown, opts)

colors:find()
