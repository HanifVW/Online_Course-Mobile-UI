class Course {
  final String course;
  final String courseClass;
  final String lecturer;
  final int? time;

  Course({
    required this.course,
    required this.courseClass,
    required this.lecturer,
    this.time,
});

  String getCourse() {
    return course;
  }

  String getCourseClass(){
    return "classroom_"+courseClass;
  }

  String getLecturer(){
    return lecturer;
  }

  int getTime(){
    return time!;
  }
}