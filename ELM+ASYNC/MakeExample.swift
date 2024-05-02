import SwiftUI

// Composition Root
func makeExample() async -> some View {
        
    let viewAdapter = await TEA.makeAdapter(
        initialState: ExampleState.initValue,
        environment: ExampleEnvironment(
            increment: { $0 + 1 },
            decrement: { $0 - 1 }
        ),
        transform: ExampleReducer.transform,
        apply: ExampleReducer.apply
    )
        
    return ExampleView(adapter: viewAdapter)
}
