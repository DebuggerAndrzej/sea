package main

import "core:fmt"

import "entities"
import "virtual_machine"

main :: proc() {
	chunk: entities.Chunk
	entities.add_operation(&chunk, entities.Operation.CONSTANT, 12)
	entities.add_value(&chunk, 1.2)
	virtual_machine.interpret(&chunk)
}
