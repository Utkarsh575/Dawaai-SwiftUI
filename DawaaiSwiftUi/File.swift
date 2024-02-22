////
////  File.swift
////  DawaaiSwiftUi
////
////  Created by user1 on 22/02/24.
////
//
//import SwiftUI
//
//struct PofileView: View {
//    @State private var image: Image?
//    @State private var isImagePickerPresented: Bool = false
//
//    var body: some View {
//        VStack {
//            imageView
//                .onTapGesture {
//                    self.isImagePickerPresented.toggle()
//                }
//                .sheet(isPresented: $isImagePickerPresented) {
//                    ImagePickerView(image: self.$image)
//                }
//        }
//    }
//
//    var imageView: some View {
//        ZStack {
//            if image != nil {
//                
//                image!
//                    .resizable()
//                    .scaledToFit()
//            } else {
//                Rectangle()
//                    .fill(Color.gray)
//                    .aspectRatio(contentMode: .fit)
//                    .overlay(Image(systemName: "person.circle.fill").foregroundColor(.white).aspectRatio(contentMode: .fit))
//            }
//        }
//        .frame(width: 200, height: 200)
//    }
//}
//
//struct ImagePickerView: UIViewControllerRepresentable {
//    @Binding var image: Image?
//
//    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//        @Binding var image: Image?
//
//        init(image: Binding<Image?>) {
//            _image = image
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
//            if let uiImage = info[.originalImage] as? UIImage {
//                image = Image(uiImage: uiImage)
//            }
//            picker.dismiss(animated: true, completion: nil)
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(image: $image)
//    }
//
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = context.coordinator
//        return imagePicker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
//
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PofileView()
//    }
//}
