
import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      WelcomeView()
      
      ForEach(0 ..< Exercise.exercises.count) { number in
        ExerciseView(index: number)
      }
      
      Text("3. Hello, world!")
    }
    .tabViewStyle(.page)
    .indexViewStyle(.page(backgroundDisplayMode: .always))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
