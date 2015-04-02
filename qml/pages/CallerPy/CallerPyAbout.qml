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
            source: "../../img/about_callerpy.png"
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
                qsTr("CallerPy is an open source software licensed under the terms of the GNU General Public License.") + "<br/><br/>" + qsTr("You can find more about the project") +
                "<br/> <a href=\"http://www.callerpy.io\">" + qsTr("Project Home") + "</a>";
            onLinkActivated:
            {
                Qt.openUrlExternally(link);
            }
        }
    }

    Text
    {
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Text.AlignHCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: Theme.fontSizeSmall
        color: Theme.secondaryHighlightColor
        font.pixelSize: Theme.fontSizeSmall
        text: qsTr("The Truecaller name is the property of True Software Scandinavia AB. CallerPy is a Truecaller Name Retriever. It emulates the process one would encounter if using a web-browser.")
    }
}
