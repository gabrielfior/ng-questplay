use dep::std;

struct Square {
    x: Field,
    y: Field
}

fn is_valid_move(curr_square: Square, next_square: Square) -> bool {
    // valid moves involve x+1 and y+2 OR x+2 and y+1
    // can be 1, -1, 2 or -2
    std::println(f"curr_square {curr_square} next_square {next_square}");
    let diff_x = (next_square.x as i32 - curr_square.x as i32) as i32; 
    let diff_y = (next_square.y as i32 - curr_square.y as i32) as i32;
    std::println(f"diff x {diff_x} diff_y {diff_y}");
    let mut result = false;

    if (diff_x == 1) | (diff_x == -1) {
     
        if (diff_y == 2) | (diff_y == -2) {
     
            result = true;
        }
     
    }
    if (diff_x == 2) | (diff_x == -2) {
     
        if (diff_y == 1) | (diff_y == -1) {
            result = true;
        }
    }
    result
}

pub fn is_valid_path(path: [Square; 8], dagger: Square) {
    // Part 1
    // first square should be (0,0)
    let first_square = path[0];
    assert(first_square.x as u32 == 0);
    assert(first_square.y as u32 == 0);
    // coords should lie between [0,7]
    for square in path {
        assert(is_in_range(square.x as i64, square.y as i64));
    }

    for i in 0..7 {
        // call valid_move
        //std::println(f"oi {i}");
        let curr_square = path[i];
        let next_square = path[i+1];
        let is_valid_move = is_valid_move(curr_square, next_square);
        std::println(f"valid_move {is_valid_move} i {i}");
        assert(is_valid_move);
    }
    

    // last square should equal dagger
    let last_square = path[7];
    assert(last_square.x == dagger.x);
    assert(last_square.y == dagger.y);
}

fn is_in_range(x: i64, y:i64) -> bool{
    x>=0 & x<=7 & y>=0 & y<=7
}

fn fill_matrix_for_coordinates(x:i64, y:i64, mut watcher_map: [[bool; 8]; 8]) -> [[bool; 8]; 8]  {    

    for i in 0..8 {
        let diff_x = x - i;
        let new_x = i;
        let new_y = y - diff_x;
        if is_in_range(new_x,new_y){
            watcher_map[new_x][new_y] = true;
        }
        let new_y = y+diff_x;
        if is_in_range(new_x,new_y){
            watcher_map[new_x][new_y] = true;
        }
    }    
    
    watcher_map
}

fn build_watcher_matrix(mut watcher_map: [[bool; 8]; 8]) -> [[bool; 8]; 8] {
    std::println("entered build watcher matrix");
    let mut filled_watcher_map = [[false; 8]; 8];
    for i in 0..8 {
        for j in 0..8 {
            let watcher = watcher_map[i][j];
            if (watcher){
                std::println(f"watcher found i {i} j {j}");
                filled_watcher_map = fill_matrix_for_coordinates(i as i64,j as i64, filled_watcher_map);
            }
        }
    }
    filled_watcher_map
}

pub fn is_safe_path(
    path: [Square; 8],
    watcher_map: [[bool; 8]; 8]
) { 
    let watcher_matrix = build_watcher_matrix(watcher_map);
    for square in path {
        let coordx = square.x as u32;
        let coordy = square.y as u32;
        let is_watcher_in_square = watcher_matrix[coordx][coordy];
        if (is_watcher_in_square){
            assert(false);
        }
    }
}