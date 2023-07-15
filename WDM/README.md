# WDM (Windows Driver Model)

## Зміст - in process
1. [Послідовність звернення ОС до підпрограми у драйвері (скорочено)](#r1)
20. [Посилання](#references)
______


## <a name="r1">Послідовність звернення ОС до підпрограми у драйвері (скорочено)</a>

1. Користувач підключає пристрій та система завантажує виконуваний файл нашого драйвера в віртуальну пам'ять і викликає функцію **DriverEntry**. **DriverEntry** виконує кілька дій і повертається
2. Менеджер **Plug and Play** (**PnP Manager**) викликає нашу функцію **AddDevice**, яка також виконує кілька дій і повертається
3. **PnP Manager** відправляє нам кілька **IRP** (*Input/Output Request Packets*). Наша функція обробки диспетчеризації обробляє кожен **IRP** по черзі і повертається
4. Додаток відкриває дескриптор до нашого пристрою і система відправляє нам ще один **IRP**. Наша функція обробки диспетчеризації виконує деяку роботу і повертається
5. Додаток намагається прочитати деякі дані і тоді система відправляє нам **IRP**. Наша функція обробки диспетчеризації поміщає **IRP** в чергу і повертається
6. Попередня операція <u>вводу-виводу</u> завершується, посилаючи апаратне переривання, до якого наш драйвер підключений. Наша функція обробки переривання виконує деяку роботу, заплановує виклик **DPC** (Deffered Procedure Call - виклик відкладеної процедури) і повертається
7. Виконується наша функція **DPC**. Серед інших дій, вона видаляє **IRP**, яку ми поставили в чергу на кроці 5, і програмує апаратне забезпечення для зчитування даних. Після цього функція **DPC** повертається до системи
8. Проходить деякий час, протягом якого система робить багато інших коротких викликів до наших підпрограм
9. Зрештою, кінцевий користувач відключає наш пристрій. **PnP Manager** відправляє нам деякі **IRP**, які ми обробляємо і повертаємо. Операційна система викликає нашу функцію **DriverUnload**, яка, як правило, виконує невелику кількість роботи і повертається. Потім система видаляє код нашого драйвера з віртуальної пам'яті



## <a name="references">Посилання</a>