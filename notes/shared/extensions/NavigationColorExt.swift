
import SwiftUI


extension View {
    func navigationColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationModifier(backgroundColor: backgroundColor))
    }
}
