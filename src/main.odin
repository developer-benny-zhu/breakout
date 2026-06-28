package src

import "vendor:raylib"


main :: proc() {
    raylib.InitWindow(WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_TITLE)
    raylib.SetTargetFPS(TARGET_FPS)
    player := Player {}
    ball := Ball {}
    ball_and_player_collision_system := Ball_And_Player_Collision_System {}
    ball_and_brick_collision_system := Ball_And_Brick_Collision_System {}
    brick_manager := Brick_Manager {}

    initialize_player(&player)
    initialize_ball(&ball)
    initialize_ball_and_player_collision_system(&ball_and_player_collision_system)
    initialize_brick_manager(&brick_manager)
    initialize_ball_and_brick_collision_system(&ball_and_brick_collision_system)

    for !raylib.WindowShouldClose() {

        update_player(&player)
        update_ball(&ball)
        update_brick_manager(&brick_manager)

        execute_ball_and_player_collision_system(&ball_and_player_collision_system, &player, &ball)
        execute_ball_and_brick_collision_system(&ball_and_brick_collision_system, &ball, &brick_manager)


        raylib.BeginDrawing()
        raylib.ClearBackground(raylib.WHITE)

        draw_player(&player)
        draw_brick_manager(&brick_manager)
        draw_ball(&ball)

        raylib.EndDrawing()
    }
}
