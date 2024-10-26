import Utils "Utils.mo";

module Main = {
    public query func getTasks(): [Types.TodoItem] {
        return Utils.listTasks();
    };

    public func addTask(task: Text): Nat {
        return Utils.addTask(task);
    };

    public func completeTask(id: Nat): ?Text {
        return Utils.completeTask(id);
    };

    public func removeTask(id: Nat): ?Text {
        return Utils.removeTask(id);
    };
};
