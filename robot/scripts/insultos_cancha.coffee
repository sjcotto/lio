# Description:
#   Fill your chat with some kindness
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot un insulto de futbol - retorna un insulto de futbol
#
# Author:
#   santiago cotto

insultos = [
  "Arzeno, correte que están jugando!!!",

  "Delorte , pasate a nafta, hijo de puta",

  'Se va la pelota al lateral y queda al lado de un perro policía. El jugador encargado del saque no se acerca al perro y el policía tampoco le acercaba la pelota. Desde la tribuna se oye: "Dale pelotudo que el perro no come mierda!!!!"',

  'Argentina en el Monumental. El Piojo López tiraba los centros a la tribuna y de la tribuna baja un: "Piojo la próxima tirala autografiada la concha de tu hermana !!!"',

  'Cada vez que era córner, lo iba a patear el 9, y un gordo desde la tribuna le grita: “9! Chupame la pija!”, “9! Chupame la pija!”. En un momento lo va a patear el 7, y el mismo gordo le grita: “7! Decile al 9 que me chupe la pija!”',

  'Eliminatorias para mundial 2006. Argentina-Paraguay termina en empate bien amargo. Salida. Uno de los argentinos, pasando por abajo de la tribuna de los paraguayos que festejaban el empate, grita: "Qué festejás la concha de tu hermana, mañana me tenés que venir a destapar el baño.”',

  ' "Carranza! Ojalá que te mate Dios!" ',

  ' "Ese Krupoviesa le ponés dos medias de distinto color y se caga a patadas solo" ',

  ' "Devolvele la cara al cuco negro de mierda !!!” ',

  ' "Pipa Estevez , deformado, naciste con la pija en la cara hijo de mil putas !!!" ',

  ' "krupoviesa en tu casa hasta los muebles usan canilleras burrooooo" ',

  ' "Che 9, hac é de cuenta que estas en Esperanto y encarate a alguien, FORRO" ',

  ' "Balsas, movete que te va a mear un perro!!"" ',

  ' "Tenes menos definicion que un Atari , la puta que te pario!!" ',

  ' "Piojo, tenés menos centro que Las Toninas en abril, la concha de tu madre." ',

  ' "Fabbiani en el piso: "Tírenle agua que se seca la ballena!""',

  ' "hijo de puta!!! Sofovich corre más que vos, rengo de mierda!!!" ',

  ' "Ortigozaaaa: La mochila dejala en el vestuario!" ',

  ' "sacale la caja a los botines para jugar muertooo"',

  ' "no le pongas aerosol, ponele Blem , que es de madera ese hijo de puta" ',

  ' "Cabral, los de la banda roja son tus compañeros, pelotuudoo" ',

  ' "4, no te conoce ni tu vieja. Cuando te llama a comer te grita: Cuatro a comer" ',

  ' "Cormillot , Fabbiani es argentino" ',

  ' "Negro quita hipo"" ',

  ' "Ahumada, ya te aprendiste los numeros de todos, ahora sacales la pelota!!" ',

  ' "Hrabina con vos los radiologos se llenaron de plata!!! (Juro q Hrabina se tento y se empezo a reir, un Grande)" ',

  ' "Barradooo!!! Quien te puso Diego Armando, el mentiroso de tu papa?Huh?? "',

  ' "Pero , ¿vos sos pelotudo o tus viejos son primos!?!?!"',

  ' "Lux, sal í al area grande a ver si llueve por lo menos"',

  ' "a un gordo en la tribuna de Independiente... Gordo vomitá a la gente que falta!!" ',

  ' "(desde atrás del arco a Nacho González) Hace 40 grados pelotudo, tenés várices?"',

  ' "La culpa no es de Chittzoff, la culpa es del HDP, q le regalo la primer a pelota, ¿pq no le regalo una caña de pescar!?"',

  ' "Seis, te putearía pero no se quien sos"',

  ' "Cubero te cojes a Nicole porque le gustan los perros"',

  ' "Cabral hace como Cabañas y cabecea una bala hijo de puta!"',

  ' "TUZZIO!! CERRÁS MENOS QUE FARMACITY HIJO DE PUTA!!!"',

  ' "Orteguita juga tranquilo que no hay Alcoholemia!!"',

  ' "Que cobro? Que cobro?!? -Ah, es para nosotros? - Amarilla? Era para roja, la concha de tu madre!!"',

  ' "Leyenda... a vos te meten un gol con la pelota de Kiko!!',

  ' "Lugüercio sos el pesimista del gol"',

  ' "Fabiani, Te pido un remis para volver?"',

  ' "Abbondanzieri tenes menos reflejos que un espejo de corcho!!!!"',

  ' "9 matate! Menos patada que una pila tenes!!!"',

  ' "Zelaya, sos mas lento que "only you"',

  ' "Hincha a un suplente: "Ehhh, 14, ehhh, 14, si estos perros son los titulares que malo que serás vos HIJO DE PUTA!!!"',

  ' "Marino tenes menos esfuerzo que un piquetero con plan social"',

  ' "Carreño, va un pie después del otro, muerto, hijo de puta"',

  ' "Arbitro expulsa a Caruso del banco que el humo no me deja ver el partido"',

  ' "Tenés menos marca que Once, ¡muerto de hambre!"',

  ' "¡Que lo pisen, que lo pisen! Plateista de River cuando el carrito de lesionados se acercó a Toresani tendido en el pasto"',

  ' "4, tenés menos sorpresa que un kinder abierto,¡ lpqtp!"',

  ' "Patiñoooo, ¡sos más feo que un Twingo!"',

  ' "Meijide, hijo de la radiación solar"',

  ' "Heinze, pasa el 9 en corriendo en ojotas y te gana hijo de puta!!"',

  ' "Luchetti salí que es sábado!!!"',

  ' "Verón vendepatria, ojala te mueras de diarrea tomando un yogurt cada día"',

  ' "Pasarlo al Flaco Schavi es como agarrar un cable pelado en patas, te recontra caga a patadas!"',

  '  Al arbitro de un tigre boca: marcando la linea de la barrera con la espuma: matalo a luna con el aerosol matalo que es una cucaracha!!',
]


module.exports = (robot)->
  robot.respond /(.*)insulto(.*)futbol(.*)/i, (message)->
    rnd = Math.floor Math.random() * insultos.length
    message.send insultos[rnd]
