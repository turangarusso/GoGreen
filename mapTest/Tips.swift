//
//  Tips.swift
//  mapTest
//
//  Created by Giovanni Russo on 31/05/22.
//  

import SwiftUI

struct Tips: View {
    var body: some View {
        VStack{
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 63){
                    
                    ForEach(littleTip){ num in
                        GeometryReader{ proxy in
                            
                            let scale = getScale(proxy: proxy)
                            
                            ZStack(alignment : .bottom){
                                ZStack{
                                    Image(num.Immagine)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 320, height: 460)
                                        .clipped()
                                        .cornerRadius(20)
                                        .overlay(RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color(white: 0.4))            )
                                        .shadow(radius: 8)
                                    
                                    RoundedRectangle(cornerRadius: 20.0)
                                        .foregroundColor(.clear)
                                        .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                                        .frame(width: 320, height: 460, alignment: .center)
                                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                                    
                                }
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                                
                                Text(num.title)
                                    .font(.system(size: 32, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .padding(.bottom)
                                
                            
                                
                            }
                            
                            
                            
                            
                            .scaleEffect(.init(width: scale, height: scale))
                            //                            .animation(.spring(), value: 1)
                            .animation(.easeOut(duration: 1))
                            .padding(.vertical)
                            
                        } // end Geometry
                        .frame(width: 230, height: 500)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 48)
                    }
                    Spacer()
                        .frame(width:48)
                } //EndHStack
            }//End ScrollView
        }
    }
    
    func getScale(proxy: GeometryProxy) -> CGFloat{
        let midPoint: CGFloat = 125
        
        let viewFrame = proxy.frame(in: CoordinateSpace.global)
        
        var scale: CGFloat = 1.0
        let deltaXAnimationThreshold: CGFloat = 125
        
        let diffFromCenter = abs(midPoint - viewFrame.origin.x - deltaXAnimationThreshold / 2)
        if diffFromCenter < deltaXAnimationThreshold{
            scale = 1 + (deltaXAnimationThreshold - diffFromCenter) / 500
        }
        
        return scale
    }
}

struct Tips_Previews: PreviewProvider {
    static var previews: some View {
        Tips()
    }
}
