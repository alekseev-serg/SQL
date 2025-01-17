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

-- Вывести суммарную стоимость книг каждого автора.
SELECT author, SUM(price * amount) AS Стоимость
FROM book
GROUP BY author;

-- Найти среднюю цену книг каждого автора.
SELECT author, ROUND(AVG(price), 2)
FROM book
GROUP BY author;

# Для каждого автора вычислить суммарную стоимость книг S (имя столбца Стоимость), а также вычислить налог
# на добавленную стоимость  для полученных сумм (имя столбца НДС ) , который включен в стоимость и составляет 18% (k=18),
# а также стоимость книг  (Стоимость_без_НДС) без него. Значения округлить до двух знаков после запятой.
SELECT author,
       SUM(price * amount)                                            as Стоимость,
       ROUND(SUM(price * amount) * 18 / 118, 2)                       as НДС,
       ROUND(SUM(price * amount) - SUM(price * amount) * 18 / 118, 2) as Стоимость_без_НДС
FROM book
GROUP BY author;
