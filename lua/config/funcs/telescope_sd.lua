local M = {}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local dir_previewer = previewers.new_termopen_previewer({
    get_command = function(entry)
        return { "eza", "--tree", "--level=2", "--all", entry.value }
    end,
    on_exit = function(_, _, _)
        -- do nothing
    end,
})

function M.search_dirs()
    pickers.new({}, {
        prompt_title = "Search Directories",

        finder = finders.new_oneshot_job({
            "fd",
            "--type", "d",
            "--hidden",
            "--exclude", ".git",
        }),

        sorter = conf.generic_sorter({}),

        previewer = dir_previewer,

        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                require("oil").open(selection.value)
            end)
            return true
        end,
    }):find()
end

return M
