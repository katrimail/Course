//
//  Data.swift
//  Courses
//
//  Created by Катрин Маилян on 27.12.2020.
//

import Foundation

struct Page : Identifiable {
    var id : Int
    var image : String
    var title : String
    var descrip : String
}

var Data = [
    Page(id: 0, image: "2", title: "Получай статистику своей успеваемости", descrip: "Мы визуализируем  и удобно отображаем твои оценки."),
    Page(id: 1, image: "5", title: "Делись новостями", descrip: "В нашем приложении ты можешь выкладывать посты на интересующие и обсуждаемые темы. Отправляй личные сообщения прям в приложении. "),
    Page(id: 2, image: "4", title: "Быстрое взаимодействие с  учебными материалами", descrip: "Мы упрощаем доступ ко всем необходимым для учебы информацией.")
]
