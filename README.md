# 見出し1
|colum | type | association |index|
|:---|:---:|---:|---:|
|user_name|string |has_many tasks | | |




## tasks
colum | type | association |index|
|:---|:---:|---:|---:|
|name|string|       |    |
|content|text|      |    |
|status|string|     |    |
|deadline|datetime| |    |
|priority|integer|  |    |
### 見出し3
colum | type | association |index|
|:---|:---:|---:|---:|
|lbel_name|string|  |    |
|text_id|integer  |has_many tasks||
