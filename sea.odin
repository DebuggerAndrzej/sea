package main

import "core:fmt"

import "entities"

main :: proc() {
    chunk : entities.Chunk
    entities.add_operation(&chunk, entities.Operation.RETURN)
	for operation in chunk.operations {
        process_instruction(operation)
	}
}


process_instruction :: proc(operation: entities.Operation) {
	using entities.Operation
	switch operation {
	case RETURN:
		simple_instruction("RETURN")
	case CONSTANT:
		simple_instruction("CONSTANT")
	}
}

simple_instruction :: proc(instruction: string) {
	fmt.println(instruction)
}
