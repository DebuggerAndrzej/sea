package entities

Chunk :: struct {
    operations: [dynamic]Operation,
    values: [dynamic]Value,
}

add_operation :: proc(chunk: ^Chunk, operation: Operation) {
    append(&chunk.operations, operation)
}

add_value :: proc(chunk: ^Chunk, value: Value) {
    append(&chunk.values, value)
}
