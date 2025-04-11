---@meta

---@class Config
---
---@field adjust_window_size_when_changing_font_size boolean?
---@field allow_download_protocols boolean
---@field allow_square_glyphs_to_overflow_width AllowSquareGlyphOverflow
---@field allow_win32_input_mode boolean
---@field alternate_buffer_wheel_scroll_speed integer
---@field animation_fps integer
---@field anti_alias_custom_block_glyphs boolean
---@field audible_bell AudibleBell
---@field automatically_reload_config boolean When true, watch the config file and reload it automatically when it is detected as changing.
---@field background [BackgroundLayer]
---@field bidi_direction ParagraphDirectionHint
---@field bidi_enabled boolean
---@field bold_brightens_ansi_colors BoldBrightening
---@field bypass_mouse_reporting_modifiers Modifiers
---@field canonicalize_pasted_newlines NewlineCanon?
---@field cell_width number
---@field char_select_bg_color RgbaColor
---@field char_select_fg_color RgbaColor
---@field char_select_font TextStyle?
---@field char_select_font_size number
---@field check_for_updates boolean
---@field check_for_updates_interval_seconds integer
---@field clean_exit_codes [integer]
---@field color_scheme string? Use a named color scheme rather than the palette specified by the colors setting.
---@field color_scheme_dirs [string]
---@field color_schemes table<string, Palette>
---@field colors Palette?
---@field command_palette_bg_color RgbaColor
---@field command_palette_fg_color RgbaColor
---@field command_palette_font TextStyle?
---@field command_palette_font_size number
---@field command_palette_rows integer?
---@field cursor_blink_ease_in EasingFunction
---@field cursor_blink_ease_out EasingFunction
---@field cursor_blink_rate integer Specifies how often a blinking cursor transitions between visible and invisible, expressed in milliseconds. Setting this to 0 disables blinking. Note that this value is approximate due to the way that the system event loop schedulers manage timers; non-zero values will be at least the interval specified with some degree of slop.
---@field cursor_thickness Dimension?
---@field custom_block_glyphs boolean
---@field daemon_options DaemonOptions
---@field debug_key_events boolean
---@field default_cursor_style DefaultCursorStyle
---@field default_cwd string? Specifies the default current working directory if none is specified through configuration or OSC 7 (see docs for `default_cwd` for more info!)
---@field default_domain string?
---@field default_gui_startup_args [string]
---@field default_mux_server_domain string?
---@field default_prog [any]? If no `prog` is specified on the command line, use this instead of running the user's shell. For example, to have `wezterm` always run `top` by default, you'd use this: ```toml default_prog = ["top"] ``` `default_prog` is implemented as an array where the 0th element is the command to run and the rest of the elements are passed as the positional arguments to that command.
---@field default_ssh_auth_sock string?
---@field default_workspace string?
---@field detect_password_input boolean
---@field disable_default_key_bindings boolean
---@field disable_default_mouse_bindings boolean
---@field disable_default_quick_select_patterns boolean
---@field display_pixel_geometry DisplayPixelGeometry
---@field dpi number? The DPI to assume
---@field dpi_by_screen table<string, number>
---@field enable_csi_u_key_encoding boolean When set to true, use the CSI-U encoding scheme as described in http://www.leonerd.org.uk/hacks/fixterms/ This is off by default because @wez and @jsgf find the shift-space mapping annoying in vim :-p
---@field enable_kitty_graphics boolean
---@field enable_kitty_keyboard boolean
---@field enable_scroll_bar boolean
---@field enable_tab_bar boolean If true, display the tab bar UI at the top of the window. The tab bar shows the titles of the tabs and which is the active tab.  Clicking on a tab activates it.
---@field enable_title_reporting boolean Whether the terminal should respond to requests to read the title string. Disabled by default for security concerns with shells that might otherwise attempt to execute the response. <https://marc.info/?l=bugtraq&m=104612710031920&w=2>
---@field enable_wayland boolean If false, do not try to use a Wayland protocol connection when starting the gui frontend, and instead use X11. This option is only considered on X11/Wayland systems and has no effect on macOS or Windows. The default is true.
---@field enable_zwlr_output_manager boolean
---@field enq_answerback string
---@field exec_domains [ExecDomain]
---@field exit_behavior ExitBehavior
---@field exit_behavior_messaging ExitBehaviorMessaging
---@field experimental_pixel_positioning boolean
---@field font TextStyle
---@field font_colr_rasterizer FontRasterizerSelection
---@field font_dirs [string] When using FontKitXXX font systems, a set of directories to search ahead of the standard font locations for fonts. Relative paths are taken to be relative to the directory from which the config was loaded.
---@field font_locator FontLocatorSelection
---@field font_rasterizer FontRasterizerSelection
---@field font_rules [StyleRule]
---@field font_shaper FontShaperSelection
---@field font_size number The font size, measured in points
---@field force_reverse_video_cursor boolean
---@field foreground_text_hsb HsbTransform
---@field freetype_interpreter_version integer? Selects the freetype interpret version to use. Likely values are 35, 38 and 40 which have different characteristics with respective to subpixel hinting. See https://freetype.org/freetype2/docs/subpixel-hinting.html
---@field freetype_load_flags FreeTypeLoadFlags?
---@field freetype_load_target FreeTypeLoadTarget
---@field freetype_pcf_long_family_names boolean
---@field freetype_render_target FreeTypeLoadTarget?
---@field front_end FrontEndSelection
---@field glyph_cache_image_cache_size integer
---@field harfbuzz_features [string] Specify the features to enable when using harfbuzz for font shaping. There is some light documentation here: <https://harfbuzz.github.io/shaping-opentype-features.html> but it boils down to allowing opentype feature names to be specified using syntax similar to the CSS font-feature-settings options: <https://developer.mozilla.org/en-US/docs/Web/CSS/font-feature-settings>. The OpenType spec lists a number of features here: <https://docs.microsoft.com/en-us/typography/opentype/spec/featurelist> Options of likely interest will be: * `calt` - <https://docs.microsoft.com/en-us/typography/opentype/spec/features_ae#tag-calt> * `clig` - <https://docs.microsoft.com/en-us/typography/opentype/spec/features_ae#tag-clig> If you want to disable ligatures in most fonts, then you may want to use a setting like this: ```toml harfbuzz_features = ["calt=0", "clig=0", "liga=0"] ``` Some fonts make available extended options via stylistic sets. If you use the [Fira Code font](https://github.com/tonsky/FiraCode), it lists available stylistic sets here: <https://github.com/tonsky/FiraCode/wiki/How-to-enable-stylistic-sets> and you can set them in wezterm: ```toml # Use this for a zero with a dot rather than a line through it # when using the Fira Code font harfbuzz_features = ["zero"] ```
---@field hide_mouse_cursor_when_typing boolean If true, the mouse cursor will be hidden while typing. This option is true by default.
---@field hide_tab_bar_if_only_one_tab boolean If true, hide the tab bar if the window only has a single tab.
---@field hyperlink_rules [Rule]
---@field ignore_svg_fonts boolean
---@field ime_preedit_rendering ImePreeditRendering
---@field inactive_pane_hsb HsbTransform
---@field initial_cols integer Specifies the width of a new window, expressed in character cells
---@field initial_rows integer Specifies the height of a new window, expressed in character cells.
---@field integrated_title_button_alignment IntegratedTitleButtonAlignment
---@field integrated_title_button_color IntegratedTitleButtonColor
---@field integrated_title_button_style IntegratedTitleButtonStyle
---@field integrated_title_buttons [IntegratedTitleButton]
---@field key_map_preference KeyMapPreference
---@field key_tables table<string, [any]>
---@field keys [Key]
---@field launch_menu [SpawnCommand]
---@field launcher_alphabet string
---@field leader LeaderKey?
---@field line_height number
---@field line_quad_cache_size integer
---@field line_state_cache_size integer
---@field line_to_ele_shape_cache_size integer
---@field log_unknown_escape_sequences boolean
---@field macos_forward_to_ime_modifier_mask Modifiers
---@field macos_fullscreen_extend_behind_notch boolean
---@field macos_window_background_blur integer Only works on MacOS
---@field max_fps integer
---@field min_scroll_bar_height Dimension
---@field mouse_bindings [Mouse]
---@field mouse_wheel_scrolls_tabs boolean
---@field mux_enable_ssh_agent boolean
---@field mux_env_remove [string]
---@field mux_output_parser_buffer_size integer The buffer size used by parse_buffered_data in the mux module. This should not be too large, otherwise the processing cost of applying a batch of actions to the terminal will be too high and the user experience will be laggy and less responsive.
---@field mux_output_parser_coalesce_delay_ms integer How many ms to delay after reading a chunk of output in order to try to coalesce fragmented writes into a single bigger chunk of output and reduce the chances observing "screen tearing" with un-synchronized output
---@field native_macos_fullscreen_mode boolean
---@field normalize_output_to_unicode_nfc boolean
---@field notification_handling NotificationHandling
---@field palette_max_key_assigments_for_action integer
---@field pane_focus_follows_mouse boolean
---@field pane_select_bg_color RgbaColor
---@field pane_select_fg_color RgbaColor
---@field pane_select_font TextStyle?
---@field pane_select_font_size number
---@field periodic_stat_logging integer If non-zero, specifies the period (in seconds) at which various statistics are logged.  Note that there is a minimum period of 10 seconds.
---@field prefer_egl boolean Whether to prefer EGL over other GL implementations. EGL on Windows has jankier resize behavior than WGL (which is used if EGL is unavailable), but EGL survives graphics driver updates without breaking and losing your work.
---@field prefer_to_spawn_tabs boolean When true, launching a new wezterm instance will prefer to spawn a new tab into an existing instance. Otherwise, it will spawn a new window.
---@field quick_select_alphabet string
---@field quick_select_patterns [string]
---@field quick_select_remove_styling boolean
---@field quit_when_all_windows_are_closed boolean
---@field quote_dropped_files DroppedFileQuoting
---@field ratelimit_mux_line_prefetches_per_second integer Constrains the rate at which the multiplexer client will speculatively fetch line data. This helps to avoid saturating the link between the client and server if the server is dumping a large amount of output to the client.
---@field resolved_palette Palette
---@field scroll_to_bottom_on_input boolean If false, do not scroll to the bottom of the terminal when you send input to the terminal. The default is to scroll to the bottom when you send input to the terminal.
---@field scrollback_lines integer How many lines of scrollback you want to retain
---@field search_font_dirs_for_fallback boolean
---@field selection_word_boundary string
---@field send_composed_key_when_left_alt_is_pressed boolean
---@field send_composed_key_when_right_alt_is_pressed boolean
---@field serial_ports [SerialDomain]
---@field set_environment_variables table<string, string> Specifies a map of environment variables that should be set when spawning commands in the local domain. This is not used when working with remote domains.
---@field shape_cache_size integer
---@field show_close_tab_button_in_tabs boolean
---@field show_new_tab_button_in_tab_bar boolean
---@field show_tab_index_in_tab_bar boolean If true, tab bar titles are prefixed with the tab index
---@field show_tabs_in_tab_bar boolean
---@field show_update_window boolean
---@field skip_close_confirmation_for_processes_named [string]
---@field sort_fallback_fonts_by_coverage boolean
---@field ssh_backend SshBackend
---@field ssh_domains [any]?
---@field status_update_interval integer
---@field strikethrough_position Dimension?
---@field swallow_mouse_click_on_pane_focus boolean
---@field swallow_mouse_click_on_window_focus boolean
---@field swap_backspace_and_delete boolean If true, the `Backspace` and `Delete` keys generate `Delete` and `Backspace` keypresses, respectively, rather than their normal keycodes. On macOS the default for this is true because its Backspace key is labeled as Delete and things are backwards.
---@field switch_to_last_active_tab_when_closing_tab boolean
---@field tab_and_split_indices_are_zero_based boolean If true, show_tab_index_in_tab_bar uses a zero-based index. The default is false and the tab shows a one-based index.
---@field tab_bar_at_bottom boolean
---@field tab_bar_style TabBarStyle
---@field tab_max_width integer Specifies the maximum width that a tab can have in the tab bar.  Defaults to 16 glyphs in width.
---@field term string What to set the TERM variable to
---@field text_background_opacity number
---@field text_blink_ease_in EasingFunction
---@field text_blink_ease_out EasingFunction
---@field text_blink_rapid_ease_in EasingFunction
---@field text_blink_rapid_ease_out EasingFunction
---@field text_blink_rate integer Specifies how often blinking text (normal speed) transitions between visible and invisible, expressed in milliseconds. Setting this to 0 disables slow text blinking.  Note that this value is approximate due to the way that the system event loop schedulers manage timers; non-zero values will be at least the interval specified with some degree of slop.
---@field text_blink_rate_rapid integer Specifies how often blinking text (rapid speed) transitions between visible and invisible, expressed in milliseconds. Setting this to 0 disables rapid text blinking.  Note that this value is approximate due to the way that the system event loop schedulers manage timers; non-zero values will be at least the interval specified with some degree of slop.
---@field tiling_desktop_environments [string]
---@field tls_clients [TlsDomainClient]
---@field tls_servers [TlsDomainServer]
---@field treat_east_asian_ambiguous_width_as_wide boolean
---@field treat_left_ctrlalt_as_altgr boolean
---@field ui_key_cap_rendering UIKeyCapRendering
---@field ulimit_nofile integer
---@field ulimit_nproc integer
---@field underline_position Dimension?
---@field underline_thickness Dimension?
---@field unicode_version integer
---@field unix_domains [UnixDomain]
---@field unzoom_on_switch_pane boolean
---@field use_box_model_render boolean
---@field use_cap_height_to_scale_fallback_fonts boolean
---@field use_dead_keys boolean
---@field use_fancy_tab_bar boolean
---@field use_ime boolean
---@field use_resize_increments boolean
---@field visual_bell VisualBell
---@field warn_about_missing_glyphs boolean
---@field webgpu_force_fallback_adapter boolean
---@field webgpu_power_preference WebGpuPowerPreference
---@field webgpu_preferred_adapter GpuInfo?
---@field win32_acrylic_accent_color RgbaColor
---@field win32_system_backdrop SystemBackdrop
---@field window_background_gradient Gradient?
---@field window_background_image string? Specifies the path to a background image attachment file. The file can be any image format that the rust `image` crate is able to identify and load. A window background image is rendered into the background of the window before any other content. The image will be scaled to fit the window.
---@field window_background_image_hsb HsbTransform?
---@field window_background_opacity number Specifies the alpha value to use when rendering the background of the window.  The background is taken either from the window_background_image, or if there is none, the background color of the cell in the current position. The default is 1.0 which is 100% opaque.  Setting it to a number between 0.0 and 1.0 will allow for the screen behind the window to "shine through" to varying degrees. This only works on systems with a compositing window manager. Setting opacity to a value other than 1.0 can impact render performance.
---@field window_close_confirmation WindowCloseConfirmation
---@field window_content_alignment WindowContentAlignment
---@field window_decorations WindowDecorations
---@field window_frame WindowFrameConfig
---@field window_padding WindowPadding
---@field wsl_domains [any]?
---@field xcursor_size integer?
---@field xcursor_theme string?
---@field xim_im_name string?
Config = {}

---@class AllowSquareGlyphOverflow
AllowSquareGlyphOverflow = {}

---@class AudibleBell
AudibleBell = {}

---@class BackgroundLayer
BackgroundLayer = {}

---@class BoldBrightening
---  When true (the default), PaletteIndex 0-7 are shifted to
---  bright when the font intensity is bold.  The brightening
---  doesn't apply to text that is the default color.
BoldBrightening = {}

---@class DaemonOptions
DaemonOptions = {}

---@class DefaultCursorStyle
---  Specifies the default cursor style.  various escape sequences
---  can override the default style in different situations (eg:
---  an editor can change it depending on the mode), but this value
---  controls how the cursor appears when it is reset to default.
---  The default is `SteadyBlock`.
---  Acceptable values are `SteadyBlock`, `BlinkingBlock`,
---  `SteadyUnderline`, `BlinkingUnderline`, `SteadyBar`,
---  and `BlinkingBar`.
DefaultCursorStyle = {}

---@class Dimension
Dimension = {}

---@class DisplayPixelGeometry
DisplayPixelGeometry = {}

---@class DroppedFileQuoting
DroppedFileQuoting = {}

---@class EasingFunction
EasingFunction = {}

---@class ExecDomain
ExecDomain = {}

---@class ExitBehavior
ExitBehavior = {}

---@class ExitBehaviorMessaging
ExitBehaviorMessaging = {}

---@class FontLocatorSelection
FontLocatorSelection = {}

---@class FontRasterizerSelection
FontRasterizerSelection = {}

---@class FontShaperSelection
FontShaperSelection = {}

---@class FreeTypeLoadFlags
FreeTypeLoadFlags = {}

---@class FreeTypeLoadTarget
FreeTypeLoadTarget = {}

---@class FrontEndSelection
FrontEndSelection = {}

---@class GpuInfo
GpuInfo = {}

---@class Gradient
Gradient = {}

---@class HsbTransform
HsbTransform = {}

---@class ImePreeditRendering
ImePreeditRendering = {}

---@class IntegratedTitleButton
IntegratedTitleButton = {}

---@class IntegratedTitleButtonAlignment
IntegratedTitleButtonAlignment = {}

---@class IntegratedTitleButtonColor
IntegratedTitleButtonColor = {}

---@class IntegratedTitleButtonStyle
IntegratedTitleButtonStyle = {}

---@class Key
Key = {}

---@class KeyMapPreference
KeyMapPreference = {}

---@class LeaderKey
LeaderKey = {}

---@class Modifiers
Modifiers = {}

---@class Mouse
Mouse = {}

---@class NewlineCanon
NewlineCanon = {}

---@class NotificationHandling
NotificationHandling = {}

---@class Palette
Palette = {}

---@class ParagraphDirectionHint
ParagraphDirectionHint = {}

---@class RgbaColor
RgbaColor = {}

---@class Rule
Rule = {}

---@class SerialDomain
SerialDomain = {}

---@class SpawnCommand
SpawnCommand = {}

---@class SshBackend
SshBackend = {}

---@class StyleRule
---  An optional set of style rules to select the font based
---  on the cell attributes
StyleRule = {}

---@class SystemBackdrop
---  Only works on Windows
SystemBackdrop = {}

---@class TabBarStyle
TabBarStyle = {}

---@class TextStyle
---  Font to use for PaneSelect
TextStyle = {}

---@class TlsDomainClient
---  The set of tls domains that we can connect to as a client
TlsDomainClient = {}

---@class TlsDomainServer
---  When running in server mode, defines configuration for
---  each of the endpoints that we'll listen for connections
TlsDomainServer = {}

---@class UIKeyCapRendering
UIKeyCapRendering = {}

---@class UnixDomain
---  The set of unix domains
UnixDomain = {}

---@class VisualBell
VisualBell = {}

---@class WebGpuPowerPreference
---  Whether to select the higher powered discrete GPU when
---  the system has a choice of integrated or discrete.
---  Defaults to low power.
WebGpuPowerPreference = {}

---@class WindowCloseConfirmation
WindowCloseConfirmation = {}

---@class WindowContentAlignment
WindowContentAlignment = {}

---@class WindowDecorations
WindowDecorations = {}

---@class WindowFrameConfig
WindowFrameConfig = {}

---@class WindowPadding
---  Controls the amount of padding to use around the terminal cell area
WindowPadding = {}

