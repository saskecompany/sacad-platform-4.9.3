BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "home_lessons" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(256) NOT NULL,
	"date"	date NOT NULL,
	"catname_id"	bigint,
	"limg"	varchar(100),
	"video"	varchar(100),
	"LYoutube"	varchar(255),
	FOREIGN KEY("catname_id") REFERENCES "home_catgory"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "students_student_Scourses" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"student_id"	bigint NOT NULL,
	"catgory_id"	bigint NOT NULL,
	FOREIGN KEY("student_id") REFERENCES "students_student"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("catgory_id") REFERENCES "home_catgory"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "students_student" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Sfname"	varchar(50),
	"Smname"	varchar(50),
	"Slname"	varchar(50),
	"Spercent"	integer NOT NULL,
	"Spercenthomeworks"	integer NOT NULL,
	"Spercentexams"	integer NOT NULL,
	"shomeworks"	integer NOT NULL,
	"sexams"	integer NOT NULL,
	"points"	bigint NOT NULL,
	"sinit_id"	integer UNIQUE,
	"Sidnumber"	bigint unsigned NOT NULL CHECK("Sidnumber">=0) UNIQUE,
	"simg"	varchar(100) NOT NULL,
	"Sstatus"	bool NOT NULL,
	FOREIGN KEY("sinit_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "coaches_coach" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"CName"	varchar(50) NOT NULL,
	"CPhone"	varchar(128) NOT NULL,
	"User_id"	integer NOT NULL UNIQUE,
	"Cemail"	varchar(254) NOT NULL,
	FOREIGN KEY("User_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "home_catgory" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(50) NOT NULL,
	"cimage"	varchar(100),
	"Cprice"	integer,
	"CCoach_id"	bigint,
	FOREIGN KEY("CCoach_id") REFERENCES "coaches_coach"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "live_live" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Lname"	varchar(256) NOT NULL,
	"Limg"	varchar(100),
	"Linit_id"	integer NOT NULL,
	"Lroom"	varchar(256) NOT NULL,
	"Lurl"	text NOT NULL,
	FOREIGN KEY("Linit_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "news_news" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"title"	varchar(256) NOT NULL,
	"img"	varchar(100),
	"detail"	text NOT NULL
);
CREATE TABLE IF NOT EXISTS "ads_news" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"title"	varchar(256) NOT NULL,
	"img"	varchar(100),
	"detail"	text NOT NULL
);
CREATE TABLE IF NOT EXISTS "students_student_watchedlecs" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"student_id"	bigint NOT NULL,
	"lessons_id"	bigint NOT NULL,
	FOREIGN KEY("student_id") REFERENCES "students_student"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("lessons_id") REFERENCES "home_lessons"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "students_student_finishedHomework" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"student_id"	bigint NOT NULL,
	"lessons_id"	bigint NOT NULL,
	FOREIGN KEY("student_id") REFERENCES "students_student"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("lessons_id") REFERENCES "home_lessons"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "students_student_finishExam" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"student_id"	bigint NOT NULL,
	"exam_id"	bigint NOT NULL,
	FOREIGN KEY("exam_id") REFERENCES "tasks_exam"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("student_id") REFERENCES "students_student"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "reports_report_homerport" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"report_id"	bigint NOT NULL,
	"homeworkreport_id"	bigint NOT NULL,
	FOREIGN KEY("homeworkreport_id") REFERENCES "reports_homeworkreport"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("report_id") REFERENCES "reports_report"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "reports_report_examReport" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"report_id"	bigint NOT NULL,
	"examreport_id"	bigint NOT NULL,
	FOREIGN KEY("examreport_id") REFERENCES "reports_examreport"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("report_id") REFERENCES "reports_report"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "reports_report" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "reports_homeworkreport" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"asknumber"	integer,
	"correctAnswers"	integer,
	"wrongAnswers"	integer,
	"presentage"	integer,
	"lesson_id"	bigint NOT NULL,
	"user_id"	integer,
	FOREIGN KEY("lesson_id") REFERENCES "home_lessons"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "reports_examreport" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"asknumber"	integer,
	"correctAnswers"	integer,
	"wrongAnswers"	integer,
	"presentage"	integer,
	"exam_id"	bigint,
	"user_id"	integer,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("exam_id") REFERENCES "tasks_exam"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "tasks_task" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"quest"	text,
	"questimg"	varchar(100),
	"answer1"	varchar(50),
	"answer2"	varchar(50),
	"answer3"	varchar(50),
	"answer4"	varchar(50),
	"answer"	varchar(50),
	"exam_id"	bigint,
	"lesson_id"	bigint,
	FOREIGN KEY("lesson_id") REFERENCES "home_lessons"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("exam_id") REFERENCES "tasks_exam"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "tasks_exam" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"title"	varchar(256) NOT NULL,
	"publishAt"	datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(150) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag">=0),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL
);
INSERT INTO "home_lessons" VALUES (1,'الدرس الأول','2023-08-16',1,'','lessons/الدرس_الأول.mp4',NULL);
INSERT INTO "home_lessons" VALUES (2,'الدرس الثاني','2023-08-25',1,'','lessons/الدرس_الثاني.mp4',NULL);
INSERT INTO "home_lessons" VALUES (3,'محاضره تجريبيه من يوتيوب','2024-08-02',2,'','','dmJYYbNOMPI');
INSERT INTO "students_student_Scourses" VALUES (10,8,1);
INSERT INTO "students_student_Scourses" VALUES (11,17,1);
INSERT INTO "students_student" VALUES (8,'سلطان','عبدالكريم','سلطان',0,0,0,0,0,0,14,30009152401371,'students/img/sultanpasha.png',1);
INSERT INTO "students_student" VALUES (17,'حسن','علي','بسيوني',0,0,0,0,0,0,28,12345678900989,'students/img/None_i2YYQyh.jpg',1);
INSERT INTO "coaches_coach" VALUES (1,'سلطان','+201060950140',2,'sultanelsultan4@gmail.com');
INSERT INTO "coaches_coach" VALUES (2,'أحمد طه','+201062167420',17,'ahmedtaha12131415@gmail.com');
INSERT INTO "home_catgory" VALUES (1,'كورس التسويق','',240,2);
INSERT INTO "home_catgory" VALUES (2,'كورس البرمجه','',400,1);
INSERT INTO "news_news" VALUES (1,'إعلان إفتتاح المنصه','img/SACAD_logo_Company.png','يسعدنا و بكل فخر الإعلان عن تشغيل قسم تقديم التدريبات وتعليم #البرمجه بالشركه
قسم #SaCaD التعليمي
انتظروا الإعلان عن الكورسات المقدمه لكل الفئات العمريه قريباً
#Soon 🔥
#SASKE_Company 😎
#بوابتك_للخدمات_التقنيه 👌🏼');
INSERT INTO "news_news" VALUES (2,'إعلان كورس تعلم البرمجه','img/SASKE_SACAD_first_Ad_Project.png','تعلم البرمجه من Zero to Hero#💪لجميع الفئات العمريه. 
مع شركة SASKE 🐉 
تحت شعار البرمجه للجميع و حرصاً منا لإعداد قاده وشباب متواكبين مع رؤيه مصر 2030🇪🇬 
و تحت رعاية مركز المستقبل للتأهيل 😎 
📢نعلن عن بدء محاضرات دورة تعلم البرمجه من الصفر في محافظة المنيا📌
تلبية لرغبات الساده عملائنا الكرام ❤️
الدوره مناسبه لكل الفئات العمريه💯
هذه الدوره مجهزه و مقدمه علي ايدي نخبه من المدربين👌 المتخصصين و المتميزين في مجالات برمجيه مختلفه و متعدده✨.
وسنتعرف خلالها عن:
👈 كل ما يخص عالم البرمجيات
👈 تداخل البرمجيات مع الهاردوير
👈 لغات البرمجه
👈 أهم المبادئ البرمجية
👈 مقدمه في علوم الحاسب
👈 تطبيقات عمليه مختلفه و مشاريع نهائيه علي كل مرحله تعليميه
لو انت طالب في العشرينات و ما دون ذلك الحق استثمر في نفسك و تعلم لغة المستقبل🔮
ولو انت أب نمي مهارات ابنك و علمه لغة المستقبل ليصبح له مستقبل واعد مواكباً للتغير التكنولوجي السريع🚀.
اللغات اثناء الدوره:
Scratch منصة لتعلم البرمجه للمبتدئين
HTML لغة ترميز النص الفائق
Css لغة أوراق الأنماط المتتاليه (لتنسيق مواقع الويب)
javascript لغة برمجة عالية المستوي (لإنشاء مواقع ويب تفاعليه)
python لغة برمجة عالية المستوي مفتوحة المصدر (إستخدامات متعدده)
متطلبات الالتحاق بالدوره:
يحق لكل الطلاب من هم بين 6 سنوات حتي 35 سنه الالتحاق بالدوره✅
لا يتطلب اي معلومات سابقه عن البرمجه او الحاسب الآلي✅
يتطلب اساسيات اللغه الانجليزيه قراءه و كتابه✅
للحجز يرجي ملئي نموذج طلب الإلتحاق التالي لتحديد المستوي و مدى تأهل الطالب للدوره:
https://forms.gle/e4LkYaMQVmbmR3j49
وللإستفسار يرجي التواصل معنا علي الأرقام التاليه ☎️:
فون وواتساب: 01060950140
تليفون الشركه: 0862130396
او زيارة مقر الشركه الجديد علي العنوان التالي:
المنيا - شلبي - برج الزهراء بجوار بنزينة التعاون الدور الثالث
#SASKE_Company 😎
#بوابتك_للخدمات_التقنيه 👌🏼');
INSERT INTO "students_student_watchedlecs" VALUES (15,8,1);
INSERT INTO "students_student_watchedlecs" VALUES (31,17,1);
INSERT INTO "students_student_watchedlecs" VALUES (32,17,2);
INSERT INTO "students_student_watchedlecs" VALUES (33,17,3);
INSERT INTO "students_student_watchedlecs" VALUES (34,8,2);
INSERT INTO "students_student_finishExam" VALUES (2,8,1);
INSERT INTO "django_session" VALUES ('ublfdpgm1v54rptdbtpfoeszbnsi633z','.eJxVjDsOwjAQBe_iGln-rT-U9JzBWq8dHEC2FCcV4u4QKQW0b2bei0Xc1hq3UZY4Z3Zmip1-t4T0KG0H-Y7t1jn1ti5z4rvCDzr4tefyvBzu30HFUb81Bi8hg1fGBqW0I5NEkmi9p2Q1ZgJbJq2cB41AjoKkrASAkUYY6Sb2_gDCxTbg:1qW3c4:Wvrt8tPoCYvksOLoPzXfFtkaDYjEgjQp7R464TWJ7f4','2023-08-29 23:38:12.814679');
INSERT INTO "django_session" VALUES ('zp4c0jxa47f5h6d3z96bitrodap5avux','.eJxVjEEOwiAQRe_C2hBmBBGX7nsGMgODVA1NSrsy3l2bdKHb_977LxVpXWpcu8xxzOqijurwuzGlh7QN5Du126TT1JZ5ZL0peqddD1OW53V3_w4q9fqtvbXCnAUB0JFF5x0BGMpUyjn7E6A3VoINLgUXLIfCKCYAiEsJhdX7A9nSN8s:1qW3tP:bQXQHhAWaIoTq0oU2oTdfFbfFGenbZqh-_UsSx6yP50','2023-08-29 23:56:07.353667');
INSERT INTO "django_session" VALUES ('6ohx5c24ly50fwndrcdamb48mt6k7dg8','.eJxVjDsOwjAQBe_iGln-rT-U9JzBWq8dHEC2FCcV4u4QKQW0b2bei0Xc1hq3UZY4Z3Zmip1-t4T0KG0H-Y7t1jn1ti5z4rvCDzr4tefyvBzu30HFUb81Bi8hg1fGBqW0I5NEkmi9p2Q1ZgJbJq2cB41AjoKkrASAkUYY6Sb2_gDCxTbg:1qWMK2:kZ65yG53mZKE7mO0glVPz27BALVDn-16S3_SkEviovY','2023-08-30 19:36:50.641506');
INSERT INTO "django_session" VALUES ('ch7cptjh5a72aakp9w8vv1tzwqep9bbg','.eJxVjDsOwjAQBe_iGln-rT-U9JzBWq8dHEC2FCcV4u4QKQW0b2bei0Xc1hq3UZY4Z3Zmip1-t4T0KG0H-Y7t1jn1ti5z4rvCDzr4tefyvBzu30HFUb81Bi8hg1fGBqW0I5NEkmi9p2Q1ZgJbJq2cB41AjoKkrASAkUYY6Sb2_gDCxTbg:1qYsxt:VERWgZuhuQlSO1qDrkDIuLkwh03NyaipWbvAsC2QcCM','2023-09-06 18:52:25.331654');
INSERT INTO "django_session" VALUES ('mji8bs0x8nv6zc17g0eiruxz5tccbd60','.eJxVjEEOgjAQRe_StWko7XTEpXvO0Mx0poIaSCisjHdXEha6_e-9_zKJtnVIW9UljWIuxgVz-h2Z8kOnncidptts8zyty8h2V-xBq-1n0ef1cP8OBqrDt2ZtNIqXRoHFIwm2FErIHQg47woKcMaIymcmiqX1EQFiCNSpg7Yz7w8tWjhs:1qZ4v9:OZR17FmdfANKe9FZG4vjxyS_WaZyMUsJ0-07CkqV-xo','2023-09-07 07:38:23.892359');
INSERT INTO "django_session" VALUES ('1v6ffo8smfeugqr4xxys21tavblxjgit','.eJxVjEEOgjAQRe_StWko7XTEpXvO0Mx0poIaSCisjHdXEha6_e-9_zKJtnVIW9UljWIuxgVz-h2Z8kOnncidptts8zyty8h2V-xBq-1n0ef1cP8OBqrDt2ZtNIqXRoHFIwm2FErIHQg47woKcMaIymcmiqX1EQFiCNSpg7Yz7w8tWjhs:1qf4rh:QjSLy0Bce_q1kRbPeXeq1Mn60qhH5SkALcN6T5tZgVA','2023-09-23 20:47:37.762161');
INSERT INTO "django_session" VALUES ('akkpeb97ahyo9ykk559bl1is3t4rrj90','.eJxVjDsOwjAQBe_iGln-rT-U9JzBWq8dHEC2FCcV4u4QKQW0b2bei0Xc1hq3UZY4Z3Zmip1-t4T0KG0H-Y7t1jn1ti5z4rvCDzr4tefyvBzu30HFUb81Bi8hg1fGBqW0I5NEkmi9p2Q1ZgJbJq2cB41AjoKkrASAkUYY6Sb2_gDCxTbg:1qfOHW:VjZWOHRLVXasa1lVYwfIba5UiZ4jCutOWGw2HAYRrEE','2023-09-24 17:31:34.341306');
INSERT INTO "django_session" VALUES ('q0ui0nik4tidnb9x5pgdi4rkp8slu806','.eJxVjEEOwiAQRe_C2pACY6Eu3fcMZGaYStVAUtqV8e7apAvd_vfef6mI25rj1mSJc1IXZXp1-h0J-SFlJ-mO5VY117IuM-ld0QdteqxJntfD_TvI2PK3PktgLzxZ4xOy4w6dARgcePRiiY0LEwiwJwuWKJiEvaHkBQe0Vjr1_gAfITiv:1qgqFa:ghSFRIBrLOa1AnFEiLQNwsC-5D-GFrL2n8uXRGuR88k','2023-09-28 17:35:34.427652');
INSERT INTO "django_session" VALUES ('yu8vw4vmp1g75s9f15df6jogsmm79vif','.eJxVjMEOwiAQRP-FsyHQwsJ69O43kAVWqRqalPZk_Hdp0oNe5vDmzbxFoG0tYWu8hCmLs9BGnH5hpPTkujf5QfU-yzTXdZmi3BV5tE1e58yvy-H-HRRqpa8TDmSUAa2c5dFZVBoYU2ZCC0Z3GNGP_qbBq54YWaEDTDwYAmdAfL7a0jbb:1r3oXQ:2ZAl8ekgb9SZwbF2iOPyyVWrNaaz8fiDBryDxv7vBq4','2023-12-01 02:24:56.714206');
INSERT INTO "django_session" VALUES ('fb7n3ap4wfuj3g7fzcnndvlvc6rm6hk8','.eJxVjEEOgjAQRe_StWm00M7UpXvO0Mx0BosaSCisjHcXEha6_e-9_zaJ1qWkteqcBjFX48zpd2PKTx13IA8a75PN07jMA9tdsQettptEX7fD_TsoVMtWA2Avquy1DYxtJr5wRB8gukyCfWjUcWzQ-zMGl4El99g2GxIPHsB8vvz5ODE:1r3sPY:2XUkanSmUBwf9J9f1mtwHYDXYWs1ILQh6n-zwvg9-sM','2023-12-01 06:33:04.117296');
INSERT INTO "django_session" VALUES ('5a6ax8kke3ovftx2etrxznspf538v1gp','.eJxVjEEOwiAQRe_C2pACY6Eu3fcMZGaYStVAUtqV8e7apAvd_vfef6mI25rj1mSJc1IXZXp1-h0J-SFlJ-mO5VY117IuM-ld0QdteqxJntfD_TvI2PK3PktgLzxZ4xOy4w6dARgcePRiiY0LEwiwJwuWKJiEvaHkBQe0Vjr1_gAfITiv:1s1s7A:o-IB5BY1NWx9xYjRWvnKrsz7Cq37Y_iI-TBZDyBFlGs','2024-05-14 18:22:04.673307');
INSERT INTO "django_session" VALUES ('w95sdrzygx4uyx15qwoedb34emlxauxp','.eJxVjMEOwiAQRP-FsyEsS6V49O43kAUWqRpISnsy_rtt0oMe5jLvzbyFp3Upfu08-ymJiwAjTr9loPjkupP0oHpvMra6zFOQuyIP2uWtJX5dD_fvoFAv29q5gNk4yxiU4ZgtQAatKSk9IgZM5KI5Owxa2cQAwzAqq5EhO9rC4vMF-1E3og:1sYsqA:iwCUjIRr1HhrW-7nYFsTeTlAJupLF1-9N3lFPUtoXOk','2024-08-13 19:48:58.657941');
INSERT INTO "reports_report_examReport" VALUES (2,2,2);
INSERT INTO "reports_report" VALUES (2,14);
INSERT INTO "reports_examreport" VALUES (2,1,0,1,0,1,14);
INSERT INTO "tasks_task" VALUES (1,'التسويق الإلكتروني هو ؟','','تسويق المنتجات','التسويق بالعموله','التسويق بالإنترنت','تسويق تقليدي','3',1,1);
INSERT INTO "tasks_exam" VALUES (1,'الدرس الأول','2023-08-15 23:40:35.148654');
INSERT INTO "tasks_exam" VALUES (2,'امتحان الشهر الجديد','2023-08-25 20:12:28.919506');
INSERT INTO "auth_user" VALUES (2,'pbkdf2_sha256$600000$LbGKruKDobrEZMtEzp3SLv$TFkProU+qvO6Ycfd/+28WQ+Sv65+ICVQp79PDjRX+yw=','2024-08-06 21:37:26.459794',1,'saskeadmin','','saskecompany1@gmail.com',1,1,'2023-08-15 22:21:42.256180','');
INSERT INTO "auth_user" VALUES (14,'pbkdf2_sha256$600000$N94auoGBbjKr6d4N7wYqCn$XefNHKG1zIbFF4QWX+8dddb32A0KsYSmP9WykfiCTBs=','2024-08-07 01:15:39.754512',0,'sultanpasha','','sultanelsultan4@gmail.com',0,1,'2023-08-24 07:38:23.349680','');
INSERT INTO "auth_user" VALUES (16,'pbkdf2_sha256$600000$S4EVaz09FhVZ0mYNKmsfmh$up0D/5pQKHPotmrBKXZJvHJs+/x0CG8oMUSbdtVxqAg=','2024-08-02 00:08:44.725450',1,'admin','','test1@gmail.com',1,1,'2023-09-14 17:35:21.752824','');
INSERT INTO "auth_user" VALUES (17,'pbkdf2_sha256$600000$OcpgaK5nXAB7RgUJJMoqC6$+cLwNPt0lsLSA3ivlcghKRw136IZm1J8nkBRYeapTg0=','2024-08-03 17:06:03.352671',0,'ahmed','','',1,1,'2024-07-30 16:30:54','');
INSERT INTO "auth_user" VALUES (28,'pbkdf2_sha256$600000$cRMoWsDrw0TnFN4b4IAnCt$O9sLm6fI3K/GBiMIKKFP8MilGOyUbW6SDPFSmOBaL1U=','2024-08-04 02:59:57.160934',0,'hassen','','hassen@gmail.com',0,1,'2024-08-04 02:51:55.459683','');
INSERT INTO "auth_group" VALUES (1,'المدربين');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_catgory','Can add الفرع');
INSERT INTO "auth_permission" VALUES (26,7,'change_catgory','Can change الفرع');
INSERT INTO "auth_permission" VALUES (27,7,'delete_catgory','Can delete الفرع');
INSERT INTO "auth_permission" VALUES (28,7,'view_catgory','Can view الفرع');
INSERT INTO "auth_permission" VALUES (29,8,'add_lessons','Can add الدرس');
INSERT INTO "auth_permission" VALUES (30,8,'change_lessons','Can change الدرس');
INSERT INTO "auth_permission" VALUES (31,8,'delete_lessons','Can delete الدرس');
INSERT INTO "auth_permission" VALUES (32,8,'view_lessons','Can view الدرس');
INSERT INTO "auth_permission" VALUES (33,9,'add_student','Can add الطالب');
INSERT INTO "auth_permission" VALUES (34,9,'change_student','Can change الطالب');
INSERT INTO "auth_permission" VALUES (35,9,'delete_student','Can delete الطالب');
INSERT INTO "auth_permission" VALUES (36,9,'view_student','Can view الطالب');
INSERT INTO "auth_permission" VALUES (37,10,'add_exam','Can add امتحان');
INSERT INTO "auth_permission" VALUES (38,10,'change_exam','Can change امتحان');
INSERT INTO "auth_permission" VALUES (39,10,'delete_exam','Can delete امتحان');
INSERT INTO "auth_permission" VALUES (40,10,'view_exam','Can view امتحان');
INSERT INTO "auth_permission" VALUES (41,11,'add_task','Can add الأسئله');
INSERT INTO "auth_permission" VALUES (42,11,'change_task','Can change الأسئله');
INSERT INTO "auth_permission" VALUES (43,11,'delete_task','Can delete الأسئله');
INSERT INTO "auth_permission" VALUES (44,11,'view_task','Can view الأسئله');
INSERT INTO "auth_permission" VALUES (45,12,'add_examreport','Can add تقرير الامتحان');
INSERT INTO "auth_permission" VALUES (46,12,'change_examreport','Can change تقرير الامتحان');
INSERT INTO "auth_permission" VALUES (47,12,'delete_examreport','Can delete تقرير الامتحان');
INSERT INTO "auth_permission" VALUES (48,12,'view_examreport','Can view تقرير الامتحان');
INSERT INTO "auth_permission" VALUES (49,13,'add_homeworkreport','Can add تفرير الواجب');
INSERT INTO "auth_permission" VALUES (50,13,'change_homeworkreport','Can change تفرير الواجب');
INSERT INTO "auth_permission" VALUES (51,13,'delete_homeworkreport','Can delete تفرير الواجب');
INSERT INTO "auth_permission" VALUES (52,13,'view_homeworkreport','Can view تفرير الواجب');
INSERT INTO "auth_permission" VALUES (53,14,'add_report','Can add التفرير');
INSERT INTO "auth_permission" VALUES (54,14,'change_report','Can change التفرير');
INSERT INTO "auth_permission" VALUES (55,14,'delete_report','Can delete التفرير');
INSERT INTO "auth_permission" VALUES (56,14,'view_report','Can view التفرير');
INSERT INTO "auth_permission" VALUES (57,15,'add_adds','Can add adds');
INSERT INTO "auth_permission" VALUES (58,15,'change_adds','Can change adds');
INSERT INTO "auth_permission" VALUES (59,15,'delete_adds','Can delete adds');
INSERT INTO "auth_permission" VALUES (60,15,'view_adds','Can view adds');
INSERT INTO "auth_permission" VALUES (61,15,'add_ads','Can add ads');
INSERT INTO "auth_permission" VALUES (62,15,'change_ads','Can change ads');
INSERT INTO "auth_permission" VALUES (63,15,'delete_ads','Can delete ads');
INSERT INTO "auth_permission" VALUES (64,15,'view_ads','Can view ads');
INSERT INTO "auth_permission" VALUES (65,15,'add_news','Can add news');
INSERT INTO "auth_permission" VALUES (66,15,'change_news','Can change news');
INSERT INTO "auth_permission" VALUES (67,15,'delete_news','Can delete news');
INSERT INTO "auth_permission" VALUES (68,15,'view_news','Can view news');
INSERT INTO "auth_permission" VALUES (69,16,'add_news','Can add إعلان');
INSERT INTO "auth_permission" VALUES (70,16,'change_news','Can change إعلان');
INSERT INTO "auth_permission" VALUES (71,16,'delete_news','Can delete إعلان');
INSERT INTO "auth_permission" VALUES (72,16,'view_news','Can view إعلان');
INSERT INTO "auth_permission" VALUES (73,17,'add_live','Can add live');
INSERT INTO "auth_permission" VALUES (74,17,'change_live','Can change live');
INSERT INTO "auth_permission" VALUES (75,17,'delete_live','Can delete live');
INSERT INTO "auth_permission" VALUES (76,17,'view_live','Can view live');
INSERT INTO "auth_permission" VALUES (77,18,'add_coach','Can add المدرب');
INSERT INTO "auth_permission" VALUES (78,18,'change_coach','Can change المدرب');
INSERT INTO "auth_permission" VALUES (79,18,'delete_coach','Can delete المدرب');
INSERT INTO "auth_permission" VALUES (80,18,'view_coach','Can view المدرب');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'home','catgory');
INSERT INTO "django_content_type" VALUES (8,'home','lessons');
INSERT INTO "django_content_type" VALUES (9,'students','student');
INSERT INTO "django_content_type" VALUES (10,'tasks','exam');
INSERT INTO "django_content_type" VALUES (11,'tasks','task');
INSERT INTO "django_content_type" VALUES (12,'reports','examreport');
INSERT INTO "django_content_type" VALUES (13,'reports','homeworkreport');
INSERT INTO "django_content_type" VALUES (14,'reports','report');
INSERT INTO "django_content_type" VALUES (15,'ads','news');
INSERT INTO "django_content_type" VALUES (16,'news','news');
INSERT INTO "django_content_type" VALUES (17,'live','live');
INSERT INTO "django_content_type" VALUES (18,'coaches','coach');
INSERT INTO "django_admin_log" VALUES (1,'2023-08-15 22:22:17.875508','1','sas','',4,2,3);
INSERT INTO "django_admin_log" VALUES (2,'2023-08-15 22:23:29.218850','1','كورس التسويق','[{"added": {}}]',7,2,1);
INSERT INTO "django_admin_log" VALUES (3,'2023-08-15 22:24:01.334439','1','1- الدرس الأول, من فرع كورس التسويق','[{"added": {}}]',8,2,1);
INSERT INTO "django_admin_log" VALUES (4,'2023-08-15 23:39:36.850175','1','task object (1)','[{"added": {}}]',11,2,1);
INSERT INTO "django_admin_log" VALUES (5,'2023-08-15 23:40:35.181501','1','الدرس الأول','[{"added": {}}]',10,2,1);
INSERT INTO "django_admin_log" VALUES (6,'2023-08-15 23:40:38.223384','1','task object (1)','[{"changed": {"fields": ["\u0627\u0645\u062a\u062d\u0627\u0646"]}}]',11,2,2);
INSERT INTO "django_admin_log" VALUES (7,'2023-08-16 19:43:32.380717','1','الإعلان الأول','[{"added": {}}]',16,2,1);
INSERT INTO "django_admin_log" VALUES (8,'2023-08-17 11:11:25.462055','1','الإعلان الأول','[{"changed": {"fields": ["\u062a\u0641\u0627\u0635\u064a\u0644 \u0627\u0644\u0625\u0639\u0644\u0627\u0646"]}}]',16,2,2);
INSERT INTO "django_admin_log" VALUES (9,'2023-08-18 09:55:16.545586','2','الإعلان الثاني','[{"added": {}}]',16,2,1);
INSERT INTO "django_admin_log" VALUES (10,'2023-08-23 18:53:06.793871','2','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0635\u0648\u0631\u0629 \u0627\u0644\u0637\u0627\u0644\u0628"]}}]',9,2,2);
INSERT INTO "django_admin_log" VALUES (11,'2023-08-23 19:27:43.378421','5','ahmed22','',4,2,3);
INSERT INTO "django_admin_log" VALUES (12,'2023-08-23 19:28:25.228623','6','ahmed22','',4,2,3);
INSERT INTO "django_admin_log" VALUES (13,'2023-08-23 19:30:34.818123','3','sultanelsultan4','',4,2,3);
INSERT INTO "django_admin_log" VALUES (14,'2023-08-23 19:30:34.820197','4','sultanpasha','',4,2,3);
INSERT INTO "django_admin_log" VALUES (15,'2023-08-23 19:35:47.855793','7','sultanpasha4','',4,2,3);
INSERT INTO "django_admin_log" VALUES (16,'2023-08-23 19:40:33.064645','8','sultanpasha','',4,2,3);
INSERT INTO "django_admin_log" VALUES (17,'2023-08-23 20:03:50.545123','9','sultanpasha','',4,2,3);
INSERT INTO "django_admin_log" VALUES (18,'2023-08-23 20:08:21.642150','10','sultanpasha4','',4,2,3);
INSERT INTO "django_admin_log" VALUES (19,'2023-08-23 20:10:19.749004','7','اسم الطالب:سلطان عبدالكريم سلطان','',9,2,3);
INSERT INTO "django_admin_log" VALUES (20,'2023-08-23 20:10:19.751181','5','اسم الطالب:سلطان عبدالكريم سلطان','',9,2,3);
INSERT INTO "django_admin_log" VALUES (21,'2023-08-23 20:10:19.753431','4','اسم الطالب:احمد علي جاد','',9,2,3);
INSERT INTO "django_admin_log" VALUES (22,'2023-08-23 20:14:37.682495','11','sultanpasha4','',4,2,3);
INSERT INTO "django_admin_log" VALUES (23,'2023-08-23 20:17:52.636541','12','sultanpasha','',4,2,3);
INSERT INTO "django_admin_log" VALUES (24,'2023-08-23 20:18:29.024064','13','sultanpasha','',4,2,3);
INSERT INTO "django_admin_log" VALUES (25,'2023-08-25 19:31:37.168882','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0627\u0644\u0646\u0642\u0627\u0637"]}}]',9,2,2);
INSERT INTO "django_admin_log" VALUES (26,'2023-08-25 19:32:25.350168','2','2- الدرس الثاني, من فرع كورس التسويق','[{"added": {}}]',8,2,1);
INSERT INTO "django_admin_log" VALUES (27,'2023-08-25 20:12:28.922432','2','امتحان الشهر الجديد','[{"added": {}}]',10,2,1);
INSERT INTO "django_admin_log" VALUES (28,'2023-08-25 20:28:56.835706','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647"]}}]',9,2,2);
INSERT INTO "django_admin_log" VALUES (29,'2023-08-26 09:26:22.811142','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647"]}}]',9,2,2);
INSERT INTO "django_admin_log" VALUES (30,'2023-08-26 09:26:32.568826','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647"]}}]',9,2,2);
INSERT INTO "django_admin_log" VALUES (31,'2023-08-26 09:27:55.356477','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647"]}}]',9,2,2);
INSERT INTO "django_admin_log" VALUES (32,'2023-08-26 09:28:11.456764','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647"]}}]',9,2,2);
INSERT INTO "django_admin_log" VALUES (33,'2023-08-26 09:28:33.683686','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647"]}}]',9,2,2);
INSERT INTO "django_admin_log" VALUES (34,'2023-08-26 09:28:43.167022','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647"]}}]',9,2,2);
INSERT INTO "django_admin_log" VALUES (35,'2023-08-26 09:28:51.234957','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647"]}}]',9,2,2);
INSERT INTO "django_admin_log" VALUES (36,'2023-08-26 10:22:39.012294','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647"]}}]',9,2,2);
INSERT INTO "django_admin_log" VALUES (37,'2023-08-26 10:23:00.319233','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647", "\u0627\u0644\u0646\u0642\u0627\u0637"]}}]',9,2,2);
INSERT INTO "django_admin_log" VALUES (38,'2023-08-26 10:23:32.904945','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647", "\u0627\u0644\u0646\u0642\u0627\u0637"]}}]',9,2,2);
INSERT INTO "django_admin_log" VALUES (39,'2023-08-26 10:24:05.207859','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647"]}}]',9,2,2);
INSERT INTO "django_admin_log" VALUES (40,'2023-09-01 20:07:23.030139','8','Live object (8)','',17,2,3);
INSERT INTO "django_admin_log" VALUES (41,'2023-09-01 20:07:23.042251','7','Live object (7)','',17,2,3);
INSERT INTO "django_admin_log" VALUES (42,'2023-09-01 20:07:23.045858','6','Live object (6)','',17,2,3);
INSERT INTO "django_admin_log" VALUES (43,'2023-09-01 20:07:23.049541','5','Live object (5)','',17,2,3);
INSERT INTO "django_admin_log" VALUES (44,'2023-09-01 20:07:23.051835','4','Live object (4)','',17,2,3);
INSERT INTO "django_admin_log" VALUES (45,'2023-09-01 20:07:23.054540','3','Live object (3)','',17,2,3);
INSERT INTO "django_admin_log" VALUES (46,'2023-09-01 20:07:23.057671','2','Live object (2)','',17,2,3);
INSERT INTO "django_admin_log" VALUES (47,'2023-09-01 20:07:23.061736','1','Live object (1)','',17,2,3);
INSERT INTO "django_admin_log" VALUES (48,'2023-09-01 20:43:22.814906','13','Live object (13)','',17,2,3);
INSERT INTO "django_admin_log" VALUES (49,'2023-09-01 20:43:22.821015','12','Live object (12)','',17,2,3);
INSERT INTO "django_admin_log" VALUES (50,'2023-09-01 20:43:22.822969','11','Live object (11)','',17,2,3);
INSERT INTO "django_admin_log" VALUES (51,'2023-09-01 20:43:22.824859','10','Live object (10)','',17,2,3);
INSERT INTO "django_admin_log" VALUES (52,'2023-09-01 20:43:22.826587','9','Live object (9)','',17,2,3);
INSERT INTO "django_admin_log" VALUES (53,'2023-09-04 17:26:20.977039','17','9765','',17,2,3);
INSERT INTO "django_admin_log" VALUES (54,'2023-09-04 17:26:20.986857','16','4511','',17,2,3);
INSERT INTO "django_admin_log" VALUES (55,'2023-09-04 17:26:20.989018','15','latest9628','',17,2,3);
INSERT INTO "django_admin_log" VALUES (56,'2023-09-04 17:26:20.990698','14','5386','',17,2,3);
INSERT INTO "django_admin_log" VALUES (57,'2023-09-04 17:26:20.997748','13','9477','',17,2,3);
INSERT INTO "django_admin_log" VALUES (58,'2023-09-04 17:26:20.999871','12','9477','',17,2,3);
INSERT INTO "django_admin_log" VALUES (59,'2023-09-04 17:26:21.001753','11','9477','',17,2,3);
INSERT INTO "django_admin_log" VALUES (60,'2023-09-04 17:26:21.005234','10','9477','',17,2,3);
INSERT INTO "django_admin_log" VALUES (61,'2023-09-04 17:26:21.007695','9','9477','',17,2,3);
INSERT INTO "django_admin_log" VALUES (62,'2023-09-04 17:26:21.011062','8','9477','',17,2,3);
INSERT INTO "django_admin_log" VALUES (63,'2023-09-04 17:26:21.014862','7','9477','',17,2,3);
INSERT INTO "django_admin_log" VALUES (64,'2023-09-04 17:26:21.017780','6','9477','',17,2,3);
INSERT INTO "django_admin_log" VALUES (65,'2023-09-04 17:26:21.019563','5','9477','',17,2,3);
INSERT INTO "django_admin_log" VALUES (66,'2023-09-04 17:26:21.021434','4','9477','',17,2,3);
INSERT INTO "django_admin_log" VALUES (67,'2023-09-04 17:26:21.023017','3','9477','',17,2,3);
INSERT INTO "django_admin_log" VALUES (68,'2023-09-04 17:26:21.024750','2','9477','',17,2,3);
INSERT INTO "django_admin_log" VALUES (69,'2023-09-04 17:26:21.026907','1','19477','',17,2,3);
INSERT INTO "django_admin_log" VALUES (70,'2023-09-04 17:32:23.199173','19','2','',17,2,3);
INSERT INTO "django_admin_log" VALUES (71,'2023-09-04 17:32:23.205156','18','8850','',17,2,3);
INSERT INTO "django_admin_log" VALUES (72,'2023-09-04 17:35:54.363742','21','8850','',17,2,3);
INSERT INTO "django_admin_log" VALUES (73,'2023-09-04 17:35:54.368350','20','8850','',17,2,3);
INSERT INTO "django_admin_log" VALUES (74,'2023-09-04 17:47:30.091034','22','6507','',17,2,3);
INSERT INTO "django_admin_log" VALUES (75,'2023-09-04 20:18:13.426355','25','440','',17,2,3);
INSERT INTO "django_admin_log" VALUES (76,'2023-09-04 20:18:44.478617','26','5753','',17,2,3);
INSERT INTO "django_admin_log" VALUES (77,'2023-09-04 20:22:07.302475','27','2937','',17,2,3);
INSERT INTO "django_admin_log" VALUES (78,'2023-09-04 20:23:37.677911','28','7960','',17,2,3);
INSERT INTO "django_admin_log" VALUES (79,'2023-09-04 20:30:07.337914','7','3897','',17,2,3);
INSERT INTO "django_admin_log" VALUES (80,'2023-09-04 20:30:07.343562','6','1856','',17,2,3);
INSERT INTO "django_admin_log" VALUES (81,'2023-09-04 20:30:07.345326','5','1255','',17,2,3);
INSERT INTO "django_admin_log" VALUES (82,'2023-09-04 20:30:07.347187','4','7941','',17,2,3);
INSERT INTO "django_admin_log" VALUES (83,'2023-09-04 20:30:07.349786','3','1255','',17,2,3);
INSERT INTO "django_admin_log" VALUES (84,'2023-09-04 20:30:07.352741','2','1255','',17,2,3);
INSERT INTO "django_admin_log" VALUES (85,'2023-09-04 20:30:07.354868','1','1255','',17,2,3);
INSERT INTO "django_admin_log" VALUES (86,'2023-09-04 20:32:21.637032','8','3897','',17,2,3);
INSERT INTO "django_admin_log" VALUES (87,'2023-09-04 20:34:17.685265','9','2198','',17,2,3);
INSERT INTO "django_admin_log" VALUES (88,'2023-09-04 21:38:15.766397','15','8415','',17,2,3);
INSERT INTO "django_admin_log" VALUES (89,'2023-09-04 21:38:15.775791','14','8415','',17,2,3);
INSERT INTO "django_admin_log" VALUES (90,'2023-09-04 21:38:15.777652','13','874','',17,2,3);
INSERT INTO "django_admin_log" VALUES (91,'2023-09-04 21:38:15.780143','12','874','',17,2,3);
INSERT INTO "django_admin_log" VALUES (92,'2023-09-04 21:38:15.783270','11','4087','',17,2,3);
INSERT INTO "django_admin_log" VALUES (93,'2023-09-04 21:38:15.785260','10','8812','',17,2,3);
INSERT INTO "django_admin_log" VALUES (94,'2023-09-04 22:29:36.443511','21','test6785','',17,2,3);
INSERT INTO "django_admin_log" VALUES (95,'2023-09-04 22:54:15.046480','23','test8693','',17,2,3);
INSERT INTO "django_admin_log" VALUES (96,'2023-11-16 20:23:18.206778','27','test6499','',17,2,3);
INSERT INTO "django_admin_log" VALUES (97,'2024-07-30 15:30:51.744859','1','coach object (1)','[{"added": {}}]',18,16,1);
INSERT INTO "django_admin_log" VALUES (98,'2024-07-30 15:55:13.315499','1','كورس التسويق','[{"changed": {"fields": ["\u0645\u062f\u0631\u0628 \u0627\u0644\u0643\u0648\u0631\u0633"]}}]',7,16,2);
INSERT INTO "django_admin_log" VALUES (99,'2024-07-30 16:30:55.272981','17','ahmed','[{"added": {}}]',4,16,1);
INSERT INTO "django_admin_log" VALUES (100,'2024-07-30 16:31:33.506175','2','أحمد طه','[{"added": {}}]',18,16,1);
INSERT INTO "django_admin_log" VALUES (101,'2024-07-30 16:31:51.097148','2','كورس إنجليزي','[{"added": {}}]',7,16,1);
INSERT INTO "django_admin_log" VALUES (102,'2024-07-30 16:33:54.466784','1','المدربين','[{"added": {}}]',3,16,1);
INSERT INTO "django_admin_log" VALUES (103,'2024-07-30 16:34:11.890951','17','ahmed','[{"changed": {"fields": ["Staff status", "Groups"]}}]',4,16,2);
INSERT INTO "django_admin_log" VALUES (104,'2024-07-30 16:51:56.855179','2','كورس إنجليزي','[{"changed": {"fields": ["\u0642\u064a\u0645\u0629 \u0627\u0644\u0625\u0634\u062a\u0631\u0627\u0643 \u0634\u0647\u0631\u064a"]}}]',7,16,2);
INSERT INTO "django_admin_log" VALUES (105,'2024-07-30 16:53:12.081728','1','كورس التسويق','[{"changed": {"fields": ["\u0642\u064a\u0645\u0629 \u0627\u0644\u0625\u0634\u062a\u0631\u0627\u0643 \u0634\u0647\u0631\u064a"]}}]',7,16,2);
INSERT INTO "django_admin_log" VALUES (106,'2024-07-30 16:54:03.296549','1','كورس التسويق','[{"changed": {"fields": ["\u0645\u062f\u0631\u0628 \u0627\u0644\u0643\u0648\u0631\u0633"]}}]',7,16,2);
INSERT INTO "django_admin_log" VALUES (107,'2024-07-30 16:57:02.759018','1','كورس التسويق','[{"changed": {"fields": ["\u0642\u064a\u0645\u0629 \u0627\u0644\u0625\u0634\u062a\u0631\u0627\u0643 \u0634\u0647\u0631\u064a"]}}]',7,16,2);
INSERT INTO "django_admin_log" VALUES (108,'2024-07-30 19:48:35.800980','14','sultanpasha','[{"changed": {"fields": ["password"]}}]',4,16,2);
INSERT INTO "django_admin_log" VALUES (109,'2024-07-31 15:54:04.030553','2','أحمد طه','[{"changed": {"fields": ["\u0628\u0631\u064a\u062f \u0627\u0644\u0645\u062f\u0631\u0628"]}}]',18,16,2);
INSERT INTO "django_admin_log" VALUES (110,'2024-07-31 15:54:15.847339','1','سلطان','[{"changed": {"fields": ["\u0628\u0631\u064a\u062f \u0627\u0644\u0645\u062f\u0631\u0628"]}}]',18,16,2);
INSERT INTO "django_admin_log" VALUES (111,'2024-07-31 19:02:52.183254','1','كورس التسويق','[{"changed": {"fields": ["\u0645\u062f\u0631\u0628 \u0627\u0644\u0643\u0648\u0631\u0633"]}}]',7,16,2);
INSERT INTO "django_admin_log" VALUES (112,'2024-08-01 20:04:26.610223','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0643\u0648\u0631\u0633\u0627\u062a \u0627\u0644\u0637\u0627\u0644\u0628", "\u062d\u0627\u0644\u0629 \u0627\u0644\u0637\u0627\u0644\u0628"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (113,'2024-08-01 20:08:19.452950','17','ahmed','[{"changed": {"fields": ["User permissions"]}}]',4,16,2);
INSERT INTO "django_admin_log" VALUES (114,'2024-08-01 20:09:43.840086','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0643\u0648\u0631\u0633\u0627\u062a \u0627\u0644\u0637\u0627\u0644\u0628"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (115,'2024-08-01 20:29:48.435392','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u062d\u0627\u0644\u0629 \u0627\u0644\u0637\u0627\u0644\u0628"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (116,'2024-08-01 21:04:42.886497','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0643\u0648\u0631\u0633\u0627\u062a \u0627\u0644\u0637\u0627\u0644\u0628"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (117,'2024-08-01 21:06:18.722937','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0643\u0648\u0631\u0633\u0627\u062a \u0627\u0644\u0637\u0627\u0644\u0628"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (118,'2024-08-01 21:06:44.364756','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (119,'2024-08-01 21:12:32.090501','8','اسم الطالب:سلطان عبدالكريم سلطان','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647", "\u0627\u0644\u0646\u0642\u0627\u0637"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (120,'2024-08-01 21:29:23.142472','3','3- محاضره تجريبيه من يوتيوب, من فرع كورس إنجليزي','[{"added": {}}]',8,17,1);
INSERT INTO "django_admin_log" VALUES (121,'2024-08-01 21:50:09.964369','3','3- محاضره تجريبيه من يوتيوب, من فرع كورس إنجليزي','[{"changed": {"fields": ["\u0644\u064a\u0646\u0643 \u0627\u0644\u062d\u0644\u0642\u0647 \u0645\u0646 \u0627\u0644\u064a\u0648\u062a\u064a\u0648\u0628"]}}]',8,16,2);
INSERT INTO "django_admin_log" VALUES (122,'2024-08-02 00:13:59.291347','18','Sultan','',4,16,3);
INSERT INTO "django_admin_log" VALUES (123,'2024-08-02 00:13:59.294509','19','amar','',4,16,3);
INSERT INTO "django_admin_log" VALUES (124,'2024-08-02 00:14:42.734113','9','اسم الطالب:سلطان عبدالكريم سلطان','',9,16,3);
INSERT INTO "django_admin_log" VALUES (125,'2024-08-02 00:17:07.386173','20','amar','',4,16,3);
INSERT INTO "django_admin_log" VALUES (126,'2024-08-02 00:26:39.286683','21','amar','',4,16,3);
INSERT INTO "django_admin_log" VALUES (127,'2024-08-02 00:27:32.284335','22','amar','',4,16,3);
INSERT INTO "django_admin_log" VALUES (128,'2024-08-03 16:57:48.010051','26','hassen123','',4,16,3);
INSERT INTO "django_admin_log" VALUES (129,'2024-08-04 00:58:32.605245','16','اسم الطالب:حسن علي بسيوني','[{"changed": {"fields": ["\u0643\u0648\u0631\u0633\u0627\u062a \u0627\u0644\u0637\u0627\u0644\u0628"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (130,'2024-08-04 01:00:17.174720','16','اسم الطالب:حسن علي بسيوني','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (131,'2024-08-04 01:29:37.006445','16','اسم الطالب:حسن علي بسيوني','[{"changed": {"fields": ["\u0627\u0644\u0646\u0642\u0627\u0637"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (132,'2024-08-04 01:31:28.541595','16','اسم الطالب:حسن علي بسيوني','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647", "\u0627\u0644\u0646\u0642\u0627\u0637"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (133,'2024-08-04 01:31:50.711924','16','اسم الطالب:حسن علي بسيوني','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647", "\u0643\u0648\u0631\u0633\u0627\u062a \u0627\u0644\u0637\u0627\u0644\u0628", "\u0627\u0644\u0646\u0642\u0627\u0637"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (134,'2024-08-04 01:31:56.282692','16','اسم الطالب:حسن علي بسيوني','[{"changed": {"fields": ["\u0627\u0644\u0646\u0642\u0627\u0637"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (135,'2024-08-04 01:32:27.347852','16','اسم الطالب:حسن علي بسيوني','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647", "\u0643\u0648\u0631\u0633\u0627\u062a \u0627\u0644\u0637\u0627\u0644\u0628"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (136,'2024-08-04 01:32:42.796046','16','اسم الطالب:حسن علي بسيوني','[{"changed": {"fields": ["\u0643\u0648\u0631\u0633\u0627\u062a \u0627\u0644\u0637\u0627\u0644\u0628"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (137,'2024-08-04 01:32:54.033549','16','اسم الطالب:حسن علي بسيوني','[{"changed": {"fields": ["\u0643\u0648\u0631\u0633\u0627\u062a \u0627\u0644\u0637\u0627\u0644\u0628"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (138,'2024-08-04 01:33:12.937007','16','اسم الطالب:حسن علي بسيوني','[{"changed": {"fields": ["\u0643\u0648\u0631\u0633\u0627\u062a \u0627\u0644\u0637\u0627\u0644\u0628"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (139,'2024-08-04 01:33:32.737940','16','اسم الطالب:حسن علي بسيوني','[{"changed": {"fields": ["\u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0627\u062a \u0627\u0644\u0645\u0646\u062a\u0647\u064a\u0647", "\u0643\u0648\u0631\u0633\u0627\u062a \u0627\u0644\u0637\u0627\u0644\u0628"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (140,'2024-08-04 01:35:13.279518','15','1','',4,16,3);
INSERT INTO "django_admin_log" VALUES (141,'2024-08-04 01:35:13.282768','25','ali','',4,16,3);
INSERT INTO "django_admin_log" VALUES (142,'2024-08-04 01:35:13.285581','24','alielmasry','',4,16,3);
INSERT INTO "django_admin_log" VALUES (143,'2024-08-04 01:35:13.288445','23','amar','',4,16,3);
INSERT INTO "django_admin_log" VALUES (144,'2024-08-04 01:35:13.290448','27','hassen123','',4,16,3);
INSERT INTO "django_admin_log" VALUES (145,'2024-08-04 01:54:48.564983','2','saskeadmin','[{"changed": {"fields": ["password"]}}]',4,16,2);
INSERT INTO "django_admin_log" VALUES (146,'2024-08-04 03:01:46.010261','17','اسم الطالب:حسن علي بسيوني','[{"changed": {"fields": ["\u0627\u0644\u0646\u0642\u0627\u0637"]}}]',9,16,2);
INSERT INTO "django_admin_log" VALUES (147,'2024-08-06 23:56:50.981007','2','أحمد طه','[{"changed": {"fields": ["\u0628\u0631\u064a\u062f \u0627\u0644\u0645\u062f\u0631\u0628"]}}]',18,16,2);
INSERT INTO "django_admin_log" VALUES (148,'2024-08-06 23:57:04.072814','28','new3020','',17,16,3);
INSERT INTO "django_admin_log" VALUES (149,'2024-08-06 23:58:06.810317','1','المدربين','[{"changed": {"fields": ["Permissions"]}}]',3,16,2);
INSERT INTO "django_admin_log" VALUES (150,'2024-08-06 23:59:51.860358','1','إعلان إفتتاح المنصه','[{"changed": {"fields": ["\u0627\u0644\u0639\u0646\u0648\u0627\u0646", "\u062a\u0641\u0627\u0635\u064a\u0644 \u0627\u0644\u0625\u0639\u0644\u0627\u0646"]}}]',16,16,2);
INSERT INTO "django_admin_log" VALUES (151,'2024-08-07 00:00:34.563323','2','إعلان كورس تعلم البرمجه','[{"changed": {"fields": ["\u0627\u0644\u0639\u0646\u0648\u0627\u0646", "\u062a\u0641\u0627\u0635\u064a\u0644 \u0627\u0644\u0625\u0639\u0644\u0627\u0646"]}}]',16,16,2);
INSERT INTO "django_admin_log" VALUES (152,'2024-08-07 00:00:56.181727','1','إعلان إفتتاح المنصه','[{"changed": {"fields": ["\u0635\u0648\u0631\u0629 \u0627\u0644\u0625\u0639\u0644\u0627\u0646"]}}]',16,16,2);
INSERT INTO "django_admin_log" VALUES (153,'2024-08-07 00:01:18.109608','2','إعلان كورس تعلم البرمجه','[{"changed": {"fields": ["\u0635\u0648\u0631\u0629 \u0627\u0644\u0625\u0639\u0644\u0627\u0646"]}}]',16,16,2);
INSERT INTO "django_admin_log" VALUES (154,'2024-08-07 00:01:38.903228','2','كورس البرمجه','[{"changed": {"fields": ["\u0627\u0633\u0645 \u0627\u0644\u0643\u0648\u0631\u0633"]}}]',7,16,2);
INSERT INTO "django_admin_log" VALUES (155,'2024-08-07 00:02:38.738831','2','إعلان كورس تعلم البرمجه','[{"changed": {"fields": ["\u062a\u0641\u0627\u0635\u064a\u0644 \u0627\u0644\u0625\u0639\u0644\u0627\u0646"]}}]',16,16,2);
INSERT INTO "django_admin_log" VALUES (156,'2024-08-07 00:09:13.017108','2','كورس البرمجه','[{"changed": {"fields": ["\u0645\u062f\u0631\u0628 \u0627\u0644\u0643\u0648\u0631\u0633"]}}]',7,16,2);
INSERT INTO "django_admin_log" VALUES (157,'2024-08-07 00:09:19.684568','1','كورس التسويق','[{"changed": {"fields": ["\u0645\u062f\u0631\u0628 \u0627\u0644\u0643\u0648\u0631\u0633"]}}]',7,16,2);
INSERT INTO "django_admin_log" VALUES (158,'2024-08-07 00:09:26.852955','2','كورس البرمجه','[{"changed": {"fields": ["\u0642\u064a\u0645\u0629 \u0627\u0644\u0625\u0634\u062a\u0631\u0627\u0643 \u0634\u0647\u0631\u064a"]}}]',7,16,2);
INSERT INTO "auth_user_user_permissions" VALUES (1,17,36);
INSERT INTO "auth_user_groups" VALUES (1,17,1);
INSERT INTO "auth_group_permissions" VALUES (1,1,25);
INSERT INTO "auth_group_permissions" VALUES (2,1,29);
INSERT INTO "auth_group_permissions" VALUES (3,1,36);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2023-08-12 21:38:18.943921');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2023-08-12 21:38:18.970427');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2023-08-12 21:38:19.038031');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2023-08-12 21:38:19.075399');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2023-08-12 21:38:19.096175');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2023-08-12 21:38:19.126799');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2023-08-12 21:38:19.139627');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2023-08-12 21:38:19.156591');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2023-08-12 21:38:19.165817');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2023-08-12 21:38:19.183520');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2023-08-12 21:38:19.185879');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2023-08-12 21:38:19.196070');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2023-08-12 21:38:19.216603');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2023-08-12 21:38:19.228904');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2023-08-12 21:38:19.240613');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2023-08-12 21:38:19.250427');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2023-08-12 21:38:19.263604');
INSERT INTO "django_migrations" VALUES (18,'home','0001_initial','2023-08-12 21:38:19.272914');
INSERT INTO "django_migrations" VALUES (19,'home','0002_auto_20220829_0404','2023-08-12 21:38:19.289359');
INSERT INTO "django_migrations" VALUES (20,'home','0003_remove_lessons_limg','2023-08-12 21:38:19.299196');
INSERT INTO "django_migrations" VALUES (21,'home','0004_auto_20220829_0417','2023-08-12 21:38:19.315526');
INSERT INTO "django_migrations" VALUES (22,'home','0005_auto_20220829_1703','2023-08-12 21:38:19.331468');
INSERT INTO "django_migrations" VALUES (23,'tasks','0001_initial','2023-08-12 21:38:19.343109');
INSERT INTO "django_migrations" VALUES (24,'reports','0001_initial','2023-08-12 21:38:19.394821');
INSERT INTO "django_migrations" VALUES (25,'sessions','0001_initial','2023-08-12 21:38:19.401186');
INSERT INTO "django_migrations" VALUES (26,'students','0001_initial','2023-08-12 21:38:19.429570');
INSERT INTO "django_migrations" VALUES (27,'students','0002_remove_student_sidnumber','2023-08-12 21:38:19.463258');
INSERT INTO "django_migrations" VALUES (28,'students','0003_student_sidnumber','2023-08-12 21:38:19.492749');
INSERT INTO "django_migrations" VALUES (29,'ads','0001_initial','2023-08-16 18:12:42.772345');
INSERT INTO "django_migrations" VALUES (30,'ads','0002_rename_adds_ads','2023-08-16 18:14:19.684784');
INSERT INTO "django_migrations" VALUES (31,'ads','0003_rename_ads_news','2023-08-16 18:22:17.693952');
INSERT INTO "django_migrations" VALUES (32,'ads','0004_alter_news_options','2023-08-16 18:25:24.953207');
INSERT INTO "django_migrations" VALUES (33,'ads','0005_auto_20230816_2126','2023-08-16 18:26:34.404537');
INSERT INTO "django_migrations" VALUES (34,'news','0001_initial','2023-08-16 18:34:44.781298');
INSERT INTO "django_migrations" VALUES (35,'students','0004_student_simg','2023-08-23 03:04:57.374656');
INSERT INTO "django_migrations" VALUES (36,'students','0005_alter_student_simg','2023-08-23 20:03:19.678958');
INSERT INTO "django_migrations" VALUES (37,'live','0001_initial','2023-09-01 19:42:27.921104');
INSERT INTO "django_migrations" VALUES (38,'live','0002_live_lroom','2023-09-01 20:45:23.493755');
INSERT INTO "django_migrations" VALUES (39,'live','0003_alter_live_lurl','2023-09-04 20:24:57.435286');
INSERT INTO "django_migrations" VALUES (40,'live','0004_alter_live_lurl','2023-09-04 20:25:24.334422');
INSERT INTO "django_migrations" VALUES (41,'live','0005_alter_live_lurl','2023-09-04 20:29:32.760535');
INSERT INTO "django_migrations" VALUES (42,'coaches','0001_initial','2024-07-30 15:24:25.566849');
INSERT INTO "django_migrations" VALUES (43,'home','0006_auto_20240730_1824','2024-07-30 15:24:25.640770');
INSERT INTO "django_migrations" VALUES (44,'live','0006_alter_live_options','2024-07-30 15:24:25.666193');
INSERT INTO "django_migrations" VALUES (45,'news','0002_alter_news_options','2024-07-30 15:24:25.672664');
INSERT INTO "django_migrations" VALUES (46,'coaches','0002_auto_20240730_1951','2024-07-30 16:51:39.540815');
INSERT INTO "django_migrations" VALUES (47,'home','0007_catgory_cprice','2024-07-30 16:51:39.573763');
INSERT INTO "django_migrations" VALUES (48,'home','0008_alter_catgory_ccoach','2024-07-30 16:54:00.042793');
INSERT INTO "django_migrations" VALUES (49,'students','0006_student_sstatus','2024-07-31 15:51:41.082684');
INSERT INTO "django_migrations" VALUES (50,'coaches','0003_coach_cemail','2024-07-31 15:53:45.450745');
INSERT INTO "django_migrations" VALUES (51,'home','0009_alter_catgory_cimage_alter_catgory_name','2024-08-01 15:07:01.757564');
INSERT INTO "django_migrations" VALUES (52,'students','0007_student_scourses','2024-08-01 15:07:01.821158');
INSERT INTO "django_migrations" VALUES (53,'students','0008_remove_student_scourses','2024-08-01 15:08:09.360582');
INSERT INTO "django_migrations" VALUES (54,'students','0009_student_scourses','2024-08-01 15:09:05.619882');
INSERT INTO "django_migrations" VALUES (55,'students','0010_remove_student_scourses_student_scourses','2024-08-01 15:10:23.319755');
INSERT INTO "django_migrations" VALUES (56,'students','0011_alter_student_scourses','2024-08-01 15:10:23.362313');
INSERT INTO "django_migrations" VALUES (57,'home','0010_alter_lessons_video','2024-08-01 21:24:41.855905');
INSERT INTO "django_migrations" VALUES (58,'home','0011_lessons_youtube','2024-08-01 21:25:55.684332');
INSERT INTO "django_migrations" VALUES (59,'home','0012_rename_youtube_lessons_lyoutube','2024-08-01 21:36:52.096581');
CREATE INDEX IF NOT EXISTS "home_lessons_catname_id_0fc34870" ON "home_lessons" (
	"catname_id"
);
CREATE INDEX IF NOT EXISTS "students_student_Scourses_catgory_id_143f04e5" ON "students_student_Scourses" (
	"catgory_id"
);
CREATE INDEX IF NOT EXISTS "students_student_Scourses_student_id_deaa5766" ON "students_student_Scourses" (
	"student_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "students_student_Scourses_student_id_catgory_id_5ce5593d_uniq" ON "students_student_Scourses" (
	"student_id",
	"catgory_id"
);
CREATE INDEX IF NOT EXISTS "home_catgory_CCoach_id_5547dfc8" ON "home_catgory" (
	"CCoach_id"
);
CREATE INDEX IF NOT EXISTS "live_live_Linit_id_fd7a8ae2" ON "live_live" (
	"Linit_id"
);
CREATE INDEX IF NOT EXISTS "students_student_watchedlecs_lessons_id_0bd93cb7" ON "students_student_watchedlecs" (
	"lessons_id"
);
CREATE INDEX IF NOT EXISTS "students_student_watchedlecs_student_id_6f78d6b1" ON "students_student_watchedlecs" (
	"student_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "students_student_watchedlecs_student_id_lessons_id_2410db2c_uniq" ON "students_student_watchedlecs" (
	"student_id",
	"lessons_id"
);
CREATE INDEX IF NOT EXISTS "students_student_finishedHomework_lessons_id_09b545bb" ON "students_student_finishedHomework" (
	"lessons_id"
);
CREATE INDEX IF NOT EXISTS "students_student_finishedHomework_student_id_e84cd46e" ON "students_student_finishedHomework" (
	"student_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "students_student_finishedHomework_student_id_lessons_id_8b94d5f0_uniq" ON "students_student_finishedHomework" (
	"student_id",
	"lessons_id"
);
CREATE INDEX IF NOT EXISTS "students_student_finishExam_exam_id_cc4b26f6" ON "students_student_finishExam" (
	"exam_id"
);
CREATE INDEX IF NOT EXISTS "students_student_finishExam_student_id_1f0f3aa3" ON "students_student_finishExam" (
	"student_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "students_student_finishExam_student_id_exam_id_4ebc6e44_uniq" ON "students_student_finishExam" (
	"student_id",
	"exam_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "reports_report_homerport_homeworkreport_id_3ff5d6d8" ON "reports_report_homerport" (
	"homeworkreport_id"
);
CREATE INDEX IF NOT EXISTS "reports_report_homerport_report_id_52399c92" ON "reports_report_homerport" (
	"report_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "reports_report_homerport_report_id_homeworkreport_id_8c91a6ad_uniq" ON "reports_report_homerport" (
	"report_id",
	"homeworkreport_id"
);
CREATE INDEX IF NOT EXISTS "reports_report_examReport_examreport_id_e2f52d3a" ON "reports_report_examReport" (
	"examreport_id"
);
CREATE INDEX IF NOT EXISTS "reports_report_examReport_report_id_a1db0039" ON "reports_report_examReport" (
	"report_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "reports_report_examReport_report_id_examreport_id_fcd2fc63_uniq" ON "reports_report_examReport" (
	"report_id",
	"examreport_id"
);
CREATE INDEX IF NOT EXISTS "reports_report_user_id_0a19e61e" ON "reports_report" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "reports_homeworkreport_user_id_153961dd" ON "reports_homeworkreport" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "reports_homeworkreport_lesson_id_ef9810c6" ON "reports_homeworkreport" (
	"lesson_id"
);
CREATE INDEX IF NOT EXISTS "reports_examreport_user_id_e5073a4a" ON "reports_examreport" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "reports_examreport_exam_id_1d87a6aa" ON "reports_examreport" (
	"exam_id"
);
CREATE INDEX IF NOT EXISTS "tasks_task_lesson_id_951cf04b" ON "tasks_task" (
	"lesson_id"
);
CREATE INDEX IF NOT EXISTS "tasks_task_exam_id_fc16266f" ON "tasks_task" (
	"exam_id"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
COMMIT;
