# Проверка случайности

## Внутренний рендом 0-37, 1000 значений

- [скрипт script.R](inner_random_37/script_solidity.R)

- [данные results](inner_random_37/results.txt)

![histo](inner_random_37/histo.png)

### Shapiro-Wilk normality test > 0.05 Числа случайны

W = 0.99794, p-value = 0.2574



----------------------------------------------------------------------------------


## Внешний рендом на "движениях" мышки)

- [скрипт script.R](outer_random_js/script_js.R)

- [скрипт init.js](outer_random_js/init.js)

- [данные results](outer_random_js/results.csv)

![histo](outer_random_js/histo.png)

### Shapiro-Wilk normality test > 0.05 Числа случайны

W = 0.99938, p-value = 0.7512

Как и предполагалось - "сгенерированные" специальным пользователем движения мышки дают самое случайное распределение



## Внешний рендом на window.crypto.getRandomValues

- [скрипт script.R](outer_random_js_outer/script_js_outer.R)

- [скрипт init.js](outer_random_js_outer/init.js)

- [данные results](outer_random_js_outer/results.csv)

![histo](outer_random_js_outer/histo.png)

### Shapiro-Wilk normality test > 0.05 Числа случайны

W = 0.99844, p-value = 0.5155

Второй по случайности алгоритм "криптографически" стойких случайных чисел в javascript



## Внешний рендом на server side random

- [скрипт script.R](outer_random_php/script_php.R)

- [скрипт any_data.php](outer_random_php/any_data.php)

- [данные results](outer_random_js_outer/results.csv)

![histo](outer_random_php/histo.png)

### Shapiro-Wilk normality test > 0.05 Числа случайны

W = 0.99801, p-value = 0.2852

И для сравнения - третий алгоритм самой простой серверной части