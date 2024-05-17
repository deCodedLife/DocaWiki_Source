# Action buttons

```json
[
  {
    "type": "href",
    "settings": {
      "title": "Вернуть",
      "background": "dark",
      "icon": "trash",
      "object": "sales",
      "command": "return",
      "data": {
        "id": ":id"
      },
      "page": [
        "payments/return/",
        ":id"
      ]
    }
  }
]
```