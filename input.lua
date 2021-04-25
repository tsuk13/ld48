input_x = 0
input_y = 0
input_a = 0
input_a_pressed = 0
input_b = 0
input_b_pressed = 0

function update_input()
    --x
    if btn(0) then
        input_x = -1
    elseif btn(1) then
        input_x = 1
    else
        input_x = 0
    end

    --y
    if btn(2) then
        input_y = -1
    elseif btn(3) then
        input_y = 1
    else
        input_y = 0
    end

    --a
    local a = btn(4)
    if a and not input_a then
        input_a_pressed = 4
    else
        input_a_pressed = a and max(0, input_a_pressed - 1) or 0
    end
    input_a = a

    --attack
    local b = btn(5)
    if b and not input_b then
        input_b_pressed = 4
    else
        input_b_pressed = b and max(0, input_b_pressed - 1) or 0
    end
    input_b = b

end

function consume_a_press()
	local val = input_a_pressed > 0
	input_a_pressed = 0
	return val
end

function consume_b_press()
	local val = input_b_pressed > 0
	input_b_pressed = 0
	return val
end