# Генератор случайных чисел

## Поставновка задачи

Нахождение наилучшего алгоритма получения "случайного" числа в Solidity

## План работы

1.0. [Анализ существующих решений](1.examples/analyse.md)

1.1. Составление списка контрактов с различными алгоритмами получения случайного числа (2.tests)

1.2. Вычленение из каждого из них кода собственно получения "случайного"

2.0. Выбор алгоритма (с внешней реализацией или внутренней)

2.1. [Контракт "мне нужен рендом из блокхеша"](2.tests/inner_random/readme.md)

- [Random.sol](2.tests/inner_random/truf/contracts/Random.sol)

Стоимость создания: 66299 + 346200 - один раз и навсегда

Стоимость заявки: 77339 + Стоимость генерации: 48517 => Cтоимость одного числа = 125856

2.2. [Контракт "я хочу генерировать рендомы + мне нужен рендом"](2.tests/outer_random/readme.md)

- [OutRandom.sol](2.tests/outer_random/truf/contracts/OutRandom.sol)
- [Provider.sol](2.tests/outer_random/truf/contracts/Provider.sol)

Стоимость создания базового: 45957 + 325800 - один раз и навсегда

Стоимость создания провайдера: 20601 + 295800 + 20734 = 337135 (установка админа, можно прописать сразу главный контракт) - делим на количество разрешенных рендомов одному провайдеру

Вызовы: 

предложение рендома + 66673

заявка на рендом + 86740

метка админом предложения +  21094

метка админом заявки + 41426

отправка провайдером рендома + 21818

= 237751

2.3. Прогон вариантов на тестовом блокчейне эфира

- [Result Inner Random.csv](2.tests/inner_random/www/results.csv)

- внешний - рендом реальный через практически любой "движок"

2.4. Оценка "случайности" полученных случайных чисел каждым вариантом (предлагается проверить что распределение = нормальное)

http://r-analytics.blogspot.com/2012/06/blog-post_14.html#.WYhL7uklEuU

3.0 Результат работы

3.1. Составление таблицы "цена алгоритма" / "степень нормальности"

3.2. Создание окончального смартконтракта "случайного числа"

## Результат работы

Контракт с наиболее случайным из алгоритмов "случайного числа" либо существующих, либо их модификаций


