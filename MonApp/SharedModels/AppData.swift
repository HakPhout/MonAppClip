import Foundation
import Combine

// Shared app data between views
final class AppData: ObservableObject {
    @Published var selectedAnswer: String? = nil // Réponse 1/2/3 or amount with €
    @Published var amount: String = "" // numeric string from Page2 (with €)
}
