#### En qué consiste el principio de responsabilidad única? ¿Cuál es su propósito? 

Una clase realiza una única función
Todos nuestros métodos deben de estar bien definidos y ser concretos con la finalidad de la clase

Por ejemplo:

En mi clase MapApiViewModel su única finalidad es extraer un fichero .json del disco 
En mi clase MoviesHeaderSectionView establece el diseño del header de cada section

#### ¿Qué características tiene, según su opinión, un “buen” código o código limpio?  
	✓	Fácil de leer para cualquier programador 
	✓	Aplicar la nomenclatura correcta a variables, métodos, clases, estructuras, etc.
	✓	Usar plurales y singulares “Movie” “Movies” esto ayuda bastante para inferir muchas cosas
	✓	Aplicar las buenas practicas que Apple sugiere (ser claro y breve) al nombrar variables, métodos y funciones, por ejemplo CheckIfExist - que se traduce revisa si existe y devuelve un boleano
	✓	Siempre asegurarse de identar el código correctamente 
	✓	Siempre usar Mark / Mark - / Todo / Fixme para ir mejorando progresivamente nuestro código
	✓	Dejar los menos warning posibles
	✓	Actualizar las funciones deprecadas 
	✓	Evitar funciones con muchos paràmetros de entrada, en caso de ser necesario separar en otras funciones

#### Detalla cómo harías todo aquello que no hayas llegado a completar.  
	•	No termine las pruebas Unitarias.

También deje varias TODO y FIXME para tener una app funcional, de todas maneras dejo aquí la lista:

	•	En ApiManager -> funcs -> fail() crear un método para manejar los errores. 
	•	En MoviesView -> crear un custom class para navigationBar y si es necesario y funcional cambiar el self.present por pushviewcontroller 
	•	En MoviesViewCell crear una función que adapte el diseño a diferentes resoluciones y orientaciones 
	•	Deje varias estructuras vacías, evaluar si esos datos de la API se van a utilizar 
	•	MoviesViewView crear una función que adapte el diseño a diferentes resoluciones y orientaciones 
	•	En MoviesDetailHeaderCell crear función con constantes para ajustar los márgenes del diseño
	•	En MoviesHeaderFiltersView cambiar el (for filters) por collectionview para hacerlo mas funcional 
	•	En MoviesTrailers cambiar a un collectionview para mostrar todos los tráileres 

### Swift Package Dependencies
https://github.com/hyperoslo/Cache/

https://github.com/Alamofire/Alamofire

https://github.com/kean/Nuke/

https://github.com/SvenTiigi/YouTubePlayerKit/

https://github.com/realm/SwiftLint

Targets -> Build Phases -> Run Swiftlint Script -> + Add new build Phases
export PATH="$PATH:/opt/homebrew/bin"
if which swiftlint > /dev/null; then
  swiftlint
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
