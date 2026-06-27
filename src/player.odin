package src

import "core:math/linalg"
import "vendor:raylib"

Player :: struct {
    position_x: f32,
    velocity_x: f32,
    size: linalg.Vector2f32,
    color: raylib.Color,
    collision: raylib.Rectangle
}

initialize_player :: proc(
    player: ^Player,
    position_x := WINDOW_WIDTH / 2.0 - PLAYER_WIDTH / 2.0,
    velocity_x := 0.0,
    size := linalg.Vector2f32 {PLAYER_WIDTH, PLAYER_HEIGHT},
    color := raylib.ORANGE
) {
    player.position_x = f32(position_x)
    player.velocity_x = f32(velocity_x)
    player.size = size
    player.color = color
}

draw_player :: proc(player: ^Player) {
    raylib.DrawRectangleV(linalg.Vector2f32 {player.position_x, PLAYER_POSITION_Y}, player.size, player.color)
}

update_player :: proc(player: ^Player) {
    player.collision = raylib.Rectangle {
        player.position_x,
        PLAYER_POSITION_Y,
        player.size.x,
        player.size.y
    }
    player.velocity_x = 0
    if raylib.IsKeyDown(raylib.KeyboardKey.A) {
        player.velocity_x = -PLAYER_SPEED
    }
    else if raylib.IsKeyDown(raylib.KeyboardKey.D) {
        player.velocity_x = PLAYER_SPEED
    }
    if raylib.CheckCollisionRecs(player.collision, LEFT_WALL_COLLISION_RECTANGLE) {
        return
    }
    else if raylib.CheckCollisionRecs(player.collision, RIGHT_WALL_COLLISION_RECTANGLE) {
        return
    }
    player.position_x += player.velocity_x
}