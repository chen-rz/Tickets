# Tickets
Web project implemeted by J2EE and based on PostgreSQL database, for tourism tickets booking along with COVID-19 checking.

## Database Structure
- **PostgreSQL**

|No.|Table|Description|
|:-:|:-:|:-:|
|1|register|用户注册信息表|
|2|parks|景区信息表|
|3|reservations|订单信息表|

**Sequence of data fields should be consistent with the following lists.**

1. register

|Data field|Description|Data type|Is primary key|
|:-:|:-:|:-:|:-:|
|user_name|用户名|varchar (50)|No|
|phone_no|用户手机号码|varchar (20)|Yes|
|password|用户登录密码|varchar (120)|No|
|is_official|用户是否为有关部门管理员|boolean|No|

2. parks

|Data field|Description|Data type|Is primary key|
|:-:|:-:|:-:|:-:|
|park_id|景区ID号|int|Yes|
|open_time|开园时间（精确到小时）|int|No|
|close_time|闭园时间（精确到小时）|int|No|
|park_address|景区地址|varchar (120)|No|
|contact|景区联系电话|varchar (100)|No|
|max_num|游客人次上限|int|No|
|park_name|景点名称|varchar (100)|No|
|visitor_0|当日预订人次|int|No|
|visitor_1|次日预订人次|int|No|
|visitor_2|后日预订人次|int|No|
|price|票价|float|No|
|description|景区简介|text|No|
|covid_risk|是否有疫情风险|boolean|No|

3. reservations

|Data field|Description|Data type|Is primary key|
|:-:|:-:|:-:|:-:|
|reserve_id|订单号|int|Yes|
|user_phoneno|提交此订单的用户手机号码|varchar (120)|No|
|schedule|预订日期时间（精确到小时）|varchar (50)|No|
|tourist_phoneno|游客手机号|varchar (120)|No|
|member_num|同行人数|int|No|
|tourist_name|游客姓名|varchar (120)|No|
|tourist_idcard|游客身份证号|varchar (120)|No|
|where_from|14天内来源地|varchar (100)|No|
|is_healthy|“苏康码”是否为绿码|boolean|No|
|is_payed|是否已完成支付|boolean|No|
|time_stamp|订单生成时间|varchar (50)|No|
|id_cipher|订单号加密密文|varchar (70)|No|
|park_selected|预订的景区名称|varchar (80)|No|
