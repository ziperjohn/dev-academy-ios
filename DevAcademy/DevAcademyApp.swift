import SwiftUI

@main
struct DevAcademyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(PlacesObservableObject(placesService: ProductionPlacesService()))
                .environmentObject(Coordinator())
        }
    }
}
