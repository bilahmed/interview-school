# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


CLASS_ROOMS = ["CR1", "CR2", "CR3", "CR4", "CR5"]

STUDENTS = [
  { name: "Student1", email: 'student1@gmail.com', roll_no: '123' },
  { name: "Student2", email: 'student2@gmail.com', roll_no: '456' },
  { name: "Student3", email: 'student3@gmail.com', roll_no: '789' }
]

TEACHERS = [
  { email: 'adam@gmail.com', first_name: "Adam", last_name: "A" },
  { email: 'john@gmail.com', first_name: "John", last_name: "J" },
  { email: 'shawn@gmail.com', first_name: "Shawn", last_name: "S" }
]

SUBJECTS = [
  { name: 'English', code: "E23" },
  { name: 'Math', code: "M23" },
  { name: 'Physics', code: "P23" }
]

CLASS_ROOMS.each { |class_room| ClassRoom.create(name: class_room) }
STUDENTS.each { |student| Student.create(name: student[:name], email: student[:email], roll_no: student[:roll_no]) }
SUBJECTS.each { |subject| Subject.create(name: subject[:name], code: subject[:code]) }
TEACHERS.each { |teacher| Teacher.create(email: teacher[:email], first_name: teacher[:first_name], last_name: teacher[:last_name]) }

TeacherSubject.create(teacher_id: Teacher.first.id, subject_id: Subject.first.id)
TeacherSubject.create(teacher_id: Teacher.second.id, subject_id: Subject.first.id)
TeacherSubject.create(teacher_id: Teacher.second.id, subject_id: Subject.second.id)
TeacherSubject.create(teacher_id: Teacher.third.id, subject_id: Subject.second.id)
TeacherSubject.create(teacher_id: Teacher.third.id, subject_id: Subject.third.id)
TeacherSubject.create(teacher_id: Teacher.first.id, subject_id: Subject.third.id)
