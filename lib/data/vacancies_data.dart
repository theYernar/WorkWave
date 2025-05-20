class ContactData{
  final String phone;
  final String email;

  ContactData({
    required this.phone,
    required this.email,
  });
}

class VacanciesData {
  final String title;
  final String salary;
  final String description;
  final ContactData contacts;
  final DateTime postedDate;

  VacanciesData({
    required this.title,
    required this.salary,
    required this.description,
    required this.contacts,
    required this.postedDate,
  });
}