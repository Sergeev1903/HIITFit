import SwiftUI

struct WelcomeView: View {
  @EnvironmentObject var history: HistoryStore
  @State private var showHistory = false
  @Binding var selectedTab: Int
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
        Spacer()
        ContainerView {
          VStack {
            WelcomeView.images
            WelcomeView.welcomeText
            getStartedButton
            Spacer()
            historyButton
          }
        }
        .frame(height: geometry.size.height * 0.8)
      }
      .sheet(isPresented: $showHistory) {
        HistoryView(showHistory: $showHistory)
          .environmentObject(history)
      }
    }
  }
  
  var getStartedButton: some View {
    RaisedButton(buttonText: "Get Started") {
      selectedTab = 0
    }
    .padding()
  }
  
  var historyButton: some View {
    Button(
      action: {
        showHistory = true
      }, label: {
        Text("History")
          .fontWeight(.bold)
          .padding([.leading, .trailing], 5)
      })
    .padding(.bottom, 10)
    .buttonStyle(EmbossedButtonStyle())
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      WelcomeView(selectedTab: .constant(9))
      WelcomeView(selectedTab: .constant(9))
        .previewDevice("iPod touch (7th generation)")
    }
  }
}

