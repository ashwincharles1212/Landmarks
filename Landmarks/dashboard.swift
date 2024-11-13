import SwiftUI


struct dashboard: View {
    @State private var isLoading = true // Start with loading as true
    @State private var currency = 265
    @EnvironmentObject var sharedData: SharedData
    let images = [("reward", "Coffee"), ("reward", "Necklace"), ("reward", "Plant")]
    
    var body: some View {
        NavigationStack{
            ZStack {
                sharedData.topColor
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Scrollable content
                    ScrollView {
                        VStack {
                            // Welcome Text
                            Text("Welcome \(sharedData.name)")
                                .font(.custom("Jua", size: 25))
                                .foregroundColor(sharedData.textColor)
                                .frame(width: 250)
                            
                            // Cow Image
                            Image("cow")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 275, height: 150)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(sharedData.textColor, lineWidth: 4))
                                .shadow(radius: 10)
                            
                            // Quote Text
                            Text("”Worrying does not take away tomorrow's troubles. It takes away today's peace.”")
                                .foregroundColor(sharedData.textColor)
                                .font(.custom("Jua", size: 14))
                                .frame(width: 300)
                                .padding(.top, 20)
                            
                            Text("~ Randy Armstrong")
                                .foregroundColor(sharedData.lighttext)
                                .font(.custom("Jua", size: 10))
                                .frame(width: 100)
                                .padding(.top, 5)
                            
                            // Check-In Button
                            Button(action: {}) {
                                Text("Start a Check in")
                                    .font(.custom("Jua", size: 15))
                                    .frame(width: 150, height: 50)
                                    .foregroundColor(sharedData.textColor)
                                    .background(sharedData.buttoncolor)
                                    .cornerRadius(10)
                                    .padding(25)
                            }
                            
                            // Dashboard Header
                            Text("DASHBOARD")
                                .foregroundColor(sharedData.textColor)
                                .font(.custom("Jua", size: 20))
                                .frame(width: 300)
                                .padding(.top, 20)
                                .padding(.trailing, 150)
                            
                            // Progress Bar
                            ProgressBar(currency: $currency, bar: .yellow, lighttext: sharedData.lighttext)
                                .padding(.bottom, 50)
                            
                            Text("REWARDS")
                                .foregroundColor(sharedData.textColor)
                                .font(.custom("Jua", size: 20))
                                .frame(width: 300, height: 50)
                                .padding(.trailing, 170)
                            
                            // Horizontal ScrollView for Images
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    Spacer().frame(width: 73)
                                    ForEach(images, id: \.1) { imageName, label in
                                        VStack {
                                            Image(imageName)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 100, height: 100)
                                                .cornerRadius(10)
                                            Text(label)
                                                .font(.custom("Jua", size: 15))
                                                .foregroundColor(sharedData.textColor)
                                                .padding(.top, 20)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    homebar()
                }
                .opacity(isLoading ? 0 : 1) // Hide the main content when loading
                
                // Loading view
                if isLoading {
                    LoadView()
                }
            }
            .onAppear {
                networkCall()
            }
            .statusBar(hidden: true) // Hide the status bar
            .navigationBarHidden(true) // Hide navigation bar
            .navigationBarBackButtonHidden(true) // Hide the back button
        }
        
        
    }
    func networkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
        }
    }
}
    
    struct ProgressBar: View {
        @Binding var currency: Int
        @EnvironmentObject var sharedData: SharedData
        var bar: Color
        var lighttext: Color
        
        var body: some View {
            VStack {
                HStack {
                    Text("You have")
                        .foregroundColor(sharedData.textColor)
                        .font(.custom("Jua", size: 14))
                        .padding(.top, 20)
                    
                    Text("\(currency) points!")
                        .foregroundColor(bar)
                        .font(.custom("Jua", size: 14))
                        .padding(.top, 20)
                        .padding(.trailing, 130)
                }
                
                ProgressView(value: Double(currency) / 1000.0)
                    .frame(width: 270)
                    .scaleEffect(x: 1, y: 3, anchor: .center)
                    .padding(20)
                    .tint(bar)
                
                HStack {
                    Text("\(1000 - currency) until next award")
                        .font(.custom("Jua", size: 10))
                        .foregroundColor(lighttext)
                        .padding(.leading, 175)
                }
            }
        }
    }
    
    struct LoadView: View {
        @EnvironmentObject var sharedData: SharedData
        var body: some View {
            ZStack {
                Color(sharedData.topColor).ignoresSafeArea()
                VStack {
                        Text("MOO'D")
                            .font(.custom("Jua", size: 50))
                            .foregroundColor(sharedData.textColor)
                        
                    Image("logosamp")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 275, height: 150)
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: sharedData.textColor))
                        .scaleEffect(1.5)
                        .padding(50)
                }
                .frame(width: 400, height: 150, alignment: .center)
            }
        }
    }
