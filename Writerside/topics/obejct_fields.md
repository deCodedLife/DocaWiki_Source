# Поля объекта

> \* Обязательные параметры
{style="warning"}

| Параметр             |    Тип данных    | Описание                                                          |
|----------------------|:----------------:|-------------------------------------------------------------------|
| * title              |      string      | Название поля                                                     |
| * article            |      string      | Артикул                                                           |
| * data_type          |      string      | Тип данных как в бд                                               |
| * field_type         |      string      | Тип поля в админке                                                |
| * is_default_in_list |       bool       | Показывать поле в списке                                          |
| * is_unique          |       bool       | Аналогично уникальному ключу в бд                                 |
| * is_autofill        |       bool       | Хранить поле в базе данных                                        |
| * use_in_commands    | array of strings | Список команд в которых будет использоваться поле                 |
| require_in_commands  | array of strings | Делает поле обязательным для передачи в `data` для перечня команд |
| annotation           |      string      | Всплывающая подсказка                                             |
| is_hook              |       bool       | Вызывает команду `hook` при изменении                             |
| is_visible           |       bool       | Отображать в админке (true) по умолчанию                          |
| required_permissions | array of strings | Список доступов, необходимых для использования поля               |
| required_modules     |                  |                                                                   |
| custom_list          | array of objects | Список значений, которое может принимать поле                     |
| list_donor           |      object      | Связанный объект (только для типа поля `list`)                    |
| join                 |      object      | Связанный список объектов (только для типа поля `list`)           |
|                      |                  |                                                                   |

> Если поле используется в базе данных, его артикул должен совпадать с
> артикулом в схеме таблицы
{style="note"}

> Переданные значения в `data` JSON запроса будут проигнорированы при обработке
> маршрутизатором и не попадут в переменную `requestData`, если команда не будет передана
> в массив `use_in_commands`
{style="note"}

### Пример

```json
[
  {
    "title": "Дата и время операции",
    "article": "created_at",
    "data_type": "datetime",
    "field_type": "datetime",
    "is_default_in_list": true,
    "is_unique": false,
    "is_autofill": false,
    "use_in_commands": [
      "add",
      "get"
    ]
  },
  {
    "title": "Сотрудник",
    "article": "employee_id",
    "data_type": "integer",
    "field_type": "list",
    "is_default_in_list": true,
    "is_unique": false,
    "is_autofill": true,
    "list_donor": {
      "table": "users",
      "properties_title": "last_name",
      "select": [
        [ "id" ],
        [ "last_name" ],
        [ "first_name" ],
        [ "patronymic" ]
      ]
    },
    "use_in_commands": [
      "get",
      "add",
      "update"
    ],
    "require_in_commands": [],
    "is_visible": false
  },
  {
    "title": "Филиал",
    "article": "store_id",
    "data_type": "integer",
    "field_type": "list",
    "is_default_in_list": false,
    "is_unique": false,
    "is_autofill": true,
    "is_visible": false,
    "list_donor": {
      "table": "stores",
      "properties_title": "title"
    },
    "use_in_commands": [
      "hook",
      "add",
      "get"
    ],
    "require_in_commands": []
  },
  {
    "title": "Способ оплаты",
    "article": "pay_method",
    "data_type": "string",
    "field_type": "list",
    "is_default_in_list": true,
    "is_unique": false,
    "is_autofill": true,
    "use_in_commands": [
      "hook",
      "update",
      "add",
      "get"
    ],
    "custom_list": [
      {
        "title": "Наличные",
        "value": "cash"
      },
      {
        "title": "Безналичные",
        "value": "card"
      },
      {
        "title": "Раздельная",
        "value": "parts"
      },
      {
        "title": "Юридическое лицо",
        "value": "legalEntity"
      },
      {
        "title": "Онлайн оплата",
        "value": "online"
      }
    ],
    "is_hook": true,
    "require_in_commands": [
      "add",
      "return"
    ]
  }
]
```