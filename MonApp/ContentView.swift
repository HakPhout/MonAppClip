import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appData: AppData
    @State private var navigateToPage2 = false
    @State private var navigateToPage3 = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("LogoH2H") // Assure-toi que ton asset s'appelle LogoH2H
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.top, 40)

                Text("Veux-tu faire un don* H2H ?")
                    .foregroundColor(.white)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()

                VStack(spacing: 16) {
                    HStack(spacing: 16) {
                        Button(action: {
                                appData.selectedAnswer = "1€"
                            navigateToPage3 = true
                        }) {
                            Text("1€")
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("AppLightViolet"))
                                .cornerRadius(12)
                                .foregroundColor(.black)
                        }

                        Button(action: {
                            appData.selectedAnswer = "2€"
                            navigateToPage3 = true
                        }) {
                            Text("2€")
                                .font(SwiftUI.Font.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("AppLightViolet"))
                                .cornerRadius(12)
                                .foregroundColor(.black)
                        }
                    }

                    HStack(spacing: 16) {
                        Button(action: {
                            appData.selectedAnswer = "5€"
                            navigateToPage3 = true
                        }) {
                            Text("5€")
                                .font(SwiftUI.Font.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("AppLightViolet"))
                                .cornerRadius(12)
                                .foregroundColor(.black)
                        }

                        Button(action: {
                            // go to Page 2 for manual input
                            navigateToPage2 = true
                        }) {
                            Text("Autre montant")
                                .font(SwiftUI.Font.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("AppPink"))
                                .cornerRadius(12)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding(.horizontal)

                // white line of text under the 4 buttons
                Text("* Ton don est soumis à une commission qui financera un programme d'accompagnement vers une formation de service")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)

                Spacer()
            }
            .navigationDestination(isPresented: $navigateToPage2) {
                Page2View().environmentObject(appData)
            }
            .navigationDestination(isPresented: $navigateToPage3) {
                Page3View().environmentObject(appData)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.ignoresSafeArea())
        }
    }
}

