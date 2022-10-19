//
//  QuestionUTTViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 19/10/22.
//

import UIKit

class QuestionUTTViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.GenerarNumeroRandom()
    }
    
    
    //MARK: - Private Var / Let
    private let dataSourceQuestions : [QuestionStruct] = [
        QuestionStruct(pregunta: "¿Qué es la arquitectura de un sistema de software?", respuesta: "La arquitectura del software por tanto define la estructura que debe de tener un software, las piezas que debemos construir y el modo en el que se deben de juntar y trabajar entre ellas."),
        QuestionStruct(pregunta: "¿Qué es el modelado de la arquitectura del sistema?", respuesta: "Es un Documento que sirve como fundamento para la Ingeniería Hardware, software, Base de datos, e ingeniería Humana. Describe la función y rendimiento de un Sistema basado en computadoras y las dificultades que estarán presente durante su desarrollo."),
        QuestionStruct(pregunta: "¿Qué características tiene una arquitectura de software?", respuesta: "Características de una arquitectura de software exitosa Factores importantes que influyen la aptitud de la arquitectura de software son la planificación de proyectos, el análisis de riesgo, la organización, el proceso de desarrollo, los ciclos de trabajo, el hardware, la garantía de calidad y los requerimientos."),
        QuestionStruct(pregunta: "¿Qué es la arquitectura en software objetivos?", respuesta: "El objetivo principal de la Arquitectura del Software es aportar elementos que ayuden a la toma de decisiones y, al mismo tiempo, proporcionar conceptos y un lenguaje común que permitan la comunicación entre los equipos que participen en un proyecto."),
        QuestionStruct(pregunta: "¿Qué es modelo de diseño de software?", respuesta: "Los modelos de desarrollo de software ofrecen un marco de trabajo usado para controlar el proceso de desarrollo de sistemas de información, estos marcos de trabajo consisten en una filosofía de desarrollo de programas la cual debe de contar con las herramientas necesarias para la asistencia del proceso de desarrollo."),
        QuestionStruct(pregunta: "¿Qué es el diseño del modelo?", respuesta: "El modelo de diseño se basa sobre el modelo de análisis describiendo, en mayor detalle, la estructura del sistema y cómo será implementado el sistema. Las clases que fueron identificadas en el modelo de análisis son refinadas para incluir las construcciones de implementación."),
        QuestionStruct(pregunta: "¿Qué importancia tiene definir una arquitectura de software?", respuesta: "La importancia de la arquitectura de software Creamos una base sólida para el proyecto. Conseguiremos que la plataforma creada sea escalable. Aumenta el rendimiento de la plataforma. Reduce considerablemente los costes y evita duplicaciones del código."),
        QuestionStruct(pregunta: "¿Cuál es la importancia de la arquitectura de software?", respuesta: "La importancia de la arquitectura de software Creamos una base sólida para el proyecto. Conseguiremos que la plataforma creada sea escalable. Aumenta el rendimiento de la plataforma. Reduce considerablemente los costes y evita duplicaciones del código."),
        QuestionStruct(pregunta: "¿Cuál es la diferencia entre diseño y modelo?", respuesta: "Un modelo Industrial es la forma incorporada a un producto industrial que le confiere carácter ornamental. Un diseño industrial es el aspecto aplicado a un producto industrial que le confiere carácter ornamental."),
        QuestionStruct(pregunta: "¿Qué es el diseño en dibujo?", respuesta: "El diseño es una disciplina de anticipación, es por ello que el dibujo constituye una herramienta muy valiosa e irremplazable durante el proceso de creación. Con él nos ayudaremos a la hora de lograr el resultado más aproximado posible al producto que hemos diseñado."),
        QuestionStruct(pregunta: "¿Cómo elegir una arquitectura de software?", respuesta: "Elegir una arquitectura monolítica o de microservicio depende en gran medida de nuestro caso de uso. Sugiero mantener las cosas simples y comprender los requisitos a fondo. Construir sólo cuando se necesite y seguir evolucionando el código de forma iterativa. Ese es el camino correcto."),
        QuestionStruct(pregunta: "¿Qué es un modelo en el diseño?", respuesta: "El modelo de diseño se basa sobre el modelo de análisis describiendo, en mayor detalle, la estructura del sistema y cómo será implementado el sistema. Las clases que fueron identificadas en el modelo de análisis son refinadas para incluir las construcciones de implementación."),
        QuestionStruct(pregunta: "¿Cuál es la diferencia entre un diseño industrial y un modelo de utilidad?", respuesta: "Las patentes de invención requieren un alto grado de creación intelectual y pueden ser productos y procedimientos. Por otro lado, los modelos de utilidad sólo pueden ser productos (pero no procedimientos) que tengan una ventaja técnica y no requieren nivel inventivo."),
        QuestionStruct(pregunta: "¿Qué es un diseño y un ejemplo?", respuesta: "La palabra diseño también se puede usar para referir el conjunto de características visuales y/o funcionales que constituyen un determinado objeto animado o inanimado. Por ejemplo, «Uno de los diseños más hermosos de la naturaleza es el tigre de Bengala»."),
        QuestionStruct(pregunta: "¿Qué es y para qué sirve el diseño?", respuesta: "En términos formales el diseño (de-signio) consiste en configurar los signos para resolver algo para alguien, de ahí su nombre. El diseño es una disciplina creativa en la cual se proyectan soluciones estéticas, simbólicas y funcionales, es decir, que emocionan, significan y sirven."),
        QuestionStruct(pregunta: "¿Cuáles son las fases en la construcción de un arquitecto de software", respuesta: "Las 4 fases son: inicio, elaboración, construcción y transición y se llevan a cabo en ese orden."),
        QuestionStruct(pregunta: "¿Qué importancia tiene la arquitectura de software en la actualidad?", respuesta: "La importancia de la arquitectura de software Creamos una base sólida para el proyecto. Conseguiremos que la plataforma creada sea escalable. Aumenta el rendimiento de la plataforma. Reduce considerablemente los costes y evita duplicaciones del código."),
        QuestionStruct(pregunta: "¿Qué es un modelo y un diseño industrial?", respuesta: "Los modelos y diseños industriales son las formas o aspectos incorporados o aplicados a un producto que le confieren carácter ornamental, constituyendo una nueva forma o aspecto de tal modo de hacerlo más agradable y de atraer -en consecuencia- al consumidor.")
    ]
    
    private var dataSourcePositionLast : [Int] = []
    
    //MARK: - Public Var / Let
    
    //MARK: - @IBOutlet
    @IBOutlet weak var lablePregunta: UILabel!
    @IBOutlet weak var textViewRespuesta: UITextView!
    
}
//MARK: - @IBAction
extension QuestionUTTViewController {
    @IBAction func mostrarRespuestaAction() {
        self.textViewRespuesta.isHidden = false
    }
    
    @IBAction func siguientePreguntaAction() {
        self.GenerarNumeroRandom()
    }
}
//MARK: - public func
extension QuestionUTTViewController {

}
//MARK: - Private func
extension QuestionUTTViewController {
    private func GenerarNumeroRandom(){
        
        var numberRandom : Int = 0
        
        if self.dataSourcePositionLast.count > 17 {
            self.dataSourcePositionLast.removeAll()
        }
        
        repeat {
            numberRandom = Int.random(in: 0...17)
        } while self.dataSourcePositionLast.contains(numberRandom)
        
        self.dataSourcePositionLast.append(numberRandom)
        
        print(self.dataSourcePositionLast)
            
        self.lablePregunta.text = self.dataSourceQuestions[self.dataSourcePositionLast.last!].pregunta
        self.textViewRespuesta.isHidden = true
        self.textViewRespuesta.text = self.dataSourceQuestions[self.dataSourcePositionLast.last!].respuesta
    }
}
//MARK: - Services
extension QuestionUTTViewController {

}
//MARK: - Other
extension QuestionUTTViewController {
    struct QuestionStruct : Codable {
        let pregunta : String
        let respuesta : String
    }
}

