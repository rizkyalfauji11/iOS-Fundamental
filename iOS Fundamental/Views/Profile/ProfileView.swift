//
//  ProfileView.swift
//  iOS Fundamental
//
//  Created by Rizky Alfa Uji Gultom on 21/07/20.
//  Copyright © 2020 Rizky Alfa Uji Gultom. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            Spacer()
            Image("profile")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .shadow(radius: 10)
                .frame(height: 300)
            
            Text("Rizky Alfa Uji Gultom")
                .padding()
            Text("rizkyalfauji11@gmail.com")
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
