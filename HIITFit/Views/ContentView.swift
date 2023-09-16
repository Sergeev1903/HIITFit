
import SwiftUI

struct ContentView: View {

  @SceneStorage("selectedTab") private var selectedTab = 9

  var body: some View {
    TabView(selection: $selectedTab) {
      WelcomeView(selectedTab: $selectedTab)
        .tag(9)
      ForEach(0 ..< Exercise.exercises.count) { index in
        ExerciseView(selectedTab: $selectedTab, index: index)
          .tag(index)
      }
    }
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    .onAppear {
      print(FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask))
    }
  }

  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
  }
}
