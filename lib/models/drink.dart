// this is an abstract class
abstract class Drink {
  String name;
  Drink(this.name);
}
// this is a subclass of Drink
class Coffee extends Drink {
  Coffee() : super('Coffee');
}
class Tea extends Drink {
  Tea() : super('Tea');
}
class Hibiscus extends Drink {
  Hibiscus() : super('Turkish  coffee');
} 