**"ESCHOOL" test project for Greetgo**

1. Скачайте проект используя комманду:
    
    $ git clone https://github.com/Tukenbayev/Eschool

2. В файле /resources/database.propreties измените настройки БД:

    db.url - укажите URL адрес вашей БД
    db.driverClassName - название драйвера вашей БД
    
    ** Если Вы используете не MySQL DB, то в файле pom.xml подключите зависимость для вашей БД.
    
    db.username/db.password - логин/пароль
    
3. Используйте файл /resources/tablesNdata.sql для создания и заполнения тестовыми данными таблицы.

4. Build с помощью maven-a (clean install)

5. На главной странице введите login "eschool@gmail.com" password "password"
