package src

import "vendor:raylib"


main :: proc() {
    raylib.InitWindow(WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_TITLE)
    raylib.SetTargetFPS(TARGET_FPS)
    player := Player {}
    ball := Ball {}
    initialize_player(&player)
    initialize_ball(&ball)

    for !raylib.WindowShouldClose() {

        update_player(&player)
        update_ball(&ball)


        raylib.BeginDrawing()
        raylib.ClearBackground(raylib.WHITE)

        draw_player(&player)
        draw_ball(&ball)


        raylib.EndDrawing()
    }
}
