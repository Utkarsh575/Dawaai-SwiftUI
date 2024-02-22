//
//  ProfileView.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 21/02/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var image: Image?
    @State private var isImagePickerPresented: Bool = false
    var body: some View {
        NavigationStack{
            ScrollView{
                
                VStack{
                    
                        HStack{
                            imageView
                                            .onTapGesture {
                                                self.isImagePickerPresented.toggle()
                                            }
                                            .sheet(isPresented: $isImagePickerPresented) {
                                                ImagePickerView(image: self.$image)
                                            }
//                            Image(systemName: "person.circle.fill").padding(.horizontal ,1).font(.system(size: 150)).foregroundColor(.gray)
                            VStack{
                                Text("Sarthak Shroff").font(.system(size: 24,weight: .semibold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .center).padding(.leading , -15);
                                HStack{
                                    Text("Age:").font(.system(size: 20)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .center).padding(.leading, -40);
                                    Text("20").font(.system(size: 20,weight: .semibold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .center).padding(.leading);
                                    
                                }
                                HStack{
                                    Text("Gender:").font(.system(size: 20)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .center).padding(.leading, -10);
                                    Text("Male").font(.system(size: 20,weight: .semibold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .center).padding(.leading, -2);
                                    
                                }
                                HStack{
                                    Text("Blood Group:").font(.system(size: 20)).frame(width: 125 ,alignment : .center).padding(.leading ,-5)
                                    Text("B+").font(.system(size: 20,weight: .semibold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .trailing).padding(.trailing, 9);
                                }
                                
                            }

                        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , alignment:.leading).background(Color("heroColor")).cornerRadius(25.0).shadow(color: .green,radius: 2).foregroundColor(.black)
                    
                    
                    
                    
                        HStack{
                            Text("Unique Code").font(.system(size: 20,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .top).padding();
                        
                        }.background(Color.white).frame(maxWidth: .infinity , maxHeight:200).cornerRadius(10).foregroundColor(.black).padding(.top, 20)
                    
                    
                        HStack{
                            Text("Medicine Provider").font(.system(size: 20,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .top).padding();
                        
                        }.background(Color.white).frame(maxWidth: .infinity , maxHeight:200).cornerRadius(10).foregroundColor(.black).padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                    
                    
                    //Hstack end
                }.frame(maxWidth: .infinity , maxHeight: .infinity , alignment: .center).padding(10).padding(.horizontal,10)
                
                
                
            
                
                //            MedicineCta(medicine: medicineCtas[0])
                //            MedicineCta()
                //            MedicineCta()
                
            }.background(Color("bgColor"))
        }
    }
    var imageView: some View {
        ZStack {
            if image != nil {
                
                image!
                    .resizable()
                    .scaledToFit()
            } else {
                Circle()
                    .fill(Color.gray)
                    .aspectRatio(contentMode: .fit)
                    .overlay(Image(systemName: "person.circle.fill").foregroundColor(.white).aspectRatio(contentMode: .fit))
            }
        }
        .frame(width: 150, height: 150)

    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var image: Image?

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var image: Image?

        init(image: Binding<Image?>) {
            _image = image
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                image = Image(uiImage: uiImage)
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

}

#Preview {
    ProfileView()
}
