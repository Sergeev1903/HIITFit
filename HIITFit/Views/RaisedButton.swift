import SwiftUI

struct RaisedButton: View {
  let buttonText: String
  let action: () -> Void
  
  var body: some View {
    Button(action: {
      action()
    }, label: {
      Text(buttonText)
        .raisedButtonTextStyle()
    })
    .buttonStyle(RaisedButtonStyle())
  }
}

struct RaisedButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .offset(y: configuration.isPressed ? 2 : 0)
      .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
      .frame(maxWidth: .infinity)
      .padding([.top, .bottom], 12)
      .buttonPress(configuration.isPressed)
      .animation(.none)
  }
}

private extension View {
  func buttonPress(_ isPressed: Bool) -> some View {
    self
      .background(
        !isPressed ? AnyView(normal()) : AnyView(pressed())
      )
  }
  
  func normal() -> some View {
    Capsule()
      .shadow(color: Color("drop-shadow"), radius: 8, x: 6, y: 6)
      .shadow(color: Color("drop-highlight"), radius: 8, x: -6, y: -6)
      .foregroundColor(Color("background"))
  }
  
  func pressed() -> some View {
    Capsule()
      .inset(by: -4)
      .stroke(Color("background"), lineWidth: 8)
      .shadow(color: Color("drop-shadow"), radius: 4, x: 6, y: 6)
      .shadow(color: Color("drop-highlight"), radius: 4, x: -6, y: -6)
      .foregroundColor(Color("background"))
      .clipShape(Capsule())
  }
}

struct RaisedButton_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ZStack {
        RaisedButton(buttonText: "Get Started") {
          print("Hello World")
        }
        .padding(20)
      }
      .preferredColorScheme(.light)
      .background(Color("background"))
      .previewLayout(.sizeThatFits)
      ZStack {
        RaisedButton(buttonText: "Get Started") {
          print("Hello World")
        }
        .padding(20)
      }
      .preferredColorScheme(.dark)
      .background(Color("background"))
      .previewLayout(.sizeThatFits)
    }
  }
}

extension Text {
  func raisedButtonTextStyle() -> some View {
    self
      .font(.body)
      .fontWeight(.bold)
  }
}
