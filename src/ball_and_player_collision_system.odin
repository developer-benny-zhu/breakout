package src

import "vendor:raylib"
import "core:time"

Ball_And_Player_Collision_System :: struct {
    start_time: time.Tick
}

initialize_ball_and_player_collision_system :: proc(b_a_p_c_s: ^Ball_And_Player_Collision_System) {
    b_a_p_c_s.start_time = time.tick_now()
}
execute_ball_and_player_collision_system :: proc(b_a_p_c_s: ^Ball_And_Player_Collision_System, p: ^Player, b: ^Ball) {
    current_tick := time.tick_now()
    time_difference := time.tick_diff(b_a_p_c_s.start_time, current_tick)
    time_difference_seconds := time.duration_seconds(time_difference)
    if time_difference_seconds >= COLLISION_COOLDOWN_SECONDS {
        if raylib.CheckCollisionRecs(b.collision, p.collision) {
            b.velocity.y *= -1
            b_a_p_c_s.start_time = time.tick_now()
        }
    }
}