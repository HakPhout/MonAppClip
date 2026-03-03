import SwiftUI

struct Page6View: View {
    var body: some View {
        VStack {
            Text("Oh non tu nous quittes 😢")
                .foregroundColor(Color("AppLightViolet"))
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding(.top, 20)

            LottieView(name: "Chat", loopMode: .loop)
                .frame(height: 300)

            Spacer()
            Spacer()
            Spacer()
            
            Text("En espérant te revoir bientôt parmi nous")
                .foregroundColor(.white)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.top, 16)

            Spacer()
        }
        .background(Color.black.ignoresSafeArea())
    }
}
