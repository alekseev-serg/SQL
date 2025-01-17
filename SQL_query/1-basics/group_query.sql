-- Выбрать различных авторов, книги которых хранятся в таблице book.
SELECT DISTINCT author
FROM book;

SELECT book.author
FROM book
GROUP BY author;

-- Подробно рассмотрим, как осуществляется группировка данных по некоторому столбцу и вычисления над группой
SELECT author, SUM(amount), COUNT(amount)
FROM book
GROUP BY author;

-- Посчитать, сколько экземпляров книг каждого автора хранится на складе.
SELECT author, SUM(amount)
FROM book
GROUP BY author;

-- Посчитать, сколько различных книг каждого автора хранится на складе.
SELECT author, COUNT(author), COUNT(amount)
FROM book
GROUP BY author;

-- Посчитать, количество различных книг и количество экземпляров книг каждого автора , хранящихся на складе.  Столбцы назвать Автор, Различных_книг и Количество_экземпляров соответственно.
SELECT author        as Автор,
       COUNT(author) as Различных_книг,
       SUM(amount)   as Количество_экземпляров
FROM book
GROUP BY author;

-- Вывести минимальную цену книги каждого автора
SELECT author, MIN(price) as min_price
FROM book
GROUP BY author;

-- Вывести фамилию и инициалы автора, минимальную, максимальную и среднюю цену книг каждого автора.
-- Вычисляемые столбцы назвать Минимальная_цена, Максимальная_цена и Средняя_цена соответственно.
SELECT author, MIN(price) as Минимальная_цена, MAX(price) as Максимальная_цена, AVG(price) as Средняя_цена
FROM book
GROUP BY author;