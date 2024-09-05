package virual_machine

import "core:fmt"

import "../entities"

InterpretResult :: enum {
	OK,
	COMPILE_ERROR,
	RUNTIME_ERROR,
}

interpret :: proc(chunk: ^entities.Chunk) -> InterpretResult {
	for operation in chunk.operations {
		using entities.Operation
		switch operation {
		case RETURN:
			return InterpretResult.OK
		case CONSTANT:
			constant: entities.Value = chunk.values[0]
			ordered_remove(&chunk.values, 0)
			fmt.println(constant)
		}
	}
	return InterpretResult.OK
}
