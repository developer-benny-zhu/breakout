package src

import "core:math"
import "core:math/linalg"

Brick_Manager :: struct {
    bricks: [TOTAL_BRICKS]Brick
}

initialize_brick_manager :: proc(b_m: ^Brick_Manager) {
    number_of_bricks_that_can_fit_in_a_row := math.floor_f32(WINDOW_WIDTH / BRICK_WIDTH)
    horizontal_space_left_after_brick_row := WINDOW_WIDTH - (number_of_bricks_that_can_fit_in_a_row * BRICK_WIDTH)
    spacing := horizontal_space_left_after_brick_row / number_of_bricks_that_can_fit_in_a_row
    number_of_columns := number_of_bricks_that_can_fit_in_a_row
    number_of_rows := TOTAL_BRICKS / number_of_bricks_that_can_fit_in_a_row
    for column in 0..<number_of_columns {
        for row in 0..<number_of_rows{
            brick_position := linalg.Vector2f32 {
                column * (spacing + BRICK_WIDTH),
                row * (spacing + BRICK_HEIGHT)
            }
            index := int((number_of_columns * row) + column)
            initialize_brick(&b_m.bricks[index], brick_position)
        }
    }
}

draw_brick_manager :: proc(b_m: ^Brick_Manager) {
    for index in 0..<len(b_m.bricks) {
        draw_brick(&b_m.bricks[index])
    }
}

update_brick_manager :: proc(b_m: ^Brick_Manager) {
    for index in 0..<len(b_m.bricks) {
        update_brick(&b_m.bricks[index])
    }
}