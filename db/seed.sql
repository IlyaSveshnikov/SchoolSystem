--
-- PostgreSQL database dump
--

\restrict zgAqLcRtcfkR6dgqJyCgBSCffgyC7hMNkMJJddtE57jCkXtrHziWNChMW9A5OZK

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.classes VALUES (1, '1А', '101');
INSERT INTO public.classes VALUES (2, '1Б', '102');
INSERT INTO public.classes VALUES (3, '2А', '103');
INSERT INTO public.classes VALUES (4, '2Б', '104');
INSERT INTO public.classes VALUES (5, '3А', '105');
INSERT INTO public.classes VALUES (6, '4А', '106');
INSERT INTO public.classes VALUES (7, '4Б', '107');
INSERT INTO public.classes VALUES (8, '5А', '108');
INSERT INTO public.classes VALUES (9, '5Б', '109');
INSERT INTO public.classes VALUES (10, '6А', '110');
INSERT INTO public.classes VALUES (11, '6Б', '111');
INSERT INTO public.classes VALUES (12, '7А', '112');
INSERT INTO public.classes VALUES (13, '8А', '113');
INSERT INTO public.classes VALUES (14, '8Б', '114');
INSERT INTO public.classes VALUES (15, '9А', '115');
INSERT INTO public.classes VALUES (16, '10А', '116');
INSERT INTO public.classes VALUES (17, '11А', '117');
INSERT INTO public.classes VALUES (18, '11Б', '118');


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.subjects VALUES (1, 'Математика', 'Базовый курс математики: арифметика, текстовые задачи, основы логики.');
INSERT INTO public.subjects VALUES (2, 'Алгебра', 'Уравнения, функции, тождественные преобразования и неравенства.');
INSERT INTO public.subjects VALUES (4, 'Русский язык', 'Орфография, пунктуация, морфология и синтаксис русского языка.');
INSERT INTO public.subjects VALUES (5, 'Литература', 'Изучение классических и современных произведений, анализ текста.');
INSERT INTO public.subjects VALUES (6, 'Чтение', 'Литературное чтение и развитие речи в начальной школе.');
INSERT INTO public.subjects VALUES (7, 'Окружающий мир', 'Начальные знания о природе, обществе и безопасности.');
INSERT INTO public.subjects VALUES (8, 'Английский язык', 'Развитие навыков чтения, письма и устной речи на английском.');
INSERT INTO public.subjects VALUES (9, 'Информатика', 'Алгоритмы, программирование и работа с информацией.');
INSERT INTO public.subjects VALUES (10, 'История', 'История России и мира от древности до современности.');
INSERT INTO public.subjects VALUES (11, 'Обществознание', 'Человек, общество, право и экономика.');
INSERT INTO public.subjects VALUES (13, 'Биология', 'Строение и жизнедеятельность живых организмов.');
INSERT INTO public.subjects VALUES (14, 'Физика', 'Механика, электричество, оптика и основы термодинамики.');
INSERT INTO public.subjects VALUES (15, 'Химия', 'Вещества, химические реакции и их закономерности.');
INSERT INTO public.subjects VALUES (16, 'ИЗО', 'Изобразительное искусство, основы рисунка и композиции.');
INSERT INTO public.subjects VALUES (17, 'Музыка', 'Музыкальная грамота, пение и слушание музыки.');
INSERT INTO public.subjects VALUES (18, 'Технология', 'Практические трудовые навыки и проектная деятельность.');
INSERT INTO public.subjects VALUES (19, 'Физкультура', 'Общая физическая подготовка и спортивные игры.');
INSERT INTO public.subjects VALUES (20, 'ОБЖ', 'Основы безопасности жизнедеятельности.');
INSERT INTO public.subjects VALUES (3, 'География', 'Планиметрия и стереометрия, доказательство теорем, построения.');


--
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.students VALUES (1, 'Петров Дмитрий Сергеевич', 1, '2019-11-06', 'М', 'Петрова Елизавета Дмитриевна', '+7-959-490-86-69', NULL);
INSERT INTO public.students VALUES (2, 'Павлова Анна Дмитриевна', 1, '2019-11-18', 'Ж', 'Павлова Варвара Михайловна', '+7-924-400-65-30', NULL);
INSERT INTO public.students VALUES (3, 'Иванова Ева Андреевна', 1, '2019-09-25', 'Ж', 'Иванова Андрей Андреевич', '+7-991-619-87-35', NULL);
INSERT INTO public.students VALUES (4, 'Морозов Максим Викторович', 1, '2019-09-01', 'М', 'Морозова Анастасия Александровна', '+7-924-471-49-40', NULL);
INSERT INTO public.students VALUES (5, 'Соколов Андрей Дмитриевич', 1, '2019-02-24', 'М', 'Соколов Андрей Викторович', '+7-926-231-94-70', NULL);
INSERT INTO public.students VALUES (6, 'Михайлов Кирилл Павлович', 2, '2019-04-18', 'М', 'Михайлова Ева Ивановна', '+7-949-508-95-93', NULL);
INSERT INTO public.students VALUES (7, 'Лебедева Ксения Олеговна', 2, '2019-02-08', 'Ж', 'Лебедева Олег Александрович', '+7-985-667-39-85', NULL);
INSERT INTO public.students VALUES (8, 'Иванов Дмитрий Александрович', 2, '2019-04-03', 'М', 'Иванова Дарья Дмитриевна', '+7-975-343-45-95', NULL);
INSERT INTO public.students VALUES (9, 'Васильева Ксения Сергеевна', 2, '2019-12-19', 'Ж', 'Васильева Виктория Олеговна', '+7-962-294-22-22', NULL);
INSERT INTO public.students VALUES (10, 'Морозова Елизавета Павловна', 2, '2019-08-28', 'Ж', 'Морозова Варвара Дмитриевна', '+7-917-512-53-23', NULL);
INSERT INTO public.students VALUES (11, 'Васильев Иван Викторович', 2, '2019-08-05', 'М', 'Васильев Михаил Олегович', '+7-941-995-19-66', NULL);
INSERT INTO public.students VALUES (12, 'Петров Роман Викторович', 3, '2018-01-03', 'М', 'Петрова Виктория Сергеевна', '+7-962-597-71-37', NULL);
INSERT INTO public.students VALUES (13, 'Петрова София Павловна', 3, '2018-01-13', 'Ж', 'Петрова Виктор Андреевич', '+7-964-813-81-94', NULL);
INSERT INTO public.students VALUES (14, 'Смирнова Виктория Андреевна', 3, '2018-04-02', 'Ж', 'Смирнова Ксения Александровна', '+7-950-158-16-84', NULL);
INSERT INTO public.students VALUES (15, 'Егорова Ксения Сергеевна', 3, '2018-01-17', 'Ж', 'Егорова Дмитрий Дмитриевич', '+7-986-169-96-40', NULL);
INSERT INTO public.students VALUES (16, 'Кузнецова Алиса Ивановна', 3, '2018-10-20', 'Ж', 'Кузнецова Андрей Павлович', '+7-994-697-82-76', NULL);
INSERT INTO public.students VALUES (17, 'Михайлова Виктория Михайловна', 3, '2018-04-09', 'Ж', 'Михайлова Михаил Олегович', '+7-950-869-19-11', NULL);
INSERT INTO public.students VALUES (18, 'Сидоров Кирилл Иванович', 4, '2018-09-09', 'М', 'Сидоров Олег Дмитриевич', '+7-941-478-46-30', NULL);
INSERT INTO public.students VALUES (19, 'Павлова Ева Андреевна', 4, '2018-10-26', 'Ж', 'Павлова Анна Викторовна', '+7-948-779-23-27', NULL);
INSERT INTO public.students VALUES (20, 'Кузнецова Мария Викторовна', 4, '2018-03-09', 'Ж', 'Кузнецова Алексей Михайлович', '+7-936-803-91-43', NULL);
INSERT INTO public.students VALUES (21, 'Михайлова Анна Дмитриевна', 4, '2018-11-14', 'Ж', 'Михайлова Анна Александровна', '+7-952-889-26-91', NULL);
INSERT INTO public.students VALUES (22, 'Попова Ева Олеговна', 4, '2018-09-23', 'Ж', 'Попова Сергей Дмитриевич', '+7-919-807-29-79', NULL);
INSERT INTO public.students VALUES (23, 'Козлова Ксения Сергеевна', 5, '2017-07-05', 'Ж', 'Козлова Олег Александрович', '+7-955-315-97-41', NULL);
INSERT INTO public.students VALUES (24, 'Морозов Кирилл Павлович', 5, '2017-10-24', 'М', 'Морозов Алексей Сергеевич', '+7-932-522-13-32', NULL);
INSERT INTO public.students VALUES (25, 'Алексеева Варвара Ивановна', 5, '2017-05-06', 'Ж', 'Алексеева Мария Павловна', '+7-914-979-70-38', NULL);
INSERT INTO public.students VALUES (26, 'Лебедев Никита Андреевич', 5, '2017-04-08', 'М', 'Лебедев Алексей Павлович', '+7-952-385-18-45', NULL);
INSERT INTO public.students VALUES (27, 'Павлова Дарья Александровна', 6, '2016-02-09', 'Ж', 'Павлова Михаил Александрович', '+7-923-710-65-54', NULL);
INSERT INTO public.students VALUES (28, 'Алексеева Алиса Викторовна', 6, '2016-02-13', 'Ж', 'Алексеева Виктория Андреевна', '+7-915-825-65-10', NULL);
INSERT INTO public.students VALUES (29, 'Морозов Михаил Дмитриевич', 6, '2016-11-11', 'М', 'Морозова Варвара Дмитриевна', '+7-948-619-49-95', NULL);
INSERT INTO public.students VALUES (30, 'Фёдорова Елизавета Андреевна', 6, '2016-09-05', 'Ж', 'Фёдорова Павел Сергеевич', '+7-988-682-48-61', NULL);
INSERT INTO public.students VALUES (31, 'Новиков Артём Иванович', 6, '2016-07-26', 'М', 'Новикова Варвара Михайловна', '+7-969-552-66-96', NULL);
INSERT INTO public.students VALUES (32, 'Попова Варвара Дмитриевна', 7, '2016-05-17', 'Ж', 'Попова Алиса Михайловна', '+7-921-938-40-96', NULL);
INSERT INTO public.students VALUES (33, 'Соколова Виктория Сергеевна', 7, '2016-01-02', 'Ж', 'Соколова Виктор Дмитриевич', '+7-968-524-90-83', NULL);
INSERT INTO public.students VALUES (34, 'Волков Егор Павлович', 7, '2016-04-05', 'М', 'Волкова Анна Дмитриевна', '+7-964-324-32-99', NULL);
INSERT INTO public.students VALUES (35, 'Петрова Ксения Ивановна', 7, '2016-02-15', 'Ж', 'Петрова Виктор Викторович', '+7-981-709-50-66', NULL);
INSERT INTO public.students VALUES (36, 'Павлова Анастасия Сергеевна', 8, '2015-12-28', 'Ж', 'Павлова Михаил Иванович', '+7-991-383-76-72', NULL);
INSERT INTO public.students VALUES (37, 'Михайлов Егор Дмитриевич', 8, '2015-12-10', 'М', 'Михайлов Олег Михайлович', '+7-979-182-27-29', NULL);
INSERT INTO public.students VALUES (38, 'Волков Тимофей Сергеевич', 8, '2015-12-07', 'М', 'Волков Павел Михайлович', '+7-979-577-63-17', NULL);
INSERT INTO public.students VALUES (39, 'Алексеев Михаил Александрович', 8, '2015-10-13', 'М', 'Алексеев Олег Андреевич', '+7-959-973-63-78', NULL);
INSERT INTO public.students VALUES (40, 'Семёнов Иван Андреевич', 8, '2015-07-16', 'М', 'Семёнов Олег Павлович', '+7-931-960-69-26', NULL);
INSERT INTO public.students VALUES (41, 'Волков Андрей Александрович', 8, '2015-02-21', 'М', 'Волков Виктор Сергеевич', '+7-916-366-58-51', NULL);
INSERT INTO public.students VALUES (42, 'Фёдорова Дарья Павловна', 9, '2015-05-25', 'Ж', 'Фёдорова Елизавета Андреевна', '+7-920-581-12-79', NULL);
INSERT INTO public.students VALUES (43, 'Морозов Иван Дмитриевич', 9, '2015-11-02', 'М', 'Морозова Виктория Ивановна', '+7-912-736-29-40', NULL);
INSERT INTO public.students VALUES (44, 'Семёнов Роман Дмитриевич', 9, '2015-10-07', 'М', 'Семёнов Михаил Михайлович', '+7-931-720-87-24', NULL);
INSERT INTO public.students VALUES (45, 'Новиков Дмитрий Александрович', 9, '2015-05-19', 'М', 'Новикова Елизавета Павловна', '+7-935-177-85-98', NULL);
INSERT INTO public.students VALUES (46, 'Кузнецов Тимофей Андреевич', 10, '2014-11-20', 'М', 'Кузнецова Алиса Александровна', '+7-954-645-64-94', NULL);
INSERT INTO public.students VALUES (47, 'Сидорова Ксения Михайловна', 10, '2014-01-28', 'Ж', 'Сидорова Виктор Дмитриевич', '+7-965-470-91-68', NULL);
INSERT INTO public.students VALUES (48, 'Алексеев Максим Викторович', 10, '2014-11-09', 'М', 'Алексеева Ксения Олеговна', '+7-969-546-85-44', NULL);
INSERT INTO public.students VALUES (49, 'Соколова Мария Андреевна', 10, '2014-08-08', 'Ж', 'Соколова Алиса Павловна', '+7-953-129-73-51', NULL);
INSERT INTO public.students VALUES (50, 'Семёнов Иван Михайлович', 10, '2014-05-11', 'М', 'Семёнов Николай Андреевич', '+7-981-110-76-34', NULL);
INSERT INTO public.students VALUES (51, 'Соколов Тимофей Павлович', 10, '2014-08-18', 'М', 'Соколова Ева Олеговна', '+7-992-828-72-67', NULL);
INSERT INTO public.students VALUES (52, 'Новиков Иван Павлович', 11, '2014-12-08', 'М', 'Новиков Николай Михайлович', '+7-970-666-77-54', NULL);
INSERT INTO public.students VALUES (53, 'Павлова Дарья Михайловна', 11, '2014-12-15', 'Ж', 'Павлова Михаил Иванович', '+7-925-838-34-50', NULL);
INSERT INTO public.students VALUES (54, 'Павлов Тимофей Сергеевич', 11, '2014-04-07', 'М', 'Павлова Полина Викторовна', '+7-986-389-22-34', NULL);
INSERT INTO public.students VALUES (55, 'Соколова Дарья Сергеевна', 11, '2014-05-01', 'Ж', 'Соколова София Андреевна', '+7-915-155-80-47', NULL);
INSERT INTO public.students VALUES (56, 'Семёнов Дмитрий Александрович', 12, '2013-10-10', 'М', 'Семёнов Виктор Михайлович', '+7-933-152-42-71', NULL);
INSERT INTO public.students VALUES (57, 'Сидоров Михаил Олегович', 12, '2013-02-19', 'М', 'Сидорова Анна Сергеевна', '+7-929-930-82-48', NULL);
INSERT INTO public.students VALUES (58, 'Соколов Дмитрий Викторович', 12, '2013-07-20', 'М', 'Соколова Алиса Ивановна', '+7-976-489-67-66', NULL);
INSERT INTO public.students VALUES (59, 'Козлова Елизавета Андреевна', 12, '2013-10-20', 'Ж', 'Козлова Андрей Иванович', '+7-990-316-43-94', NULL);
INSERT INTO public.students VALUES (60, 'Попов Иван Сергеевич', 12, '2013-09-03', 'М', 'Попов Павел Олегович', '+7-998-708-70-47', NULL);
INSERT INTO public.students VALUES (61, 'Соколов Артём Андреевич', 12, '2013-12-28', 'М', 'Соколов Алексей Андреевич', '+7-990-703-94-35', NULL);
INSERT INTO public.students VALUES (62, 'Павлов Иван Сергеевич', 13, '2012-05-27', 'М', 'Павлов Сергей Сергеевич', '+7-949-709-82-46', NULL);
INSERT INTO public.students VALUES (63, 'Кузнецова Анастасия Андреевна', 13, '2012-12-13', 'Ж', 'Кузнецова Ксения Викторовна', '+7-973-548-20-86', NULL);
INSERT INTO public.students VALUES (64, 'Алексеев Тимофей Михайлович', 13, '2012-10-09', 'М', 'Алексеев Алексей Александрович', '+7-996-941-44-83', NULL);
INSERT INTO public.students VALUES (65, 'Попов Егор Викторович', 13, '2012-11-15', 'М', 'Попова София Павловна', '+7-991-933-72-21', NULL);
INSERT INTO public.students VALUES (66, 'Морозова Елизавета Михайловна', 13, '2012-06-22', 'Ж', 'Морозова Дмитрий Михайлович', '+7-962-810-73-46', NULL);
INSERT INTO public.students VALUES (67, 'Павлова Анна Олеговна', 14, '2012-02-11', 'Ж', 'Павлова Андрей Павлович', '+7-975-944-10-94', NULL);
INSERT INTO public.students VALUES (68, 'Алексеева Анна Ивановна', 14, '2012-09-12', 'Ж', 'Алексеева Анастасия Олеговна', '+7-916-308-44-80', NULL);
INSERT INTO public.students VALUES (69, 'Новиков Егор Олегович', 14, '2012-02-01', 'М', 'Новикова Алиса Ивановна', '+7-930-418-80-11', NULL);
INSERT INTO public.students VALUES (70, 'Сидорова Виктория Дмитриевна', 14, '2012-08-04', 'Ж', 'Сидорова София Олеговна', '+7-947-621-44-63', NULL);
INSERT INTO public.students VALUES (71, 'Семёнова Виктория Олеговна', 14, '2012-09-05', 'Ж', 'Семёнова Николай Викторович', '+7-927-984-18-45', NULL);
INSERT INTO public.students VALUES (72, 'Фёдорова Ксения Андреевна', 14, '2012-01-10', 'Ж', 'Фёдорова Алиса Олеговна', '+7-929-557-78-71', NULL);
INSERT INTO public.students VALUES (73, 'Павлова Ксения Павловна', 15, '2011-08-11', 'Ж', 'Павлова Ева Ивановна', '+7-983-492-39-62', NULL);
INSERT INTO public.students VALUES (74, 'Фёдоров Тимофей Олегович', 15, '2011-12-26', 'М', 'Фёдоров Дмитрий Олегович', '+7-914-229-74-85', NULL);
INSERT INTO public.students VALUES (75, 'Кузнецова Анастасия Дмитриевна', 15, '2011-09-15', 'Ж', 'Кузнецова Дмитрий Павлович', '+7-993-258-19-70', NULL);
INSERT INTO public.students VALUES (76, 'Фёдорова Алиса Павловна', 15, '2011-11-03', 'Ж', 'Фёдорова Варвара Викторовна', '+7-958-424-90-72', NULL);
INSERT INTO public.students VALUES (77, 'Степанов Дмитрий Иванович', 15, '2011-11-22', 'М', 'Степанова Виктория Дмитриевна', '+7-965-200-91-22', NULL);
INSERT INTO public.students VALUES (78, 'Новиков Александр Александрович', 16, '2010-06-26', 'М', 'Новиков Олег Михайлович', '+7-965-249-41-77', NULL);
INSERT INTO public.students VALUES (79, 'Козлова Варвара Сергеевна', 16, '2010-03-06', 'Ж', 'Козлова Павел Иванович', '+7-973-697-28-39', NULL);
INSERT INTO public.students VALUES (80, 'Михайлова Анастасия Андреевна', 16, '2010-11-01', 'Ж', 'Михайлова Анастасия Андреевна', '+7-996-659-30-19', NULL);
INSERT INTO public.students VALUES (81, 'Морозова Алиса Андреевна', 16, '2010-11-14', 'Ж', 'Морозова Анастасия Андреевна', '+7-935-493-71-23', NULL);
INSERT INTO public.students VALUES (82, 'Волков Андрей Михайлович', 16, '2010-10-10', 'М', 'Волкова Полина Александровна', '+7-994-505-45-11', NULL);
INSERT INTO public.students VALUES (83, 'Степанов Тимофей Олегович', 17, '2009-05-25', 'М', 'Степанова Алиса Михайловна', '+7-938-751-34-89', NULL);
INSERT INTO public.students VALUES (84, 'Смирнова Варвара Дмитриевна', 17, '2009-11-21', 'Ж', 'Смирнова Виктор Александрович', '+7-984-473-26-21', NULL);
INSERT INTO public.students VALUES (85, 'Фёдорова Ева Павловна', 17, '2009-03-07', 'Ж', 'Фёдорова Игорь Михайлович', '+7-977-613-44-31', NULL);
INSERT INTO public.students VALUES (86, 'Семёнова Полина Михайловна', 17, '2009-02-15', 'Ж', 'Семёнова София Ивановна', '+7-996-841-96-60', NULL);
INSERT INTO public.students VALUES (87, 'Сидорова Елизавета Александровна', 17, '2009-05-18', 'Ж', 'Сидорова Олег Андреевич', '+7-984-490-91-57', NULL);
INSERT INTO public.students VALUES (88, 'Соколов Егор Александрович', 17, '2009-10-18', 'М', 'Соколов Николай Иванович', '+7-992-164-91-69', NULL);
INSERT INTO public.students VALUES (89, 'Алексеева Мария Сергеевна', 18, '2009-01-02', 'Ж', 'Алексеева Виктор Дмитриевич', '+7-922-340-78-27', NULL);
INSERT INTO public.students VALUES (90, 'Лебедева Дарья Викторовна', 18, '2009-07-19', 'Ж', 'Лебедева София Павловна', '+7-993-201-72-88', NULL);
INSERT INTO public.students VALUES (91, 'Михайлова Анна Михайловна', 18, '2009-04-15', 'Ж', 'Михайлова Алексей Михайлович', '+7-922-802-57-79', NULL);
INSERT INTO public.students VALUES (92, 'Петрова Елизавета Андреевна', 18, '2009-04-04', 'Ж', 'Петрова Анастасия Дмитриевна', '+7-994-317-92-91', NULL);
INSERT INTO public.students VALUES (93, 'Петров Никита Иванович', 18, '2009-03-26', 'М', 'Петрова Мария Викторовна', '+7-936-700-37-39', NULL);
INSERT INTO public.students VALUES (94, 'Смирнова Алиса Александровна', 18, '2009-05-28', 'Ж', 'Смирнова София Викторовна', '+7-942-917-32-24', NULL);


--
-- Data for Name: marks; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.marks VALUES (1, 2, 17, 2, 4, '2025-12-17');
INSERT INTO public.marks VALUES (2, 3, 11, 2, 5, '2025-11-18');
INSERT INTO public.marks VALUES (4, 3, 9, 3, 3, '2025-11-25');
INSERT INTO public.marks VALUES (5, 4, 7, 4, 4, '2025-12-12');
INSERT INTO public.marks VALUES (6, 4, 18, 3, 4, '2025-09-19');
INSERT INTO public.marks VALUES (7, 5, 13, 4, 4, '2025-10-10');
INSERT INTO public.marks VALUES (8, 5, 2, 3, 2, '2025-11-15');
INSERT INTO public.marks VALUES (9, 5, 9, 4, 3, '2025-10-27');
INSERT INTO public.marks VALUES (10, 5, 18, 3, 4, '2025-10-04');
INSERT INTO public.marks VALUES (11, 6, 19, 2, 3, '2025-09-22');
INSERT INTO public.marks VALUES (12, 6, 17, 2, 3, '2025-09-04');
INSERT INTO public.marks VALUES (13, 6, 14, 3, 5, '2025-09-22');
INSERT INTO public.marks VALUES (14, 6, 5, 1, 3, '2025-12-21');
INSERT INTO public.marks VALUES (15, 7, 16, 2, 4, '2025-11-10');
INSERT INTO public.marks VALUES (16, 7, 2, 1, 3, '2025-09-06');
INSERT INTO public.marks VALUES (17, 7, 14, 2, 2, '2025-12-26');
INSERT INTO public.marks VALUES (18, 8, 6, 3, 2, '2025-09-10');
INSERT INTO public.marks VALUES (19, 8, 19, 1, 4, '2025-11-15');
INSERT INTO public.marks VALUES (20, 8, 18, 4, 3, '2025-12-09');
INSERT INTO public.marks VALUES (21, 9, 4, 3, 3, '2025-12-21');
INSERT INTO public.marks VALUES (22, 10, 6, 1, 4, '2025-11-19');
INSERT INTO public.marks VALUES (23, 10, 7, 2, 5, '2025-12-17');
INSERT INTO public.marks VALUES (24, 11, 3, 4, 2, '2025-10-05');
INSERT INTO public.marks VALUES (25, 11, 16, 3, 3, '2025-09-09');
INSERT INTO public.marks VALUES (26, 12, 8, 4, 4, '2025-11-10');
INSERT INTO public.marks VALUES (27, 12, 19, 1, 4, '2025-11-23');
INSERT INTO public.marks VALUES (28, 12, 8, 1, 2, '2025-12-10');
INSERT INTO public.marks VALUES (29, 13, 13, 3, 2, '2025-11-12');
INSERT INTO public.marks VALUES (30, 14, 8, 2, 3, '2025-12-05');
INSERT INTO public.marks VALUES (31, 14, 15, 3, 5, '2025-12-25');
INSERT INTO public.marks VALUES (32, 14, 18, 2, 3, '2025-09-17');
INSERT INTO public.marks VALUES (33, 14, 15, 3, 2, '2025-09-02');
INSERT INTO public.marks VALUES (34, 15, 17, 2, 3, '2025-10-11');
INSERT INTO public.marks VALUES (35, 15, 17, 4, 2, '2025-10-23');
INSERT INTO public.marks VALUES (36, 15, 19, 4, 2, '2025-12-26');
INSERT INTO public.marks VALUES (37, 15, 2, 4, 3, '2025-12-15');
INSERT INTO public.marks VALUES (38, 16, 2, 4, 4, '2025-09-13');
INSERT INTO public.marks VALUES (39, 16, 9, 1, 3, '2025-09-02');
INSERT INTO public.marks VALUES (40, 16, 14, 3, 2, '2025-09-03');
INSERT INTO public.marks VALUES (41, 16, 16, 1, 4, '2025-12-06');
INSERT INTO public.marks VALUES (42, 17, 14, 3, 5, '2025-12-28');
INSERT INTO public.marks VALUES (43, 18, 13, 1, 3, '2025-11-04');
INSERT INTO public.marks VALUES (44, 18, 6, 4, 3, '2025-10-27');
INSERT INTO public.marks VALUES (45, 18, 1, 1, 4, '2025-12-22');
INSERT INTO public.marks VALUES (46, 19, 14, 4, 3, '2025-10-15');
INSERT INTO public.marks VALUES (48, 19, 4, 1, 5, '2025-09-08');
INSERT INTO public.marks VALUES (49, 19, 7, 1, 2, '2025-09-15');
INSERT INTO public.marks VALUES (50, 20, 2, 2, 2, '2025-12-15');
INSERT INTO public.marks VALUES (51, 20, 8, 2, 2, '2025-10-17');
INSERT INTO public.marks VALUES (52, 20, 10, 2, 4, '2025-11-08');
INSERT INTO public.marks VALUES (53, 20, 10, 2, 3, '2025-12-10');
INSERT INTO public.marks VALUES (54, 21, 2, 2, 5, '2025-12-02');
INSERT INTO public.marks VALUES (56, 22, 10, 4, 3, '2025-12-08');
INSERT INTO public.marks VALUES (57, 23, 10, 2, 5, '2025-09-18');
INSERT INTO public.marks VALUES (58, 24, 14, 2, 5, '2025-10-09');
INSERT INTO public.marks VALUES (59, 24, 7, 3, 2, '2025-12-28');
INSERT INTO public.marks VALUES (61, 25, 20, 1, 2, '2025-10-26');
INSERT INTO public.marks VALUES (62, 25, 19, 2, 5, '2025-10-28');
INSERT INTO public.marks VALUES (63, 25, 11, 3, 2, '2025-10-07');
INSERT INTO public.marks VALUES (64, 27, 8, 2, 5, '2025-10-18');
INSERT INTO public.marks VALUES (65, 27, 11, 3, 5, '2025-12-18');
INSERT INTO public.marks VALUES (67, 28, 15, 1, 5, '2025-11-07');
INSERT INTO public.marks VALUES (69, 28, 8, 2, 2, '2025-11-18');
INSERT INTO public.marks VALUES (70, 29, 19, 4, 4, '2025-10-07');
INSERT INTO public.marks VALUES (71, 29, 11, 2, 5, '2025-10-16');
INSERT INTO public.marks VALUES (72, 29, 18, 3, 4, '2025-12-24');
INSERT INTO public.marks VALUES (73, 29, 16, 4, 3, '2025-11-06');
INSERT INTO public.marks VALUES (74, 30, 18, 4, 3, '2025-09-17');
INSERT INTO public.marks VALUES (75, 35, 5, 2, 2, '2025-10-01');
INSERT INTO public.marks VALUES (76, 35, 7, 4, 4, '2025-09-20');
INSERT INTO public.marks VALUES (77, 35, 20, 4, 5, '2025-09-01');
INSERT INTO public.marks VALUES (78, 36, 18, 4, 2, '2025-09-17');
INSERT INTO public.marks VALUES (79, 36, 9, 3, 2, '2025-12-26');
INSERT INTO public.marks VALUES (80, 36, 6, 1, 2, '2025-10-08');
INSERT INTO public.marks VALUES (81, 36, 7, 3, 4, '2025-11-26');
INSERT INTO public.marks VALUES (82, 37, 3, 3, 5, '2025-12-19');
INSERT INTO public.marks VALUES (83, 37, 8, 2, 4, '2025-09-21');
INSERT INTO public.marks VALUES (84, 37, 2, 1, 5, '2025-12-13');
INSERT INTO public.marks VALUES (85, 38, 16, 1, 2, '2025-10-03');
INSERT INTO public.marks VALUES (86, 38, 16, 4, 4, '2025-09-17');
INSERT INTO public.marks VALUES (87, 38, 2, 2, 3, '2025-12-09');
INSERT INTO public.marks VALUES (88, 38, 2, 1, 4, '2025-09-06');
INSERT INTO public.marks VALUES (89, 39, 1, 2, 3, '2025-12-03');
INSERT INTO public.marks VALUES (90, 39, 10, 2, 3, '2025-12-22');
INSERT INTO public.marks VALUES (91, 40, 11, 4, 3, '2025-09-17');
INSERT INTO public.marks VALUES (93, 40, 3, 3, 5, '2025-11-01');
INSERT INTO public.marks VALUES (94, 40, 9, 4, 5, '2025-10-12');
INSERT INTO public.marks VALUES (95, 41, 13, 4, 3, '2025-12-03');
INSERT INTO public.marks VALUES (96, 41, 20, 3, 3, '2025-09-03');
INSERT INTO public.marks VALUES (97, 41, 9, 2, 5, '2025-10-24');
INSERT INTO public.marks VALUES (98, 41, 13, 3, 4, '2025-09-03');
INSERT INTO public.marks VALUES (99, 43, 15, 3, 4, '2025-09-05');
INSERT INTO public.marks VALUES (100, 43, 3, 2, 5, '2025-12-18');
INSERT INTO public.marks VALUES (101, 44, 17, 4, 2, '2025-09-03');
INSERT INTO public.marks VALUES (103, 44, 10, 4, 5, '2025-09-24');
INSERT INTO public.marks VALUES (104, 44, 18, 2, 3, '2025-12-06');
INSERT INTO public.marks VALUES (105, 45, 9, 3, 4, '2025-12-05');
INSERT INTO public.marks VALUES (106, 47, 14, 3, 5, '2025-11-16');
INSERT INTO public.marks VALUES (107, 49, 9, 2, 5, '2025-10-15');
INSERT INTO public.marks VALUES (108, 49, 4, 2, 4, '2025-09-13');
INSERT INTO public.marks VALUES (109, 50, 20, 4, 4, '2025-12-11');
INSERT INTO public.marks VALUES (110, 50, 14, 2, 4, '2025-11-20');
INSERT INTO public.marks VALUES (111, 51, 16, 3, 3, '2025-12-11');
INSERT INTO public.marks VALUES (112, 52, 16, 2, 4, '2025-12-09');
INSERT INTO public.marks VALUES (113, 52, 13, 3, 2, '2025-10-19');
INSERT INTO public.marks VALUES (114, 53, 6, 1, 5, '2025-10-15');
INSERT INTO public.marks VALUES (115, 53, 10, 1, 5, '2025-12-05');
INSERT INTO public.marks VALUES (116, 53, 10, 2, 4, '2025-10-23');
INSERT INTO public.marks VALUES (117, 53, 14, 4, 2, '2025-12-20');
INSERT INTO public.marks VALUES (118, 54, 19, 4, 5, '2025-09-26');
INSERT INTO public.marks VALUES (121, 55, 14, 1, 2, '2025-09-09');
INSERT INTO public.marks VALUES (122, 55, 8, 2, 5, '2025-11-13');
INSERT INTO public.marks VALUES (123, 56, 19, 2, 4, '2025-09-16');
INSERT INTO public.marks VALUES (124, 56, 4, 3, 5, '2025-09-04');
INSERT INTO public.marks VALUES (125, 56, 5, 3, 4, '2025-11-15');
INSERT INTO public.marks VALUES (126, 57, 17, 4, 4, '2025-12-04');
INSERT INTO public.marks VALUES (127, 58, 15, 3, 2, '2025-11-02');
INSERT INTO public.marks VALUES (128, 58, 4, 1, 4, '2025-09-22');
INSERT INTO public.marks VALUES (129, 58, 6, 2, 3, '2025-10-11');
INSERT INTO public.marks VALUES (130, 59, 14, 4, 3, '2025-12-21');
INSERT INTO public.marks VALUES (131, 59, 6, 2, 5, '2025-12-01');
INSERT INTO public.marks VALUES (132, 59, 20, 2, 5, '2025-12-13');
INSERT INTO public.marks VALUES (133, 59, 1, 2, 3, '2025-11-25');
INSERT INTO public.marks VALUES (134, 61, 4, 2, 4, '2025-11-07');
INSERT INTO public.marks VALUES (135, 61, 15, 1, 4, '2025-12-17');
INSERT INTO public.marks VALUES (136, 61, 11, 4, 5, '2025-09-12');
INSERT INTO public.marks VALUES (138, 62, 3, 2, 4, '2025-09-08');
INSERT INTO public.marks VALUES (139, 62, 10, 1, 3, '2025-11-23');
INSERT INTO public.marks VALUES (140, 62, 5, 4, 5, '2025-10-19');
INSERT INTO public.marks VALUES (141, 62, 13, 4, 3, '2025-12-21');
INSERT INTO public.marks VALUES (142, 63, 6, 2, 5, '2025-11-05');
INSERT INTO public.marks VALUES (143, 63, 6, 3, 5, '2025-09-28');
INSERT INTO public.marks VALUES (145, 63, 13, 4, 5, '2025-12-14');
INSERT INTO public.marks VALUES (146, 64, 16, 2, 2, '2025-09-26');
INSERT INTO public.marks VALUES (147, 64, 8, 3, 2, '2025-11-08');
INSERT INTO public.marks VALUES (148, 64, 18, 3, 3, '2025-12-19');
INSERT INTO public.marks VALUES (149, 65, 18, 1, 2, '2025-11-25');
INSERT INTO public.marks VALUES (150, 65, 18, 3, 2, '2025-12-18');
INSERT INTO public.marks VALUES (151, 65, 7, 4, 2, '2025-10-10');
INSERT INTO public.marks VALUES (152, 67, 9, 3, 2, '2025-12-28');
INSERT INTO public.marks VALUES (153, 67, 4, 2, 3, '2025-11-28');
INSERT INTO public.marks VALUES (154, 67, 20, 4, 3, '2025-10-26');
INSERT INTO public.marks VALUES (155, 68, 7, 1, 4, '2025-11-20');
INSERT INTO public.marks VALUES (156, 69, 6, 3, 4, '2025-11-19');
INSERT INTO public.marks VALUES (157, 69, 9, 1, 3, '2025-12-02');
INSERT INTO public.marks VALUES (158, 69, 9, 2, 3, '2025-10-05');
INSERT INTO public.marks VALUES (159, 69, 11, 2, 5, '2025-12-05');
INSERT INTO public.marks VALUES (160, 70, 9, 4, 5, '2025-12-03');
INSERT INTO public.marks VALUES (161, 70, 3, 4, 4, '2025-11-15');
INSERT INTO public.marks VALUES (162, 70, 16, 3, 2, '2025-09-24');
INSERT INTO public.marks VALUES (163, 70, 15, 3, 2, '2025-12-07');
INSERT INTO public.marks VALUES (164, 71, 7, 4, 4, '2025-11-27');
INSERT INTO public.marks VALUES (165, 71, 10, 3, 3, '2025-12-26');
INSERT INTO public.marks VALUES (166, 71, 11, 1, 2, '2025-09-21');
INSERT INTO public.marks VALUES (167, 72, 1, 1, 3, '2025-12-15');
INSERT INTO public.marks VALUES (168, 72, 1, 4, 3, '2025-10-21');
INSERT INTO public.marks VALUES (169, 72, 10, 2, 4, '2025-09-21');
INSERT INTO public.marks VALUES (170, 73, 9, 1, 4, '2025-10-02');
INSERT INTO public.marks VALUES (171, 73, 13, 3, 3, '2025-12-21');
INSERT INTO public.marks VALUES (172, 77, 16, 1, 3, '2025-10-17');
INSERT INTO public.marks VALUES (173, 78, 1, 1, 4, '2025-09-28');
INSERT INTO public.marks VALUES (174, 78, 14, 2, 5, '2025-09-08');
INSERT INTO public.marks VALUES (175, 78, 13, 1, 2, '2025-09-11');
INSERT INTO public.marks VALUES (176, 79, 10, 2, 5, '2025-10-21');
INSERT INTO public.marks VALUES (177, 79, 5, 1, 2, '2025-10-15');
INSERT INTO public.marks VALUES (178, 80, 7, 2, 5, '2025-12-28');
INSERT INTO public.marks VALUES (179, 80, 7, 1, 2, '2025-10-25');
INSERT INTO public.marks VALUES (180, 82, 13, 3, 5, '2025-11-26');
INSERT INTO public.marks VALUES (181, 82, 5, 2, 4, '2025-09-08');
INSERT INTO public.marks VALUES (182, 82, 18, 3, 2, '2025-11-07');
INSERT INTO public.marks VALUES (183, 82, 17, 2, 5, '2025-11-21');
INSERT INTO public.marks VALUES (184, 84, 16, 4, 2, '2025-10-16');
INSERT INTO public.marks VALUES (185, 85, 3, 1, 4, '2025-11-05');
INSERT INTO public.marks VALUES (186, 85, 13, 4, 4, '2025-10-25');
INSERT INTO public.marks VALUES (187, 85, 16, 1, 2, '2025-09-01');
INSERT INTO public.marks VALUES (188, 85, 9, 2, 2, '2025-09-26');
INSERT INTO public.marks VALUES (189, 86, 17, 3, 5, '2025-12-23');
INSERT INTO public.marks VALUES (190, 86, 13, 1, 3, '2025-11-03');
INSERT INTO public.marks VALUES (191, 86, 10, 1, 3, '2025-10-18');
INSERT INTO public.marks VALUES (192, 87, 13, 1, 4, '2025-12-24');
INSERT INTO public.marks VALUES (193, 87, 8, 1, 3, '2025-09-14');
INSERT INTO public.marks VALUES (194, 89, 20, 1, 4, '2025-10-04');
INSERT INTO public.marks VALUES (195, 89, 1, 2, 2, '2025-10-16');
INSERT INTO public.marks VALUES (197, 90, 4, 1, 4, '2025-12-09');
INSERT INTO public.marks VALUES (198, 90, 17, 1, 4, '2025-09-16');
INSERT INTO public.marks VALUES (199, 91, 17, 3, 2, '2025-12-28');
INSERT INTO public.marks VALUES (200, 91, 19, 2, 4, '2025-10-09');
INSERT INTO public.marks VALUES (201, 91, 4, 1, 3, '2025-09-02');
INSERT INTO public.marks VALUES (202, 93, 2, 4, 4, '2025-12-05');
INSERT INTO public.marks VALUES (203, 94, 2, 4, 3, '2025-11-08');
INSERT INTO public.marks VALUES (3, 3, 3, 3, 5, '2025-10-08');
INSERT INTO public.marks VALUES (47, 19, 3, 2, 4, '2025-10-24');
INSERT INTO public.marks VALUES (55, 21, 3, 4, 4, '2025-12-14');
INSERT INTO public.marks VALUES (60, 24, 3, 1, 3, '2025-09-09');
INSERT INTO public.marks VALUES (66, 27, 3, 3, 4, '2025-11-17');
INSERT INTO public.marks VALUES (68, 28, 3, 3, 5, '2025-09-19');
INSERT INTO public.marks VALUES (92, 40, 3, 1, 2, '2025-12-08');
INSERT INTO public.marks VALUES (102, 44, 3, 1, 4, '2025-12-01');
INSERT INTO public.marks VALUES (119, 54, 3, 1, 2, '2025-10-22');
INSERT INTO public.marks VALUES (120, 54, 3, 2, 2, '2025-12-25');
INSERT INTO public.marks VALUES (137, 61, 3, 4, 3, '2025-11-20');
INSERT INTO public.marks VALUES (144, 63, 3, 1, 5, '2025-10-07');
INSERT INTO public.marks VALUES (196, 89, 3, 3, 3, '2025-11-05');


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.schedule VALUES (1, '1_1', 'Понедельник', 1, 'Математика', '201', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (2, '1_1', 'Понедельник', 2, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (3, '1_1', 'Понедельник', 3, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (4, '1_1', 'Понедельник', 4, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (5, '1_1', 'Вторник', 1, 'Математика', '201', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (6, '1_1', 'Вторник', 2, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (7, '1_1', 'Вторник', 3, 'Чтение', '206', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (8, '1_1', 'Вторник', 4, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (9, '1_1', 'Среда', 1, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (10, '1_1', 'Среда', 2, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (11, '1_1', 'Среда', 3, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (12, '1_1', 'Среда', 4, 'Английский язык', '208', 'Сидорова М.А.');
INSERT INTO public.schedule VALUES (13, '1_1', 'Четверг', 1, 'Математика', '201', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (14, '1_1', 'Четверг', 2, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (15, '1_1', 'Четверг', 3, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (16, '1_1', 'Четверг', 4, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (17, '1_1', 'Пятница', 1, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (18, '1_1', 'Пятница', 2, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (19, '1_1', 'Пятница', 3, 'Математика', '201', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (20, '1_1', 'Пятница', 4, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (21, '1_2', 'Понедельник', 1, 'Русский язык', '204', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (22, '1_2', 'Понедельник', 2, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (23, '1_2', 'Понедельник', 3, 'Английский язык', '208', 'Лебедева О.И.');
INSERT INTO public.schedule VALUES (24, '1_2', 'Понедельник', 4, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (25, '1_2', 'Вторник', 1, 'Русский язык', '204', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (26, '1_2', 'Вторник', 2, 'Английский язык', '208', 'Лебедева О.И.');
INSERT INTO public.schedule VALUES (27, '1_2', 'Вторник', 3, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (28, '1_2', 'Вторник', 4, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (29, '1_2', 'Среда', 1, 'Физкультура', 'спортзал', 'Новиков А.М.');
INSERT INTO public.schedule VALUES (30, '1_2', 'Среда', 2, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (31, '1_2', 'Среда', 3, 'Чтение', '206', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (32, '1_2', 'Среда', 4, 'Окружающий мир', '207', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (33, '1_2', 'Четверг', 1, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (34, '1_2', 'Четверг', 2, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (35, '1_2', 'Четверг', 3, 'Математика', '201', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (36, '1_2', 'Четверг', 4, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (37, '1_2', 'Пятница', 1, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (38, '1_2', 'Пятница', 2, 'Окружающий мир', '207', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (39, '1_2', 'Пятница', 3, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (40, '1_2', 'Пятница', 4, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (41, '2_1', 'Понедельник', 1, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (42, '2_1', 'Понедельник', 2, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (43, '2_1', 'Понедельник', 3, 'Чтение', '206', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (44, '2_1', 'Понедельник', 4, 'Окружающий мир', '207', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (45, '2_1', 'Вторник', 1, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (46, '2_1', 'Вторник', 2, 'Чтение', '206', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (47, '2_1', 'Вторник', 3, 'Русский язык', '204', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (48, '2_1', 'Вторник', 4, 'Английский язык', '208', 'Лебедева О.И.');
INSERT INTO public.schedule VALUES (49, '2_1', 'Среда', 1, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (50, '2_1', 'Среда', 2, 'Английский язык', '208', 'Лебедева О.И.');
INSERT INTO public.schedule VALUES (51, '2_1', 'Среда', 3, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (52, '2_1', 'Среда', 4, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (53, '2_1', 'Четверг', 1, 'Математика', '201', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (54, '2_1', 'Четверг', 2, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (55, '2_1', 'Четверг', 3, 'Окружающий мир', '207', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (56, '2_1', 'Четверг', 4, 'Русский язык', '204', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (57, '2_1', 'Пятница', 1, 'Чтение', '206', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (58, '2_1', 'Пятница', 2, 'Русский язык', '204', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (59, '2_1', 'Пятница', 3, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (60, '2_1', 'Пятница', 4, 'Математика', '201', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (61, '2_2', 'Понедельник', 1, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (62, '2_2', 'Понедельник', 2, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (63, '2_2', 'Понедельник', 3, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (64, '2_2', 'Понедельник', 4, 'Окружающий мир', '207', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (65, '2_2', 'Вторник', 1, 'Русский язык', '204', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (66, '2_2', 'Вторник', 2, 'Окружающий мир', '207', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (67, '2_2', 'Вторник', 3, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (68, '2_2', 'Вторник', 4, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (69, '2_2', 'Среда', 1, 'Английский язык', '208', 'Лебедева О.И.');
INSERT INTO public.schedule VALUES (70, '2_2', 'Среда', 2, 'Физкультура', 'спортзал', 'Новиков А.М.');
INSERT INTO public.schedule VALUES (71, '2_2', 'Среда', 3, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (72, '2_2', 'Среда', 4, 'Окружающий мир', '207', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (73, '2_2', 'Четверг', 1, 'Окружающий мир', '207', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (74, '2_2', 'Четверг', 2, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (75, '2_2', 'Четверг', 3, 'Математика', '201', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (76, '2_2', 'Четверг', 4, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (77, '2_2', 'Пятница', 1, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (78, '2_2', 'Пятница', 2, 'Математика', '201', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (79, '2_2', 'Пятница', 3, 'Английский язык', '208', 'Сидорова М.А.');
INSERT INTO public.schedule VALUES (80, '2_2', 'Пятница', 4, 'Русский язык', '204', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (81, '3_1', 'Понедельник', 1, 'Английский язык', '208', 'Сидорова М.А.');
INSERT INTO public.schedule VALUES (82, '3_1', 'Понедельник', 2, 'Чтение', '206', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (83, '3_1', 'Понедельник', 3, 'Окружающий мир', '207', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (84, '3_1', 'Понедельник', 4, 'Математика', '201', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (85, '3_1', 'Вторник', 1, 'Физкультура', 'спортзал', 'Новиков А.М.');
INSERT INTO public.schedule VALUES (86, '3_1', 'Вторник', 2, 'Чтение', '206', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (87, '3_1', 'Вторник', 3, 'Английский язык', '208', 'Сидорова М.А.');
INSERT INTO public.schedule VALUES (88, '3_1', 'Вторник', 4, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (89, '3_1', 'Среда', 1, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (90, '3_1', 'Среда', 2, 'Математика', '201', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (91, '3_1', 'Среда', 3, 'Чтение', '206', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (92, '3_1', 'Среда', 4, 'Окружающий мир', '207', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (93, '3_1', 'Четверг', 1, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (94, '3_1', 'Четверг', 2, 'Физкультура', 'спортзал', 'Новиков А.М.');
INSERT INTO public.schedule VALUES (95, '3_1', 'Четверг', 3, 'Математика', '201', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (96, '3_1', 'Четверг', 4, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (97, '3_1', 'Пятница', 1, 'Чтение', '206', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (98, '3_1', 'Пятница', 2, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (99, '3_1', 'Пятница', 3, 'Английский язык', '208', 'Сидорова М.А.');
INSERT INTO public.schedule VALUES (100, '3_1', 'Пятница', 4, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (101, '4_1', 'Понедельник', 1, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (102, '4_1', 'Понедельник', 2, 'Физкультура', 'спортзал', 'Новиков А.М.');
INSERT INTO public.schedule VALUES (103, '4_1', 'Понедельник', 3, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (104, '4_1', 'Понедельник', 4, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (105, '4_1', 'Вторник', 1, 'Чтение', '206', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (106, '4_1', 'Вторник', 2, 'Русский язык', '204', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (107, '4_1', 'Вторник', 3, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (108, '4_1', 'Вторник', 4, 'Английский язык', '208', 'Сидорова М.А.');
INSERT INTO public.schedule VALUES (109, '4_1', 'Среда', 1, 'Окружающий мир', '207', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (110, '4_1', 'Среда', 2, 'Чтение', '206', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (111, '4_1', 'Среда', 3, 'Русский язык', '204', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (112, '4_1', 'Среда', 4, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (113, '4_1', 'Четверг', 1, 'Русский язык', '204', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (114, '4_1', 'Четверг', 2, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (115, '4_1', 'Четверг', 3, 'Физкультура', 'спортзал', 'Новиков А.М.');
INSERT INTO public.schedule VALUES (116, '4_1', 'Четверг', 4, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (117, '4_1', 'Пятница', 1, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (118, '4_1', 'Пятница', 2, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (119, '4_1', 'Пятница', 3, 'Окружающий мир', '207', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (120, '4_1', 'Пятница', 4, 'Физкультура', 'спортзал', 'Новиков А.М.');
INSERT INTO public.schedule VALUES (121, '4_2', 'Понедельник', 1, 'Английский язык', '208', 'Сидорова М.А.');
INSERT INTO public.schedule VALUES (122, '4_2', 'Понедельник', 2, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (123, '4_2', 'Понедельник', 3, 'Чтение', '206', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (124, '4_2', 'Понедельник', 4, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (125, '4_2', 'Вторник', 1, 'Математика', '201', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (126, '4_2', 'Вторник', 2, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (127, '4_2', 'Вторник', 3, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (128, '4_2', 'Вторник', 4, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (129, '4_2', 'Среда', 1, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (130, '4_2', 'Среда', 2, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (131, '4_2', 'Среда', 3, 'Чтение', '206', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (132, '4_2', 'Среда', 4, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (133, '4_2', 'Четверг', 1, 'Математика', '201', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (134, '4_2', 'Четверг', 2, 'Чтение', '206', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (135, '4_2', 'Четверг', 3, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (136, '4_2', 'Четверг', 4, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (137, '4_2', 'Пятница', 1, 'Математика', '201', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (138, '4_2', 'Пятница', 2, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (139, '4_2', 'Пятница', 3, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (140, '4_2', 'Пятница', 4, 'Окружающий мир', '207', 'Петрова А.Б.');
INSERT INTO public.schedule VALUES (141, '5_1', 'Понедельник', 1, 'Физика', '213', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (142, '5_1', 'Понедельник', 2, 'Физкультура', 'спортзал', 'Новиков А.М.');
INSERT INTO public.schedule VALUES (143, '5_1', 'Понедельник', 3, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (144, '5_1', 'Понедельник', 4, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (145, '5_1', 'Понедельник', 5, 'Литература', '205', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (146, '5_1', 'Вторник', 1, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (147, '5_1', 'Вторник', 2, 'Химия', '214', 'Морозов С.П.');
INSERT INTO public.schedule VALUES (148, '5_1', 'Вторник', 3, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (149, '5_1', 'Вторник', 4, 'Обществознание', '210', 'Николаева М.П.');
INSERT INTO public.schedule VALUES (150, '5_1', 'Вторник', 5, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (151, '5_1', 'Среда', 1, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (152, '5_1', 'Среда', 2, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (153, '5_1', 'Среда', 3, 'Физика', '213', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (154, '5_1', 'Среда', 4, 'Английский язык', '208', 'Лебедева О.И.');
INSERT INTO public.schedule VALUES (155, '5_1', 'Среда', 5, 'Физкультура', 'спортзал', 'Новиков А.М.');
INSERT INTO public.schedule VALUES (156, '5_1', 'Четверг', 1, 'Английский язык', '208', 'Сидорова М.А.');
INSERT INTO public.schedule VALUES (157, '5_1', 'Четверг', 2, 'Физкультура', 'спортзал', 'Новиков А.М.');
INSERT INTO public.schedule VALUES (158, '5_1', 'Четверг', 3, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (159, '5_1', 'Четверг', 4, 'Обществознание', '210', 'Николаева М.П.');
INSERT INTO public.schedule VALUES (160, '5_1', 'Четверг', 5, 'История', '209', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (161, '5_1', 'Пятница', 1, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (162, '5_1', 'Пятница', 2, 'География', '211', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (163, '5_1', 'Пятница', 3, 'Алгебра', '202', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (164, '5_1', 'Пятница', 4, 'История', '209', 'Николаева М.П.');
INSERT INTO public.schedule VALUES (165, '5_1', 'Пятница', 5, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (166, '5_2', 'Понедельник', 1, 'Химия', '214', 'Морозов С.П.');
INSERT INTO public.schedule VALUES (167, '5_2', 'Понедельник', 2, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (168, '5_2', 'Понедельник', 3, 'Алгебра', '202', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (169, '5_2', 'Понедельник', 4, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (170, '5_2', 'Понедельник', 5, 'Физкультура', 'спортзал', 'Новиков А.М.');
INSERT INTO public.schedule VALUES (171, '5_2', 'Вторник', 1, 'Литература', '205', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (172, '5_2', 'Вторник', 2, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (173, '5_2', 'Вторник', 3, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (174, '5_2', 'Вторник', 4, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (175, '5_2', 'Вторник', 5, 'Английский язык', '208', 'Сидорова М.А.');
INSERT INTO public.schedule VALUES (176, '5_2', 'Среда', 1, 'Физика', '213', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (177, '5_2', 'Среда', 2, 'Обществознание', '210', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (178, '5_2', 'Среда', 3, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (179, '5_2', 'Среда', 4, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (180, '5_2', 'Среда', 5, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (181, '5_2', 'Четверг', 1, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (182, '5_2', 'Четверг', 2, 'История', '209', 'Николаева М.П.');
INSERT INTO public.schedule VALUES (183, '5_2', 'Четверг', 3, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (184, '5_2', 'Четверг', 4, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (185, '5_2', 'Четверг', 5, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (186, '5_2', 'Пятница', 1, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (187, '5_2', 'Пятница', 2, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (188, '5_2', 'Пятница', 3, 'Литература', '205', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (189, '5_2', 'Пятница', 4, 'Обществознание', '210', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (190, '5_2', 'Пятница', 5, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (191, '6_1', 'Понедельник', 1, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (192, '6_1', 'Понедельник', 2, 'География', '211', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (193, '6_1', 'Понедельник', 3, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (194, '6_1', 'Понедельник', 4, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (195, '6_1', 'Понедельник', 5, 'Литература', '205', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (196, '6_1', 'Вторник', 1, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (197, '6_1', 'Вторник', 2, 'География', '211', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (198, '6_1', 'Вторник', 3, 'Литература', '205', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (199, '6_1', 'Вторник', 4, 'Английский язык', '208', 'Сидорова М.А.');
INSERT INTO public.schedule VALUES (200, '6_1', 'Вторник', 5, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (201, '6_1', 'Среда', 1, 'Химия', '214', 'Морозов С.П.');
INSERT INTO public.schedule VALUES (202, '6_1', 'Среда', 2, 'Английский язык', '208', 'Сидорова М.А.');
INSERT INTO public.schedule VALUES (203, '6_1', 'Среда', 3, 'История', '209', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (204, '6_1', 'Среда', 4, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (205, '6_1', 'Среда', 5, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (206, '6_1', 'Четверг', 1, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (207, '6_1', 'Четверг', 2, 'Алгебра', '202', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (208, '6_1', 'Четверг', 3, 'История', '209', 'Николаева М.П.');
INSERT INTO public.schedule VALUES (209, '6_1', 'Четверг', 4, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (210, '6_1', 'Четверг', 5, 'Химия', '214', 'Морозов С.П.');
INSERT INTO public.schedule VALUES (211, '6_1', 'Пятница', 1, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (212, '6_1', 'Пятница', 2, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (213, '6_1', 'Пятница', 3, 'Литература', '205', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (214, '6_1', 'Пятница', 4, 'История', '209', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (215, '6_1', 'Пятница', 5, 'Физкультура', 'спортзал', 'Новиков А.М.');
INSERT INTO public.schedule VALUES (216, '6_2', 'Понедельник', 1, 'Алгебра', '202', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (217, '6_2', 'Понедельник', 2, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (218, '6_2', 'Понедельник', 3, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (219, '6_2', 'Понедельник', 4, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (220, '6_2', 'Понедельник', 5, 'История', '209', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (221, '6_2', 'Вторник', 1, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (222, '6_2', 'Вторник', 2, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (223, '6_2', 'Вторник', 3, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (224, '6_2', 'Вторник', 4, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (225, '6_2', 'Вторник', 5, 'Алгебра', '202', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (226, '6_2', 'Среда', 1, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (227, '6_2', 'Среда', 2, 'Литература', '205', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (228, '6_2', 'Среда', 3, 'Обществознание', '210', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (229, '6_2', 'Среда', 4, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (230, '6_2', 'Среда', 5, 'География', '211', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (231, '6_2', 'Четверг', 1, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (232, '6_2', 'Четверг', 2, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (233, '6_2', 'Четверг', 3, 'Алгебра', '202', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (234, '6_2', 'Четверг', 4, 'География', '211', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (235, '6_2', 'Четверг', 5, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (236, '6_2', 'Пятница', 1, 'Физкультура', 'спортзал', 'Новиков А.М.');
INSERT INTO public.schedule VALUES (237, '6_2', 'Пятница', 2, 'История', '209', 'Николаева М.П.');
INSERT INTO public.schedule VALUES (238, '6_2', 'Пятница', 3, 'Литература', '205', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (239, '6_2', 'Пятница', 4, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (240, '6_2', 'Пятница', 5, 'Обществознание', '210', 'Николаева М.П.');
INSERT INTO public.schedule VALUES (241, '7_1', 'Понедельник', 1, 'Обществознание', '210', 'Николаева М.П.');
INSERT INTO public.schedule VALUES (242, '7_1', 'Понедельник', 2, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (243, '7_1', 'Понедельник', 3, 'Физика', '213', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (244, '7_1', 'Понедельник', 4, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (245, '7_1', 'Понедельник', 5, 'Английский язык', '208', 'Сидорова М.А.');
INSERT INTO public.schedule VALUES (246, '7_1', 'Вторник', 1, 'Обществознание', '210', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (247, '7_1', 'Вторник', 2, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (248, '7_1', 'Вторник', 3, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (249, '7_1', 'Вторник', 4, 'Английский язык', '208', 'Сидорова М.А.');
INSERT INTO public.schedule VALUES (250, '7_1', 'Вторник', 5, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (251, '7_1', 'Среда', 1, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (252, '7_1', 'Среда', 2, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (253, '7_1', 'Среда', 3, 'История', '209', 'Николаева М.П.');
INSERT INTO public.schedule VALUES (254, '7_1', 'Среда', 4, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (255, '7_1', 'Среда', 5, 'Обществознание', '210', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (256, '7_1', 'Четверг', 1, 'Алгебра', '202', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (257, '7_1', 'Четверг', 2, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (258, '7_1', 'Четверг', 3, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (259, '7_1', 'Четверг', 4, 'Химия', '214', 'Морозов С.П.');
INSERT INTO public.schedule VALUES (260, '7_1', 'Четверг', 5, 'География', '211', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (261, '7_1', 'Пятница', 1, 'Алгебра', '202', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (262, '7_1', 'Пятница', 2, 'Химия', '214', 'Морозов С.П.');
INSERT INTO public.schedule VALUES (263, '7_1', 'Пятница', 3, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (264, '7_1', 'Пятница', 4, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (265, '7_1', 'Пятница', 5, 'География', '211', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (266, '8_1', 'Понедельник', 1, 'Литература', '205', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (267, '8_1', 'Понедельник', 2, 'Физкультура', 'спортзал', 'Новиков А.М.');
INSERT INTO public.schedule VALUES (268, '8_1', 'Понедельник', 3, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (269, '8_1', 'Понедельник', 4, 'Алгебра', '202', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (270, '8_1', 'Понедельник', 5, 'География', '211', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (271, '8_1', 'Вторник', 1, 'Русский язык', '204', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (272, '8_1', 'Вторник', 2, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (273, '8_1', 'Вторник', 3, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (274, '8_1', 'Вторник', 4, 'История', '209', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (275, '8_1', 'Вторник', 5, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (276, '8_1', 'Среда', 1, 'Литература', '205', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (277, '8_1', 'Среда', 2, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (278, '8_1', 'Среда', 3, 'Обществознание', '210', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (279, '8_1', 'Среда', 4, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (280, '8_1', 'Среда', 5, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (281, '8_1', 'Четверг', 1, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (282, '8_1', 'Четверг', 2, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (283, '8_1', 'Четверг', 3, 'Химия', '214', 'Морозов С.П.');
INSERT INTO public.schedule VALUES (284, '8_1', 'Четверг', 4, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (285, '8_1', 'Четверг', 5, 'Русский язык', '204', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (286, '8_1', 'Пятница', 1, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (287, '8_1', 'Пятница', 2, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (288, '8_1', 'Пятница', 3, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (289, '8_1', 'Пятница', 4, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (290, '8_1', 'Пятница', 5, 'Английский язык', '208', 'Лебедева О.И.');
INSERT INTO public.schedule VALUES (291, '8_2', 'Понедельник', 1, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (292, '8_2', 'Понедельник', 2, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (293, '8_2', 'Понедельник', 3, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (294, '8_2', 'Понедельник', 4, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (295, '8_2', 'Понедельник', 5, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (296, '8_2', 'Вторник', 1, 'Алгебра', '202', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (297, '8_2', 'Вторник', 2, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (298, '8_2', 'Вторник', 3, 'Физика', '213', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (299, '8_2', 'Вторник', 4, 'История', '209', 'Николаева М.П.');
INSERT INTO public.schedule VALUES (300, '8_2', 'Вторник', 5, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (301, '8_2', 'Среда', 1, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (302, '8_2', 'Среда', 2, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (303, '8_2', 'Среда', 3, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (304, '8_2', 'Среда', 4, 'Английский язык', '208', 'Лебедева О.И.');
INSERT INTO public.schedule VALUES (305, '8_2', 'Среда', 5, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (306, '8_2', 'Четверг', 1, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (307, '8_2', 'Четверг', 2, 'Английский язык', '208', 'Сидорова М.А.');
INSERT INTO public.schedule VALUES (308, '8_2', 'Четверг', 3, 'Литература', '205', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (309, '8_2', 'Четверг', 4, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (310, '8_2', 'Четверг', 5, 'ИЗО', '215', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (311, '8_2', 'Пятница', 1, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (312, '8_2', 'Пятница', 2, 'Английский язык', '208', 'Лебедева О.И.');
INSERT INTO public.schedule VALUES (313, '8_2', 'Пятница', 3, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (314, '8_2', 'Пятница', 4, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (315, '8_2', 'Пятница', 5, 'Физкультура', 'спортзал', 'Новиков А.М.');
INSERT INTO public.schedule VALUES (316, '9_1', 'Понедельник', 1, 'Английский язык', '208', 'Сидорова М.А.');
INSERT INTO public.schedule VALUES (317, '9_1', 'Понедельник', 2, 'История', '209', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (318, '9_1', 'Понедельник', 3, 'Химия', '214', 'Морозов С.П.');
INSERT INTO public.schedule VALUES (319, '9_1', 'Понедельник', 4, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (320, '9_1', 'Понедельник', 5, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (321, '9_1', 'Вторник', 1, 'Физика', '213', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (322, '9_1', 'Вторник', 2, 'История', '209', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (323, '9_1', 'Вторник', 3, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (324, '9_1', 'Вторник', 4, 'Обществознание', '210', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (325, '9_1', 'Вторник', 5, 'Литература', '205', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (326, '9_1', 'Среда', 1, 'Обществознание', '210', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (327, '9_1', 'Среда', 2, 'Английский язык', '208', 'Лебедева О.И.');
INSERT INTO public.schedule VALUES (328, '9_1', 'Среда', 3, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (329, '9_1', 'Среда', 4, 'Химия', '214', 'Морозов С.П.');
INSERT INTO public.schedule VALUES (330, '9_1', 'Среда', 5, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (331, '9_1', 'Четверг', 1, 'История', '209', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (332, '9_1', 'Четверг', 2, 'Литература', '205', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (333, '9_1', 'Четверг', 3, 'Алгебра', '202', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (334, '9_1', 'Четверг', 4, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (335, '9_1', 'Четверг', 5, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (336, '9_1', 'Пятница', 1, 'Музыка', '216', 'Васильева Т.В.');
INSERT INTO public.schedule VALUES (337, '9_1', 'Пятница', 2, 'Технология', '217', 'Фёдорова И.Г.');
INSERT INTO public.schedule VALUES (338, '9_1', 'Пятница', 3, 'Химия', '214', 'Морозов С.П.');
INSERT INTO public.schedule VALUES (339, '9_1', 'Пятница', 4, 'География', '211', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (340, '9_1', 'Пятница', 5, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (341, '10_1', 'Понедельник', 1, 'Английский язык', '208', 'Лебедева О.И.');
INSERT INTO public.schedule VALUES (342, '10_1', 'Понедельник', 2, 'Литература', '205', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (343, '10_1', 'Понедельник', 3, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (344, '10_1', 'Понедельник', 4, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (345, '10_1', 'Понедельник', 5, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (346, '10_1', 'Вторник', 1, 'История', '209', 'Николаева М.П.');
INSERT INTO public.schedule VALUES (347, '10_1', 'Вторник', 2, 'Обществознание', '210', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (348, '10_1', 'Вторник', 3, 'Физика', '213', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (349, '10_1', 'Вторник', 4, 'Алгебра', '202', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (350, '10_1', 'Вторник', 5, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (351, '10_1', 'Среда', 1, 'История', '209', 'Николаева М.П.');
INSERT INTO public.schedule VALUES (352, '10_1', 'Среда', 2, 'Химия', '214', 'Морозов С.П.');
INSERT INTO public.schedule VALUES (353, '10_1', 'Среда', 3, 'Английский язык', '208', 'Лебедева О.И.');
INSERT INTO public.schedule VALUES (354, '10_1', 'Среда', 4, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (355, '10_1', 'Среда', 5, 'Литература', '205', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (356, '10_1', 'Четверг', 1, 'Английский язык', '208', 'Лебедева О.И.');
INSERT INTO public.schedule VALUES (357, '10_1', 'Четверг', 2, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (358, '10_1', 'Четверг', 3, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (359, '10_1', 'Четверг', 4, 'Физика', '213', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (360, '10_1', 'Четверг', 5, 'История', '209', 'Николаева М.П.');
INSERT INTO public.schedule VALUES (361, '10_1', 'Пятница', 1, 'Физика', '213', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (362, '10_1', 'Пятница', 2, 'Химия', '214', 'Морозов С.П.');
INSERT INTO public.schedule VALUES (363, '10_1', 'Пятница', 3, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (364, '10_1', 'Пятница', 4, 'Литература', '205', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (365, '10_1', 'Пятница', 5, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (366, '11_1', 'Понедельник', 1, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (367, '11_1', 'Понедельник', 2, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (368, '11_1', 'Понедельник', 3, 'Русский язык', '204', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (369, '11_1', 'Понедельник', 4, 'Обществознание', '210', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (370, '11_1', 'Понедельник', 5, 'Физкультура', 'спортзал', 'Новиков А.М.');
INSERT INTO public.schedule VALUES (371, '11_1', 'Вторник', 1, 'Химия', '214', 'Морозов С.П.');
INSERT INTO public.schedule VALUES (372, '11_1', 'Вторник', 2, 'Литература', '205', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (373, '11_1', 'Вторник', 3, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (374, '11_1', 'Вторник', 4, 'Физика', '213', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (375, '11_1', 'Вторник', 5, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (376, '11_1', 'Среда', 1, 'Обществознание', '210', 'Николаева М.П.');
INSERT INTO public.schedule VALUES (377, '11_1', 'Среда', 2, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (378, '11_1', 'Среда', 3, 'История', '209', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (379, '11_1', 'Среда', 4, 'Литература', '205', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (380, '11_1', 'Среда', 5, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (381, '11_1', 'Четверг', 1, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (382, '11_1', 'Четверг', 2, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (383, '11_1', 'Четверг', 3, 'Алгебра', '202', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (384, '11_1', 'Четверг', 4, 'Физика', '213', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (385, '11_1', 'Четверг', 5, 'Обществознание', '210', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (386, '11_1', 'Пятница', 1, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (387, '11_1', 'Пятница', 2, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (388, '11_1', 'Пятница', 3, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (389, '11_1', 'Пятница', 4, 'Русский язык', '204', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (390, '11_1', 'Пятница', 5, 'Английский язык', '208', 'Лебедева О.И.');
INSERT INTO public.schedule VALUES (391, '11_2', 'Понедельник', 1, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (392, '11_2', 'Понедельник', 2, 'Химия', '214', 'Морозов С.П.');
INSERT INTO public.schedule VALUES (393, '11_2', 'Понедельник', 3, 'Алгебра', '202', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (394, '11_2', 'Понедельник', 4, 'Обществознание', '210', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (395, '11_2', 'Понедельник', 5, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (396, '11_2', 'Вторник', 1, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (397, '11_2', 'Вторник', 2, 'Информатика', 'каб.305', 'Соколова Е.Д.');
INSERT INTO public.schedule VALUES (398, '11_2', 'Вторник', 3, 'Химия', '214', 'Морозов С.П.');
INSERT INTO public.schedule VALUES (399, '11_2', 'Вторник', 4, 'ОБЖ', '218', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (400, '11_2', 'Вторник', 5, 'Физика', '213', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (401, '11_2', 'Среда', 1, 'История', '209', 'Зайцев И.А.');
INSERT INTO public.schedule VALUES (402, '11_2', 'Среда', 2, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (403, '11_2', 'Среда', 3, 'Физика', '213', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (404, '11_2', 'Среда', 4, 'Русский язык', '204', 'Григорьева С.О.');
INSERT INTO public.schedule VALUES (405, '11_2', 'Среда', 5, 'Обществознание', '210', 'Николаева М.П.');
INSERT INTO public.schedule VALUES (406, '11_2', 'Четверг', 1, 'Физкультура', 'спортзал', 'Петров Д.А.');
INSERT INTO public.schedule VALUES (407, '11_2', 'Четверг', 2, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (408, '11_2', 'Четверг', 3, 'Алгебра', '202', 'Смирнова О.В.');
INSERT INTO public.schedule VALUES (409, '11_2', 'Четверг', 4, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (410, '11_2', 'Четверг', 5, 'Русский язык', '204', 'Иванова Е.В.');
INSERT INTO public.schedule VALUES (411, '11_2', 'Пятница', 1, 'Геометрия', '203', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (412, '11_2', 'Пятница', 2, 'Химия', '214', 'Морозов С.П.');
INSERT INTO public.schedule VALUES (413, '11_2', 'Пятница', 3, 'Физика', '213', 'Кузьмин А.И.');
INSERT INTO public.schedule VALUES (414, '11_2', 'Пятница', 4, 'Биология', '212', 'Козлова Н.С.');
INSERT INTO public.schedule VALUES (415, '11_2', 'Пятница', 5, 'Информатика', 'каб.305', 'Соколова Е.Д.');


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.teachers VALUES (2, 'Кузьмин Андрей Игоревич', '+7-900-222-22-22', 'kuzmin@school.ru', '1972-03-24', 'Высшее педагогическое', 7, 'Без категории', NULL);
INSERT INTO public.teachers VALUES (3, 'Николаева Мария Павловна', '+7-900-333-33-33', 'nikolaeva@school.ru', '1978-01-01', 'Высшее педагогическое', 15, 'Высшая', NULL);
INSERT INTO public.teachers VALUES (4, 'Иванова Елена Владимировна', '+7-900-765-99-79', 'teacher4@school.ru', '1981-10-01', 'Среднее специальное', 14, 'Без категории', NULL);
INSERT INTO public.teachers VALUES (5, 'Петрова Анна Борисовна', '+7-900-877-30-99', 'teacher5@school.ru', '1978-04-15', 'Среднее специальное', 19, 'Высшая', NULL);
INSERT INTO public.teachers VALUES (6, 'Сидорова Марина Анатольевна', '+7-900-204-21-58', 'teacher6@school.ru', '1978-06-09', 'Высшее педагогическое', 15, 'Первая', NULL);
INSERT INTO public.teachers VALUES (7, 'Фёдорова Ирина Геннадьевна', '+7-900-847-68-78', 'teacher7@school.ru', '1968-06-28', 'Высшее', 18, 'Высшая', NULL);
INSERT INTO public.teachers VALUES (9, 'Петров Дмитрий Александрович', '+7-900-181-39-22', 'teacher9@school.ru', '1971-12-03', 'Высшее педагогическое', 16, 'Первая', NULL);
INSERT INTO public.teachers VALUES (10, 'Козлова Наталья Сергеевна', '+7-900-479-55-36', 'teacher10@school.ru', '1977-05-15', 'Среднее специальное', 25, 'Высшая', NULL);
INSERT INTO public.teachers VALUES (11, 'Морозов Сергей Петрович', '+7-900-750-31-78', 'teacher11@school.ru', '1986-05-23', 'Среднее специальное', 6, 'Без категории', NULL);
INSERT INTO public.teachers VALUES (12, 'Соколова Екатерина Дмитриевна', '+7-900-755-98-81', 'teacher12@school.ru', '1988-04-06', 'Высшее', 26, 'Первая', NULL);
INSERT INTO public.teachers VALUES (13, 'Лебедева Ольга Игоревна', '+7-900-924-50-61', 'teacher13@school.ru', '1972-11-11', 'Высшее педагогическое', 16, 'Высшая', NULL);
INSERT INTO public.teachers VALUES (14, 'Новиков Алексей Михайлович', '+7-900-771-73-60', 'teacher14@school.ru', '1973-02-07', 'Среднее специальное', 22, 'Высшая', NULL);
INSERT INTO public.teachers VALUES (15, 'Григорьева Светлана Олеговна', '+7-900-352-81-78', 'teacher15@school.ru', '1993-11-15', 'Высшее педагогическое', 18, 'Высшая', NULL);
INSERT INTO public.teachers VALUES (16, 'Зайцев Игорь Анатольевич', '+7-900-324-27-75', 'teacher16@school.ru', '1973-12-19', 'Высшее', 27, 'Первая', NULL);
INSERT INTO public.teachers VALUES (8, 'Васильева Татьяна Викторовна', '+7-900-733-56-83', 'teacher8@school.ru', '1968-07-03', 'Среднее специальное', 20, 'Без категории', NULL);
INSERT INTO public.teachers VALUES (1, 'Смирнова Ольга Викторовна', '+7-900-111-11-11', 'smirnova@school.ru', '1985-02-01', 'Среднее специальное', 19, 'Высшая', NULL);


--
-- Data for Name: teachersubjects; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.teachersubjects VALUES (1, 1);
INSERT INTO public.teachersubjects VALUES (1, 2);
INSERT INTO public.teachersubjects VALUES (2, 14);
INSERT INTO public.teachersubjects VALUES (3, 10);
INSERT INTO public.teachersubjects VALUES (3, 11);
INSERT INTO public.teachersubjects VALUES (4, 4);
INSERT INTO public.teachersubjects VALUES (4, 5);
INSERT INTO public.teachersubjects VALUES (5, 6);
INSERT INTO public.teachersubjects VALUES (5, 7);
INSERT INTO public.teachersubjects VALUES (6, 8);
INSERT INTO public.teachersubjects VALUES (7, 16);
INSERT INTO public.teachersubjects VALUES (7, 18);
INSERT INTO public.teachersubjects VALUES (8, 17);
INSERT INTO public.teachersubjects VALUES (9, 19);
INSERT INTO public.teachersubjects VALUES (9, 20);
INSERT INTO public.teachersubjects VALUES (10, 13);
INSERT INTO public.teachersubjects VALUES (11, 15);
INSERT INTO public.teachersubjects VALUES (12, 9);
INSERT INTO public.teachersubjects VALUES (13, 8);
INSERT INTO public.teachersubjects VALUES (14, 19);
INSERT INTO public.teachersubjects VALUES (15, 4);
INSERT INTO public.teachersubjects VALUES (15, 5);
INSERT INTO public.teachersubjects VALUES (16, 10);
INSERT INTO public.teachersubjects VALUES (16, 11);
INSERT INTO public.teachersubjects VALUES (2, 3);
INSERT INTO public.teachersubjects VALUES (10, 3);


--
-- Name: classes_id_class_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.classes_id_class_seq', 19, true);


--
-- Name: lessons_id_lesson_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lessons_id_lesson_seq', 1, false);


--
-- Name: marks_id_mark_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.marks_id_mark_seq', 204, true);


--
-- Name: schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.schedule_id_seq', 416, true);


--
-- Name: students_id_student_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.students_id_student_seq', 95, true);


--
-- Name: subjects_id_subject_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subjects_id_subject_seq', 20, true);


--
-- Name: teachers_id_teacher_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teachers_id_teacher_seq', 17, true);


--
-- PostgreSQL database dump complete
--

\unrestrict zgAqLcRtcfkR6dgqJyCgBSCffgyC7hMNkMJJddtE57jCkXtrHziWNChMW9A5OZK

