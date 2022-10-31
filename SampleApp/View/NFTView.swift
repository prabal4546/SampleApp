//
//  NFTViiew.swift
//  SampleApp
//
//  Created by Prabaljit Walia on 25/10/22.
//

import SwiftUI

struct NFTView: View {
    // FIXME: static data to be replaced with VM fetchNFT call
    @State var data = [
        FetchedNFT(image: ("person"), title: "first nft"),
        FetchedNFT(image: ("person"), title: "first nft"),
        FetchedNFT(image: ("person"), title: "first nft"),
        FetchedNFT(image: ("person"), title: "first nft")
    ]
    
    @State var Grid:[Int] = []
    var body: some View {
        NavigationView {
            VStack {
                MainView(data: self.$data, Grid: self.$Grid)
            }.navigationBarItems(leading: Image("metaplex_logo"), trailing: Text("owner key").foregroundColor(.white))
                .background(Color("Background"), ignoresSafeAreaEdges: .all)
        }
        .onAppear{
            self.generateGrid()
        }
        
        
    }
    
    // FIXME: 
    func generateGrid(){
        for i in stride(from: 0, to: self.data.count, by: 2){
            if i != self.data.count{
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
    var data:FetchedNFT
    var body: some View{
        VStack(spacing: 0){
            Image(data.image)
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: (UIScreen.main.bounds.width - 55)/2, height: 150)
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(Color("CardBackground"))
                    .frame(width: (UIScreen.main.bounds.width - 55)/2, height: 50)
                
                Text(data.title)
                    .font(.caption)
                .foregroundColor(.white)
                    
            }
        }.background(Color("CardBackground"), ignoresSafeAreaEdges: .all)
            .cornerRadius(20)
            
            .padding()
    }
}
struct MainView:View{
    @Binding var data:[FetchedNFT]
    @Binding var Grid:[Int]
    var body: some View{
        VStack{
            if !self.Grid.isEmpty{
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 5) {
                        ForEach(self.Grid,id:\.self) { i in
                            HStack(spacing:5){
                                ForEach(i...i+1,id:\.self){j in
                                    VStack{
                                        if j != self.data.count{
                                            
                                            NavigationLink{
                                                
                                                NFTDetailView()
                                                
                                            }
                                        label:{
                                            CardView(data: self.data[j])
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
    }
}
