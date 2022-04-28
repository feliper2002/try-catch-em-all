abstract class CreateTrainerDatabaseContract {
  Future<String> createTrainer(
      String name, int age, String gender, String region);
}
