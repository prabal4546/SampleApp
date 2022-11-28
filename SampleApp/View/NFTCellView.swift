//
//  NFTCellView.swift
//  SampleApp
//
//  Created by Iqrah Nadeem on 24/11/2022.
//

import SwiftUI

struct NFTCellView: View {
    
    let nft: NFTHolder
    var body: some View {
        
                VStack{
                    
                    AsyncImage(
                        url:URL(string: nft.imageURL),
                        content: { image in
                            image
                                .resizable()
                                .aspectRatio( contentMode: .fill)
                                .frame(width: (UIScreen.main.bounds.width - 55)/2, height: 150)
                        },
                        placeholder: {
                            ProgressView()
                        }
                                )
                            
                        VStack(alignment: .leading){
                            Text(nft.name)
                                
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                
                            Text("Geh5Ss5.....KHyeBHor1b")
                                .font(.caption)
                                .foregroundColor(Color.gray)
                                
                        }
                        .padding()
                }
                .background(Color("CardBackground"))
                .cornerRadius(10)
    }
    
}

struct NFTCellView_Previews: PreviewProvider {
    static var previews: some View {
        NFTCellView(nft: MockData.sampleNFT)
    }
}
