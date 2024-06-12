import 'package:gptparty_frontend/src/models/convert.dart';

class OnboardingStep {
  final String step;
  final String title;
  final String description;
  final List<String> links;
  final Map<String, bool> tasks;

  OnboardingStep({
    required this.step,
    required this.title,
    required this.description,
    required this.links,
    required this.tasks,
  });

  factory OnboardingStep.fromJson(Map<String, dynamic> json) {
    return OnboardingStep(
      step: json['step'],
      title: json['title'],
      description: json['description'],
      links: toListString(json['links']) ?? [],
      tasks: Map.fromIterable(
        toListString(json['tasks']) ?? [],
        key: (v) => v,
        value: (v) => false,
      ),
    );
  }

  static List<OnboardingStep> listFromJson(List<dynamic>? json) {
    return json == null
        ? <OnboardingStep>[]
        : json
            .map<OnboardingStep>((value) => OnboardingStep.fromJson(value))
            .toList();
  }

  @override
  String toString() {
    return 'OnboardingStep(step: $step, title: $title, description: $description, links: $links, tasks: $tasks)';
  }

  static String onboardingStepsListToString(List<OnboardingStep> steps) {
    return steps.map((step) => step.toString()).join(', ');
  }
}
