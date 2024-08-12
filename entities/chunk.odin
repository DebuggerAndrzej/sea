package entities

Chunk :: struct {
	operations: [dynamic]Operation,
	values:     [dynamic]Value,
	lines:      map[u32]u16,
}

add_operation :: proc(chunk: ^Chunk, operation: Operation, line_number: u32) {
	append(&chunk.operations, operation)
	chunk.lines[line_number] += 1
}

add_value :: proc(chunk: ^Chunk, value: Value) {
	append(&chunk.values, value)
}

get_line :: proc(chunk: ^Chunk, operation_index: u32) -> (u32, bool) {
	partial_sum: u32 = 0
	lines_handled: int = 0

	for line_number: u32 = 0; lines_handled < len(chunk.lines); line_number += 1 {
		if line_number in chunk.lines {
			partial_sum += u32(chunk.lines[line_number])
			if partial_sum >= operation_index {
				return line_number, true
			}
			lines_handled += 1
		}
	}

	return 0, false
}
