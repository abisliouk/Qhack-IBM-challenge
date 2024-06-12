// Flask server url
const String BASE_URL = 'http://localhost:5000';

// JSON response from the Flask server
const String MOCK_JSON_RESPONSE = '''
[
  {
    "step": "1",
    "title": "Official Welcome and Introduction",
    "description": "Receive an official welcome email from the HR department with details about the first day of work, including time, location, and what to bring. This step often includes links to essential documents and forms that need to be completed.",
    "links": ["https://www.uni-mannheim.de/en/"],
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
    "tasks": [
      "Explore professional development opportunities.",
      "Join staff associations relevant to your interests.",
      "Utilize wellness programs to maintain work-life balance."
    ]
  }
]
''';
