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
    allowedOrientations: Orientation.Portrait | Orientation.Landscape | Orientation.LandscapeInverted
    signal send(string txt)
    SilicaListView {
        PullDownMenu {
            MenuItem {
                text: qsTr("Settings")
                onClicked: pageStack.push(Qt.resolvedUrl("ContactFill/api.qml"))
             }
            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
             }
         }
    anchors.fill: parent
        header: PageHeader {

            title: qsTr("ContactInfo")
        }

        model: VisualItemModel {

            ComboBox {
            width: page.width

            label: qsTr('Method')
            currentIndex: -1


                menu: ContextMenu {

                    MenuItem { Image {

                            source: '/usr/share/themes/jolla-ambient/meegotouch/icons/icon-lock-email.png'
                                fillMode: Image.PreserveAspectFit
                                anchors.centerIn: parent
                                smooth: true

                        }
                        Text {id: email
                                text: qsTr('Email')
                            visible: false}
                               onClicked: {send_url_callerPy.visible=false; code.visible=false; phone_number.visible=false; send_url.visible=true; field.visible=true; hidden_field.text='email='; header.title= email.text; field.label='Email Address'; field.placeholderText=qsTr("Search by ")+email.text; column.visible=true; field.inputMethodHints= Qt.ImHints}
                    }

                   MenuItem {
                       Image {

                               source: '/usr/share/themes/jolla-ambient/meegotouch/icons/icon-m-phone.png'
                                   fillMode: Image.PreserveAspectFit
                                   anchors.centerIn: parent
                                   smooth: true

                           }

                      Text{ id: phone
                         text: qsTr('Phone')
                         visible: false}
                               onClicked: {send_url.visible=false; field.visible=false; column.visible=true; phone_number.visible=true; code.visible=true; send_url_callerPy.visible=true; header.title=phone.text}

               }
                    MenuItem { Image {

                            source: '/usr/share/themes/jolla-ambient/meegotouch/icons/icon-lock-twitter.png'
                                fillMode: Image.PreserveAspectFit
                                anchors.centerIn: parent
                                smooth: true

                        }
                        Text {id: twitter
                                text: qsTr('Twitter')
                            visible: false}
                               onClicked: {send_url_callerPy.visible=false; code.visible=false; phone_number.visible=false; send_url.visible=true; field.visible=true; hidden_field.text='twitter='; header.title= twitter.text; field.label='Twitter Handel'; column.visible=true; field.placeholderText=qsTr("Search By ")+twitter.text; field.inputMethodHints= Qt.ImHints}

                }
                    MenuItem {Image {

                            source: '/usr/share/themes/jolla-ambient/meegotouch/icons/icon-lock-facebook.png'
                                fillMode: Image.PreserveAspectFit
                                anchors.centerIn: parent
                                smooth: true

                        }
                        Text {id: facebook
                                text: qsTr('Facebook')
                            visible: false}
                               onClicked: {send_url_callerPy.visible=false; code.visible=false; phone_number.visible=false; send_url.visible=true; field.visible=true; hidden_field.text='facebookUsername='; header.title= facebook.text; field.label='Facebook Name'; column.visible=true; field.placeholderText=qsTr("Search By ")+facebook.text; field.inputMethodHints= Qt.ImHints}

                }
                }
                description: qsTr("Select Search Method")
            }
            Column {
                id: hidden_column
                visible: false
                height: -1
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
                    visible: false
                    width: parent.width
                    label: qsTr("Search")
                    color: Theme.highlightColor
                    placeholderText: ''
                    EnterKey.onClicked: parent.focus = true


                }

                TextField {
                    id: phone_number
                    visible: false
                    width: parent.width
                    inputMethodHints: Qt.ImhDialableCharactersOnly
                    label: "Phone Number"
                    placeholderText: "Phone number"
                    placeholderColor: Theme.highlightColor
                    color: Theme.highlightColor
                    horizontalAlignment: textAlignment
                    EnterKey.onClicked: parent.focus = true

                }

                TextField {
                    id: code
                    visible: false
                    width: parent.width
                    inputMethodHints: Qt.ImhDialableCharactersOnly
                    label: "Without + or 00"
                    placeholderText: "Country Code"
                    placeholderColor: Theme.highlightColor
                   color: Theme.highlightColor
                    horizontalAlignment: textAlignment
                    EnterKey.onClicked: parent.focus = true

                }

                FileIO {
                    id: myFile
                    source: "/home/nemo/ContactFill.key"
                    onError: console.log(msg)
                }
                Button {
                    id: send_url
                    visible: false
                    text: qsTr("Search")
                    anchors.horizontalCenter: parent.horizontalCenter
                  // onClicked: console.log(field.text + hidden_field.text)
                    onClicked: pageStack.push(Qt.resolvedUrl('ContactFill/PersonPage.qml'), {api:'person', api_key:myFile.read(), search_method:field.text, param:hidden_field.text})
                }

                Button {
                    id: send_url_callerPy
                    visible: false
                    text: "Search"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: pageStack.push(Qt.resolvedUrl('CallerPy/ResultPage.qml'), {url_send:"http://www.callerpy.com/api/v2/REST?id=&number="+phone_number.text+"&cc="+code.text})
                }
            }

            Column {
                id: column__
                visible: true
                width: page.width
                spacing: Theme.paddingLarge
//                Text
//                {
//                    width: parent.width
//                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
//                    horizontalAlignment: Text.AlignHCenter
//                    textFormat: Text.RichText
//                    font.pixelSize: Theme.fontSizeSmall
//                    color: Theme.secondaryColor
//                    text: "<style>a:link { color: " + Theme.highlightColor + "; }</style><br/>" +
//                        qsTr("This is an early testing version") + "<br/><br/>" + qsTr("Report Bugs to") +
//                        "<br/> <a href=\"https://github.com/Logic-gate/ContactFill/issues\">" + qsTr("GitHub Page") + "</a>";
//                    onLinkActivated:
//                    {
//                        Qt.openUrlExternally(link);
//                    }
//                }
                Image {
                                     id: mainimage
                                       source: '../img/mainpage.png'
                                       width: 300
                                       visible: true
                                           fillMode: Image.PreserveAspectFit
                                           anchors.horizontalCenter: parent.horizontalCenter
                                           anchors.top: header.bottom
                                           smooth: true

                              }

//                Text
//                   {
//                       id: welcome_mesg
//                       width: parent.width
//                       wrapMode: Text.WrapAtWordBoundaryOrAnywhere
//                       horizontalAlignment: Text.AlignHCenter
//                       anchors.top: mainimage.bottom
//                       font.pixelSize: Theme.fontSizeExtraSmall
//                       textFormat: Text.RichText
//                       color: Theme.primaryColor
//                       text: "Welcome to ContactInfo, a contact information utility based on FullContact and Truecaller.<br>
//               It consists of two sub-utilities, <br>CallerPy—a callerID API based on Truecaller. <br>ContactFill—an unofficial client for Fullcontact .";
//                       visible: true
//                   }


//                   Image {
//                       id: mainimage
//                       source: '../img/mainpage.png'
//                       width: 300
//                       visible: true
//                           fillMode: Image.PreserveAspectFit
//                           anchors.horizontalCenter: parent.horizontalCenter
//                           anchors.top: header.bottom
//                           smooth: true

//                   }
            }
}

}
}
