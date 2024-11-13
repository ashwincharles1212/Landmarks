//
//  Pet.swift
//  Landmarks
//
//  Created by Ashwin Charles on 11/9/24.
//

import SwiftUI

struct Pet: View {
    @State private var mood = 79
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.white]), // Define your colors here
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            VStack{
                Image(.cow)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 4)) // White border
                    .shadow(radius: 10)
                    .padding(25)
                Text("HAPPY")
                    .font(.largeTitle)
                progressmood(mood: $mood)
                ScrollView{
                    Text("test")
                    Text("test")
                    Text("test")
                    Text("test")


                }

                Spacer()
            }
        }
        
    }
}

#Preview {
    Pet()
}

struct clothing: View{
    var body: some View {
        VStack{
            Image(.suit)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            Text("Clothing")
        }
    }
}

struct progressmood: View {
    @Binding var mood: Int
    var body: some View {
        VStack{
            ProgressView(value: Double(mood)/Double(100))
                .frame(width: 270)
                .padding(20)
            HStack{
                Text("HAPPINESS LEVEL: \(mood)%")
                Image(systemName: "sun.max")
                    .foregroundColor(.yellow)
            }
        }
    }
}
