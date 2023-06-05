

/// Gera dia da semana em português
class WeekDay {
  int weekday;
  late String short;
  late String long;


  WeekDay(this.weekday) {
    switch (weekday) {
      case 7:
        short = "dom";
        long = "Domingo";
        break;
      case 1:
        short = "seg";
        long = "Segunda-Feira";
        break;
      case 2:
        short = "ter";
        long = "Terça-Feira";
        break;
      case 3:
        short = "qua";
        long = "Quarta-Feira";
        break;
      case 4:
        short = "qui";
        long = "Quinta-Feira";
        break;
      case 5:
        short = "sex";
        long = "Sexta-Feira";
        break;
      case 6:
        short = "sab";
        long = "Sábado";
        break;

    }
  }
}
