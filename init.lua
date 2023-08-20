---@diagnostic disable: undefined-global
--
-- Some safety require wrapper
local function prequire(...)
    local status, lib = pcall(require, ...)
    if (status) then return lib end
        return nil
end


-- TODO: move to external module
-- ? neovide test
if vim.g.neovide then
    vim.o.guifont = "Source Code Pro:h12"
    -- neovide_transparency should be 0
    -- if you want to unify transparency of content and title bar.
    -- window padding
    vim.g.neovide_padding_top = 1
    vim.g.neovide_padding_bottom = 1
    vim.g.neovide_padding_right = 1
    vim.g.neovide_padding_left = 1
    --  ... seconds.
    vim.g.neovide_cursor_animation_length = 0.1
    -- vim.o.guifont = \"Source Code Pro:h14\" -- text below applies for VimScript\n
    -- vim.opt.linespace = 0
    -- vim.g.neovide_scale_factor = 1.0
    -- vim.g.neovide_padding_top = 0
    -- vim.g.neovide_padding_bottom = 0
    -- vim.g.neovide_padding_right = 700
    -- vim.g.neovide_padding_left = 0
    -- -- Helper function for transparency formatting
    -- g:neovide_transparency should be 0
    -- if you want to unify transparency of content and title bar.
    -- transparency formatting
    vim.g.neovide_transparency = 1.0
    vim.g.transparency = 0.8
    vim.g.neovide_background_color = "#0f1117" .. string.format("%x", math.floor(255 * 0.8))
    -- vim.g.neovide_floating_blur_amount_x = 2.0
    -- vim.g.neovide_floating_blur_amount_y = 2.0
    -- vim.g.neovide_scroll_animation_length = 0.3
    -- vim.g.neovide_hide_mouse_when_typing = false
    -- vim.g.neovide_underline_automatic_scaling = false
    -- vim.g.neovide_refresh_rate = 60
    -- vim.g.neovide_refresh_rate_idle = 5
    -- vim.g.neovide_no_idle = true
    -- vim.g.neovide_confirm_quit = true
    -- vim.g.neovide_fullscreen = true
    -- vim.g.neovide_remember_window_size = true
    -- vim.g.neovide_profiler = false
    -- vim.g.neovide_input_use_logo = false    -- true on macOS
    -- vim.g.neovide_input_macos_alt_is_meta = false
    -- vim.g.neovide_touch_deadzone = 6.0
    -- vim.g.neovide_touch_drag_timeout = 0.17
    -- vim.g.neovide_cursor_animation_length = 0.13
    -- vim.g.neovide_cursor_trail_size = 0.8
    -- vim.g.neovide_cursor_antialiasing = true
    -- vim.g.neovide_cursor_animate_in_insert_mode = true
    -- vim.g.neovide_cursor_animate_command_line = true
    -- vim.g.neovide_cursor_unfocused_outline_width = 0.125
    -- vim.g.neovide_cursor_vfx_mode = \"\"
    vim.g.neovide_cursor_vfx_mode = "railgun"
    -- vim.g.neovide_cursor_vfx_mode = \"torpedo\"
    -- vim.g.neovide_cursor_vfx_mode = \"pixiedust\"
    -- vim.g.neovide_cursor_vfx_mode = \"sonicboom\"
    -- vim.g.neovide_cursor_vfx_mode = \"ripple\"
    -- vim.g.neovide_cursor_vfx_mode = \"wireframe\"
    -- vim.g.neovide_cursor_vfx_opacity = 200.0
    -- vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
    -- vim.g.neovide_cursor_vfx_particle_density = 7.0
    -- vim.g.neovide_cursor_vfx_particle_speed = 10.0
    -- vim.g.neovide_cursor_vfx_particle_phase = 1.5
    -- vim.g.neovide_cursor_vfx_particle_curl = 1.0
end


-- Order matter
prequire("plugins")

prequire("treesitter")
prequire("lsp")
prequire("telesconfig")

prequire("options")

-- Using treesitter block scope,
-- Load after treesitter
prequire("nvim-autopairs").setup{
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
}

-- those bars
prequire('statusline')
prequire('tabline')

prequire('keybindings')
prequire('comments')
prequire("auto-events")

prequire("utils")
prequire("masonne")


vim.g.user_emmet_leader_key = '<C-e>'
