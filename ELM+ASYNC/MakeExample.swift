import SwiftUI

func makeExample() async -> some View {
    
    var adapter: ViewAdapter<ExampleState, ExampleEvent>?
    
    await TEA.start(
        initialState: ExampleState.initValue,
        environment: ExampleEnvironment(
            increment: { $0 + 1 },
            decrement: { $0 - 1 }
        ),
        feedback: { stateStream in
            let _adapter = ViewAdapter<ExampleState, ExampleEvent>(.initValue, stream: stateStream)
            adapter = _adapter
            return _adapter.eventStream
        },
        transform: Reducer.transform,
        apply: Reducer.apply
    )
    
    // TBD: Create better solution
    try? await Task.sleep(nanoseconds: 1_000_000)
    
    return ExampleView(adapter: adapter!)
}
