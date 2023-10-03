import 'dart:math';

class NeuralNetwork {
  // Ваги для вхідних сигналів
  late List<double> weights;

  // Конструктор для ініціалізації мережі з вагами
  NeuralNetwork(List<double> initialWeights) {
    if (initialWeights.length != 9) {
      throw ArgumentError("Кількість ваг має бути 9");
    }
    weights = List.from(initialWeights);
  }

  // Функція активації (сигмоїда)
  double sigmoid(double x) {
    return 1 / (1 + exp(-x));
  }

  // Функція для передбачення виходу на основі вхідних сигналів
  double predict(List<int> inputs) {
    if (inputs.length != 9) {
      throw ArgumentError("Кількість вхідних сигналів має бути 9");
    }

    double sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += inputs[i] * weights[i];
    }

    // Застосовуємо функцію активації (сигмоїда) до суми
    return sigmoid(sum);
  }
}

void main() {
  // Ваги мережі (приклад значень)
  List<double> initialWeights = [0.7, 0.9, 0.9, 0.3, 0.4, 0.6, 0.7, 0.8, 0.9];

  // Створимо мережу з заданими вагами
  NeuralNetwork network = NeuralNetwork(initialWeights);

  // Вхідні дані для цифри 1 (включено 1, решта вимкнено)
  List<int> input1 = [0, 1, 0, 0, 0, 0, 0, 0, 0];

  // Вхідні дані для цифри 3 (включено 3, решта вимкнено)
  List<int> input3 = [0, 1, 1, 0, 0, 0, 0, 0, 0];

  // Вхідні дані для цифри 7 (включено 7, решта вимкнено)
  List<int> input7 = [0, 1, 1, 0, 0, 1, 0, 0, 0];

  // Передбачення для цифр 1, 3 і 7
  double prediction1 = network.predict(input1);
  double prediction3 = network.predict(input3);
  double prediction7 = network.predict(input7);

  // Виведемо результати передбачень
  print("Предсказание для цифры 1: $prediction1");
  print("Предсказание для цифры 3: $prediction3");
  print("Предсказание для цифры 7: $prediction7");
}
