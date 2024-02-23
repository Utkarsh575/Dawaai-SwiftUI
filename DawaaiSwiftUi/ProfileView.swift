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
    @State private var showModal = false
    @State var showAlert: Bool = false
    let uniqueCode = "vhTCH85g"
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
                                            }.padding(.top, 10).padding(.bottom,10).padding()
//                            Image(systemName: "person.circle.fill").padding(.horizontal ,1).font(.system(size: 150)).foregroundColor(.gray)
                            VStack{
                                Text("Sarthak Shroff").font(.system(size: 24,weight: .semibold)).frame(maxWidth: .infinity ,alignment : .center).padding(.leading , -15);
                                HStack{
                                    Text("Age:").font(.system(size: 20)).frame(maxWidth: .infinity ,alignment : .center).padding(.leading, -40);
                                    Text("20").font(.system(size: 20,weight: .semibold)).frame(maxWidth: .infinity ,alignment : .center).padding(.leading);
                                    
                                }
                                HStack{
                                    Text("Gender:").font(.system(size: 20)).frame(maxWidth: .infinity ,alignment : .center).padding(.leading, -10);
                                    Text("Male").font(.system(size: 20,weight: .semibold)).frame(maxWidth: .infinity ,alignment : .center).padding(.leading, -2);
                                    
                                }
                                HStack{
                                    Text("Blood Group:").font(.system(size: 20)).frame(width: 125 ,alignment : .center).padding(.leading ,-1)
                                    Text("B+").font(.system(size: 20,weight: .semibold)).frame(maxWidth: .infinity ,alignment : .trailing).padding(.trailing, 25);
                                }
                                
                            }

                        }.frame(maxWidth: 361, maxHeight: 218 , alignment:.leading).background(Color("heroColor")).cornerRadius(25.0).shadow(color: .green,radius: 2).foregroundColor(.black)
                    
                    
                    
                    
                        HStack{
                            Button(action: {
                                showAlert.toggle()
                                    // action for "Unique Code" button
        
                                
                            }) {
                                Text("Unique Code").font(.system(size: 20,weight: .medium)).frame(maxWidth: .infinity ,alignment : .top).padding();
                            }.alert(isPresented: $showAlert, content: {
                                getAlert()
                            })
                        }.background(Color.white).frame(maxWidth: .infinity , maxHeight:200).cornerRadius(10).foregroundColor(.black).padding(.top, 20)
                    
                    
                    
                    HStack {
                        Button(action: {
                                        self.showModal = true
                                    }) {
                                        Text("Medicine Provider")
                                            .font(.system(size: 20, weight: .medium))
                                            .frame(maxWidth: .infinity, alignment: .top)
                                            .padding()
                                    }
                    }
                    .background(Color.white)
                    .frame(maxWidth: .infinity, maxHeight:200)
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .padding(EdgeInsets())
                    .sheet(isPresented: $showModal) {
                        MedicineProviderView(isPresented: self.$showModal)
                    }
                    
                    HStack{
                        Button(action: {
                                // action for "Logout" button
                        }) {
                            Text("Log Out").font(.system(size: 20,weight: .medium)).frame(maxWidth: .infinity ,alignment : .bottom).padding().foregroundColor(.red);
                        }
                    }.background(Color.white).frame(maxWidth: .infinity , maxHeight:200).cornerRadius(10).foregroundColor(.black).padding(.top, 20).padding(.top,275)
                
                    
                    
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
                    .clipShape(Circle())
            } else {
                Circle()
                    .fill(Color.gray)
                    .aspectRatio(contentMode: .fit)
                    .overlay(Image(systemName: "person.circle.fill").foregroundColor(.white).aspectRatio(contentMode: .fit))
                    
            }
        }
        .frame(width: 125, height: 125)

    }
    
    func getAlert() -> Alert {
        return Alert(title: Text("Your Unique Code"), message: Text(uniqueCode).font(.title), primaryButton: .destructive(Text("Done"), action: {
            print("Done")
        }), secondaryButton: .cancel(Text("Copy"), action: {
            UIPasteboard.general.string = uniqueCode // Copy the code to clipboard
            print("Copied to clipboard")
        }))
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
