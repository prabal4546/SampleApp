//
//  MintView.swift
//  SampleApp
//
//  Created by Prabaljit Walia on 31/10/22.
//

import SwiftUI

import SwiftUI

 struct MintView: View {
     var body: some View {
         
             VStack {
                 VStack {
                     HStack{
                         Text("Creators")
                             .font(.system(size: 25))
                             .fontWeight(.bold)
                         Spacer()
                         Text("Royalty splits")
                             .font(.footnote)
                             .foregroundColor(.gray)

                     }.padding(.vertical)

                     HStack{
                         Text("ohs9...TecV")
                         Spacer()
                         Text("100%")
                     }

                 }.padding()
                 
                 VStack {
                     HStack{
                         Text("Overview")
                             .font(.system(size: 25))
                             .fontWeight(.bold)
                         Spacer()


                     }.padding(.vertical)

                     HStack{
                         Text("Sales Status")
                         Spacer()
                         Text("Secondary")
                     }.padding(.vertical)
                     HStack{
                         Text("Royalty Fee Basis")
                         Spacer()
                         Text("8.5%")
                     }.padding(.vertical)
                     HStack{
                         Text("Metadata Status")
                         Spacer()
                         Text("Mutable")

                     }.padding(.vertical)

                 }.padding()

                 VStack{
                     HStack{
                         Text("Summary")
                             .font(.system(size: 25))
                             .fontWeight(.bold)
                         Spacer()
                         Text("Wallet ID")
                             .font(.footnote)
                             .foregroundColor(.gray)

                     }.padding(.vertical)

                     HStack{
                         Text("Update Authority")
                         Spacer()
                         Text("ohs9...TecV")
                             .onTapGesture {
                                 UIApplication.shared.open(URL(string: "https://solscan.io/account/ohs9X6mPZG3mLqdPheYpEGvvXZkGwVFdV1ec8WbTecV")!)
                             }
                             .foregroundColor(Color.green)
                     }.padding(.vertical)
                     HStack{
                         Text("Token Address")
                         Spacer()
                         Text("ohs9...TecV")
                             .foregroundColor(Color.green)
                             .onTapGesture {
                                 UIApplication.shared.open(URL(string: "https://solscan.io/account/ohs9X6mPZG3mLqdPheYpEGvvXZkGwVFdV1ec8WbTecV")!)
                             }
                     }.padding(.vertical)
                     HStack{
                         Text("Owner Address")
                         Spacer()
                         Text("ohs9...TecV")
                             .foregroundColor(Color.green)
                             .onTapGesture {
                                 UIApplication.shared.open(URL(string: "https://solscan.io/account/ohs9X6mPZG3mLqdPheYpEGvvXZkGwVFdV1ec8WbTecV")!)
                             }
                     }.padding(.vertical)

                 }.padding()
             }
         }
     
 }

 struct MintView_Previews: PreviewProvider {
     static var previews: some View {
         MintView()
     }
 }
