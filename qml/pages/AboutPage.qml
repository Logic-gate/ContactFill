import QtQuick 2.0
import Sailfish.Silica 1.0

Page
{
    id: page
    SilicaFlickable {
        PullDownMenu {
            MenuItem {
                text: qsTr("About CallerPy")
                onClicked: pageStack.push(Qt.resolvedUrl("CallerPy/CallerPyAbout.qml"))
             }
            MenuItem {
                text: qsTr("About ContactFill")
                onClicked: pageStack.push(Qt.resolvedUrl("ContactFill/ContactFillAbout.qml"))
             }
         }
    anchors.fill: parent
    Column
    {
        id: column

        spacing: 5
        width: parent.width

        Item
        {
            width: 1
            height: Theme.fontSizeExtraLarge
        }
        Image {
                              id: mainimage
                               source: '../img/mainpage.png'
                               width: 300
                               visible: true
                                   fillMode: Image.PreserveAspectFit
                                   anchors.horizontalCenter: parent.horizontalCenter
                                 //  anchors.top: header.bottom
                                   smooth: true

                           }


        Label
        {
            text: qsTr("Version 0.1-1")
            anchors.horizontalCenter: parent.horizontalCenter
            color: Theme.secondaryHighlightColor
            font.pixelSize: Theme.fontSizeSmall
        }
        Label
        {
            text: qsTr("Copyright © 2015 Mad_Dev")
            anchors.horizontalCenter: parent.horizontalCenter
            color: Theme.primaryColor
            font.pixelSize: Theme.fontSizeSmall
        }


        Text
        {
            width: parent.width
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            font.pixelSize: Theme.fontSizeSmall
            color: Theme.secondaryColor
            text: "<style>a:link { color: " + Theme.highlightColor + "; }</style><br/>" +
                qsTr(" ContactInfo is the merger of two Sailfish Apps, CallerPy and ContactFill. The original projects will no longer be supported, all efforts will be targeted at ContactInfo.") + "<br/><br/>" + qsTr("Report Bugs for CallerPy and ContactFill to") +
                "<br/> <a href=\"https://github.com/Logic-gate/ContactInfo/issues\">" + qsTr("GitHub Page") + "</a>";
            onLinkActivated:
            {
                Qt.openUrlExternally(link);
            }
        }


    }
    }





}
