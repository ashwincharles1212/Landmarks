//
//  QuestionaireView.swift
//  Landmarks
//
//  Created by Ashwin Charles on 12/3/24.
//

import SwiftUI

struct QuestionaireView: View {
    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        ZStack{
            sharedData.topColor
                .ignoresSafeArea()
        VStack(spacing: 50) {
            Text("Let's check your moo'd.")
                .font(.custom("Jua", size: 24))
                .padding()
                .padding(.top, 25)
                .foregroundColor(sharedData.textColor)
            Image("questionaire")
                .resizable()
                .scaledToFit()
                .frame(width: 175, height: 100)
                .scaleEffect(2)
                .padding(.top, 25)

            
            Text("How do you want to check in?")
                .padding(.top, 50)
                .font(.custom("Jua", size: 24))
                .foregroundColor(sharedData.textColor)


            HStack(spacing: 40) {
                VStack {
                    NavigationLink(
                        destination: SurveyView(),
                        label: {
                            VStack {
                                Image(systemName: "checkmark.rectangle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(0.5)
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(20)
                                Text("SURVEY")
                                    .font(.custom("Jua", size: 24))
                                    .foregroundColor(sharedData.textColor)

                                
                            }
                        })
                    
                    Text("~ 5 minutes")
                        .foregroundColor(.gray)
                        .font(.custom("Jua", size: 14))
                    
                }
                
                VStack {
                    NavigationLink(
                        destination: JournalView(),
                        label: {
                            VStack {
                                Image(systemName: "newspaper")
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(0.5)
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(20)
                                Text("JOURNAL")
                                    .font(.custom("Jua", size: 24))
                                    .foregroundColor(sharedData.textColor)
                            }
                        })
                    
                    Text("~ 10 minutes")
                        .foregroundColor(.gray)
                        .font(.custom("Jua", size: 14))
                }
            }
                homebar()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //homebar()
    }
    }
}

#Preview {
    let previewSharedData = SharedData() // Create a sample instance of SharedData

    return QuestionaireView()
        .environmentObject(previewSharedData) // Provide the shared data to the preview
}
