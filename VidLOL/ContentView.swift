//
//  ContentView.swift
//  VidLOL
//
//  Created by Fathan Akram on 28/09/21.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var content : String?
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text(content != nil ? content! : "Home")
                        .font(.title)
                        .bold()
                        .padding(.horizontal)
                    Spacer()
                    Button(action: {
                        
                    },label:{
                        Image("gear")
                    })
//                    switch content{
//                    case "Browse":
//                        Button(action: {
//
//                        },label:{
//                            Image("magnifyingglass")
//                        })
//                    default:
//                        Button(action: {
//
//                        },label:{
//                            Image("gear")
//                        })
//                    }
                    
                        
                    
                }
                
                
                switch content{
                case "Home":
                    homeContent()
                case "Browse" :
                    browseContent()
                default:
                    homeContent()
                }
                
            }
            
            
            
            NavigationBar(content: $content)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NavigationBar: View {
    @Binding var content : String?
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
                .cornerRadius(5.0)
                .padding()
                .shadow(radius: 10 )
            HStack{
                NavigationItem(mContent: "Home", img: "house")
                Spacer()
                NavigationItem(mContent: "Browse", img: "magnifyingglass")
                Spacer()
                NavigationItem(mContent: "Upload", img: "plus")
                Spacer()
                NavigationItem(mContent: "Acticity", img: "heart")
                Spacer()
                NavigationItem(mContent: "Profile", img: "person")
                
            }.frame(width: 230, height: 100, alignment: .center)
                
        }
        .frame(width: .infinity, height: 90, alignment: .center)
        .position(x: 160, y: 495)
    }
    
    func NavigationItem(mContent: String, img:String) -> some View {
        Button( action: {
            content = mContent
        },label:{
            Image(systemName: img)
        })
    }
}
struct homeContent: View {
    var body: some View {
        ScrollView(.vertical){
            VStack{
                HStack{
                    Text("Recommended for you")
                    Spacer()
                }
                
                ForEach(0..<10){ _ in
                    ScrollView(.horizontal){
                        
                        LazyHStack{
                            ForEach(0..<4){_ in
                                VStack{
                                    Image("mukbang")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 100)
                                        .cornerRadius(5.0)
                                    Text("video mukbang gila parah sih, sampe muntah")
                                        .font(.caption)
                                        .frame(width: 140, height: 40)
                                        .lineLimit(2)
                                        .multilineTextAlignment(.leading)
                                        
                                }.frame(width: 170, height: 160, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                                    
                            }
                        }
                    }
                }
                
            }.padding()
        }
    }
}

struct browseContent: View {
    var body: some View {
        
        ScrollView {
                LazyVGrid(columns: [GridItem(.fixed(150)),GridItem(.fixed(100))],
                          alignment: .leading,
                          spacing: nil,
                          pinnedViews: [], content: {
                
                        ForEach(0..<10){_ in
                            VStack{
                                Image("mukbang")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 100)
                                    .cornerRadius(5.0)
                                Text("video mukbang gila parah sih, sampe muntah")
                                    .font(.caption)
                                    .frame(width: 140, height: 40)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                                    
                            }.frame(width: 170, height: 160, alignment: .center)
                            
                                
                        }
                    })
        }
    }
}




