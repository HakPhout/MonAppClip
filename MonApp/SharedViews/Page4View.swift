import SwiftUI

struct Page4View: View {
    @EnvironmentObject var appData: AppData
    @State private var navigateToPage7 = false

    var body: some View {
        VStack {
            Text("Happy 2 Help te remercie pour ce don 🎉")
                .foregroundColor(Color("AppLightViolet"))
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding(.top, 20)

            // You can keep your Lottie confetti or the SwiftUI particle system
            LottieView(name: "Catcheur", loopMode: .loop)
                .frame(height: 500)

            Spacer()
            Spacer()

            Text("Quel champion ! Tu mérites la ceinture de la générosité 🏆")
                .foregroundColor(.white)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
        }
        .background(Color.black.ignoresSafeArea())
        .onAppear {
            // open Page7 after 10 seconds automatically
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                navigateToPage7 = true
            }
        }
        .navigationDestination(isPresented: $navigateToPage7) {
            Page7View().environmentObject(appData)
        }
    }
}

