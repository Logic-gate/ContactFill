import QtQuick 2.0
import Sailfish.Silica 1.0

Page
{
    id: page

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
        Image
        {
            anchors.horizontalCenter: parent.horizontalCenter
            source: "../../img/aboutContactFill.png"
        }

        Label
        {
            text: qsTr("Version 0.1-3")
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
                qsTr("ContactFill is an unofficial FullContact Client.") + "<br/><br/>" + qsTr("You can find more about the project") +
                "<br/> <a href=\"https://github.com/Logic-gate/ContactInfo\">" + qsTr("Project Home") + "</a>";
            onLinkActivated:
            {
                Qt.openUrlExternally(link);
            }
        }
    }


}
