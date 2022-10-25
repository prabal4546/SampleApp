//
//  LoginView.swift
//  SampleApp
//
//  Created by Iqrah Nadeem on 25/10/2022.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack{
            
            Color("Background")
            .ignoresSafeArea()
            
            
            VStack{
                
                Spacer()
              
                
                Image("metaplex_pdf")
                .resizable()
                //Not sure what width, height to put?
                .frame(width: 300.0, height: 120.0)
                

                
                Button("Login with Phantom",role: .cancel){}
                //Not sure what width, height to put?
                .frame(width: 300.0, height: 50.0)
                .background(Color("Green"))
                .foregroundColor(Color("Neutral90"))
                .bold()
                .padding()
                
                
                
                Spacer()
                Text("Created by Metaplex")
                    .foregroundColor(.gray)
                
              
                
            }
            
        }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
