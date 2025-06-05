/*
*
*   c3rl, made by Marmot (https://github.com/Marmotus/c3rl).
*
*   Snake case Raylib bindings for the C3 programming language.
*
*   Tested Raylib version: 5.5.
*
*/


module rl;


enum ConfigFlag : (inline int v)
{
    VSYNC_HINT                  = 0x00000040,   // Set to try enabling V-Sync on GPU
    FULLSCREEN_MODE             = 0x00000002,   // Set to run program in fullscreen
    WINDOW_RESIZABLE            = 0x00000004,   // Set to allow resizable window
    WINDOW_UNDECORATED          = 0x00000008,   // Set to disable window decoration (frame and buttons)
    WINDOW_HIDDEN               = 0x00000080,   // Set to hide window
    WINDOW_MINIMIZED            = 0x00000200,   // Set to minimize window (iconify)
    WINDOW_MAXIMIZED            = 0x00000400,   // Set to maximize window (expanded to monitor)
    WINDOW_UNFOCUSED            = 0x00000800,   // Set to window non focused
    WINDOW_TOPMOST              = 0x00001000,   // Set to window always on top
    WINDOW_ALWAYS_RUN           = 0x00000100,   // Set to allow windows running while minimized
    WINDOW_TRANSPARENT          = 0x00000010,   // Set to allow transparent framebuffer
    WINDOW_HIGHDPI              = 0x00002000,   // Set to support HighDPI
    WINDOW_MOUSE_PASSTHROUGH    = 0x00004000,   // Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED
    BORDERLESS_WINDOWED_MODE    = 0x00008000,   // Set to run program in borderless windowed mode
    MSAA_4X_HINT                = 0x00000020,   // Set to try enabling MSAA 4X
    INTERLACED_HINT             = 0x00010000,
}


struct Vector2
{
    float x;
    float y;
}

fn void Vector2.add(self, Vector2 other_vector) 
{
    self.x += other_vector.x;
    self.y += other_vector.y;
}

fn Vector2 Vector2.plus_vector2(self, Vector2 other_vector) @operator(+) =>
{ 
    .x = self.x + other_vector.x,
    .y = self.y + other_vector.y 
};

fn Vector2 Vector2.times_vector2(self, Vector2 other_vector) @operator(*) =>
{
    .x = self.x * other_vector.x,
    .y = self.y * other_vector.y
};

fn Vector2 Vector2.times_float(self, float mult) @operator(*) =>
{
    .x = self.x * mult,
    .y = self.y * mult
};

fn Vector2 Vector2.divide_by_float(self, float div) @operator(/) =>
{
    .x = self.x / div,
    .y = self.y / div
};

struct Vector3
{
    float x;
    float y;
    float z;
}

struct Vector4
{
    float x;
    float y;
    float z;
    float w;
}

alias Quaternion = Vector4;

struct Color
{
    char r; // Red
    char g; // Green
    char b; // Blue
    char a; // Alpha
}

struct Rectangle
{
    float x;
    float y;
    float width;
    float height;
}

struct Image
{
    void* data;
    int width;
    int height;
    int mipmaps;
    int format;
}

struct Texture
{
    uint id;
    int width;
    int height;
    int mipmaps;
    int format;
}

struct RenderTexture
{
    uint id;                // OpenGL framebuffer object id
    Texture texture;        // Color buffer attachment texture
    Texture depth;          // Depth buffer attachment texture
}

enum KeyboardKey : (inline int v)
{
    KEY_NULL            = 0,        // Key: NULL, used for no key pressed
    // Alphanumeric keys
    KEY_APOSTROPHE      = 39,       // Key: '
    KEY_COMMA           = 44,       // Key: ,
    KEY_MINUS           = 45,       // Key: -
    KEY_PERIOD          = 46,       // Key: .
    KEY_SLASH           = 47,       // Key: /
    KEY_ZERO            = 48,       // Key: 0
    KEY_ONE             = 49,       // Key: 1
    KEY_TWO             = 50,       // Key: 2
    KEY_THREE           = 51,       // Key: 3
    KEY_FOUR            = 52,       // Key: 4
    KEY_FIVE            = 53,       // Key: 5
    KEY_SIX             = 54,       // Key: 6
    KEY_SEVEN           = 55,       // Key: 7
    KEY_EIGHT           = 56,       // Key: 8
    KEY_NINE            = 57,       // Key: 9
    KEY_SEMICOLON       = 59,       // Key: ;
    KEY_EQUAL           = 61,       // Key: =
    KEY_A               = 65,       // Key: A | a
    KEY_B               = 66,       // Key: B | b
    KEY_C               = 67,       // Key: C | c
    KEY_D               = 68,       // Key: D | d
    KEY_E               = 69,       // Key: E | e
    KEY_F               = 70,       // Key: F | f
    KEY_G               = 71,       // Key: G | g
    KEY_H               = 72,       // Key: H | h
    KEY_I               = 73,       // Key: I | i
    KEY_J               = 74,       // Key: J | j
    KEY_K               = 75,       // Key: K | k
    KEY_L               = 76,       // Key: L | l
    KEY_M               = 77,       // Key: M | m
    KEY_N               = 78,       // Key: N | n
    KEY_O               = 79,       // Key: O | o
    KEY_P               = 80,       // Key: P | p
    KEY_Q               = 81,       // Key: Q | q
    KEY_R               = 82,       // Key: R | r
    KEY_S               = 83,       // Key: S | s
    KEY_T               = 84,       // Key: T | t
    KEY_U               = 85,       // Key: U | u
    KEY_V               = 86,       // Key: V | v
    KEY_W               = 87,       // Key: W | w
    KEY_X               = 88,       // Key: X | x
    KEY_Y               = 89,       // Key: Y | y
    KEY_Z               = 90,       // Key: Z | z
    KEY_LEFT_BRACKET    = 91,       // Key: [
    KEY_BACKSLASH       = 92,       // Key: '\'
    KEY_RIGHT_BRACKET   = 93,       // Key: ]
    KEY_GRAVE           = 96,       // Key: `
    // Function keys
    KEY_SPACE           = 32,       // Key: Space
    KEY_ESCAPE          = 256,      // Key: Esc
    KEY_ENTER           = 257,      // Key: Enter
    KEY_TAB             = 258,      // Key: Tab
    KEY_BACKSPACE       = 259,      // Key: Backspace
    KEY_INSERT          = 260,      // Key: Ins
    KEY_DELETE          = 261,      // Key: Del
    KEY_RIGHT           = 262,      // Key: Cursor right
    KEY_LEFT            = 263,      // Key: Cursor left
    KEY_DOWN            = 264,      // Key: Cursor down
    KEY_UP              = 265,      // Key: Cursor up
    KEY_PAGE_UP         = 266,      // Key: Page up
    KEY_PAGE_DOWN       = 267,      // Key: Page down
    KEY_HOME            = 268,      // Key: Home
    KEY_END             = 269,      // Key: End
    KEY_CAPS_LOCK       = 280,      // Key: Caps lock
    KEY_SCROLL_LOCK     = 281,      // Key: Scroll down
    KEY_NUM_LOCK        = 282,      // Key: Num lock
    KEY_PRINT_SCREEN    = 283,      // Key: Print screen
    KEY_PAUSE           = 284,      // Key: Pause
    KEY_F1              = 290,      // Key: F1
    KEY_F2              = 291,      // Key: F2
    KEY_F3              = 292,      // Key: F3
    KEY_F4              = 293,      // Key: F4
    KEY_F5              = 294,      // Key: F5
    KEY_F6              = 295,      // Key: F6
    KEY_F7              = 296,      // Key: F7
    KEY_F8              = 297,      // Key: F8
    KEY_F9              = 298,      // Key: F9
    KEY_F10             = 299,      // Key: F10
    KEY_F11             = 300,      // Key: F11
    KEY_F12             = 301,      // Key: F12
    KEY_LEFT_SHIFT      = 340,      // Key: Shift left
    KEY_LEFT_CONTROL    = 341,      // Key: Control left
    KEY_LEFT_ALT        = 342,      // Key: Alt left
    KEY_LEFT_SUPER      = 343,      // Key: Super left
    KEY_RIGHT_SHIFT     = 344,      // Key: Shift right
    KEY_RIGHT_CONTROL   = 345,      // Key: Control right
    KEY_RIGHT_ALT       = 346,      // Key: Alt right
    KEY_RIGHT_SUPER     = 347,      // Key: Super right
    KEY_KB_MENU         = 348,      // Key: KB menu
    // Keypad keys
    KEY_KP_0            = 320,      // Key: Keypad 0
    KEY_KP_1            = 321,      // Key: Keypad 1
    KEY_KP_2            = 322,      // Key: Keypad 2
    KEY_KP_3            = 323,      // Key: Keypad 3
    KEY_KP_4            = 324,      // Key: Keypad 4
    KEY_KP_5            = 325,      // Key: Keypad 5
    KEY_KP_6            = 326,      // Key: Keypad 6
    KEY_KP_7            = 327,      // Key: Keypad 7
    KEY_KP_8            = 328,      // Key: Keypad 8
    KEY_KP_9            = 329,      // Key: Keypad 9
    KEY_KP_DECIMAL      = 330,      // Key: Keypad .
    KEY_KP_DIVIDE       = 331,      // Key: Keypad /
    KEY_KP_MULTIPLY     = 332,      // Key: Keypad *
    KEY_KP_SUBTRACT     = 333,      // Key: Keypad -
    KEY_KP_ADD          = 334,      // Key: Keypad +
    KEY_KP_ENTER        = 335,      // Key: Keypad Enter
    KEY_KP_EQUAL        = 336,      // Key: Keypad =
    // Android key buttons
    KEY_BACK            = 4,        // Key: Android back button
    KEY_MENU            = 5,        // Key: Android menu button
    KEY_VOLUME_UP       = 24,       // Key: Android volume up button
    KEY_VOLUME_DOWN     = 25        // Key: Android volume down button
}

enum MouseButton : (inline int v)
{
    MOUSE_BUTTON_LEFT    = 0,       // Mouse button left
    MOUSE_BUTTON_RIGHT   = 1,       // Mouse button right
    MOUSE_BUTTON_MIDDLE  = 2,       // Mouse button middle (pressed wheel)
    MOUSE_BUTTON_SIDE    = 3,       // Mouse button side (advanced mouse device)
    MOUSE_BUTTON_EXTRA   = 4,       // Mouse button extra (advanced mouse device)
    MOUSE_BUTTON_FORWARD = 5,       // Mouse button forward (advanced mouse device)
    MOUSE_BUTTON_BACK    = 6,       // Mouse button back (advanced mouse device)
}

enum MouseCursor : (inline int v)
{
    MOUSE_CURSOR_DEFAULT       = 0,     // Default pointer shape
    MOUSE_CURSOR_ARROW         = 1,     // Arrow shape
    MOUSE_CURSOR_IBEAM         = 2,     // Text writing cursor shape
    MOUSE_CURSOR_CROSSHAIR     = 3,     // Cross shape
    MOUSE_CURSOR_POINTING_HAND = 4,     // Pointing hand cursor
    MOUSE_CURSOR_RESIZE_EW     = 5,     // Horizontal resize/move arrow shape
    MOUSE_CURSOR_RESIZE_NS     = 6,     // Vertical resize/move arrow shape
    MOUSE_CURSOR_RESIZE_NWSE   = 7,     // Top-left to bottom-right diagonal resize/move arrow shape
    MOUSE_CURSOR_RESIZE_NESW   = 8,     // The top-right to bottom-left diagonal resize/move arrow shape
    MOUSE_CURSOR_RESIZE_ALL    = 9,     // The omnidirectional resize/move cursor shape
    MOUSE_CURSOR_NOT_ALLOWED   = 10     // The operation-not-allowed shape
}

struct Camera2D
{
    Vector2 offset;
    Vector2 target;
    float rotation;
    float zoom;
}


// Window-related functions


extern fn void init_window(CInt width, CInt height, char* title) @extern("InitWindow");
extern fn void close_window() @extern("CloseWindow");
extern fn bool window_should_close() @extern("WindowShouldClose");
extern fn bool is_window_ready() @extern("IsWindowReady");
extern fn bool is_window_fullscreen() @extern("IsWindowFullscreen");
extern fn bool is_window_hidden() @extern("IsWindowHidden");
extern fn bool is_window_minimized() @extern("IsWindowMinimized");
extern fn bool is_window_maximized() @extern("IsWindowMaximized");
extern fn bool is_window_focused() @extern("IsWindowFocused");
extern fn bool is_window_resized() @extern("IsWindowResized");
extern fn bool is_window_state(CUInt flag) @extern("IsWindowState");
extern fn void set_window_state(CUInt flags) @extern("SetWindowState");
extern fn void clear_window_state(CUInt flags) @extern("ClearWindowState");
extern fn void toggle_fullscreen() @extern("ToggleFullscreen");
extern fn void toggle_borderless_windowed() @extern("ToggleBorderlessWindowed");
extern fn void maximize_window() @extern("MaximizeWindow");
extern fn void minimize_window() @extern("MinimizeWindow");
extern fn int get_screen_width() @extern("GetScreenWidth");
extern fn int get_screen_height() @extern("GetScreenHeight");
extern fn int get_render_width() @extern("GetRenderWidth");
extern fn int get_render_height() @extern("GetRenderHeight");
extern fn void set_config_flags(CUInt flags) @extern("SetConfigFlags");


extern fn void set_window_title(char* title) @extern("SetWindowTitle");
extern fn void set_window_position(CInt x, CInt y) @extern("SetWindowPosition");

extern fn void show_cursor() @extern("ShowCursor");
extern fn void hide_cursor() @extern("HideCursor");

extern fn void clear_background(Color color) @extern("ClearBackground");
extern fn void begin_drawing() @extern("BeginDrawing");
extern fn void end_drawing() @extern("EndDrawing");
extern fn void begin_mode_2d(Camera2D camera) @extern("BeginMode2D");
extern fn void end_mode_2d() @extern("EndMode2D");

extern fn Vector2 get_world_to_screen_2d(Vector2 position, Camera2D camera) @extern("GetWorldToScreen2D");
extern fn Vector2 get_screen_to_world_2d(Vector2 position, Camera2D camera) @extern("GetScreenToWorld2D");

extern fn void set_target_fps(CInt fps) @extern("SetTargetFPS");
extern fn float get_frame_time() @extern("GetFrameTime");
extern fn void poll_input_events() @extern("PollInputEvents");
extern fn void set_random_seed(CUInt seed) @extern("SetRandomSeed");
extern fn int get_random_value(CInt min, CInt max) @extern("GetRandomValue");


// Compression/Encoding functionality

<* Compress data (DEFLATE algorithm), memory must be MemFree() *>
extern fn char* compress_data(char* data, CInt data_size, CInt *comp_data_size) @extern("CompressData");

<* Decompress data (DEFLATE algorithm), memory must be MemFree() *>
extern fn char* decompress_data(char* comp_data, CInt comp_data_size, CInt *data_size) @extern("DecompressData");


// Shapes functions


extern fn void draw_text(char* text, CInt pos_x, CInt pos_y, CInt font_size, Color color) @extern("DrawText");
extern fn int measure_text(char* text, CInt font_size) @extern("MeasureText");

extern fn void draw_rectangle(CInt pos_x, CInt pos_y, CInt width, CInt height, Color color) @extern("DrawRectangle"); // Draw a color-filled rectangle
extern fn void draw_rectangle_lines(CInt pos_x, CInt pos_y, CInt width, CInt height, Color color) @extern("DrawRectangleLines");
extern fn void draw_rectangle_lines_ex(Rectangle rec, float line_thickness, Color color) @extern("DrawRectangleLinesEx");
extern fn void draw_rectangle_rounded(Rectangle rec, float roundness, CInt segments, Color color) @extern("DrawRectangleRounded");

// === INPUT FUNCTIONS ===

// Keyboard functions

extern fn bool is_key_pressed(CInt key) @extern("IsKeyPressed");
extern fn bool is_key_pressed_repeat(CInt key) @extern("IsKeyPressedRepeat");
extern fn bool is_key_down(CInt key) @extern("IsKeyDown");
extern fn bool is_key_released(CInt key) @extern("IsKeyReleased");
extern fn bool is_key_up(CInt key) @extern("IsKeyUp");
extern fn int get_key_pressed() @extern("GetKeyPressed");
extern fn int get_char_pressed() @extern("GetCharPressed");
extern fn String get_key_name(CInt key) @extern("GetKeyName");
extern fn void set_exit_key(CInt key) @extern("SetExitKey");

// Mouse functions

extern fn bool is_mouse_button_pressed(CInt button) @extern("IsMouseButtonPressed");
extern fn bool is_mouse_button_down(CInt button) @extern("IsMouseButtonDown");
extern fn bool is_mouse_button_released(CInt button) @extern("IsMouseButtonReleased");
extern fn bool is_mouse_button_up(CInt button) @extern("IsMouseButtonUp");
extern fn int get_mouse_x() @extern("GetMouseX");
extern fn int get_mouse_y() @extern("GetMouseY");
extern fn float get_mouse_wheel_move() @extern("GetMouseWheelMove");
extern fn Vector2 get_mouse_position() @extern("GetMousePosition");
extern fn Vector2 get_mouse_delta() @extern("GetMouseDelta");
extern fn void set_mouse_cursor(CInt cursor) @extern("SetMouseCursor");
