//
//  newhomepage.swift
//  Landmarks
//
//  Created by Ashwin Charles on 11/19/24.
//

import SwiftUI

struct newhomepage: View {
    @EnvironmentObject var sharedData: SharedData
    var body: some View {
        VStack{
            Image("cowsample")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 200)
                .padding(.bottom, 25)
            Text("Welcome to MOO'd!")
                .font(.custom("Jua", size: 25))
                .foregroundColor(.black)
                .frame(width: 250)
                .padding(.top, 20)
        }
    }
}

struct newhomepage_Previews: PreviewProvider {
    static var previews: some View {
        newhomepage()
            .environmentObject(SharedData()) // Inject mock data
    }
}

#Preview {
    newhomepage()
}
