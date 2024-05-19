# Связанные таблицы

Иногда необходимо привязать несколько объектов к одному. Например: несколько товаров к продаже.
Для этого в параметрах поля используется ключ join.

## Структура

> \* Обязательные поля
{style="warning"}

| Параметр          |   Тип данных    | Описание                                                           |
|-------------------|:---------------:|--------------------------------------------------------------------|
| *connection_table |     string      | Таблица связка                                                     |
| * donor_table     |     string      | Таблица объекта связки (также объект, если не указан donor_object) |
| donor_object      |     string      | Объект связки                                                      |
| * property_article |     string      | Поля для вывода                                                    |
| * insert_property |     string      | После для связки из основного объекта                              |
| * filter_property |     string      | Поле для связки второстепенного объекта                            |
| select            | array of arrays | Кастомный заголовок элемента выпадающего списка                    |
| select_menu       | array of arrays | Кастомный заголовок выбранного элемента                            |

> В поле `select`, `select_menu` мы указываем двумерный массив строк. При обработке вторичного массива
> будет использовано первое не пустое значение. Следующая запись `["last_name", "first_name"]` означает,
> что при отсутствии значения в поле `last_name` данные будет взяты из поля `first_name`.
{style="note"}

### Пример:
```json
{
        "connection_table": "visits_clients",
        "donor_table": "clients",
        "property_article": "last_name",
        "insert_property": "visit_id",
        "filter_property": "client_id",
        "select": [
          [ "id" ],
          [ "fio", "first_name", "last_name", "patronymic" ]
        ],
        "select_menu": [
          [ "id" ],
          [ "fio" ],
          [ "phone", "second_phone"]
        ]
      }
```