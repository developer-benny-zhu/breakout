package src

import "core:math/linalg"
import "vendor:raylib"

Brick :: struct {
    position: linalg.Vector2f32,
    health: f32,
    color: raylib.Color,
    collision: raylib.Rectangle
}

initialize_brick :: proc(b: ^Brick, position := linalg.Vector2f32 {0, 0}, health : f32 = 100.0, color := raylib.PURPLE) {
    b.position = position
    b.health = health
    b.color = color

} 

draw_brick :: proc(b: ^Brick) {
    raylib.DrawRectangleV(
        b.position,
        linalg.Vector2f32 {
            BRICK_WIDTH,
            BRICK_HEIGHT
        },
        b.color
    )
}

update_brick :: proc(b: ^Brick) {
    if b.health > 0 {
        b.collision = raylib.Rectangle {
        b.position.x,
        b.position.y,
        BRICK_WIDTH,
        BRICK_HEIGHT
        }
    } else {
        // Don't mind this... nothing to see here
        b.collision = raylib.Rectangle {
            0, 0, 0, 0
        }
        b.color = raylib.WHITE
    }
}