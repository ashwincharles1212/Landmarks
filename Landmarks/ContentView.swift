import SwiftUI

class SharedData: ObservableObject {
    @Published var name: String = "AC"
    @Published var email: String = "test05@gmail.com"
    @Published var phone: String = "000-000-0000"
    @Published var pronouns: String = "he/him"
    @Published var mode = true
    @Published var topColor: Color = Color(.white)
    @Published var buttoncolor: Color = Color(.gray)
    @Published var textColor: Color = Color(.black)
    @Published var lighttext: Color = Color(.gray)
}
public struct homebar: View {
    public var body: some View {
        HStack {
            // Home NavigationLink
            NavigationLink(
                destination: dashboard(),
                label: {
                    Image(systemName: "house")
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                        .scaleEffect(2)
                }
            )
            
            // Questionnaire NavigationLink
            NavigationLink(
                destination: QuestionaireView(),
                label: {
                    Image(systemName: "book")
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                        .scaleEffect(2)
                }
            )
            
            // Resources NavigationLink
            NavigationLink(
                destination: ResourceView(),
                label: {
                    Image(systemName: "doc.text")
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                        .scaleEffect(2)
                }
            )
            
            // Settings NavigationLink
            NavigationLink(
                destination: ContentView(),
                label: {
                    Image(systemName: "gear")
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                        .scaleEffect(2)
                }
            )
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
        .frame(width: 350, height: 100)
    }
}
struct ContentView: View {
    @EnvironmentObject var sharedData: SharedData // Access shared data
    
    var body: some View {
        NavigationStack{
            ZStack {
                sharedData.topColor
                    .ignoresSafeArea()
                
                VStack {
                    Button("Change Mode") {
                        sharedData.mode.toggle()
                        if sharedData.mode {
                            sharedData.topColor = .white
                            sharedData.textColor = .black
                            sharedData.lighttext = .gray
                        } else {
                            sharedData.topColor = .black
                            sharedData.textColor = .white
                            sharedData.lighttext = .gray
                        }
                    }
                    .padding(.top, 50)
                    .foregroundColor(sharedData.textColor)
                    
                    Spacer()
                    
                    // Navigation Bar
                    homebar()
                    }
        
                .navigationBarHidden(true)
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(SharedData())
        }
    }
    public struct homebar: View{
        public var body: some View{
            HStack {
                // Home NavigationLink
                NavigationLink(
                    destination: dashboard(),
                    label: {
                        Image(systemName: "house")
                            .frame(maxWidth: .infinity)
                            .scaledToFit()
                            .scaleEffect(2)
                    }
                )
                
                // Questionnaire NavigationLink
                NavigationLink(
                    destination: QuestionaireView(),
                    label: {
                        Image(systemName: "book")
                            .frame(maxWidth: .infinity)
                            .scaledToFit()
                            .scaleEffect(2)
                    }
                )
                
                // Resources NavigationLink
                NavigationLink(
                    destination: ResourceView(),
                    label: {
                        Image(systemName: "doc.text")
                            .frame(maxWidth: .infinity)
                            .scaledToFit()
                            .scaleEffect(2)
                    }
                )
                
                // Settings NavigationLink
                NavigationLink(
                    destination: ContentView(),
                    label: {
                        Image(systemName: "gear")
                            .frame(maxWidth: .infinity)
                            .scaledToFit()
                            .scaleEffect(2)
                    }
                )
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
            .frame(width: 350, height: 100)
            .padding(.bottom, 20)
        }
    }
    
}
