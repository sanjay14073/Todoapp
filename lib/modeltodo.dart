class Model{
  String Lname;
  String task;
  DateTime?d;
  DateTime?ct;
  Model(this.Lname,this.task,this.d,this.ct);
  Map<String, dynamic> toMap() {
    return {
      "title":Lname,
      "task": task,
      "sdate": DateTime.now().toString(),
      "sdate": DateTime.now().toString(),
    };
  }
}