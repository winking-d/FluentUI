﻿import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: button

    property int startPadding : 15
    property int endPadding : 15
    property int topPadding: 8
    property int bottomPadding: 8
    property bool disabled: false
    property color primaryColor : "#0064B0"
    signal clicked
    radius: 4
    color:{
        if(disabled){
            return "#C7C7C7"
        }
        return  button_mouse.containsMouse ? Qt.lighter(primaryColor,1.15) : primaryColor
    }
    width: button_text.implicitWidth
    height: button_text.implicitHeight

    FluText {
        id: button_text
        text: "Filled Button"
        color: "#FFFFFFFF"
        font.pixelSize: 14
        leftPadding: button.startPadding
        rightPadding: button.endPadding
        topPadding: button.topPadding
        bottomPadding: button.bottomPadding
        anchors.centerIn: parent
    }

    MouseArea {
        id:button_mouse
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            if(disabled)
                return
            button.clicked()
        }
    }
}
