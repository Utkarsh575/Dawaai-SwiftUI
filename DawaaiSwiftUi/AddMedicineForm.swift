//
//  AddMedicineForm.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 21/02/24.
//

import SwiftUI

struct AddMedicineForm: View {
    @Binding public var medicineCards : [Medicine]
    
    @State private var medicine : Medicine = Medicine(id: Int.random(in: 1...100) , name: "", type: "", strength: "", strengthUnit: "", Image: "pill1", taken: 0, toBeTake: 3, nextDoseTime: Date(), dosageType: "", dosage: 0, quantity: 0 , expiryDate: Date() , startDate: Date() , breakfast: 0 , lunch: 0 , dinner: 0) ;
    
    @State private var showingDatePicker = false
    @State private var showingDatePicker2 = false

    
    var body: some View {
        
        
        //            Form
        //            {
        //                Section(header: Text("Medicine Details").bold()){
        //                                    TextField("Name", text: $medicine.name)
        //                                                                        .foregroundColor(.black)
        //
        //                                    TextField("Type", text: $medicine.type)
        //                                                                        .foregroundColor(.black)
        //
        //                                    TextField("Strength", text: $medicine.strength)
        //                                        .keyboardType(.numberPad)
        //                                        .foregroundColor(.black)
        //
        //                                    TextField("Strength Unit", text: $medicine.strengthUnit)
        //                                                                        .foregroundColor(.black)
        //
        //                                    TextField("Frequency", text: $medicine.frequency)
        //                                                                        .foregroundColor(.black)
        //
        //                                    HStack {
        //                                        Text("Expiry Date")
        //                                        Spacer()
        //                                        Button("Select") {
        //                                            showingDatePicker.toggle()
        //                                        }
        //
        //                                    }
        //
        //                                    if showingDatePicker {
        //                                        DatePicker("", selection: $medicine.expiryDate, displayedComponents: .date)
        //                                            .foregroundColor(.black)
        //                                                                        }
        //                                }
        //
        //                                Section(header: Text("Dosage")) {
        //                                    TextField("Dosage Type", text: $medicine.dosageType)
        //        //                            TextField("Dosage per Intake", text: $medicine.dosage.description)
        //        //                                .keyboardType(.numberPad)
        //                                }
        //
        //                                Button("Save") {
        //                                    // Save your medicine data here
        //                                    print("Medicine saved: \(medicine)")
        //                                    medicineCards.append(medicine)
        //
        //                                }
        //                            }
        //                            .navigationTitle("Add Medicine")
        //                        }
        //
        //
        //        //        private func isValidName(_ name: String) -> Bool {
        //        //            // Implement your validation logic here
        //        //            return name.trimmingCharacters(in: .whitespacesAndNewlines).isNotEmpty
        //        //        }
        //        //
        //        //        // ... other validation functions (type, strength, ...)
        //        //
        //        //        private var allFieldsValid: Bool {
        //        //            return nameValid && typeValid && strengthValid && strengthUnitValid && frequencyValid && quantityValid && expiryDateValid
        //        //        }
        //
        //
        //            }
        
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
                    
                    HStack{
                        Text("Dosage")
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
                }
                
                Button("Save") {
                    print("Medicine saved: \(medicine)")
                    medicineCards.append(medicine)
                    
                }

            })
        }
        
    }
    
    
    
    
    
}
