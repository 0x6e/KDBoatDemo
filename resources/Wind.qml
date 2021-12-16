/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: MIT

  Contact info@kdab.com for more information about this software.
*/

import QtQuick 2.0

Item {
    id: gaugeBase
    property string gaugetext: "" // set externally
    width: 225 * gauge.scale + 140
    property real variance: 100

    height: width
    Text {
        id: gaugeText
        color: "#ffffff"
        text: gaugetext
        font.family: lato.name
        font.pixelSize: 20
        width: 140
        font.weight: Font.Light
    }

    Item {
        id: gauge

        anchors.left: gaugeText.right
        anchors.leftMargin: -40 * gauge.scale
        scale: gaugeBase.focus ? 1 : 0.7
        smooth: true

        Behavior on scale {
            NumberAnimation { duration: 600; easing.type: Easing.InOutQuad }
        }

        MouseArea {
            width: 265 * scale
            height: 265 * scale
            onClicked: gaugeBase.focus = !gaugeBase.focus
        }

        Image {
            source: "/img/gauges/resources/images/gauges/windbase.png"
            Image {
                id: scaleImage
                source: "/img/gauges/resources/images/gauges/windR.png"
                anchors.centerIn: parent
            }

            Text {
                color: "#ffffff"
                text: (Math.ceil(scaleImage.rotation))+"º"
                font.family: openThin.name
                font.pixelSize: 20
                y: 200
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        SequentialAnimation {
            running: true
            loops: -1
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 1000*(Math.random()+1); easing.type: Easing.InOutQuad;from: 295; to: 0.4*Math.random()*variance +295}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 1000*(Math.random()+1); easing.type: Easing.InOutQuad; to: 0.2 *Math.random()*variance+295}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 2000*(Math.random()+1); easing.type: Easing.InOutQuad; to: 0.4*Math.random()*variance+295}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 2000*(Math.random()+1); easing.type: Easing.InOutQuad; to: 0.1 *Math.random()*variance+295}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 3000*(Math.random()+1); easing.type: Easing.InOutQuad; to: 0.2*Math.random()*variance+295 }
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 3000*(Math.random()+1); easing.type: Easing.InOutQuad; to: 0.2 *Math.random()*variance+295}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 2000*(Math.random()+1); easing.type: Easing.InOutQuad; to: 0.4*Math.random()*variance+295}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 2000*(Math.random()+1); easing.type: Easing.InOutQuad; to: 295}
        }

    }
}
