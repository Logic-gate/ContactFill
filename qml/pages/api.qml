import QtQuick 2.0
import Sailfish.Silica 1.0
import FileIO 1.0

Page {
    id: page

    Banner {
        id: banner
    }
    SilicaListView {

    anchors.fill: parent


        Column {
            id: column
            visible: true
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                id: header
                title: qsTr("API KEY")
            }


            TextField {
                id: field
                width: parent.width
                label: "API KEY"
                color: Theme.highlightColor
                placeholderText: myFile.read()
                EnterKey.onClicked: parent.focus = true
            }
            FileIO {
                id: myFile
                source: "/home/nemo/ContactFill.key"
                onError: console.log(msg)
            }


            Button {
                id: send_url
                text: "Save"
                anchors.horizontalCenter: parent.horizontalCenter

             onClicked: {myFile.write(field.text); banner.notify(qsTr('Api Key Save in '+myFile.source.valueOf()))}
        }
            Column {
                id: column__
                visible: true
                width: page.width
                spacing: Theme.paddingLarge
            Text
            {
                width: parent.width

                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                textFormat: Text.RichText
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.secondaryColor
                text: "<style>a:link { color: " + Theme.highlightColor + "; }</style><br/>" +
                    qsTr("For this to work, you'll need a developer API KEY") + "<br/><br/>" + qsTr("Get Your API KEY here") +
                    "<br/> <a href=\"https://www.fullcontact.com/developer/try-fullcontact/\">" + qsTr("FullContact") + "</a>";
                onLinkActivated:
                {
                    Qt.openUrlExternally(link);
                }
            }

}
            }
    }
}
