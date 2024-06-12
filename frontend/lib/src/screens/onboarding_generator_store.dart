import 'dart:async';

import 'package:gptparty_frontend/src/services/base_service.dart';
import 'package:mobx/mobx.dart';

import '../models/api/onboarding_step.dart';
part 'onboarding_generator_store.g.dart';

class OnboardingGeneratorStore = _OnboardingGeneratorStore
    with _$OnboardingGeneratorStore;

abstract class _OnboardingGeneratorStore with Store {
  @observable
  List<String> requirementsList = ObservableList<String>();

  @observable
  List<String> companyResourcesList = ObservableList<String>();

  @observable
  List<String> employeeResourcesList = ObservableList<String>();

  @observable
  List<OnboardingStep>? onboardingSteps;

  ///////////////////////////////////////////////////
  ///
  @observable
  ObservableFuture<List<OnboardingStep>?> fetchOnboardingStepsFuture =
      emptyOnboardingStepsResponse;

  @computed
  bool get hasOnboardingSteps =>
      fetchOnboardingStepsFuture != emptyOnboardingStepsResponse &&
      fetchOnboardingStepsFuture.status == FutureStatus.fulfilled;

  static ObservableFuture<List<OnboardingStep>?> emptyOnboardingStepsResponse =
      ObservableFuture.value(null);

  ///////////////////////////////////////////////////

  @action
  void addRequirement(String item) {
    requirementsList.add(item);
  }

  @action
  void editRequirement(int index, String item) {
    requirementsList[index] = item;
  }

  @action
  void deleteRequirement(int index) {
    requirementsList.removeAt(index);
  }

  @action
  void addEmployeeResource(String item) {
    employeeResourcesList.add(item);
  }

  @action
  void editEmployeeResource(int index, String item) {
    employeeResourcesList[index] = item;
  }

  @action
  void deleteEmployeeResource(int index) {
    employeeResourcesList.removeAt(index);
  }

  @action
  void addCompanyResource(String item) {
    companyResourcesList.add(item);
  }

  @action
  void editCompanyResource(int index, String item) {
    companyResourcesList[index] = item;
  }

  @action
  void deleteCompanyResource(int index) {
    companyResourcesList.removeAt(index);
  }

  /////////////////////////////////////////////////

  @action
  Future<List<OnboardingStep>?> getOnboardingSteps(
      {required List<String> requirements,
      required List<String> employeeResources,
      required List<String> companyResources}) async {
    onboardingSteps = null;
    final future = imageProcessingService.getOnboardingSteps(
        requirements: requirements,
        employeeResources: employeeResources,
        companyResources: companyResources);
    fetchOnboardingStepsFuture = ObservableFuture(future);
    onboardingSteps = await future;
    return onboardingSteps;
  }
}
