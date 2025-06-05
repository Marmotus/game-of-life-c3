module gol;
import std;
import std::io;
import rl;

const int AREA_X = 128;
const int AREA_Y = 128;

bool exit = false;

fn int main(String[] args)
{
    char[][] board = {[0..AREA_Y - 1] = {[0..AREA_X - 1] = 0}};
    char[][] next_board = {[0..AREA_Y - 1] = {[0..AREA_X - 1] = 0}};

    rl::set_config_flags(rl::ConfigFlag.WINDOW_RESIZABLE);
    rl::init_window(1200, 700, "Game of Life");

    io::printfn("Board len: %d", board.len);

    rl::set_target_fps(30);

    initialize_board(board);

    while (!exit && !rl::window_should_close())
    {
        game_cycle(board, next_board);
        draw(board);
    }

	return 0;
}

macro void draw(char[][] board)
{
    rl::begin_drawing();
    defer rl::end_drawing();

    rl::clear_background({0, 0, 0, 255});

    float board_width_to_height_ratio = (float)(AREA_X / AREA_Y);
    float screen_width_to_height_ratio = (float)(rl::get_render_width() / rl::get_render_height());

    int dot_size = rl::get_render_width() <= rl::get_render_height() ? (rl::get_render_width() / AREA_X) - 1 : (rl::get_render_height() / AREA_Y) - 1;

    for (int y = 0; y < board.len; y++)
    {
        for (int x = 0; x < board[y].len; x++)
        {
            if (board[y][x] == 0) { continue; }

            rl::draw_rectangle(0 + (dot_size * x) + (1 * x), 0 + (dot_size * y) + (1 * y), dot_size, dot_size, {255, 255, 255, 255});
        }
    }
}

macro void game_cycle(char[][] board, char[][] next_board)
{
    bool empty = true;

    for (int y = 0; y < board.len; y++)
    {
        for (int x = 0; x < board[y].len; x++)
        {
            if (board[y][x] == 1) { empty = false; }
            next_board[y][x] = determin_next_dot_state(board, x, y);
        }
    }

    if (empty)
    {
        initialize_board(board);
        return;
    }

    foreach (i, char[] row : next_board)
    {
        board[i][..] = row[..];
    }
}

macro char determin_next_dot_state(char[][] board, int dot_x, int dot_y)
{
    char surrounding_dots = 0;

    for (int y = dot_y - 1; y <= dot_y + 1; y++)
    {
        if (y < 0 || y >= board.len) { continue; }

        for (int x = dot_x - 1; x <= dot_x + 1; x++)
        {
            if (x < 0 || x >= board[y].len || (x == dot_x && y == dot_y)) { continue; }

            surrounding_dots += (char)(board[y][x] == 1);
        }
    }

    if (board[dot_y][dot_x] == 1 && surrounding_dots == 2) { return 1; }
    else if (surrounding_dots == 3) { return 1; }
    else { return 0; }
}

macro void initialize_board(char[][] board)
{
    for (int y = 0; y < board.len; y++)
    {
        for (int x = 0; x < board[y].len; x++)
        {
            // Set to 1 if the random number lands on 0.
            board[y][x] = (char)(std::math::random::rand(2) == 0);
        }
    }
}
