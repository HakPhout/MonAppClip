import SwiftUI

struct Page8View: View {
    @EnvironmentObject var appData: AppData

    var pointsText: String {
        if let sel = appData.selectedAnswer, !sel.isEmpty {
            return sel
        }
        if !appData.amount.isEmpty {
            return appData.amount
        }
        return "0"
    }

    var body: some View {
        VStack(spacing:16){
            Text("Merci pour ton don ! Tu fais maintenant parti de la grande famille H2H 💜").foregroundColor(Color("AppLightViolet")).font(.title).padding(.top,40).multilineTextAlignment(.center)
            Text("N'oublie pas de te connecter pour utliser tes points").foregroundColor(.white)

            ZStack {
                RoundedRectangle(cornerRadius:16).fill(Color("AppLightViolet"))
                    .frame(height:270)
                VStack(spacing:12){
                    Image("LogoH2H").resizable().scaledToFit().frame(width:100,height:100).padding(.top,10)
                    Text("Tu as cumulé \(pointsText) en points")
                        .font(.headline)
                        .foregroundColor(.black)
                    Button(action: {
                        // action to see benefits
                    }) {
                        Text("Voir avantages")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .padding(.horizontal)

            Spacer()
        }
        .background(Color.black.ignoresSafeArea())
    }
}
