_rus_
# Pomodoro-Timer

## Описание

Проект **Pomodoro-Timer** - это небольшой проект, созданный в основном для себя и для людей, которым нужен простой томатный таймер.
По умолчанию в таймере четыре помидора по 25 минут каждый, и 5 минут отдыха между ними. По окончании каждого помидора или отдыха, 
воспроизводится звуковой сигнал (оповещение). 

На главной форме есть 3 кнопки:

- Stop - остановка таймера;
- Run - запуск таймера;
- Settings - настроки таймера.

В настройки таймера входят:

- Number of tomatoes - количество томатов, которые вы можете выбрать сами;
- Tomato Length (min) - длина томатов в минутах;
- Rest length (min) - длина отдыха в минутах;

Слева в верхнем углу формы отражается состояние таймера (Sleep, Run). Внизу отражается количество
прошедших томатов.

---

## Техническое описание

Проект реализован с использованием free pascal и lazarus. 
Воспроизведение аудио является единственной причиной, по которой разняться версии по платформам.
Отличие небольшое, и сводится оно к тому, каким образом воспроизводить звук. Так как проект довольно маленький,
то на ум пришла мысль разделить версии и в каждой из версий реализовать (на мой взгляд) наиболее быстрый, лёгкий и
практичный способ воспроизведения звукового сигнала. 

_windows:_
В данном случае была использована библиотека MMSystem (процедура PlaySound). 

_linux:_
Использовалась библиотека process и cvlc (процедура PlaySound). Потому для linux и BSD версий нужен установленный
медиаплеер VLC. 

_macOS:_
Использовалась библиотека process (процедура PlaySound). Необходимо проверить работу afplay.

Звуковой файл находится в папке sound и имеет формат .mp3. По сути туда можно закинуть любой короткий звуковой сиглал, 
по своему выбору, дав ему наименование signal.mp3.

Компилируется проект либо из lazarus, либо с помощью fpc.

---

## Автор проекта
_Богатырев Роман_

---

> ***_Примечание:_***  _проект использует MIT License.

_eng_

## Description

The **Pomodoro-Timer** project is a small project created mainly for yourself and for people who need a simple tomato timer.
By default, the timer has four tomatoes for 25 minutes each, and 5 minutes of rest in between. At the end of each tomato or rest,
a sound signal (alert) is played. 

There are 3 buttons on the main form:

- Stop - stop the timer;
- Run - start the timer;
- Settings - timer settings.

The timer settings include:

- Number of tomatoes - the number of tomatoes that you can choose yourself;
- Tomato Length (min) - length of tomatoes in minutes;
- Rest length (min) - rest length in minutes;

The timer status (Sleep, Run) is displayed in the upper left corner of the form. The number
of tomatoes that have passed is reflected at the bottom.

---

## Technical description

The project is implemented using free pascal and lazarus. 
Audio playback is the only reason why versions differ across platforms.
The difference is small, and it boils down to how to reproduce the sound. Since the project is quite small,
the idea came to mind to divide the versions and in each of the versions to implement (in my opinion) the fastest, easiest and
most practical way to reproduce the audio signal. 

_windows:_
In this case, the MMSystem library (the PlaySound procedure) was used. 

_linux:_
The process library and cvlc (PlaySound procedure) were used. Therefore, for linux and BSD versions, you need an installed
VLC media player. 

_macOS:_
The process library (the PlaySound procedure) was used. It is necessary to check the operation of afplay.

The sound file is located in the sound folder and has the .mp3 format. In fact, you can throw any short audio signal there,
of your choice, giving it the name signal.mp3.

The project is compiled either from lazarus or using fpc.

---

## Author of the project
_Bogatyrev Roman_

---

> ***_Note:_*** _ the project uses the MIT License.
