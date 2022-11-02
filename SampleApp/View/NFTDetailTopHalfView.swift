//
//  NFTDetailTopHalfView.swift
//  SampleApp
//
//  Created by Iqrah Nadeem on 31/10/2022.
//

import SwiftUI

struct NFTDetailTopHalfView: View {
    
    @State var data = FetchedNFT(image: ("person"), title: "first nft")
    
    var body: some View {
        ZStack{
            
            Color("Background")
                .ignoresSafeArea()
            
            
            VStack{
                
                ZStack{
                    
                    VStack{
                        Image(data.image)
                        
                            .resizable()

                            .frame(height: 400.0)
                            .aspectRatio(contentMode: .fit)
                        
                            .edgesIgnoringSafeArea(.all)
                            
                            .blur(radius: 4)
                        
                        Spacer()
                        
                        
                    }
                    
                    
                    Image(data.image)
                    
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300.0, height: 300.0)
                        .offset(y: -5)
                    
                    
                    
                    
                }
                
                
                Text("OnlyHands 3266")
                    
                
                
                Text("OnlyHands is a series of 3,337 custom designed NFTs on the Solana Blockchain. We are also the FIRST EVER community driven animated NFT series.")
                
                
                
               
                
                
                
            }
        }
    }
}

struct NFTDetailTopHalfView_Previews: PreviewProvider {
    static var previews: some View {
        NFTDetailTopHalfView()
    }
}
