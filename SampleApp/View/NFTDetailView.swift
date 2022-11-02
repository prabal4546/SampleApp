//
//  NFTDetailView.swift
//  SampleApp
//
//  Created by Iqrah Nadeem on 31/10/2022.
//

import SwiftUI

struct NFTDetailView: View {
    var body: some View {
        
        
        
        ZStack{
            
            Color("Background")
                .ignoresSafeArea()
            
            
            VStack{
                
                ScrollView{
                    
                    TopHalfNFTView()
                    MintView()
                    
                    
                }
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.white)
                
                
            }
        }
        
        
        
    }
}

struct NFTDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NFTDetailView()
    }
}
