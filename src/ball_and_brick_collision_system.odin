package src

import "vendor:raylib"
import "core:time"

Ball_And_Brick_Collision_System :: struct {
    start_time: time.Tick
}

initialize_ball_and_brick_collision_system :: proc(b_a_b_c_s: ^Ball_And_Brick_Collision_System) {
    b_a_b_c_s.start_time = time.tick_now()
}

execute_ball_and_brick_collision_system :: proc(b_a_b_c_s: ^Ball_And_Brick_Collision_System, ball: ^Ball, brick_manager: ^Brick_Manager) {
    current_tick := time.tick_now()
    time_difference := time.tick_diff(b_a_b_c_s.start_time, current_tick)
    time_difference_seconds := time.duration_seconds(time_difference)
    if time_difference_seconds >= COLLISION_COOLDOWN_SECONDS {
        for index in 0..<len(brick_manager.bricks) {
            if raylib.CheckCollisionRecs(brick_manager.bricks[index].collision, ball.collision) {
                ball.velocity.y *= -1
                b_a_b_c_s.start_time = time.tick_now()
                brick_manager.bricks[index].health = 0
            }
        }
    }
}