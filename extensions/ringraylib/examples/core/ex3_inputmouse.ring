/*******************************************************************************************
*
*   raylib [core] example - Mouse input
*
*   This example has been created using raylib 1.0 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Copyright (c) 2014 Ramon Santamaria (@raysan5)
*
********************************************************************************************/
#===================================================================#
# Based on Original Sample from RayLib (https://www.raylib.com/)
# Ported to RingRayLib by Ring Team
#===================================================================#

load "raylib.ring"

screenWidth  = 800
screenHeight = 450

InitWindow(screenWidth, screenHeight, "raylib [core] example - mouse input")

ballPosition 	= Vector2(100, 100)
ballColor 	= DARKBLUE

SetTargetFPS(60)

while ! WindowShouldClose()

        ballPosition = GetMousePosition()

        if IsMouseButtonPressed(MOUSE_LEFT_BUTTON)
		ballColor = MAROON
        but IsMouseButtonPressed(MOUSE_MIDDLE_BUTTON)	
		ballColor = LIME
        but IsMouseButtonPressed(MOUSE_RIGHT_BUTTON) 	
		ballColor = DARKBLUE
	ok

        BeginDrawing()
            ClearBackground(BLACK)
            DrawCircleV(ballPosition, 40, ballColor)
            DrawText("move ball with mouse and click mouse button to change color", 10, 10, 20, YELLOW)
        EndDrawing()

end
 
CloseWindow()  
