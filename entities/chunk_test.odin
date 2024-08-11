package entities

import "core:testing"

@(test)
get_line_gets_correct_line_for_correct_input_ :: proc(t: ^testing.T) {
	chunk: Chunk

	add_operation(&chunk, Operation.RETURN, 1)
	add_operation(&chunk, Operation.CONSTANT, 1)
	add_operation(&chunk, Operation.RETURN, 1)
	add_operation(&chunk, Operation.RETURN, 2)

	line_number, succeeded := get_line(&chunk, 3)

	testing.expect_value(t, line_number, 1)
	testing.expect_value(t, succeeded, true)

	line_number, succeeded = get_line(&chunk, 4)

	testing.expect_value(t, line_number, 2)
	testing.expect_value(t, succeeded, true)
}


@(test)
get_line_fails_for_incorrect_input :: proc(t: ^testing.T) {
	chunk: Chunk

	line_number, succeeded := get_line(&chunk, 1)

	testing.expect_value(t, line_number, 0)
	testing.expect_value(t, succeeded, false)

	add_operation(&chunk, Operation.RETURN, 1)
	add_operation(&chunk, Operation.CONSTANT, 1)
	add_operation(&chunk, Operation.RETURN, 1)

	line_number, succeeded = get_line(&chunk, 4)

	testing.expect_value(t, line_number, 0)
	testing.expect_value(t, succeeded, false)
}
