import SwiftUI

struct Page2View: View {
    @EnvironmentObject var appData: AppData
    @State private var inputText: String = ""
    @State private var navigateToPage3 = false

    var formattedAmount: String {
        // if empty => show placeholder. Otherwise append € (no formatting for thousands here, but you can add NumberFormatter)
        return inputText.isEmpty ? "" : "\(inputText)€"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image("LogoH2H")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 40)

            Text("Peux-tu indiquer le montant que tu veux donner ?")
                .foregroundColor(.white)
                .font(.headline)

            HStack(spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("AppLightViolet"))
                    // place the textfield inside to look like a button
                    TextField("Saisir montant", text: $inputText)
                        .keyboardType(.numberPad)
                        .padding()
                        .frame(maxWidth: . infinity)
                        .foregroundColor(.black)
                        .onChange(of: inputText) { _ in
                            // keep typing freely; nothing forced while typing
                        }
                }
                .frame(width: 190, height: 40)

                Button(action: {
                    // save and navigate
                    appData.amount = inputText
                    appData.selectedAnswer = inputText.isEmpty ? nil : "\(inputText)€"
                    navigateToPage3 = true
                }) {
                    Text("Valider")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("AppPink"))
                        .cornerRadius(12)
                        .foregroundColor(.black)
                }
                .frame(width: 190, height: 40)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .navigationDestination(isPresented: $navigateToPage3) {
            Page3View().environmentObject(appData)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
    }
}
