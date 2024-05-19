# Умные списки

Используется, когда Вам требуется список объектов с дополнительными, настраиваемыми полями
Например список товаров с указанием количества товара. Для этого необходимо указать тип поля
`field_type` как `smart_list`. 

Настройка умных списков производится через настройки поля - ключ `settings`. Для настройки списка, 
необходимо добавить ключ `properties` в `settings` поля объекта. Настройки списка повторяют структуру
обычного поля в объекте 

![smart_lists.png](smart_lists.png)

## Структура

> \* Обязательные поля
{style="warning"}

| Параметр     | Тип данных | Описание                          |
|--------------|:----------:|-----------------------------------|
| * title      |   string   | Заголовок поля                    |
| * article    |   string   | Артикул поля                      |
| * data_type  |   string   | Тип данных                        |
| * field_type |   string   | Тип поля                          |
| size         |    int     | Размер поля (от 1 до 4)           |
| search       |   string   | Поиск поля по `article` в таблице |
| list_donor   |   object   | Связанный объект                  |


### Пример
```json
{
  "...": "...",
  "settings": {
    "properties": [
      {
        "title": "Продукт",
        "article": "id",
        "data_type": "integer",
        "field_type": "list",
        "size": 3,
        "search": "products",
        "list_donor": {
          "table": "products",
          "properties_title": "title"
        }
      },
      {
        "size": 1,
        "article": "amount",
        "data_type": "integer",
        "field_type": "integer",
        "title": "Количество"
      }
    ]
  }
}
```
