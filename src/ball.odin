package src

import "core:math/linalg"
import "vendor:raylib"

Ball :: struct {
    velocity: linalg.Vector2f32,
    position: linalg.Vector2f32,
    color: raylib.Color,
    collision: raylib.Rectangle
}

initialize_ball :: proc(
    ball: ^Ball,
    velocity := linalg.Vector2f32 {BALL_SPEED, BALL_SPEED},
    position := linalg.Vector2f32 {
        WINDOW_WIDTH / 2 - BALL_RADIUS,
        WINDOW_HEIGHT / 2 - BALL_RADIUS
    },
    color := raylib.RED
) {
    ball.velocity = velocity
    ball.position = position
    ball.color = color
}

draw_ball :: proc(ball: ^Ball) {
    raylib.DrawCircleV(ball.position, BALL_RADIUS, ball.color)
}

update_ball :: proc(ball: ^Ball) {
    ball.collision = raylib.Rectangle {
        ball.position.x - BALL_RADIUS,
        ball.position.y - BALL_RADIUS,
        BALL_RADIUS * 2,
        BALL_RADIUS * 2
    }
    if raylib.CheckCollisionRecs(ball.collision, TOP_WALL_COLLISION_RECTANGLE) || raylib.CheckCollisionRecs(ball.collision, BOTTOM_WALL_COLLISION_RECTANGLE) {
        ball.velocity.y *= -1
    }
    if raylib.CheckCollisionRecs(ball.collision, LEFT_WALL_COLLISION_RECTANGLE) || raylib.CheckCollisionRecs(ball.collision, RIGHT_WALL_COLLISION_RECTANGLE) {
        ball.velocity.x *= -1
    }
    ball.position += ball.velocity
}