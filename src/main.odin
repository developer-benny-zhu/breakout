package src

import "vendor:raylib"


main :: proc() {
    raylib.InitWindow(WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_TITLE)
    raylib.SetTargetFPS(TARGET_FPS)
    player := Player {}
    initialize_player(&player)

    for !raylib.WindowShouldClose() {

        update_player(&player)



        raylib.BeginDrawing()
        raylib.ClearBackground(raylib.WHITE)

        draw_player(&player)


        raylib.EndDrawing()
    }
}
