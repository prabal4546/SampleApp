//
//  NFTViiew.swift
//  SampleApp
//
//  Created by Prabaljit Walia on 25/10/22.
//

import SwiftUI
import Metaplex

struct NFTView: View {
    @StateObject var homeVM:NetworkingVM = NetworkingVM()
    // FIXME: static data to be replaced with VM fetchNFT call
    
    @State var Grid:[Int] = []
    var body: some View {
        NavigationView {
            VStack {
                MainView(data: homeVM.nftList, Grid: self.$Grid)
            }.navigationBarItems(leading: Image("metaplex_logo"), trailing: Text("owner key").foregroundColor(.white))
                .background(Color("Background"), ignoresSafeAreaEdges: .all)
        }
        .onAppear{
            self.generateGrid()
            homeVM.viewLoaded()
        }
        
        
    }
    
    // FIXME: 
    func generateGrid(){
        for i in stride(from: 0, to: self.homeVM.nftList.count, by: 2){
            if i != self.homeVM.nftList.count{
                self.Grid.append(i)
            }
            
        }
    }
}

struct NFTView_Previews: PreviewProvider {
    static var previews: some View {
        NFTView()
    }
}

// MARK:-

struct CardView:View{
    @StateObject var homeVM:NetworkingVM = NetworkingVM()
    
    var data:NFT
    var body: some View{
        
        VStack(spacing: 0){
            if homeVM.nftList.count == 0{
                ProgressView()
            }else{
                Image(uiImage: UIImage(named: "person")!)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: (UIScreen.main.bounds.width - 55)/2, height: 150)
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(Color("CardBackground"))
                        .frame(width: (UIScreen.main.bounds.width - 55)/2, height: 50)
                    
                    Text(data.name)
                        .font(.caption)
                    .foregroundColor(.white)
                 }
                

            }
        }.onAppear {
            homeVM.viewLoaded()
        }
        .background(Color("CardBackground"), ignoresSafeAreaEdges: .all)
            .cornerRadius(20)
            
            .padding()
    }
}
struct MainView:View{
     var data:[NFT]
    @Binding var Grid:[Int]
    @StateObject var homeVM:NetworkingVM = NetworkingVM()
    var body: some View{
        let actualNFT = homeVM.nftList[0..<homeVM.nftList.count]
        VStack{
            if !self.Grid.isEmpty{
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 5) {
                        ForEach(self.Grid,id:\.self) { i in
                            HStack(spacing:5){
                                ForEach(actualNFT.indices,id:\.self){j in
                                    VStack{
                                        if j != self.data.count{
                                            
                                            NavigationLink{
                                                
                                                NFTDetailView()
                                                
                                            }
                                        label:{
                                            CardView(data: actualNFT[j])
                                        }
                                        }
                                    }
                                    
                                }
//                                if i == self.Grid.last && self.data.count % 2 != 0{
//                                    Spacer(minLength: 0)
//                                }
                            }
                        }
                    }
                    
                }
            }
            
        }
        .onAppear{
            homeVM.viewLoaded()
        }
    }
}
