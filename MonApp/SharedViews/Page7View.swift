import SwiftUI

struct Page7View: View {
    @EnvironmentObject var appData: AppData
    @State private var phoneNumber: String = ""
    @State private var country: String = "FR"
    @State private var accepted = false
    @State private var toPage8 = false

    let countries = [("FR","🇫🇷"),("US","🇺🇸"),("GB","🇬🇧"),("DE","🇩🇪")]

    var body: some View {
        VStack(spacing:16){
            Image("LogoH2H").resizable().scaledToFit().frame(width:100,height:100).padding(.top,40)
            Text("Gagne des points pour débloquer des bons de réductions").foregroundColor(Color("AppLightViolet")).font(.title).multilineTextAlignment(.center)
            Text("Fais des dons en quelques secondes depuis cette application pour profiter d'offres exclusives").foregroundColor(.white).padding(.bottom,10)

            HStack(spacing:12){
                Menu {
                    ForEach(countries, id: \.0) { code, flag in
                        Button(action: { country = code }) {
                            Text("\(flag) \(code)")
                        }
                    }
                } label: {
                    HStack { Text(countries.first(where: { $0.0 == country })?.1 ?? "🏳️"); Text(country) }
                        .frame(width:80, height:44)
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }

                TextField("N° de téléphone", text: $phoneNumber)
                    .keyboardType(.phonePad)
                    .padding()
                    .frame(height:44)
                    .background(Color.black.opacity(0.15))
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)

            Toggle(isOn: $accepted) {
                Text("J'accepte de recevoir des promotions et des offres cadeaux par sms de la part de H2H").foregroundColor(.white)
            }
            .padding(.horizontal)

            Button(action: {
                toPage8 = true
            }) {
                Text("Valider")
                    .frame(maxWidth:.infinity)
                    .padding()
                    .background(Color("AppPink"))
                    .cornerRadius(12)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
            .padding(.top,8)

            NavigationLink(destination: Page8View().environmentObject(appData), isActive: $toPage8) { EmptyView() }

            Spacer()
        }
        .background(Color.black.ignoresSafeArea())
    }
}
