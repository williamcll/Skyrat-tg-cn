/mob
	///Whether the mob is pixel shifted or not
	var/is_shifted
	var/shifting //If we are in the shifting setting.

/datum/keybinding/mob/pixel_shift
	hotkey_keys = list("N")
	name = "pixel_shift"
	full_name = "Pixel Shift"
	description = "Shift your characters offset."
	category = CATEGORY_MOVEMENT
	keybind_signal = COMSIG_KB_MOB_PIXELSHIFT

/datum/keybinding/mob/pixel_shift/down(client/user)
	. = ..()
	if(.)
		return
	var/mob/M = user.mob
	M.shifting = TRUE
	return TRUE

/datum/keybinding/mob/pixel_shift/up(client/user)
	. = ..()
	if(.)
		return
	var/mob/M = user.mob
	M.shifting = FALSE
	return TRUE

/mob/proc/unpixel_shift()
	return

/mob/living/unpixel_shift()
	if(is_shifted)
		is_shifted = FALSE
		pixel_x = body_position_pixel_x_offset + base_pixel_x
		pixel_y = body_position_pixel_y_offset + base_pixel_y

/mob/proc/pixel_shift(direction)
	return

/mob/living/pixel_shift(direction)
	switch(direction)
		if(NORTH)
			if(pixel_y <= 16 + base_pixel_y)
				pixel_y++
				is_shifted = TRUE
		if(EAST)
			if(pixel_x <= 16 + base_pixel_x)
				pixel_x++
				is_shifted = TRUE
		if(SOUTH)
			if(pixel_y >= -16 + base_pixel_y)
				pixel_y--
				is_shifted = TRUE
		if(WEST)
			if(pixel_x >= -16 + base_pixel_x)
				pixel_x--
				is_shifted = TRUE
