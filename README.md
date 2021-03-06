##### [Live](http://barbershooop.herokuapp.com/)

# Система взаимодействия с клиентами парикмахерской
### Требования к проекту
#### Введение

Проект представляет собой веб-приложение для автоматизации взаимодействия с клиентами парикмахерской. На сайте кленты смогут выбрать наиболее подходящее время для посещения и записаться, просмотреть другую визитную информацию о парикмахерской.

#### Требования пользователя
##### Программные интерфейсы
Все фотографии должны хранится в облачном хранилище Cloudinary.
Местоположение парикмахерской должно отражаться на карте (Яндекс.Карты, Google maps).
Администрация парикмахерской уведомляется о новых записях через Telegram.
Авторизация через социальные сети (как минимум, vkontakte).
Также должен быть реализован публичный API, позволяющий сторонним приложениям получать информцию о расписании.

##### Интерфейс пользователя
На сайте можно посмотреть услуги, предоставляемые парикмахерской, цены на них, акции, свободное время для посещения, записаться на это время, авторизованным пользователям можно оставить отзыв и проставить рейтинг.

##### Характеристики пользователей
Перед клиентами приложение представляет собой обычный почти статический сайт. Но вся информация изменяется администрацией. Таким образом пользователь может иметь одну из трех ролей: гость, авторизованный и админ. При этом администрация должна обладать некоторыми несложными навыками для пользования данным приложением.

#### Системные требования
##### Функциональные требования
- Пользователь может иметь одну из трех ролей (гость, авторизованный, администратор)
- Гость может просматривать услуги, цены, акции. Управляет ими администратор в отдельной части сайта (админка).
- Возможность просмотреть расписание и записаться на удобное время. Распределяет свободное время - администратор.
- Возможность оставлять отзывы о парикмахерской.

##### Нефункциональные требования 
##### Атрибуты качества
Приложение должно быть простым в использовании и обладать интуитивно понятным графически интрефейсом. При этом удобно должно быть не только пользователю, но и администратору. Верстка сайта должна быть адаптивной и одинаково хорошо отображаться на всех видах устройств.
###### Бизнес-правила
Запись на посещение: Пользователь выбирает необходимую услугу и время посещения из доступных, затем оставляет свои контактные данные, далее администрация связывается с ним лично.
###### Внешние интерфейсы
* Авторизация через социальные сети (как минимум ВКонтакте)
* Хранение фотографий в облаке Cloudinary
