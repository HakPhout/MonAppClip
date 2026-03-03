import SwiftUI

struct Page3View: View {
    @EnvironmentObject var appData: AppData
    @State private var navigateToPage1 = false
    @State private var navigateToPage4 = false
    @State private var navigateToPage5 = false

    var previousAnswerText: String {
        if let sel = appData.selectedAnswer, !sel.isEmpty {
            return sel
        }
        if !appData.amount.isEmpty {
            return "\(appData.amount)€"
        }
        return "—"
    }

    var body: some View {
        VStack(spacing:20) {
            Image("LogoH2H")
                .resizable()
                .scaledToFit()
                .frame(width:100, height:100)
                .padding(.top,40)

            Text("Confirmes-tu ton don H2H de \(previousAnswerText) ?")
                .foregroundColor(.white)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()

            HStack(spacing:16) {
                Button(action: { navigateToPage5 = true }) {
                    Text("Annuler")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("AppLightViolet"))
                        .cornerRadius(12)
                        .foregroundColor(.black)
                }

                Button(action: { navigateToPage1 = true }) {
                    Text("Modifier")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("AppLightViolet"))
                        .cornerRadius(12)
                        .foregroundColor(.black)
                }

                Button(action: { navigateToPage4 = true }) {
                    Text("Envoyer")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("AppPink"))
                        .cornerRadius(12)
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)

            NavigationLink(destination: ContentView().environmentObject(appData), isActive: $navigateToPage1) { EmptyView() }
            NavigationLink(destination: Page4View().environmentObject(appData), isActive: $navigateToPage4) { EmptyView() }
            NavigationLink(destination: Page5View().environmentObject(appData), isActive: $navigateToPage5) { EmptyView() }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
    }
}

