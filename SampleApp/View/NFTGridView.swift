//
//  NFTGridView.swift
//  SampleApp
//
//  Created by Iqrah Nadeem on 24/11/2022.
//

import SwiftUI

struct NFTGridView: View {
    
    @StateObject var vm = ViewModel()
    
    let columns : [GridItem] = [GridItem(.flexible()),
                                GridItem(.flexible())]
    
    var body: some View {
        
        ZStack {
            
            
            NavigationView {
                ScrollView{
                    
                    LazyVGrid(columns: columns){
                        
                        ForEach(vm.nftList, id: \.self){
                            
                            nft in
                            NavigationLink{
                                  NFTDetailView()
                              }
                          label:{
                              NFTCellView(nft: nft)
                          }
                            
                        }
                        
                    }
                    
                    if vm.isLoading { LoadingView() }
                    
                }
                .navigationBarItems(leading: Image("metaplex_logo"), trailing: Text("Geh5...Hor1b").foregroundColor(.white))
                .background(Color("Background"), ignoresSafeAreaEdges: .all)
            }
            .onAppear { vm.getNFTList() }
            
            
        }
 
    }
}


struct NFTGridView_Previews: PreviewProvider {
    static var previews: some View {
        NFTGridView()
    }
}


