//
//  AddMedicineForm.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 21/02/24.
//

import SwiftUI

struct AddMedicineForm: View {
    @Binding public var medicineCards : [Medicine]
    
    @State private var medicine : Medicine = Medicine(id: Int.random(in: 1...100) , name: "", type: "", strength: "", strengthUnit: "", Image: "pill1", taken: 0, toBeTake: 3, nextDoseTime: Date(), dosageType: "", dosage: 0, quantity: 0 , expiryDate: Date() , startDate: Date(), remindForReorder: false , breakfast: false , lunch: false , dinner: false) ;
    
    @State private var showingDatePicker = false
    @State private var showingDatePicker2 = false
    
    @State private var isShowingImagePicker = false
    @State private var inputImage: UIImage?
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    var body: some View {
        
        
        NavigationStack{
            
            Form(content: {
                Section(header:
                    Text("Add A Medicine Plan").bold()
                ){
                    TextField("Name", text: $medicine.name).foregroundColor(.black)
                    TextField("Type", text: $medicine.type)
                        .foregroundColor(.black)
                    
                    TextField("Strength", text: $medicine.strength)
                        .keyboardType(.numberPad)
                        .foregroundColor(.black)
                    
                    TextField("Strength Unit", text: $medicine.strengthUnit)
                        .foregroundColor(.black)
                    
                    //                    TextField("Quantity", text: $medicine.quantity ).keyboardType(.numberPad)
                    //                                                                                            .foregroundColor(.black)
                    
                    HStack{
                        Text("Quantity")
                        Stepper("\(String(medicine.quantity))", value: $medicine.quantity )
                    }
                    Toggle("Redmind for reorder?" , isOn: $medicine.remindForReorder )
                    HStack{
                        Text("Dosage per day")
                        Stepper("\(String(medicine.dosage))", value: $medicine.dosage )
                    }
                    
                    HStack {
                        Text("Medicine Expiry Date")
                        Spacer()
                        Button("Select") {
                            showingDatePicker.toggle()
                        }
                        
                    }
                    
                    if showingDatePicker {
                        
                        DatePicker("", selection: $medicine.expiryDate, displayedComponents: .date).foregroundColor(.black)
                    }
                    
                    
                    HStack {
                        Text("Plan Start Date")
                        Spacer()
                        Button("Select") {
                        showingDatePicker2.toggle()
                        }
                    
                    }
                    
                    if showingDatePicker2 {
                        
                        DatePicker("", selection: $medicine.startDate, displayedComponents: .date).foregroundColor(.black)
                    }
                    
                }
                
                Section(header: Text("Dosage Instructions")) {
                    TextField("Dosage Type", text: $medicine.dosageType).foregroundColor(.black)
                    Toggle("Breakfast" , isOn: $medicine.breakfast)
                    Toggle("Lunch" , isOn: $medicine.lunch)
                    Toggle("Dinner" , isOn: $medicine.dinner)

                }
                
                Button("Open Camera") {
                                    self.isShowingImagePicker = true
                                }
                                .sheet(isPresented: $isShowingImagePicker) {
                                    ImagePicker(image: self.$inputImage)
                                }
                
                Button("Save") {
                            print("Medicine saved: \(medicine)")
                            medicineCards.append(medicine)
                            self.presentationMode.wrappedValue.dismiss()
                        }

            })
        }
        
//        func loadImage() {
//                guard let inputImage = inputImage else { return }
//
//            }
        
    }
    
    
    
    
    
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.image = uiImage
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                picker.sourceType = .camera
            }
            picker.delegate = context.coordinator
            return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
}
