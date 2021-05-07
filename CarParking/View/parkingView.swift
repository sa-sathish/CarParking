//
//  parkingView.swift
//  CarParking
//
//  Created by sathish s on 03/05/2021.
//

import SwiftUI

struct parkingView: View {
    @State var isAvailable = false
    @State var isSelected = false
    var carImage = ""
    var body: some View{
        VStack(spacing:0){
             
                HStack{
                 
                    DottedLine()
                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [7]))
                        .frame(maxWidth: 1, maxHeight: .infinity, alignment: .leading)
                                .foregroundColor(Color.gray)
                    
                    VStack{
                        if isAvailable{
                            VStack{
                                Text("A-1")
                                    .foregroundColor(.white)
                                        
                            }
                            .frame(width: 70, height: 50)
                            .clipShape(Capsule())
                            .background(isSelected ? Color(.systemIndigo) : Color.clear)
                           
                        }else{
                            Image(carImage)
                                .resizable()
                                .frame(width: 70, height: 50)
                                
                            
                        }

                    }
                    .background(isSelected && !isAvailable ? Color(.systemIndigo) : Color.clear)
                    Spacer()
                }
                .padding()
           
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor(named: "ThemeColor") ?? .black)).ignoresSafeArea()
    }
}

struct parkingView_Previews: PreviewProvider {
    static var previews: some View {
        parkingView()
    }
}
