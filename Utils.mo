import Types "Types.mo";

module Utils = {
    stable var todos: [Types.TodoItem] = [];
    stable var nextId: Nat = 0;

    public func addTask(task: Text): Nat {
        let newItem = { id = nextId; task = task; completed = false };
        todos := Array.append(todos, [newItem]);
        nextId := nextId + 1;
        return newItem.id;
    };

    public func completeTask(id: Nat): ?Text {
        for (item in todos) {
            if (item.id == id) {
                item.completed := true;
                return null;
            }
        }
        return null; // Task not found
    };

    public func removeTask(id: Nat): ?Text {
        let indexOpt = Array.findIndex(todos, func(item) { item.id == id });
        switch (indexOpt) {
            case (?index) {
                todos := Array.removeAt(todos, index);
                return null;
            };
            case null {
                return null; // Task not found
            };
        }
    };

    public func listTasks(): [Types.TodoItem] {
        return todos;
    };
};
