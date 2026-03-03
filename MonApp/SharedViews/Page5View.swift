import SwiftUI

struct Page5View: View {
    @EnvironmentObject var appData: AppData
    @State private var toPage1 = false
    @State private var toPage6 = false

    var body: some View {
        VStack(spacing:20){
            Image("LogoH2H")
                .resizable().scaledToFit().frame(width:100,height:100).padding(.top,40)
            Text("Veux-tu vraiment annuler ton don H2H ?")
                .foregroundColor(.white).font(.headline).padding()
            HStack(spacing:16){
                Button(action: { toPage1 = true }) {
                    Text("Non")
                        .frame(maxWidth:.infinity)
                        .padding()
                        .background(Color("AppPink"))
                        .cornerRadius(12)
                        .foregroundColor(.black)
                }
                Button(action: { toPage6 = true }) {
                    Text("Oui")
                        .frame(maxWidth:.infinity)
                        .padding()
                        .background(Color("AppPink"))
                        .cornerRadius(12)
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)

            NavigationLink(destination: ContentView().environmentObject(appData), isActive: $toPage1) { EmptyView() }
            NavigationLink(destination: Page6View().environmentObject(appData), isActive: $toPage6) { EmptyView() }

            Spacer()
        }
        .background(Color.black.ignoresSafeArea())
    }
}
