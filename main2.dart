import 'dart:io';

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
    'personalTrainer': null,
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

  // Predefined members
  addMember("John Doe", "1234567890");
  addMember("Alice Smith", "9876543210");

  // Predefined fitness classes
  addFitnessClass("Yoga Class", DateTime(2023, 7, 17, 18, 30));
  addFitnessClass("Zumba Class", DateTime(2023, 7, 18, 11, 00));

  // Predefined staff members
  addStaffMember("Alice", "Instructor");
  addStaffMember("Bob", "Trainer");
  

  // Predefined membership plans
  addMembershipPlan("Monthly Plan", 50.0, "1 month");
  addMembershipPlan("Quarterly Plan", 120.0, "3 months");

  while (true) {
    print("Welcome to the Fitness Center Management System!");
    print("1. Add Member");
    print("2. Add Fitness Class");
    print("3. Add Staff Member");
    print("4. Add Membership Plan");
    print("5. Register Member for Class");
    print("6. View Registered Classes for Member");
    print("7. Mark Attendance");
    print("8. Add Membership to Member");
    print("9. View Member's Membership Plan");
    print("10. Book Personal Trainer");
    print("11. View Member's Personal Trainer");
    print("12. View Staff Members");
    print("0. Exit");

    String? input = stdin.readLineSync();
    if (input == '0') {
      break;
    }

    switch (input) {
      case '1':
        print("Enter member's name:");
        String name = stdin.readLineSync()!;
        print("Enter member's contact number:");
        String contactNumber = stdin.readLineSync()!;
        addMember(name, contactNumber);
        print("Member added successfully!");
        break;

      case '2':
        print("Enter fitness class name:");
        String className = stdin.readLineSync()!;
        print("Enter fitness class date (yyyy-mm-dd hh:mm):");
        String classDateStr = stdin.readLineSync()!;
        DateTime classDate = DateTime.parse(classDateStr);
        addFitnessClass(className, classDate);
        print("Fitness class added successfully!");
        break;

      case '3':
        print("Enter staff member's name:");
        String staffName = stdin.readLineSync()!;
        print("Enter staff member's role:");
        String staffRole = stdin.readLineSync()!;
        addStaffMember(staffName, staffRole);
        print("Staff member added successfully!");
        break;

      case '4':
        print("Enter membership plan name:");
        String planName = stdin.readLineSync()!;
        print("Enter membership plan price:");
        double planPrice = double.parse(stdin.readLineSync()!);
        print("Enter membership plan duration:");
        String planDuration = stdin.readLineSync()!;
        addMembershipPlan(planName, planPrice, planDuration);
        print("Membership plan added successfully!");
        break;

      case '5':
        print("Enter member's ID:");
        int memberId = int.parse(stdin.readLineSync()!);
        print("Enter fitness class ID:");
        int classId = int.parse(stdin.readLineSync()!);
        registerMemberForClass(memberId, classId);
        print("Member registered for the fitness class successfully!");
        break;

      case '6':
        print("Enter member's ID:");
        int memberId = int.parse(stdin.readLineSync()!);
        viewRegisteredClassesForMember(memberId);
        break;

      case '7':
        print("Enter member's ID:");
        int memberId = int.parse(stdin.readLineSync()!);
        print("Enter fitness class ID:");
        int classId = int.parse(stdin.readLineSync()!);
        markAttendance(memberId, classId);
        break;

      case '8':
        print("Enter member's ID:");
        int memberId = int.parse(stdin.readLineSync()!);
        print("Enter membership plan ID:");
        int planId = int.parse(stdin.readLineSync()!);
        addMembershipToMember(memberId, planId);
        break;

      case '9':
        print("Enter member's ID:");
        int memberId = int.parse(stdin.readLineSync()!);
        viewMemberMembershipPlan(memberId);
        break;

      case '10':
        print("Enter member's ID:");
        int memberId = int.parse(stdin.readLineSync()!);
        print("Enter personal trainer's name:");
        String trainerName = stdin.readLineSync()!;
        bookPersonalTrainer(memberId, trainerName);
        break;

      case '11':
        print("Enter member's ID:");
        int memberId = int.parse(stdin.readLineSync()!);
        viewMemberPersonalTrainer(memberId);
        break;

      case '12':
        viewStaffMembers();
        break;

      default:
        print("Invalid option! Please try again.");
    }
  }
}

