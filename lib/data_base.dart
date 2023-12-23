import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

Future<void> createDatabase() async {
  // Откройте соединение с базой данных:
  Database database = await openDatabase(join(await getDatabasesPath(), 'finaldb_illialla.db'), version: 1,
      onCreate: (Database db, int version) async {
        // создание
        await db.execute('''
          CREATE TABLE IF NOT EXISTS tblTeacher(
            teacher_id INTEGER PRIMARY KEY,
            surname VARCHAR(255) NOT NULL,
            name VARCHAR(255) NOT NULL,
            patronymic VARCHAR(255),
            password VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL,
            birthday DATE NOT NULL
          );
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS tblGroup(
            group_id INTEGER PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            teacher_id INT NOT NULL,
            FOREIGN KEY (teacher_id) REFERENCES tblTeacher(teacher_id)
          );
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS tblStudent(
            student_id INTEGER PRIMARY KEY,
            surname VARCHAR(255) NOT NULL,
            name VARCHAR(255) NOT NULL,
            patronymic VARCHAR(255),
            password VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL,
            birthday DATE NOT NULL, 
            group_id INTEGER NOT NULL,
            FOREIGN KEY (group_id) REFERENCES tblGroup(group_id)
          );
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS tblTopic(
            topic_id INTEGER PRIMARY KEY,
            teacher_id INTEGER NOT NULL,
            name VARCHAR(255) NOT NULL,
            deadline DATE NOT NULL,
            FOREIGN KEY (teacher_id) REFERENCES tblTeacher(teacher_id)
          );
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS tblVocabulary(
            vocabulary_id INTEGER PRIMARY KEY,
            word VARCHAR(255) NOT NULL,
            translation VARCHAR(255) NOT NULL,
            topic_id INTEGER NOT NULL,
            FOREIGN KEY (topic_id) REFERENCES tblTopic(topic_id)
          );
        ''');
        // запонение
        await db.execute('''
          INSERT INTO tblTeacher (surname, name, patronymic, password, email, birthday) VALUES
          ('Максимова', 'Елизавета', 'Борисовна', '${md5.convert(utf8.encode("teacher1")).toString()}', 'teacher1@mail.ru', '1973-03-19');
        ''');
        await db.execute('''
          INSERT INTO tblGroup (name, teacher_id) VALUES ('9А', 1);
        ''');
        await db.execute('''
          INSERT INTO tblStudent (surname, name, patronymic, password, email, birthday, group_id) VALUES
          ('Соколов', 'Илья', 'Николаевич', '${md5.convert(utf8.encode("123456")).toString()}', 'pupil1@mail.ru', '2007-05-29', 1);
        ''');
        await db.execute('''
          INSERT INTO tblTopic (teacher_id, name, deadline) VALUES 
          (1, 'Travelling', '2023-10-05'), (1, 'Food', '2023-11-15'), (1, 'Education', '2023-12-25');
        ''');
        await db.execute('''
          INSERT INTO tblVocabulary (word, translation, topic_id) VALUES 
          ('Voyage', 'Путешествие', 1), ('Luggage', 'Багаж', 1), ('Currency', 'Валюта', 1), ('Vacation', 'Отпуск', 1), ('Wanderlust', 'Страсть к путешествиям', 1), 
          ('Hitchhiking', 'Автостоп', 1), ('Pilgrimage', 'Паломничество', 1), ('Delay', 'Задержка', 1), ('Insurance', 'Страхование', 1), ('Transfer', 'Пересадка', 1),
          ('Apple', 'Яблоко', 2), ('Watermelon', 'Арбуз', 2), ('Dat', 'Финик', 2), ('Gooseberry', 'Крыжовник', 2), ('Radish', 'Редис', 2), ('Currant', 'Смородина', 2),
          ('Eggplant', 'Баклажан', 2), ('Turnip', 'Репа', 2), ('Beetroot', 'Свёкла', 2), ('Mutton', 'Баранина', 2), ('Lamb', 'Ягнёнок', 2), ('Raisin', 'Изюм', 2),
          ('Fall behind', 'Отставать', 3), ('Be enrolled', 'Поступить', 3), ('Hit the books', 'Зубрить', 3), ('Freshman', 'Первокурсник', 3), ('Sophomore', 'Второкурсник', 3),
          ('Postgraduate', 'Аспирант', 3), ('Revise', 'Повторять', 3), ('Internship', 'Интернатура', 3), ('Play truant', 'Прогуливать', 3), ('Tuition fees', 'Плата за обучение', 3);
        ''');
      });
}