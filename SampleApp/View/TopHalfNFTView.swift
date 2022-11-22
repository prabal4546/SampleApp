//
//  NFTDetailTopHalfView.swift
//  SampleApp
//
//  Created by Iqrah Nadeem on 31/10/2022.
//
import SwiftUI

struct TopHalfNFTView: View {
    
    @State var data = NFTTopHalfDetail(title: "OnlyHands 3266", description: "OnlyHands is a series of 3,337 custom designed NFTs on the Solana Blockchain. We are also the FIRST EVER community driven animated NFT series.", image: "person", attributes: ["BACKGROUND" : "GREEN", "EYEBROWS" : "ORIGINAL", "EYES": "ORIGINAL", "NAILS": "BLACK", "NECKLACE": "NOTHING", "HATS": "DRINKHAT", "MOUTH": "NORMAL", "SCARS": "NOTHING", "RINGS": "NOTHING", "SKINS": "TAN2", "SHOES": "NOTHING", "TATTOSS": "NOTHING"])
    
    var body: some View {

            VStack{
                ZStack{
                    
                    VStack{
                        
                        ZStack{
                            
                            Image(data.image)
                                
                                .resizable()
                                .frame(height: 400.0)
                                .blur(radius: 5)
                            
                            
                            Rectangle()
                                .foregroundColor(Color.black.opacity(0.4))
                                .shadow(color: Color.black,
                                        radius: 50,
                                        x: 0,
                                        y: 100)
                        }
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.all)
                        Spacer()
                    }
         
                    Image(data.image)
                    
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300.0, height: 300.0)
                        .offset(y:80)
                    
                }
                .padding(.bottom)
                
                VStack{
                    
                    Text(data.title)
                        .font(.largeTitle)
                        .padding()
                    
                    Text(data.description)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                    
                    ScrollView(.horizontal){
                        
                        HStack{
                            
                            ForEach(data.attributes.sorted(by: <), id: \.key) { key, value in
                                
                                    VStack {
                                        
                                        Text(key)
                                            .foregroundColor(.gray)
                                        Text(value)
                                    }
                                    .frame(width: 120)
                                    .padding(10)
                                    .border(.gray)
                                
                                
                            }
                        }
                    }
                    .padding()
                    
                    
                }
            }
        }
}

struct TopHalfNFTView_Previews: PreviewProvider {
    static var previews: some View {
        TopHalfNFTView()
    }
}

