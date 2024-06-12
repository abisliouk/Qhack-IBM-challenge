import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'src/services/services.dart' as services;

late final ValueNotifier<int> notifier;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();

  fillLocalStorage();

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  WidgetsFlutterBinding.ensureInitialized();
  await services.configureServices();
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}

void fillLocalStorage() {
  localStorage.setItem('123', '''
[
  {
    "step": "1",
    "title": "Official Welcome and Introduction",
    "description": "Receive an official welcome email from the HR department with details about the first day of work, including time, location, and what to bring. This step often includes links to essential documents and forms that need to be completed.",
    "links": ["https://www.uni-mannheim.de/en/"],
    "images": ["https://www.uni-mannheim.de/media/_processed_/3/c/csm_DSC_9116_2fb98b46c9.jpg"],
    "tasks": [
      "Check your email for the welcome message.",
      "Note down the date, time, and location for your first day.",
      "Prepare necessary documents as listed in the email."
    ]
  },
  {
    "step": "2",
    "title": "Orientation Sessions",
    "description": "Attend orientation sessions to learn about the university's history, mission, values, and organizational structure. These sessions may include introductions to key departments, health and safety protocols, and IT security policies.",
    "links": ["https://www.uni-mannheim.de/en/academics/"],
    "images": ["https://example.com/orientation_session_image_placeholder.jpg"],
    "tasks": [
      "Attend all scheduled orientation sessions.",
      "Engage with the presentations and take notes.",
      "Ask questions to clarify any doubts."
    ]
  },
  {
    "step": "3",
    "title": "Human Resources Paperwork",
    "description": "Complete necessary HR paperwork, including tax forms, employment contracts, confidentiality agreements, and benefits enrollment. This step may also include setting up payroll details.",
    "links": [
      "https://www.uni-mannheim.de/en/about/working-at-the-university-of-mannheim/"
    ],
    "images": ["https://example.com/hr_paperwork_image_placeholder.jpg"],
    "tasks": [
      "Fill out and sign all required HR documents.",
      "Submit the paperwork to the HR department.",
      "Ensure you understand your benefits and enrollment options."
    ]
  },
  {
    "step": "4",
    "title": "IT Account Setup",
    "description": "Set up university IT accounts, including email, intranet, and access to necessary software and databases. This process often involves an IT security briefing and training on the use of university IT resources.",
    "links": ["https://www.uni-mannheim.de/en/it/"],
    "images": ["https://example.com/it_account_setup_image_placeholder.jpg"],
    "tasks": [
      "Complete the IT security training.",
      "Set up your university email account.",
      "Familiarize yourself with the intranet and any software relevant to your role."
    ]
  },
  {
    "step": "5",
    "title": "Campus Tour",
    "description": "Participate in a guided tour of the campus to become familiar with important locations such as the library, administrative offices, cafeterias, and other key facilities.",
    "links": ["https://www.uni-mannheim.de/en/about/campus/"],
    "images": ["https://example.com/campus_tour_image_placeholder.jpg"],
    "tasks": [
      "Join the campus tour.",
      "Take note of important buildings and facilities.",
      "Ask questions about campus resources and services."
    ]
  },
  {
    "step": "6",
    "title": "Departmental Introduction",
    "description": "Meet with the department head and team members. Receive an overview of departmental goals, projects, and expectations. This step may also include setting up a workstation and receiving any necessary equipment or supplies.",
    "links": ["https://www.uni-mannheim.de/en/about/departments/"],
    "images": [
      "https://example.com/departmental_introduction_image_placeholder.jpg"
    ],
    "tasks": [
      "Introduce yourself to the department head and team members.",
      "Set up your workstation with any provided equipment or supplies.",
      "Review the departmental goals and your role in achieving them."
    ]
  },
  {
    "step": "7",
    "title": "Training and Development",
    "description": "Begin any required training programs or workshops relevant to the role. This may include instructional technology, teaching methodologies, research software, or other specialized tools.",
    "links": ["https://www.uni-mannheim.de/en/academics/continuing-education/"],
    "images": [
      "https://example.com/training_and_development_image_placeholder.jpg"
    ],
    "tasks": [
      "Enroll in and attend relevant training programs.",
      "Apply the learned skills and knowledge to your role.",
      "Seek feedback on your progress and understanding."
    ]
  },
  {
    "step": "8",
    "title": "Mentor Assignment",
    "description": "Be assigned a mentor or buddy within the department to help with the transition, answer questions, and provide support during the initial period of employment.",
    "links": [],
    "images": ["https://example.com/mentor_assignment_image_placeholder.jpg"],
    "tasks": [
      "Meet with your assigned mentor or buddy.",
      "Discuss any questions or concerns about your new role.",
      "Establish regular check-ins for ongoing support."
    ]
  },
  {
    "step": "9",
    "title": "Review of Performance and Goals",
    "description": "Meet with the supervisor to discuss performance expectations, set goals for the probationary period, and outline any specific projects or responsibilities.",
    "links": [],
    "images": ["https://example.com/performance_review_image_placeholder.jpg"],
    "tasks": [
      "Prepare for the meeting with your supervisor.",
      "Discuss and agree on performance goals.",
      "Outline your responsibilities and any specific projects."
    ]
  },
  {
    "step": "10",
    "title": "Ongoing Support and Integration",
    "description": "Receive information about ongoing support resources, including professional development opportunities, staff associations, and wellness programs.",
    "links": ["https://www.uni-mannheim.de/en/about/services/"],
    "images": ["https://example.com/ongoing_support_image_placeholder.jpg"],
    "tasks": [
      "Explore professional development opportunities.",
      "Join staff associations relevant to your interests.",
      "Utilize wellness programs to maintain work-life balance."
    ]
  }
]
''');
}
