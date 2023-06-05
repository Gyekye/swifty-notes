import SwiftUI


struct NavigationModifier: ViewModifier {
    var backgroundColor: UIColor?
    
    init(backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        
        if let backgroundColor = backgroundColor {
            appearance.backgroundColor = backgroundColor
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        }
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    func body(content: Content) -> some View {
        content
    }
}
