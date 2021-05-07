//
//  DetailView.swift
//  CarParking
//
//  Created by sathish s on 02/05/2021.
//

import SwiftUI

struct DetailView: View {
    @Binding var isShow : Bool
    var body: some View {
        
        VStack{
            
            
            HStack{
                
                Button(action: {
                    withAnimation(.easeOut) {
                        isShow.toggle()
                    }
                }, label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 24, height: 23)
                        .foregroundColor(.white)
                })
                
                
               
                
                    Spacer()
                
                Text("Park zone - 1 ")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    
                }, label: {
                    VStack{
                        Capsule()
                            .frame(width: 30, height: 3)
                        Capsule()
                            .frame(width: 30, height: 3)
                        Capsule()
                            .frame(width: 30, height: 3)
                    }
                    .foregroundColor(.white)
                   
                })
            }
            .padding(.top, 40)
            .padding()
            Spacer()
            
            
            ZStack{
                Image("car")
                    .resizable()
                    .frame(width: 160, height: 160)
                
                Circle()
                    .stroke(Color(.systemIndigo).opacity(0.2),style: StrokeStyle(lineWidth: 9, dash: [2.5]))
                    .aspectRatio(contentMode: .fit)
                    .frame(width:290)
                
                Circle()
                    .stroke(Color(.darkGray).opacity(0.5), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .bevel))
                    .aspectRatio(contentMode: .fit)
                    .frame(width:250)
                    
                Circle()
                    .trim(from: 0.0, to: 0.7)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color("Color"), Color(.systemIndigo)]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .bevel))
                    .aspectRatio(contentMode: .fit)
                    .frame(width:250)
                    .rotationEffect(Angle(degrees: 90))
            
                    
            }
            
           Spacer()
            
            VStack(spacing:10){
                Text("Parking time")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                Text("00:54:34")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("A-2")
                    .foregroundColor(Color("Color"))
                    .font(.system(size: 30))
                    .font(.title)
                    .fontWeight(.bold)
                
            }
            
            Spacer()
            VStack(spacing:20){
                
                Button(action: {
                    withAnimation(.spring()) {
                        isShow.toggle()
                    }
                    
                }, label: {
                    Text("Stop")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                })
                .padding()
                .frame(width: UIScreen.main.bounds.width / 2*1.8, height: 50)
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color("Color"), Color(.systemIndigo)]), startPoint: .leading, endPoint: .trailing)
)
                .clipShape(Capsule())
                
                
                
                
                Button(action: {}, label: {
                    Text("Extend")
                        .foregroundColor(.gray)
                        .font(.system(size:17))
                        .font(.title)
                        
                })
                
            }
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor(named: "ThemeColor") ?? .black)).ignoresSafeArea()
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(isShow: false)
//    }
//}
