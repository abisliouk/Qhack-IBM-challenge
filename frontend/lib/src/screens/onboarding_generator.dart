import 'package:gptparty_frontend/src/models/api/onboarding_step.dart';
import 'package:gptparty_frontend/src/onboarding/onboarding_page.dart';
import 'package:gptparty_frontend/src/screens/onboarding_generator_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter/material.dart';

import '../widgets/oops_widget.dart';

class OnboardingGenerator extends StatefulWidget {
  const OnboardingGenerator({super.key});

  @override
  OnboardingGeneratorState createState() => OnboardingGeneratorState();
}

class OnboardingGeneratorState extends State<OnboardingGenerator> {
  late OnboardingGeneratorStore store;

  @override
  void initState() {
    store = OnboardingGeneratorStore();

    reaction((_) => store.onboardingSteps, (List<OnboardingStep>? steps) {
      if (steps != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OnboardingPage(onboardingSteps: steps),
          ),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OnboardAI', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 0,
        // Center title if desired
        centerTitle: true,
      ),
      body: Observer(builder: (_) {
        switch (store.fetchOnboardingStepsFuture.status) {
          case FutureStatus.pending:
            return const Center(child: CircularProgressIndicator.adaptive());
          case FutureStatus.rejected:
            return const OopsWidget();
          case FutureStatus.fulfilled:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 64),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 24),
                      Expanded(
                          child: _buildBox(
                        'Special Requirements',
                        'Please add your Requirements',
                        store.requirementsList,
                        (item) => store.addRequirement(item),
                        (index, item) => store.editRequirement(index, item),
                        (index) => store.deleteRequirement(index),
                      )),
                      SizedBox(width: 24),
                      Expanded(
                          child: _buildBox(
                        'Employee Resources',
                        'Please add your Employee Resources',
                        store.employeeResourcesList,
                        (item) => store.addEmployeeResource(item),
                        (index, item) =>
                            store.editEmployeeResource(index, item),
                        (index) => store.deleteEmployeeResource(index),
                      )),
                      SizedBox(width: 24),
                      Expanded(
                        child: _buildBox(
                          'Company Resources',
                          'Please add your Company Resources',
                          store.companyResourcesList,
                          (item) => store.addCompanyResource(item),
                          (index, item) =>
                              store.editCompanyResource(index, item),
                          (index) => store.deleteCompanyResource(index),
                        ),
                      ),
                      SizedBox(width: 24),
                    ],
                  ),
                  SizedBox(height: 32),
                  _generateOnboardingButton(),
                ],
              ),
            );
        }
      }),
    );
  }

  String formatText(String text) {
    int index = text.indexOf('\n');
    if (index != -1) {
      return text.substring(0, index) + '...';
    }
    return text;
  }

  Widget _buildBox(
      String title,
      String emptyMessage,
      List<String> list,
      Function(String) onAdd,
      Function(int, String) onEdit,
      Function(int) onDelete) {
    return Observer(
      builder: (_) {
        return Container(
          width: 300, // Set the width of the box
          decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .primary), // Add border to the main box
            borderRadius:
                BorderRadius.circular(10), // Add border radius to the main box
          ),
          padding: const EdgeInsets.all(10), // Add padding inside the main box
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 200, // Set the height of the ListView
                child: list.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.sentiment_dissatisfied,
                              size: 50,
                              color: Colors.grey,
                            ),
                            Text(
                              emptyMessage,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary), // Add border to each requirement
                              borderRadius: BorderRadius.circular(
                                  10), // Add border radius to each requirement
                            ),
                            margin: const EdgeInsets.only(
                                bottom: 10), // Add margin between requirements
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 50, // Set the height of the cell
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, // Center the text vertically
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start, // Align the text to the left horizontally
                                      children: [
                                        Text(
                                          formatText(list[
                                              index]), // Use the helper function to format the text
                                          overflow: TextOverflow
                                              .ellipsis, // Add "..." at the end if the text overflows
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    String editedItem = list[index];
                                    final controller =
                                        TextEditingController(text: editedItem);

                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Edit $title'),
                                          content: Container(
                                            width:
                                                300, // Set the width of the TextField
                                            child: TextField(
                                              controller: controller,
                                              onChanged: (value) {
                                                editedItem = value;
                                              },
                                              maxLines:
                                                  3, // Set the maximum number of lines
                                              scrollController:
                                                  ScrollController(), // Make the TextField scrollable
                                            ),
                                          ),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {
                                                onEdit(index, editedItem);
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Save'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    onDelete(index);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      String newItem = '';
                      final controller = TextEditingController();

                      return AlertDialog(
                        title: Text('Add $title'),
                        content: Container(
                          width: 300, // Set the width of the TextField
                          child: TextField(
                            controller: controller,
                            onChanged: (value) {
                              newItem = value;
                            },
                            maxLines: 3, // Set the maximum number of lines
                            scrollController:
                                ScrollController(), // Make the TextField scrollable
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              onAdd(newItem);
                              Navigator.pop(context);
                            },
                            child: const Text('Add'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Add $title'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _generateOnboardingButton() {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.fromLTRB(64, 20, 64, 20),
        ),
        backgroundColor: MaterialStateProperty.all(
            Theme.of(context).primaryColor), // Use the primary color
        elevation: MaterialStateProperty.all(4), // Default elevation is 2
      ),
      onPressed: () => store.getOnboardingSteps(
          requirements: store.requirementsList,
          employeeResources: store.employeeResourcesList,
          companyResources: store.companyResourcesList),
      child: const Text(
        'Generate Onboarding Steps',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
