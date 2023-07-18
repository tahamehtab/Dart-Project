import 'dart:io';

// Data Structures
List<Map<String, dynamic>> members = [];
List<Map<String, dynamic>> staffMembers = [];
List<Map<String, dynamic>> membershipPlans = [];
List<Map<String, dynamic>> classes = [];
List<Map<String, dynamic>> trainers = [];

void main() {
  classes = [
    {
      "name": "CrossFit",
      "instructor": "John Doe",
      "dateTime": DateTime(2023, 7, 19, 10, 0), // Date and time for CrossFit class
    },
    {
      "name": "Yoga",
      "instructor": "Jane Smith",
      "dateTime": DateTime(2023, 7, 20, 14, 30), // Date and time for Yoga class
    },
  ];

 trainers = [
    {
      "name": "John Doe",
      "specialization": "Strength Training",
    },
    {
      "name": "Jane Smith",
      "specialization": "Yoga",
    },
  ];

  classes = [
    {
      "name": "CrossFit",
      "instructor": "John Doe",
    },
    {
      "name": "Yoga",
      "instructor": "Jane Smith",
    },
  ];

  membershipPlans = [
    {
      "name": "Basic",
      "price": 50.0,
    },
    {
      "name": "Premium",
      "price": 100.0,
    },
  ];

  staffMembers = [
    {
      "name": "Alice Johnson",
      "role": "Receptionist",
    },
    {
      "name": "Bob Wilson",
      "role": "Trainer Manager",
    },
  ];

  showMainMenu();
}

// Main Menu
void showMainMenu() {
  print("==== Fitness Center Management System ====");
  print("1. Admin Login");
  print("2. Member Login");
  print("3. Create Member Account");
  print("4. Exit");
  print("Enter your choice: ");
  int choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      adminLogin();
      break;
    case 2:
      memberLogin();
      break;
    case 3:
      createMemberAccount();
      break;
    case 4:
      print("Exiting the system. Goodbye!");
      break;
    default:
      print("Invalid choice. Please try again.\n");
      showMainMenu();
      break;
  }
}

// Admin Login
void adminLogin() {
  print("\n==== Admin Login ====");
  print("Enter your username: ");
  String username = stdin.readLineSync()!;
  print("Enter your password: ");
  String password = stdin.readLineSync()!;

  // Replace with your actual admin username and password for the sake of simplicity
  if (username == "admin" && password == "admin") {
    showAdminMenu();
  } else {
    print("Invalid credentials. Please try again.\n");
    showMainMenu();
  }
}

// Member Login
void memberLogin() {
  print("\n==== Member Login ====");
  print("Enter your member ID: ");
  String memberID = stdin.readLineSync()!;
  print("Enter your password: ");
  String password = stdin.readLineSync()!;

  Map<String, dynamic>? member = findMemberByID(memberID);

  if (member != null && member["password"] == password) {
    showMemberMenu(member);
  } else {
    print("Invalid credentials. Please try again.\n");
    showMainMenu();
  }
}

// Create Member Account
void createMemberAccount() {
  print("\n==== Create Member Account ====");
  print("Enter your desired member ID: ");
  String memberID = stdin.readLineSync()!;
  if (findMemberByID(memberID) != null) {
    print("This member ID is already taken. Please choose a different one.\n");
    createMemberAccount();
    return;
  }

  print("Enter your password: ");
  String password = stdin.readLineSync()!;

  Map<String, dynamic> newMember = {
    "memberID": memberID,
    "password": password,
    "attendance": [],
    "registeredClasses": [],
    "registeredMemberships": [],
    "bookedTrainer": null,
  };

  members.add(newMember);
  print("Member account created successfully!\n");
  showMainMenu();
}

// Admin Menu
void showAdminMenu() {
  print("\n==== Admin Menu ====");
  print("1. Delete Member");
  print("2. View All Members");
  print("3. Add Staff Member");
  print("4. Delete Staff Member");
  print("5. View All Staff Members");
  print("6. Add Membership Plan");
  print("7. View All Membership Plans");
  print("8. Add Class");
  print("9. View All Classes");
  print("10. Add Trainer");
  print("11. Delete Trainer");
  print("12. View All Trainers");
  print("13. Logout");
  print("Enter your choice: ");
  int choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      deleteMember();
      break;
    case 2:
      viewAllMembers();
      break;
    case 3:
      addStaffMember();
      break;
    case 4:
      deleteStaffMember();
      break;
    case 5:
      viewAllStaffMembers();
      break;
    case 6:
      addMembershipPlan();
      break;
    case 7:
      viewAllMembershipPlans();
      break;
    case 8:
      addClass();
      break;
    case 9:
      viewAllClasses();
      break;
    case 10:
      addTrainer();
      break;
    case 11:
      deleteTrainer();
      break;
    case 12:
      viewAllTrainers();
      break;
    case 13:
      print("Logging out.\n");
      showMainMenu();
      break;
    default:
      print("Invalid choice. Please try again.\n");
      showAdminMenu();
      break;
  }
}

// Helper function to find a member by their ID
Map<String, dynamic>? findMemberByID(String memberID) {
  for (var member in members) {
    if (member["memberID"] == memberID) {
      return member;
    }
  }
  return null;
}

// Admin Functions

void deleteMember() {
  print("\n==== Delete Member ====");
  print("Enter the member ID to delete: ");
  String memberID = stdin.readLineSync()!;
  Map<String, dynamic>? member = findMemberByID(memberID);

  if (member != null) {
    members.remove(member);
    print("Member deleted successfully!");
  } else {
    print("Member not found.");
  }

  showAdminMenu();
}

void viewAllMembers() {
  print("\n==== View All Members ====");
  if (members.isEmpty) {
    print("No members found.");
  } else {
    for (var member in members) {
      print("Member ID: ${member['memberID']}");
    }
  }
  showAdminMenu();
}

void addStaffMember() {
  print("\n==== Add Staff Member ====");
  print("Enter staff member's name: ");
  String name = stdin.readLineSync()!;
  print("Enter staff member's role: ");
  String role = stdin.readLineSync()!;

  Map<String, dynamic> newStaffMember = {
    "name": name,
    "role": role,
  };

  staffMembers.add(newStaffMember);
  print("Staff member added successfully!");
  showAdminMenu();
}

void deleteStaffMember() {
  print("\n==== Delete Staff Member ====");
  print("Enter the staff member's name to delete: ");
  String name = stdin.readLineSync()!;
  staffMembers.removeWhere((staff) => staff["name"] == name);
  print("Staff member deleted successfully!");
  showAdminMenu();
}

void viewAllStaffMembers() {
  print("\n==== View All Staff Members ====");
  if (staffMembers.isEmpty) {
    print("No staff members found.");
  } else {
    for (var staff in staffMembers) {
      print("Name: ${staff['name']}, Role: ${staff['role']}");
    }
  }
  showAdminMenu();
}

void addMembershipPlan() {
  print("\n==== Add Membership Plan ====");
  print("Enter membership plan name: ");
  String name = stdin.readLineSync()!;
  print("Enter membership plan price: ");
  double price = double.parse(stdin.readLineSync()!);

  Map<String, dynamic> newMembershipPlan = {
    "name": name,
    "price": price,
  };

  membershipPlans.add(newMembershipPlan);
  print("Membership plan added successfully!");
  showAdminMenu();
}

void viewAllMembershipPlans() {
  print("\n==== View All Membership Plans ====");
  if (membershipPlans.isEmpty) {
    print("No membership plans found.");
  } else {
    for (var plan in membershipPlans) {
      print("Name: ${plan['name']}, Price: \$${plan['price']}");
    }
  }
  showAdminMenu();
}

void addClass() {
  print("\n==== Add Class ====");
  print("Enter class name: ");
  String name = stdin.readLineSync()!;
  print("Enter class instructor: ");
  String instructor = stdin.readLineSync()!;
  print("Enter date and time (e.g., 2023-07-19 15:30): ");
  String dateTimeString = stdin.readLineSync()!;
  DateTime dateTime = DateTime.parse(dateTimeString);

  Map<String, dynamic> newClass = {
    "name": name,
    "instructor": instructor,
    "dateTime": dateTime,
  };

  classes.add(newClass);
  print("Class added successfully!");
  showAdminMenu();
}

void viewAllClasses() {
  print("\n==== View All Classes ====");
  if (classes.isEmpty) {
    print("No classes found.");
  } else {
    for (var classData in classes) {
      print("Class: ${classData['name']}, Instructor: ${classData['instructor']}");
    }
  }
  showAdminMenu();
}

void addTrainer() {
  print("\n==== Add Trainer ====");
  print("Enter trainer's name: ");
  String name = stdin.readLineSync()!;
  print("Enter trainer's specialization: ");
  String specialization = stdin.readLineSync()!;

  Map<String, dynamic> newTrainer = {
    "name": name,
    "specialization": specialization,
  };

  trainers.add(newTrainer);
  print("Trainer added successfully!");
  showAdminMenu();
}

void deleteTrainer() {
  print("\n==== Delete Trainer ====");
  print("Enter the trainer's name to delete: ");
  String name = stdin.readLineSync()!;
  trainers.removeWhere((trainer) => trainer["name"] == name);
  print("Trainer deleted successfully!");
  showAdminMenu();
}

void viewAllTrainers() {
  print("\n==== View All Trainers ====");
  if (trainers.isEmpty) {
    print("No trainers found.");
  } else {
    for (var trainer in trainers) {
      print("Name: ${trainer['name']}, Specialization: ${trainer['specialization']}");
    }
  }
  showAdminMenu();
}

// Member Menu
void showMemberMenu(Map<String, dynamic> member) {
  print("\n==== Member Menu ====");
  print("1. Mark Attendance");
  print("2. Register Class");
  print("3. View Registered Classes");
  print("4. Register for Membership Plan");
  print("5. View Membership Plans");
  print("6. Book Personal Trainer");
  print("7. Logout");
  print("Enter your choice: ");
  int choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      markAttendance(member);
      break;
    case 2:
      registerClass(member);
      break;
    case 3:
      viewRegisteredClasses(member);
      break;
    case 4:
      registerMembershipPlan(member);
      break;
    case 5:
      viewMembershipPlans(member);
      break;
    case 6:
      bookPersonalTrainer(member);
      break;
    case 7:
      print("Logging out.\n");
      showMainMenu();
      break;
    default:
      print("Invalid choice. Please try again.\n");
      showMemberMenu(member);
      break;
  }
}

// Member Functions

void markAttendance(Map<String, dynamic> member) {
  print("\n==== Mark Attendance ====");
  DateTime now = DateTime.now();
  String date = "${now.year}-${now.month}-${now.day}";

  if (!member["attendance"].contains(date)) {
    member["attendance"].add(date);
    print("Attendance marked for today.");
  } else {
    print("Attendance already marked for today.");
  }

  showMemberMenu(member);
}

void registerClass(Map<String, dynamic> member) {
  print("\n==== Register Class ====");
  print("Available Classes: ");
  for (var classData in classes) {
    print("Class: ${classData['name']}, Instructor: ${classData['instructor']}");
  }

  print("Enter the name of the class to register: ");
  String className = stdin.readLineSync()!;
  Map<String, dynamic>? classData;
  for (var classItem in classes) {
    if (classItem["name"] == className) {
      classData = classItem;
      break;
    }
  }

  if (classData != null) {
    member["registeredClasses"].add(classData);
    print("Class registered successfully!");
  } else {
    print("Class not found. Please enter a valid class name.");
  }

  showMemberMenu(member);
}

void viewRegisteredClasses(Map<String, dynamic> member) {
  print("\n==== View Registered Classes ====");
  if (member["registeredClasses"].isEmpty) {
    print("You haven't registered for any classes yet.");
  } else {
    for (var classData in member["registeredClasses"]) {
      print("Class: ${classData['name']}, Instructor: ${classData['instructor']}");
    }
  }
  showMemberMenu(member);
}

void registerMembershipPlan(Map<String, dynamic> member) {
  print("\n==== Register for Membership Plan ====");
  print("Available Membership Plans: ");
  for (var plan in membershipPlans) {
    print("Name: ${plan['name']}, Price: \$${plan['price']}");
  }

  print("Enter the name of the membership plan to register: ");
  String planName = stdin.readLineSync()!;
  Map<String, dynamic>? selectedPlan;
  for (var plan in membershipPlans) {
    if (plan["name"] == planName) {
      selectedPlan = plan;
      break;
    }
  }

  if (selectedPlan != null) {
    member["registeredMemberships"].add(selectedPlan);
    print("Membership plan registered successfully!");
  } else {
    print("Membership plan not found. Please enter a valid plan name.");
  }

  showMemberMenu(member);
}

void viewMembershipPlans(Map<String, dynamic> member) {
  print("\n==== View Membership Plans ====");
  if (member["registeredMemberships"].isEmpty) {
    print("You haven't registered for any membership plans yet.");
  } else {
    for (var plan in member["registeredMemberships"]) {
      print("Name: ${plan['name']}, Price: \$${plan['price']}");
    }
  }
  showMemberMenu(member);
}

void bookPersonalTrainer(Map<String, dynamic> member) {
  print("\n==== Book Personal Trainer ====");
  print("Available Trainers: ");
  for (var trainer in trainers) {
    print("Name: ${trainer['name']}, Specialization: ${trainer['specialization']}");
  }

  print("Enter the name of the trainer to book: ");
  String trainerName = stdin.readLineSync()!;
  Map<String, dynamic>? selectedTrainer;
  for (var trainer in trainers) {
    if (trainer["name"] == trainerName) {
      selectedTrainer = trainer;
      break;
    }
  }

  if (selectedTrainer != null) {
    member["bookedTrainer"] = selectedTrainer;
    print("Trainer booked successfully!");
  } else {
    print("Trainer not found. Please enter a valid trainer name.");
  }

  showMemberMenu(member);
}
