//
//  HomeView.swift
//  CarParking
//
//  Created by sathish s on 29/04/2021.
//

import SwiftUI

struct HomeView: View {
    
    @Namespace var animation
    @State var selectedBtn = 0
    @State var isAvailable = true
    @State var rowIndex = -1
    @State var isPresentAlert = false
    @State var isShow = false

    @State var MockData = [
        MockArea(avaibale: true, isSelected: false),
        MockArea(avaibale: false, isSelected: false),
        MockArea(avaibale: true, isSelected: false),
        MockArea(avaibale: false, isSelected: false),
        MockArea(avaibale: true, isSelected: false),
    ]


    
    init() {
       UITableView.appearance().separatorStyle = .none
       UITableViewCell.appearance().backgroundColor = .clear
       UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().isScrollEnabled = false
    }
    var body: some View {
        
        ZStack{
            VStack{
                HStack{
                    
                    Button(action: {
                        print("back action")
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
                }
                .padding(.top, 40)
                .padding()

                
                HStack(spacing: UIScreen.main.bounds.width / 2*0.2){
                    
                    Button(action: {
                        withAnimation(.spring()) {
                            selectedBtn = 0
                        }
                       
                    }, label: {
                        Text("0-20")
                            .foregroundColor(.white)
                    })
                    .padding(.all ,5)
                    .background(selectedBtn == 0 ? Color("SecondaryColor") : Color.clear)
                    .clipShape(Capsule())
                    
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                        selectedBtn = 1
                        }
                    }, label: {
                        Text("20-40")
                            .foregroundColor(.white)

                    })
                    .padding(.all ,5)
                    .background(selectedBtn == 1 ? Color("SecondaryColor") : Color.clear)
                    .clipShape(Capsule())
                    
                    Button(action: {
                        withAnimation(.spring()) {
                        selectedBtn = 2
                        }
                    }, label: {
                        Text("40-60")
                            .foregroundColor(.white)
                    })
                    .padding(.all ,5)
                    .background(selectedBtn == 2 ? Color("SecondaryColor") : Color.clear)
                    .clipShape(Capsule())
                    
                    
                    Button(action: {
                        withAnimation(.spring()) {
                        selectedBtn = 3
                        }
                    }, label: {
                        Text("60-80")
                            .foregroundColor(.white)
                    })
                    
                    .padding(.all ,5)
                    .background(selectedBtn == 3 ? Color("SecondaryColor") : Color.clear)
                    
                    .clipShape(Capsule())
                    
                    
                }
                
                .padding()
                Spacer()
                
                HStack{
                   
                    VStack{
                        
                        
                        ForEach(MockData.enumerated().map({$0}), id: \.element.id) { index, area in
                            ZStack{
                                VerticalLineLeft()
                                            .stroke(style: StrokeStyle(lineWidth: 2, dash: [3]))
                                            .foregroundColor(Color.gray)
                                    .frame(maxWidth: 100, maxHeight: .infinity)
                                    
                                Button(action: {
                                    if !area.avaibale{
                                        isPresentAlert = true
                                    }else{
                                        
                                        if( rowIndex==index){
                                            self.rowIndex = -1
                                        }
                                        else{
                                            self.rowIndex = index
                                        }
                                    }
                                    
                                }, label: {
                                    
                                  
                                    if !area.avaibale{
                                    Image("car_left")
                                        .resizable()
                                        .frame(width: 70, height: 50)
                                }else{
                                Text("A-1")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, maxHeight: 45)
                                    .background(rowIndex == index ? Color("SecondaryColor") : Color.clear )
                                    .cornerRadius(20)
                                    

                                }

                                    
                                })
                                
                                .rotationEffect(.degrees(15))
                                .padding()
                                .alert(isPresented: $isPresentAlert) {
                                            Alert(title: Text("Sorry!!"), message: Text("Parking not avaible"), dismissButton: .default(Text("Ok")))
                                        }
                            }
                            .background(Color.clear)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .background(Color.clear)
                        }
                    }
                    .padding(.leading,30)
                    .background(Color.clear)
                    .frame(maxWidth: 120, maxHeight: .infinity)
                    Spacer()
                    
                    VStack{
                        Text("Exit")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        DottedLine()
                                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [7]))
                            .frame(maxWidth: 1, maxHeight: .infinity, alignment: .leading)
                                    .foregroundColor(Color.yellow)
                        
                        Image("car")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Entry")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    
                    
                    VStack{
                        ForEach(0..<5) { index in
                            ZStack() {
                                
                                VerticalDottedLine()
                                            .stroke(style: StrokeStyle(lineWidth: 2, dash: [3]))
                                            .foregroundColor(Color.gray)
                                    .padding(.top,20)
                                    
                                    .frame(maxWidth: 100, maxHeight: .infinity)
                                    .rotationEffect(.degrees(-90))
                                    
                                Button(action: {
                                   
                                        isPresentAlert = true
                                   
                                }, label: {
                                    
                                    if isAvailable{
                                    Image("car_right")
                                        .resizable()
                                        .frame(width: 70, height: 50)
                                       
                                }else{
                                Text("A-1")
                                    .foregroundColor(.white)
                                }
                                

                                })
                                .matchedGeometryEffect(id: "geoeffect\(index)", in: animation)
                                .padding(.leading)
                                .rotationEffect(.degrees(-30))
                                .alert(isPresented: $isPresentAlert) {
                                            Alert(title: Text("Sorry!!"), message: Text("Parking not avaible"), dismissButton: .default(Text("Ok")))
                                        }
                            }
                            
                            .background(Color.clear)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        }
                    }
                    
                    .background(Color.clear)
                    .frame(maxWidth: 120, maxHeight: .infinity)

                }
                .padding()
                .background(Color.clear)
                
                VStack(spacing:20){
                    
                    Button(action: {
                        withAnimation(.easeIn) {
                            isShow.toggle()
                        }
                    }, label: {
                        Text("Reserve")
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                    })
                    .padding()
                    .frame(width: UIScreen.main.bounds.width / 2*1.8, height: 50)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Color"), Color(.systemIndigo)]), startPoint: .leading, endPoint: .trailing)
    )
                    .clipShape(Capsule())

                }
                .padding()
                
              Spacer()
               
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor(named: "ThemeColor") ?? .black)).ignoresSafeArea()
            
            if isShow {
                DetailView(isShow: $isShow)
            }
            
            
        }
        
        
       
    }
}
    

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}






struct DottedLine: Shape {
        
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        return path
    }
}


struct VerticalDottedLine: Shape {
        
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 30, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        return path
    }
}

struct VerticalLineLeft: Shape {
        
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 10, y: 20))
        path.addLine(to: CGPoint(x: 10, y: 80))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        return path
    }
}



struct MockArea  {
    var id = UUID()
    @State var avaibale : Bool
   @State var isSelected : Bool
    
   
}




