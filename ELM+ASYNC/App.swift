import SwiftUI

@main
struct ELM_ASYNCApp: App {

    // TBD: Routing
    @State var nextView: AnyView?
    
    var body: some Scene {
        WindowGroup {
            if let next = nextView {
                next
            } else {
                Text("Loading")
                    .task { nextView = AnyView(await makeExample()) }
            }
        }
    }
}
