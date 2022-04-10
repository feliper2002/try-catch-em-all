abstract class CreateTrainerDatabaseContract {
  Future<void> createTrainer(
      String name, int age, String gender, String region);
}
