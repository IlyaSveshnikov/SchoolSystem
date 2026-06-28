--
-- PostgreSQL database dump
--

\restrict eDQ0WefAjOlvzm9vDWLB2Gxkby4Los9KKV4W96idw9ZWPsMO5EdviiFzI9QOCBl

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: classes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.classes (
    id_class integer NOT NULL,
    name character varying(20) NOT NULL,
    classroom character varying(10)
);


--
-- Name: classes_id_class_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.classes_id_class_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: classes_id_class_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.classes_id_class_seq OWNED BY public.classes.id_class;


--
-- Name: lessons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lessons (
    id_lesson integer NOT NULL,
    id_class integer NOT NULL,
    id_subject integer NOT NULL,
    lesson_type character varying(20) NOT NULL,
    lesson_date date NOT NULL,
    lesson_number smallint NOT NULL,
    CONSTRAINT lessons_lesson_type_check CHECK (((lesson_type)::text = ANY ((ARRAY['NEW_TOPIC'::character varying, 'SELF_STUDY'::character varying, 'TEST'::character varying])::text[])))
);


--
-- Name: lessons_id_lesson_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lessons_id_lesson_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lessons_id_lesson_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lessons_id_lesson_seq OWNED BY public.lessons.id_lesson;


--
-- Name: marks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.marks (
    id_mark integer NOT NULL,
    id_student integer NOT NULL,
    id_subject integer NOT NULL,
    term smallint NOT NULL,
    mark smallint NOT NULL,
    mark_date date
);


--
-- Name: marks_id_mark_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.marks_id_mark_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: marks_id_mark_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.marks_id_mark_seq OWNED BY public.marks.id_mark;


--
-- Name: schedule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schedule (
    id integer NOT NULL,
    class_key character varying(10) NOT NULL,
    day_of_week character varying(20) NOT NULL,
    lesson_number integer NOT NULL,
    subject character varying(50) NOT NULL,
    classroom character varying(10) NOT NULL,
    teacher character varying(100) NOT NULL,
    CONSTRAINT schedule_day_of_week_check CHECK (((day_of_week)::text = ANY ((ARRAY['Понедельник'::character varying, 'Вторник'::character varying, 'Среда'::character varying, 'Четверг'::character varying, 'Пятница'::character varying])::text[])))
);


--
-- Name: schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.schedule_id_seq OWNED BY public.schedule.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.students (
    id_student integer NOT NULL,
    full_name character varying(100) NOT NULL,
    id_class integer NOT NULL,
    birth_date date,
    gender character varying(10),
    parent_name character varying(100),
    parent_phone character varying(20),
    photo_url character varying(255)
);


--
-- Name: students_id_student_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.students_id_student_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: students_id_student_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.students_id_student_seq OWNED BY public.students.id_student;


--
-- Name: subjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subjects (
    id_subject integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


--
-- Name: subjects_id_subject_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subjects_id_subject_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subjects_id_subject_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subjects_id_subject_seq OWNED BY public.subjects.id_subject;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teachers (
    id_teacher integer NOT NULL,
    full_name character varying(100) NOT NULL,
    phone character varying(20),
    email character varying(100),
    birth_date date,
    education character varying(100),
    experience_years integer,
    category character varying(30),
    photo_url character varying(255)
);


--
-- Name: teachers_id_teacher_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teachers_id_teacher_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teachers_id_teacher_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teachers_id_teacher_seq OWNED BY public.teachers.id_teacher;


--
-- Name: teachersubjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teachersubjects (
    id_teacher integer NOT NULL,
    id_subject integer NOT NULL
);


--
-- Name: classes id_class; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classes ALTER COLUMN id_class SET DEFAULT nextval('public.classes_id_class_seq'::regclass);


--
-- Name: lessons id_lesson; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons ALTER COLUMN id_lesson SET DEFAULT nextval('public.lessons_id_lesson_seq'::regclass);


--
-- Name: marks id_mark; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marks ALTER COLUMN id_mark SET DEFAULT nextval('public.marks_id_mark_seq'::regclass);


--
-- Name: schedule id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedule ALTER COLUMN id SET DEFAULT nextval('public.schedule_id_seq'::regclass);


--
-- Name: students id_student; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students ALTER COLUMN id_student SET DEFAULT nextval('public.students_id_student_seq'::regclass);


--
-- Name: subjects id_subject; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id_subject SET DEFAULT nextval('public.subjects_id_subject_seq'::regclass);


--
-- Name: teachers id_teacher; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id_teacher SET DEFAULT nextval('public.teachers_id_teacher_seq'::regclass);


--
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id_class);


--
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id_lesson);


--
-- Name: marks marks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT marks_pkey PRIMARY KEY (id_mark);


--
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id_student);


--
-- Name: subjects subjects_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_name_unique UNIQUE (name);


--
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id_subject);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id_teacher);


--
-- Name: teachersubjects teachersubjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachersubjects
    ADD CONSTRAINT teachersubjects_pkey PRIMARY KEY (id_teacher, id_subject);


--
-- Name: idx_schedule_class; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_schedule_class ON public.schedule USING btree (class_key);


--
-- Name: lessons lessons_id_class_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_id_class_fkey FOREIGN KEY (id_class) REFERENCES public.classes(id_class) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lessons lessons_id_subject_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_id_subject_fkey FOREIGN KEY (id_subject) REFERENCES public.subjects(id_subject) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: marks marks_id_student_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT marks_id_student_fkey FOREIGN KEY (id_student) REFERENCES public.students(id_student) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: marks marks_id_subject_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT marks_id_subject_fkey FOREIGN KEY (id_subject) REFERENCES public.subjects(id_subject) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: students students_id_class_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_id_class_fkey FOREIGN KEY (id_class) REFERENCES public.classes(id_class) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: teachersubjects teachersubjects_id_subject_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachersubjects
    ADD CONSTRAINT teachersubjects_id_subject_fkey FOREIGN KEY (id_subject) REFERENCES public.subjects(id_subject) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: teachersubjects teachersubjects_id_teacher_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachersubjects
    ADD CONSTRAINT teachersubjects_id_teacher_fkey FOREIGN KEY (id_teacher) REFERENCES public.teachers(id_teacher) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict eDQ0WefAjOlvzm9vDWLB2Gxkby4Los9KKV4W96idw9ZWPsMO5EdviiFzI9QOCBl

