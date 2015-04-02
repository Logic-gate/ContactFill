import QtQuick 2.0
import Sailfish.Silica 1.0


Page {

    id: page
    allowedOrientations: Orientation.Portrait | Orientation.Landscape | Orientation.LandscapeInverted
    property var url_send: ""
    BusyIndicator {
        id: progressCircle
        running: true
        size: BusyIndicatorSize.Large
        anchors.verticalCenter: parent.verticalCenter
        anchors.centerIn: parent
    }
SilicaFlickable {
    anchors.fill: parent


    Column {
        id: col
        property alias name_change: name_.text
        property alias number_change: number_.text
        property alias country_change: country_.text
        spacing: Theme.paddingLarge
        width: parent.width
        PageHeader {
            id: result_header
            title: "Result"
            visible: false

        }
        Row {
            spacing: Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter

        }

        SectionHeader {
            id: name_header
            text: "Name"
            visible: false
        }


        ComboBox {
            id: name_box
            Label {
                id: name_
                onTextChanged: {progressCircle.destroy(); result_header.visible=true; name_header.visible=true; number_header.visible=true; country_header.visible=true}

                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
                anchors.horizontalCenter: parent.horizontalCenter

            }
            currentIndex: -1
            menu: ContextMenu {
                MenuItem { text: "Copy"
                onClicked: {Clipboard.text = name_.text; text=' '}}
            }
        }


        SectionHeader {
            id: number_header
            text: "Number"
            visible: false
        }

       ComboBox {
           id: number_box
           Label {
               id: number_
               color: Theme.highlightColor
               font.pixelSize: Theme.fontSizeExtraLarge
               anchors.horizontalCenter: parent.horizontalCenter

           }
           currentIndex: -1
           menu: ContextMenu {
               MenuItem { text: "Copy"
               onClicked: {Clipboard.text = number_.text; text=' '}}
           }
       }


        SectionHeader {
            id: country_header
            text: "Country"
            visible: false
        }
        Label {
            id: country_
            text: " "
            color: Theme.highlightColor
            font.pixelSize: Theme.fontSizeExtraLarge
            anchors.horizontalCenter: parent.horizontalCenter
        }


    }




    function getData(url_send) {
        var xmlhttp = new XMLHttpRequest();
        var url = url_send
       // console.log(url)

        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                myFunction(xmlhttp.responseText);

            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    function myFunction(json) {
        var obj = JSON.parse(json);
        //console.log(obj.Error);
       // listview.model.append( {jsondata: obj.getWorld[0].NAME});
      // listview.model.append( {jsondata: obj.getWorld[0].NUMBER});
       col.name_change = obj.getWorld[0].NAME;
        col.number_change = obj.getWorld[0].NUMBER;
        col.country_change = obj.getWorld[0].COUNTRY;

    }


    Component.onCompleted: {
         getData(url_send)
    }


}


}
