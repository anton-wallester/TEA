import SwiftUI

struct ExampleView: View {
    
    @ObservedObject var adapter: ViewAdapter<ExampleState, ExampleEvent>
    
    var body: some View {
        Text("Current value = \(adapter.state.currentValue)")
        Button("+", action: { adapter.send(event: .increase) })
        Button("-", action: { adapter.send(event: .decrease) })
    }
}
