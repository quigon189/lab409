## **Цель работы:**
Изучить различные типы условий в предложении WHERE для работы с числовыми, текстовыми, логическими данными, датами и временем.

**Программное обеспечение:** PostgreSQL, DBeaver

---

## **Подготовка базы данных**

### **Создание тестовой таблицы с разнообразными типами данных**

```sql
SET search_path TO ваш_логин;

CREATE TABLE company_employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    age INTEGER,
    is_active BOOLEAN DEFAULT TRUE,
    hire_date DATE,
    last_login TIMESTAMP,
    performance_rating DECIMAL(3,1),
    projects_completed INTEGER,
    birth_date DATE,
    work_schedule VARCHAR(20), -- 'full-time', 'part-time', 'remote'
    skills TEXT[] -- массив навыков
);
```

### **Заполнение таблицы тестовыми данными**

```sql
INSERT INTO company_employees 
(first_name, last_name, email, department, salary, age, is_active, hire_date, last_login, performance_rating, projects_completed, birth_date, work_schedule, skills) VALUES
('Иван', 'Петров', 'ivan.petrov@company.com', 'IT', 75000.00, 32, TRUE, '2020-03-15', '2024-01-15 09:30:00', 4.5, 12, '1991-05-20', 'full-time', '{"Python", "SQL", "Docker"}'),
('Мария', 'Сидорова', 'maria.sidorova@company.com', 'HR', 55000.00, 28, TRUE, '2021-06-10', '2024-01-14 14:20:00', 4.2, 8, '1995-08-12', 'full-time', '{"Recruitment", "Training"}'),
('Алексей', 'Козлов', 'alexey.kozlov@company.com', 'IT', 82000.00, 35, FALSE, '2019-11-05', '2023-12-20 11:45:00', 4.8, 18, '1988-12-03', 'remote', '{"Java", "Spring", "Kubernetes"}'),
('Ольга', 'Иванова', 'olga.ivanova@company.com', 'Finance', 68000.00, 29, TRUE, '2022-01-20', '2024-01-15 08:15:00', 4.0, 6, '1994-03-25', 'part-time', '{"Excel", "Accounting"}'),
('Дмитрий', 'Смирнов', 'dmitry.smirnov@company.com', 'Marketing', 72000.00, 31, TRUE, '2020-09-12', '2024-01-13 16:40:00', 4.3, 10, '1992-11-08', 'full-time', '{"SEO", "Analytics", "Content"}'),
('Елена', 'Попова', 'elena.popova@company.com', 'IT', 78000.00, 27, TRUE, '2021-04-18', '2024-01-14 10:20:00', 4.6, 14, '1996-07-30', 'remote', '{"JavaScript", "React", "Node.js"}'),
('Сергей', 'Васильев', 'sergey.vasiliev@company.com', 'Sales', 65000.00, 33, TRUE, '2018-07-22', '2024-01-12 12:30:00', 3.8, 9, '1990-09-14', 'full-time', '{"Negotiation", "CRM"}'),
('Анна', 'Морозова', 'anna.morozova@company.com', 'Finance', 71000.00, 26, FALSE, '2022-03-05', '2023-11-30 09:10:00', 4.1, 7, '1997-01-18', 'part-time', '{"Taxation", "Audit"}'),
('Павел', 'Никитин', 'pavel.nikitin@company.com', 'IT', 85000.00, 40, TRUE, '2017-05-30', '2024-01-15 13:25:00', 4.9, 22, '1983-04-12', 'full-time', '{"Python", "ML", "AI", "Docker"}'),
('Юлия', 'Федорова', 'yulia.fedorova@company.com', 'HR', 58000.00, 30, TRUE, '2020-12-01', '2024-01-14 15:50:00', 4.4, 11, '1993-06-28', 'full-time', '{"Onboarding", "Benefits"}');
```

---

## **Задания для исследования условий WHERE**

### **1. Числовые условия**

```sql
-- Сравнение чисел
SELECT * FROM company_employees WHERE salary > 70000;

-- Диапазон значений
SELECT * FROM company_employees WHERE salary BETWEEN 60000 AND 80000;

-- Неравенство
SELECT * FROM company_employees WHERE age <> 30;

-- Множественные условия
SELECT * FROM company_employees WHERE salary >= 70000 AND age < 35;

-- Арифметические операции в условиях
SELECT * FROM company_employees WHERE salary * 1.1 > 80000;
```

### **2. Текстовые условия**

```sql
-- Точное совпадение
SELECT * FROM company_employees WHERE department = 'IT';

-- Частичное совпадение (LIKE)
SELECT * FROM company_employees WHERE first_name LIKE 'А%';

-- Поиск подстроки
SELECT * FROM company_employees WHERE last_name LIKE '%ов%';

-- Нечувствительность к регистру (ILIKE)
SELECT * FROM company_employees WHERE email ILIKE '%COMPANY.COM';

-- Отрицание шаблона
SELECT * FROM company_employees WHERE department NOT LIKE 'H%';
```

### **3. Логические условия**

```sql
-- Булевы значения
SELECT * FROM company_employees WHERE is_active = TRUE;

-- Отрицание
SELECT * FROM company_employees WHERE NOT is_active;

-- Комбинация с другими условиями
SELECT * FROM company_employees WHERE is_active = TRUE AND salary > 65000;
```

### **4. Условия с датами**

```sql
-- Сравнение дат
SELECT * FROM company_employees WHERE hire_date > '2021-01-01';

-- Диапазон дат
SELECT * FROM company_employees WHERE hire_date BETWEEN '2020-01-01' AND '2021-12-31';

-- Функции дат
SELECT * FROM company_employees WHERE EXTRACT(YEAR FROM hire_date) = 2020;

-- Возрастные расчеты
SELECT * FROM company_employees WHERE birth_date < '1995-01-01';

-- Интервалы
SELECT * FROM company_employees WHERE hire_date > CURRENT_DATE - INTERVAL '2 years';
```

### **5. Условия с временными метками**

```sql
-- Точное время
SELECT * FROM company_employees WHERE last_login > '2024-01-14 00:00:00';

-- За последние N дней
SELECT * FROM company_employees WHERE last_login > CURRENT_TIMESTAMP - INTERVAL '3 days';

-- Временные диапазоны
SELECT * FROM company_employees WHERE last_login BETWEEN '2024-01-13 00:00:00' AND '2024-01-15 23:59:59';

-- Извлечение компонентов времени
SELECT * FROM company_employees WHERE EXTRACT(HOUR FROM last_login) BETWEEN 9 AND 17;
```

### **6. Комбинированные условия**

```sql
-- Множественные AND/OR
SELECT * FROM company_employees 
WHERE department = 'IT' AND (salary > 70000 OR is_active = FALSE);

-- IN для множественных значений
SELECT * FROM company_employees 
WHERE department IN ('IT', 'Finance') AND age BETWEEN 25 AND 35;

-- Комплексные условия
SELECT * FROM company_employees 
WHERE (salary > 65000 OR performance_rating >= 4.5) 
AND hire_date > '2020-01-01' 
AND is_active = TRUE;
```

### **7. Условия с массивами**

```sql
-- Содержит элемент
SELECT * FROM company_employees WHERE 'Python' = ANY(skills);

-- Длина массива
SELECT * FROM company_employees WHERE array_length(skills, 1) > 2;

-- Совпадение нескольких элементов
SELECT * FROM company_employees WHERE skills && '{"Python", "Java"}';
```

### **8. Условия с NULL значениями**

```sql
-- Проверка на NULL
SELECT * FROM company_employees WHERE performance_rating IS NULL;

-- Проверка на NOT NULL
SELECT * FROM company_employees WHERE last_login IS NOT NULL;

-- Комбинация с другими условиями
SELECT * FROM company_employees 
WHERE performance_rating IS NOT NULL AND performance_rating > 4.0;
```

### **9. Дополнительные условия**

```sql
-- CASE в условиях
SELECT first_name, last_name, salary,
       CASE 
           WHEN salary > 80000 THEN 'Высокая'
           WHEN salary > 65000 THEN 'Средняя'
           ELSE 'Низкая'
       END as salary_category
FROM company_employees;

-- Подзапросы в условиях
SELECT * FROM company_employees 
WHERE salary > (SELECT AVG(salary) FROM company_employees);

-- Регулярные выражения
SELECT * FROM company_employees WHERE first_name ~ '^[А-Я]а';
```

---

## **Практические задания для студентов**

### **Задание 1: Базовые условия**
1. Найти всех сотрудников из отдела IT
2. Найти сотрудников с зарплатой больше 70000
3. Найти активных сотрудников моложе 30 лет

### **Задание 2: Текстовые условия**
1. Найти сотрудников, чья фамилия заканчивается на "ова"
2. Найти сотрудников с email в домене company.com
3. Найти сотрудников, у которых в навыках есть "Python"

### **Задание 3: Работа с датами**
1. Найти сотрудников, принятых на работу в 2021 году
2. Найти сотрудников, которые заходили в систему в последние 2 дня
3. Найти сотрудников старше 35 лет

### **Задание 4: Комбинированные условия**
1. Найти IT-специалистов с зарплатой от 70000 до 85000
2. Найти неактивных сотрудников из отделов Finance или HR
3. Найти сотрудников на удаленной работе с рейтингом выше 4.5

### **Задание 5: Сложные запросы**
1. Найти сотрудников с более чем 2 навыками и высокой зарплатой
2. Найти сотрудников, работающих полный день и имеющих рейтинг выше среднего
3. Найти сотрудников, которые либо молоды (до 30), либо имеют высокий рейтинг (>4.5)

---

## **Требования к отчету**

1. **SQL-запросы** для каждого задания
2. **Результаты выполнения** (скриншоты или текстовый вывод)
3. **Анализ** использованных условий:
   - Тип условия (числовое, текстовое, дата и т.д.)
   - Использованные операторы
   - Особенности работы условий

---

## **Контрольные вопросы**

1. **В чем разница между LIKE и ILIKE?**
2. **Как работает оператор BETWEEN с датами?**
3. **Какие способы поиска по массивам вы знаете?**
4. **Как проверить значение на NULL?**
5. **В чем особенность работы с временными метками?**
6. **Как использовать регулярные выражения в условиях WHERE?**
7. **Какие операторы используются для работы с интервалами?**
8. **Как комбинировать несколько условий в одном запросе?**