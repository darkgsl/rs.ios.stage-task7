# Task 7

В этом задании необходимо разработать экран авторизации пользователя в приложение. \
Для реализации вам понадобятся знания об элементах пользовательского интерфейса: `UIView`, `CALayer`, `UIViewController`, `UITextField`, `UIButton`, `UILabel`, `UIAlertController`.

# Общие требования

- Приложение поддерживает только светлую тему
- Минимальная версия операционной системы: iOS 12.1
- Для реализации приложения необходимо использовать только Objective-C
- Для реализации пользовательского интерфейса можно:
    - использовать xib
    - описывать элементы интерфейса в коде
- LaunchScreen - белый экран (стандартный)
- Шрифт: системный. [link](https://developer.apple.com/documentation/uikit/uifont/1619027-systemfont)
- Использовать storyboard (кроме LaunchScreen) нельзя
# Демонстрация работы

  <img alt="demo element" src="Task/Demo_pres.gif" width="380" />
  
# Cross-check

- [Требования](https://docs.rs.school/#/cross-check-flow?id=cross-check) к `cross-check`
- [Форма](https://trotnic.github.io/checklist/) для оценки задания 

# Другое

- [Альтернативный вид](https://www.notion.so/Task-7-109243c36c6b4aa7b7f29dd4d1c31b4d)

# Application flow

При запуске приложения пользователь попадает на экран авторизации. На экране расположены интерактивные элементы:

- поля ввода `login`, `password`
- кнопка  `authorize`

Также здесь расположен неинтерактивный текстовый элемент `text`.

![Task/Login_Base.svg](Task/Login_Base.svg)

Для того, чтобы пользователь смог войти в приложение, ему необходимо ввести значения в поля `login` и `password`. 

![Task/Login_Input.svg](Task/Login_Input.svg)

При нажатии на кнопку `authorize` значения в полях `login` и `password` проверяются на совпадение с имеющимися в системе значениями. Корректными являются следующие значения:

- для поля `login` - значение "*username*"
- для поля `password` - значение "*password*"

В случае неудачной проверки - несовпадение значений в полях с имеющимися в системе - отображается следующее состояние. Изменяют своё отображение только те поля, в которых оказалось некорректное значение. В случае, если в одном поле оказалось корректное значение, а в другом - некорректное, отображение меняет только поле с некорректным значением.

При возобновлении ввода в поле с некорректным значением оно возвращает своё отображение к базовому.

![Task/Login_Input_Error.svg](Task/Login_Input_Error.svg)

В случае удачной проверки - совпадение значений в обоих полях с имеющимися в системе - экран переходит в следующее состояние. Элементы управления `login`, `password` и `authorize` изменяют состояние на неактивное. На экране появляется поле `secure`, которое имеет активное состояние. Поле `secure` содержит три кнопки - `1`, `2`, `3` - и текстовый элемент `result`. 

![Task/Login_Success_-__Secure.svg](Task/Login_Success_-__Secure.svg)

Пользователю нужно нажать кнопки `1`, `2` и  `3` в корректной последовательности, чтобы авторизоваться в приложении. Корректной последовательностью является следующая:

- `1` `3` `2`

Вводимая пользователем последовательность отображается в элементе `result`

![Task/Login_Success_-__Secure_Input.svg](Task/Login_Success_-__Secure_Input.svg)

В случае, если пользователю ввёл некорректную последовательность, в элементе `secure` отображается индикация состояния `error`. Значение элемента `result` возвращается к исходному. 

Предел количества элементв в вводимой последовательности равен 3. Состояние `error` соответствует случаю, когда пользователь ввёл три значения последовательности и результат не совпал с корректным, записанным в системе.

![Task/Login_Success_-__Secure_Input-1.svg](Task/Login_Success_-__Secure_Input-1.svg)

Если пользователь начинает вводить последовательность, когда элемент `secure` находится в состоянии `error`, элемент `secure` переходит в состояние `ready`. 

Если пользователь ввёл корректную последовательность, элемент `secure` переходит в состояние `success`. На экране отображается модальное окно с заголовком "*Welcome*" и сообщением "*You are successfuly authorized!*". Интерактивная кнопка имеет заголовок "*Refresh*". 

При нажатии на интерактивную кнопку:

- модальное окно пропадает
- экран авторизации возвращается в базовое состояние

![Task/Login_Success_-__Secure_Success.png](Task/Login_Success_-__Secure_Success.png)

---

# Иконка приложения

[Icons.zip](Task/Icons.zip)

Набор требуемых размеров иконки

![Task/Untitled.png](Task/Untitled.png)

# Цветовая схема приложения

![Task/Group_26.svg](Task/Group_26.svg)

# Элементы пользовательского интерфейса

## Фон

![Task/Atom_Mocks.svg](Task/Atom_Mocks.svg)

---

## Логотип

Текстовый элемент, содержит название приложения. Текст элемента: "*RSSchool*"

![Task/Atom_Logo.svg](Task/Atom_Logo.svg)

---

## Текстовые поля

Текстовые поля `login` и `password`. 

Поле `login` позволяет вводить только символы латинского алфавита. Ввод предлагается с нижнего начертания.

Поле `password` предназначено для ввода пароля. Значение, вводимое в это поле, экранируется.

Текстовое поле находится в одном из трёх состояний:

- `ready`
- `error`
- `success`

При нажатии на текстовое поле на экране появляется системная клавиатура. Необходимо реализовать возможности для её скрытия:

- при нажатии на кнопку "return" на клавиатуре последняя пропадает с экрана
- при нажатии на любое место экрана, кроме текстовых полей, клавиатура пропадает с экрана
- при нажатии на кнопку авторизации, когда ввод в текстовых полях валиден, клавиатура пропадает с экрана
- при нажатии на кнопку авторизации, когда ввод в текстовых полях невалиден, клавиатура **не пропадает** с экрана

![Task/Atom_Text_Fields.svg](Task/Atom_Text_Fields.svg)

Состояние `active`, поле активно

![Task/Atom_Text_Fields_Error.svg](Task/Atom_Text_Fields_Error.svg)

Состояние `error`, поле активно

![Task/Atom_Text_Fields_Error%201.svg](Task/Atom_Text_Fields_Error%201.svg)

Состояние `success`, поле неактивно

---

## Кнопка авторизации

Кнопка авторизации позволяет пользователю проверить корректность введённых данных и продолжить процесс авторизации. 

Для иконки пользователя используется элемент SF Symbols - `person` и `person.fill`.

Отображение кнопки может находиться в одном из трёх состояний:

- `default`
- `highlighted`
- `disabled`

`default` соответствует состоянию, в котором кнопка является интерактивной, но пользователь на неё не нажимает. 

`highlighted` - состояние, когда пользователь нажал на кнопку. Фоновый цвет кнопки меняется. Когда пользователь убирает палец с кнопки, она переходит в состояние `default`. 

Состояние `disabled` соответствует тому, при котором кнопка является неинтерактивной. Любые взаимодействия пользователя с ней не приводят к изменениям в её отображении.

![Task/Atom_Authorization_Button_1.svg](Task/Atom_Authorization_Button_1.svg)

Состояние `default`, кнопка активна

![Task/Atom_Authorization_Button_2.svg](Task/Atom_Authorization_Button_2.svg)

Состояние `default`, кнопка активна

![Task/Atom_Authorization_Button_3.svg](Task/Atom_Authorization_Button_3.svg)

Состояние `default`, кнопка активна

![Task/Atom_Authorization_Button_4.svg](Task/Atom_Authorization_Button_4.svg)

Состояние `highlighted`, кнопка активна

![Task/Atom_Authorization_Button_5.svg](Task/Atom_Authorization_Button_5.svg)

Состояние `disabled`, кнопка неактивна

---

## Поле дополнительной проверки

Поле `secure` содержит в себе три интерактивных элемента `1`, `2`, `3` и текстовый элемент `result`. Пользователь поочерёдно нажимает интерактивные элементы `1`, `2`, `3`, а в `result` отображается вводимая последовательность в виде чисел, соответствующих нажимаемым элементам.

Поле `secure` может находиться в одном из трёх состояний:

- `default`
- `error`
- `success`

В состоянии `default` интерактивные элементы `1`, `2`, `3` активны, граница поля `secure` не отображается. 

В состоянии `error` у поля `secure` отображается граница соответствующего цвета. Когда `secure` находится в состоянии `error` и пользователь начинает ввод последовательности, поле `secure` переходит в состояние `default`. 

В состоянии `success` поле `secure` отображает границу соответствующего цвета. 

![Task/Atom_Secret_1.svg](Task/Atom_Secret_1.svg)

Состояние `default`

![Task/Atom_Secret_2.svg](Task/Atom_Secret_2.svg)

![Task/Atom_Secret_6.svg](Task/Atom_Secret_6.svg)

![Task/Atom_Secret_3.svg](Task/Atom_Secret_3.svg)

![Task/Atom_Secret_4.svg](Task/Atom_Secret_4.svg)

Состояние `success`

![Task/Atom_Secret_5.svg](Task/Atom_Secret_5.svg)

Состояние `error`

---

Ух ты, ты здесь? 🤪
Удачи! 🙏
