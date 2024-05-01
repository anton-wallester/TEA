import Foundation

struct ExampleState {
    var currentValue: Int
}

extension ExampleState {
    static var initValue: Self { .init(currentValue: 100) }
}

struct ExampleEnvironment {
    let increment: (Int) async -> Int
    let decrement: (Int) async -> Int
}

enum ExampleEvent {
    case increase
    case decrease
}

enum ExampleEffect {
    case newValue(Int)
}

enum Reducer {
    static func transform(
        state: ExampleState,
        event: ExampleEvent,
        env: ExampleEnvironment
    ) async -> ExampleEffect {
        switch event {
        case .increase:
            let newValue = await env.increment(state.currentValue)
            return .newValue(newValue)
        case .decrease:
            let newValue = await env.decrement(state.currentValue)
            return .newValue(newValue)
        }
    }
    
    static func apply(state: inout ExampleState, effect: ExampleEffect) async -> ExampleState {
        switch effect {
        case .newValue(let newValue):
            state.currentValue = newValue
            return state
        }
    }    
}
