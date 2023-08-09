local module = {}

local pickers = {}

function module.add_picker(modes, shortcut, func, name)

    if pickers[shortcut] == nil then
        pickers[shortcut] = {
            index=1,
            funcs = {},
            names = {},
            modes = modes
        }
        local shortcut_copy = shortcut
        vim.keymap.set(modes, shortcut, function() module.open_picker(shortcut_copy) end, {remap=false})
    end
    if not vim.deep_equal(modes,pickers[shortcut].modes) then
       error('Mismatched mapping modes.') 
    end
    table.insert(pickers[shortcut].funcs, func)
    table.insert(pickers[shortcut].names, name)
end

function module.pop_picker_func(shortcut)
    if pickers[shortcut] == nil then
        return nil
    end
    local picker = pickers[shortcut]
    if picker.index > #picker.funcs then
        picker.index = 1
    end

    local func = picker.funcs[picker.index]
    picker.index = picker.index +1
    return func
end

function module.open_picker(shortcut, prompt_bufnr)

    local prompt=nil

    if prompt_bufnr ~= nil then
        local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
        prompt = picker:_get_prompt()
        require('telescope.actions').close(prompt_bufnr)
    end

    local opts = { attach_mappings = function(_, map)
            map({'i','n'},shortcut, function (_prompt_bufnr)
            module.open_picker(shortcut, _prompt_bufnr)
            end)
            return true -- Do default mappings
        end,
        default_text = prompt
    }

    module.pop_picker_func(shortcut)(opts)
end

return module
