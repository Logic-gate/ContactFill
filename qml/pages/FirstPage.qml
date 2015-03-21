/****************************************************************************************
**
** Copyright (C) 2015 Mad_Dev.
** Contact: Amer Almadani <mad_dev@linuxmail.org.org>
** All rights reserved.
**
** This file is part of Sailfish Silica UI component package.
**
** You may use this file under the terms of BSD license as follows:
**
** Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are met:
**     * Redistributions of source code must retain the above copyright
**       notice, this list of conditions and the following disclaimer.
**     * Redistributions in binary form must reproduce the above copyright
**       notice, this list of conditions and the following disclaimer in the
**       documentation and/or other materials provided with the distribution.
**     * Neither the name of the Jolla Ltd nor the
**       names of its contributors may be used to endorse or promote products
**       derived from this software without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
** ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
** WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
** DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
** ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
** (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
** ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
** SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
****************************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0
import FileIO 1.0

Page {
    id: page
    signal send(string txt)
    SilicaListView {
        PullDownMenu {
            MenuItem {
                text: qsTr("Settings")
                onClicked: pageStack.push(Qt.resolvedUrl("api.qml"))
             }
         }
    anchors.fill: parent
        header: PageHeader {

            title: "ContactFill"
        }

        model: VisualItemModel {

            ComboBox {
            width: page.width

            label: 'Method'
            currentIndex: -1


                menu: ContextMenu {

                    MenuItem { text: "Email"
                               onClicked: {hidden_field.text='email='; header.title= text; field.label='Email Address'; field.placeholderText=qsTr("Search by ")+text; column.visible=true; field.inputMethodHints= Qt.ImHints}
                    }
                   // MenuItem { text: "Phone"
                     //          onClicked: {hidden_field.text='phone='; header.title= text; field.label='Phone Number Including Country Code'; column.visible=true; field.placeholderText=qsTr("Search By ")+text; field.inputMethodHints= Qt.ImhDialableCharactersOnly}

               // }
                    MenuItem { text: "Twitter"
                               onClicked: {hidden_field.text='twitter='; header.title= text; field.label='Twitter Handel'; column.visible=true; field.placeholderText=qsTr("Search By ")+text; field.inputMethodHints= Qt.ImHints}

                }
                    MenuItem { text: "Facebook"
                               onClicked: {hidden_field.text='facebookUsername='; header.title= text; field.label='Facebook Name'; column.visible=true; field.placeholderText=qsTr("Search By ")+text; field.inputMethodHints= Qt.ImHints}

                }
                }
                description: "Select Search Method"
            }
            Column {
                id: hidden_column
                visible: false
                TextField {
                    id: hidden_field}
            }

            Column {
                id: column
                visible: false
                width: page.width
                spacing: Theme.paddingLarge
                PageHeader {
                    id: header
                    title: qsTr(" ")
                }


                TextField {
                    id: field
                    width: parent.width
                    label: "Search"
                    color: Theme.highlightColor
                    placeholderText: ''
                    EnterKey.onClicked: parent.focus = true


                }

                FileIO {
                    id: myFile
                    source: "/home/nemo/ContactFill.key"
                    onError: console.log(msg)
                }
                Button {
                    id: send_url
                    text: "Search"
                    anchors.horizontalCenter: parent.horizontalCenter
                  // onClicked: console.log(field.text + hidden_field.text)
                    onClicked: pageStack.push(Qt.resolvedUrl('PersonPage.qml'), {api:'person', api_key:myFile.read(), search_method:field.text, param:hidden_field.text})
                }
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
                        qsTr("This is an early testing version") + "<br/><br/>" + qsTr("Report Bugs to") +
                        "<br/> <a href=\"https://github.com/Logic-gate/ContactFill/issues\">" + qsTr("GitHub Page") + "</a>";
                    onLinkActivated:
                    {
                        Qt.openUrlExternally(link);
                    }
                }
            }
}

}
}
