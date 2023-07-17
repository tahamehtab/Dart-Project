// Define Lists to store data
List<Map<String, dynamic>> members = [];
List<Map<String, dynamic>> classes = [];
List<Map<String, dynamic>> staffMembers = [];
List<Map<String, dynamic>> membershipPlans = [];

// Function to add a new member
void addMember(String name, String contactNumber) {
  members.add({
    'name': name,
    'contactNumber': contactNumber,
    'registeredClasses': [],
    'membershipPlan': null,
  });
}

// Function to add a new fitness class
void addFitnessClass(String name, DateTime date) {
  classes.add({
    'name': name,
    'date': date,
  });
}

// Function to add staff member
void addStaffMember(String name, String role) {
  staffMembers.add({
    'name': name,
    'role': role,
  });
}

// Function to add a new membership plan
void addMembershipPlan(String name, double price, String duration) {
  membershipPlans.add({
    'name': name,
    'price': price,
    'duration': duration,
  });
}

// Function to register a member for a class
void registerMemberForClass(int memberId, int classId) {
  if (memberId >= 0 && memberId < members.length && classId >= 0 && classId < classes.length) {
    members[memberId]['registeredClasses'].add(classes[classId]);
  }
}

// Function to view all registered classes for a member
void viewRegisteredClassesForMember(int memberId) {
  if (memberId >= 0 && memberId < members.length) {
    print("Registered classes for ${members[memberId]['name']}:");
    if (members[memberId]['registeredClasses'].isNotEmpty) {
      for (var i = 0; i < members[memberId]['registeredClasses'].length; i++) {
        print("- ${members[memberId]['registeredClasses'][i]['name']} - ${members[memberId]['registeredClasses'][i]['date']}");
      }
    } else {
      print("No classes registered yet.");
    }
  }
}

// Function to track member attendance for a class
void markAttendance(int memberId, int classId) {
  if (memberId >= 0 && memberId < members.length && classId >= 0 && classId < classes.length) {
    members[memberId]['registeredClasses'].forEach((classData) {
      if (classData['name'] == classes[classId]['name'] && classData['date'] == classes[classId]['date']) {
        classData['attended'] = true;
        print("${members[memberId]['name']} attended ${classes[classId]['name']} on ${classes[classId]['date']}");
        return;
      }
    });
  }
}

// Function to add membership plan to a member
void addMembershipToMember(int memberId, int planId) {
  if (memberId >= 0 && memberId < members.length && planId >= 0 && planId < membershipPlans.length) {
    members[memberId]['membershipPlan'] = membershipPlans[planId];
    print("${members[memberId]['name']} has been assigned the ${membershipPlans[planId]['name']}");
  }
}

// Function to view member's assigned membership plan
void viewMemberMembershipPlan(int memberId) {
  if (memberId >= 0 && memberId < members.length) {
    if (members[memberId]['membershipPlan'] != null) {
      print("${members[memberId]['name']}'s Membership Plan:");
      print("Name: ${members[memberId]['membershipPlan']['name']}");
      print("Price: \$${members[memberId]['membershipPlan']['price']}");
      print("Duration: ${members[memberId]['membershipPlan']['duration']}");
    } else {
      print("${members[memberId]['name']} doesn't have an assigned membership plan.");
    }
  }
}

// Function to add a personal trainer to a member
void bookPersonalTrainer(int memberId, String trainerName) {
  if (memberId >= 0 && memberId < members.length) {
    members[memberId]['personalTrainer'] = trainerName;
    print("${members[memberId]['name']} has booked a personal trainer: $trainerName");
  }
}

// Function to view member's assigned personal trainer
void viewMemberPersonalTrainer(int memberId) {
  if (memberId >= 0 && memberId < members.length) {
    if (members[memberId]['personalTrainer'] != null) {
      print("${members[memberId]['name']}'s Personal Trainer: ${members[memberId]['personalTrainer']}");
    } else {
      print("${members[memberId]['name']} doesn't have an assigned personal trainer.");
    }
  }
}

// Function to view all staff members
void viewStaffMembers() {
  print("Staff Members:");
  for (var i = 0; i < staffMembers.length; i++) {
    print("- ${staffMembers[i]['name']} (${staffMembers[i]['role']})");
  }
}

void main() {
  // Example usage:
  addMember("John Doe", "1234567890");
  addMember("Jane Smith", "9876543210");
  
  addFitnessClass("Yoga Class", DateTime(2023, 7, 17, 18, 30));
  addFitnessClass("Zumba Class", DateTime(2023, 7, 18, 11, 00));
  
  addStaffMember("Alice", "Instructor");
  addStaffMember("Bob", "Trainer");
  
  addMembershipPlan("Monthly Plan", 50.0, "1 month");
  addMembershipPlan("Quarterly Plan", 120.0, "3 months");
  
  addMembershipToMember(0, 0);
  addMembershipToMember(1, 1);
  
  viewRegisteredClassesForMember(0);
  viewRegisteredClassesForMember(1);
  
  markAttendance(0, 0);
  markAttendance(1, 1);
  
  viewMemberMembershipPlan(0);
  viewMemberMembershipPlan(1);
  
  bookPersonalTrainer(0, "Bob");
  viewMemberPersonalTrainer(0);
  
  viewStaffMembers();
}
