# Выбрать все записи таблицы book .
SELECT *
FROM book;

# Выбрать названия книг и их количества из таблицы book.
select author, title, price
from book;

# Выбрать все названия книг и их количества из таблицы book , для столбца title задать новое имя Название.
select title as Название, author as Автор
from book;

# Вывести всю информацию о книгах, а также для каждой позиции посчитать ее стоимость (произведение цены на количество). Вычисляемому столбцу дать имя total
select title, author, price, amount, price * amount as total
from book;
select title, amount, amount * 1.65 as pack
from book;

# В конце года цену каждой книги на складе пересчитывают – снижают ее на 30%.
# Написать SQL запрос, который из таблицы book выбирает названия, авторов, количества и вычисляет новые цены книг. Столбец с новой ценой назвать new_price, цену округлить до 2-х знаков после запятой.
SELECT title, author, amount, ROUND(price * 0.7, 2) AS new_price
FROM book;

# Для каждой книги из таблицы book установим скидку следующим образом: если количество книг меньше 4, то скидка будет составлять 50% от цены, в противном случае 30%.
select title,
       amount,
       price,
       if(amount < 4, price * 0.5, price * 0.7) as sale
from book;

# Тоже самое, плюс округление
select title,
       amount,
       price,
       round(if(amount < 4, price * 0.5, price * 0.7), 2) as sale
from book;

# Если количество книг меньше 4 , то скидка составляет 50%, для остальных книг, количество которых меньше 11,
# скидка 30%, для всех оставшихся – 10%. И еще укажем какая именно скидка на каждую книгу.
select title,
       amount,
       price,
       round(if(amount < 4, price * 0.5,
                if(amount < 11, price * 0.7, price * 0.9)), 2) as sale,
       IF(amount < 4, 'скидка 50%',
          IF(amount < 11, 'скидка 30%', 'скидка 10%')
       )                                                       AS Ваша_скидка
from book;

select author,
       title,
       round(if(author = "Булгаков М.А.", price * 1.1,
                if(author = "Есенин С.А.", price * 1.05, price * 1)), 2) as new_price
from book;

# Вывести название и цену тех книг, цены которых меньше 600 рублей.
SELECT title, price
FROM book
WHERE price < 600;

# Вывести название, автора,  цену  и количество всех книг, цена которых меньше 500 или больше 600,
# а стоимость всех экземпляров этих книг больше или равна 5000.
SELECT author, title, price
FROM book
WHERE (price < 500 or price > 600)
  and price * amount >= 5000;

# Вывести название и авторов тех книг, цены которых принадлежат интервалу от 540.50 до 800 (включая границы),
# а количество или 2, или 3, или 5, или 7 .
SELECT title, author
FROM book
WHERE (price BETWEEN 540.5 AND 800)
  AND (amount = 2 OR amount = 3 OR amount = 5 OR amount = 7);

# Вывести название, автора и цены книг. Информацию  отсортировать по названиям книг в алфавитном порядке.
SELECT title, author, price
FROM book
ORDER BY title;

# Вывести автора, название и количество книг, в отсортированном в алфавитном порядке по автору
# и по убыванию количества, для тех книг, цены которых меньше 750 рублей.
SELECT author, title, amount AS Количество
FROM book
WHERE price < 750
ORDER BY author, amount
        DESC;

# Вывести  автора и название  книг, количество которых принадлежит интервалу от 2 до 14 (включая границы).
# Информацию  отсортировать сначала по авторам (в обратном алфавитном порядке), а затем по названиям книг (по алфавиту).
SELECT author, title
FROM book
WHERE amount BETWEEN 2 and 14
ORDER BY author
        DESC, title;

# Вывести названия книг, начинающихся с буквы «Б».
SELECT title
FROM book
WHERE title LIKE 'Б%';
/* эквивалентное условие
title LIKE 'б%'
*/

# Вывести название книг, состоящих ровно из 5 букв.
SELECT title
FROM book
WHERE title LIKE "_____";

# Вывести книги, название которых длиннее 5 символов:
SELECT title
FROM book
WHERE title LIKE "______%";
/* эквивалентные условия
title LIKE "%______"
title LIKE "%______%"
*/

# Вывести названия книг, которые состоят ровно из одного слова, если считать, что слова в названии отделяются друг от друга пробелами.
SELECT title
FROM book
WHERE title NOT LIKE "% %";

# Вывести название и автора тех книг, название которых состоит из двух и более слов, а инициалы автора содержат букву «С».
# Считать, что в названии слова отделяются друг от друга пробелами и не содержат знаков препинания, между фамилией
# автора и инициалами обязателен пробел, инициалы записываются без пробела в формате: буква, точка, буква, точка.
# Информацию отсортировать по названию книги в алфавитном порядке.
SELECT title, author
FROM book
WHERE TRIM(title) LIKE "%_ _%"
  AND author LIKE "%С.%"
ORDER BY title ASC;