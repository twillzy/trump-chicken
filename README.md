# Trump-Chicken

This little app uses Javascript SpeechRecognition API to cast a spell on Donald Trump and turn him into a chicken for eternity. This is my attempt to learn how Elm interops with Javascript so I could convince my team how easy it is to start writing some Elm with existing Javascript applications. To read more about Elm x JS interop, check out the official guide [here](https://guide.elm-lang.org/interop/javascript.html).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development.

### Prerequisites

Latest version of Elm. Install it here: https://guide.elm-lang.org/install.html

### Installing

After cloning this repo, run

```
elm-make Main.elm --output=main.js
elm-reactor
```

and visit localhost:8000 and click on index.html to see if you have what it takes to become a witch/wizard. (You will have to allow access to use your computer's microphone).

Remember to rebuild the project if you make any changes to Main.elm
