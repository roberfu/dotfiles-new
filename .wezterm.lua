local wezterm = require("wezterm")

local function is_program_in_path(program)
    local success, result = wezterm.run_child_process({ "which", program })
    return success and result:find(program, 1, true) ~= nil
end

local function is_program_installed_windows(program)
    local success, _ = wezterm.run_child_process({ "where", program })
    return success
end

local function detect_preferred_shell()
    if wezterm.target_triple:find("windows") == nil then
        if is_program_in_path("zsh") then
            return { "/bin/zsh", "-l" }
        elseif is_program_in_path("bash") then
            return { "/bin/bash", "-l" }
        else
            return nil
        end
    else
        if is_program_installed_windows("pwsh.exe") then
            return { "pwsh.exe", "-NoLogo" }
        elseif is_program_installed_windows("bash.exe") then
            return { "bash.exe", "-l" }
        else
            return { "cmd.exe" }
        end
    end
end

-- Configura el shell detectado o usa el valor por defecto
local default_prog = detect_preferred_shell()

return {
    ---default_domain = 'WSL:Ubuntu',
    ---#default_cwd = '~/home/roberto',
    default_prog = { "pwsh.exe" },

    initial_cols = 140,
    initial_rows = 40,
    font = wezterm.font("Hack Nerd Font"),
    font_size = 11.0,

    colors = {
        foreground = "#c0caf5",
        background = "#1a1b26",
        cursor_bg = "#c0caf5",
        cursor_border = "#c0caf5",
        cursor_fg = "#1a1b26",
        selection_bg = "#283457",
        selection_fg = "#c0caf5",
        split = "#7aa2f7",
        compose_cursor = "#ff9e64",
        scrollbar_thumb = "#292e42",
        ansi = { "#15161e", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
        brights = { "#414868", "#ff899d", "#9fe044", "#faba4a", "#8db0ff", "#c7a9ff", "#a4daff", "#c0caf5" },
        tab_bar = {
            inactive_tab_edge = "#16161e",
            background = "#1a1b26",
            active_tab = {
                fg_color = "#16161e",
                bg_color = "#7aa2f7",
            },
            inactive_tab = {
                fg_color = "#545c7e",
                bg_color = "#292e42",
            },
            inactive_tab_hover = {
                fg_color = "#7aa2f7",
                bg_color = "#292e42",
            },
            new_tab_hover = {
                fg_color = "#7aa2f7",
                bg_color = "#1a1b26",
                intensity = "Bold",
            },
            new_tab = {
                fg_color = "#7aa2f7",
                bg_color = "#1a1b26",
            },
        },
    },

    window_background_opacity = 0.95,
    text_background_opacity = 0.95,
}
