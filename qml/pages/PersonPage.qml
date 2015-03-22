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
import '../js/fullcontact.js' as ContactApi


Page {
    id: page
    property var api: ""
    property var api_key: ""
    property var search_method: ""
    property var param: ""

    Banner {
        id: banner
    }




SilicaFlickable {
    anchors.fill: parent
    contentWidth: parent.width
    contentHeight: col.height + Theme.paddingLarge

   // PullDownMenu {
     //   MenuItem {
          //  text: qsTr("Show Page 2")
         //   onClicked:
       // }
   // }
    Column {
        id: col
        width: parent.width
        spacing: Theme.paddingMedium
        PageHeader { title: 'Results' }
        SectionHeader {
            id: social_header
            visible: false
            text: "Photos"
            font.pixelSize: Theme.fontSizeExtraMeduim

        }



    Repeater {
        id: social_data

        model: ListModel {
            id: imageModel
        }

        delegate: Item {
                    x: Theme.paddingLarge
                    width: parent.width - 2*Theme.paddingLarge
                    height: childrenRect.height

                  Image {
                      id: image_f
                      source: image_source
                      y: Theme.paddingLarge
                      anchors {
                           horizontalCenter: parent.horizontalCenter
                           baseline: primary.baseline
                      }
                  }

                  Label {
                      id: image_type_ //Image Source
                      onTextChanged: {social_header.visible=true}
                      text: image_type
                      color: Theme.highlightColor
                      font.pixelSize: Theme.fontSizeExtraSmall
                      anchors {
                          left: parent.left
                          right: primary.left
                          rightMargin: Theme.paddingSmall
                          topMargin: 10
                      }
                  }

                  Label {
                      id: primary //Image condition
                      horizontalAlignment: Text.AlignRight
                      anchors {
                          right: parent.right
                          baseline: image_type_.baseline
                      }
                      text: 'Primary: '+ isPrimary
                      onTextChanged: {social_header.visible=true}
                      color: Theme.highlightColor
                      font.pixelSize: Theme.fontSizeExtraSmall
                  }

        }
    }

    SectionHeader {
        id: soc_info
        text: "Social Info."
        visible: false
        font.pixelSize: Theme.fontSizeExtraMeduim
    }

    Repeater {
        id: social_

        model: ListModel {
            id: socialModel
        }

        delegate: Item {
                    x: Theme.paddingLarge
                    width: parent.width - 2*Theme.paddingLarge
                    height: childrenRect.height



                  Label {
                      id: social //Social data
                      onTextChanged: {soc_info.visible=true}
                      horizontalAlignment: Text.AlignLeft
                      text: 'User Name for '+typeName + ' is '+ username_
                      color: Theme.highlightColor
                      font.pixelSize: Theme.fontSizeExtraSmall
                      anchors {
                          top: soc_info.bottom
                          left: parent.left
                          right: parent.right
                      }
                  }

                  Text {
                      id: social_url //Social Profile URL
                      horizontalAlignment: Text.AlignRight
                      onTextChanged: {soc_info.visible=true}
                      text: url_
                      color: Theme.secondaryHighlightColor
                      font.pixelSize: Theme.fontSizeExtraSmall
                      anchors {
                          top: social.bottom
                          left: parent.left
                          right: parent.right
                      }
                      onLinkActivated: {
                            Qt.openUrlExternally(url_);
                      }

                  }
        }
    }


    SectionHeader {
        id: name_header
        text: "Contact Name"
        visible: false
        font.pixelSize: Theme.fontSizeExtraMeduim

    }
    Repeater {
        id: name_data

        model: ListModel {
            id: nameModel
        }

        delegate: Item {
                    x: Theme.paddingLarge
                    width: parent.width - 2*Theme.paddingLarge
                    height: childrenRect.height

                 Label {
                     id: contactInfo_FullName //Fullname
                     text: 'Full Name: '+fullname_
                     horizontalAlignment: Text.AlignRight
                     onTextChanged: {name_header.visible=true}
                     color: Theme.highlightColor
                     font.pixelSize: Theme.fontSizeExtraSmall
                     anchors {
                        left: parent.left
                        rightMargin: Theme.paddingSmall
                        topMargin: 10
                        }
                    }

                 Label {
                     id: contactInfo_Name //Fullname
                     text: 'Family Name: '+ familyname_
                     horizontalAlignment: Text.AlignRight
                   onTextChanged: {name_header.visible=true}
                     color: Theme.highlightColor
                     font.pixelSize: Theme.fontSizeExtraSmall
                     anchors {
                        left: parent.left
                        right: contactInfo_FullName.left
                        rightMargin: Theme.paddingSmall
                        topMargin: 10
                        }
                    }

                 Label {
                     id: contactInfo_givenName //Fullname
                     text: 'Given Name: '+ givenName_
                     horizontalAlignment: Text.AlignRight
                   onTextChanged: {name_header.visible=true}
                     color: Theme.highlightColor
                     font.pixelSize: Theme.fontSizeExtraSmall
                     anchors {
                        left: parent.left
                        right: contactInfo_Name.left
                        rightMargin: Theme.paddingSmall
                        topMargin: 10
                        }
                    }


        }

    }

    SectionHeader {
        id: website_header
        text: "Websites"
        visible: false
        font.pixelSize: Theme.fontSizeExtraMeduim

    }
    Repeater {
        id: website_data

        model: ListModel {
            id: websiteModel
        }

        delegate: Item {
                    x: Theme.paddingLarge
                    width: parent.width - 2*Theme.paddingLarge
                    height: childrenRect.height

                  Label {
                      id: contactInfo_website //websites
                      onTextChanged: {website_header.visible=true}
                      text: websites_
                      color: Theme.secondaryHighlightColor
                      font.pixelSize: Theme.fontSizeExtraSmall
                      anchors {
                          right: parent.right
                          baseline: contactInfo_Name.baseline
                      }
                  }

        }

    }


    function get(api, api_key, kwargs, param){
        var xmlhttp = new XMLHttpRequest();
        var url = ContactApi.call(api)['FullCall'];

        var url_made = url+'?apiKey='+api_key+'&'+param+kwargs;
        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                myFunction(xmlhttp.responseText);
                progressCircle.destroy()
          }
            else if (xmlhttp.readyState == 4 && xmlhttp.status == 404) {
                var not_found = JSON.parse(xmlhttp.responseText);
                banner.notify(qsTr(not_found.message));
                 progressCircle.destroy()

                }
            else if (xmlhttp.readyState == 4 && xmlhttp.status == 400){
                banner.notify(qsTr('Bad Request, Please try again'));
                 progressCircle.destroy()

            }
      }
        xmlhttp.open("GET", url_made, true);
        xmlhttp.send();
    }



    function myFunction(json) {
        var obj = JSON.parse(json);

        if (obj.photos.length != 1){
        for (var i = 0; i < obj.photos.length; i++) {
            var multi_image = {
                image_source: obj.photos[i].url,
                image_type: obj.photos[i].typeName,
                isPrimary: obj.photos[i].isPrimary}
                imageModel.append(multi_image)
        };
        }
        else if (obj.photos.length = 1){
               var one_image = {
                image_source: obj.photos[0].url,
                image_type: obj.photos[0].typeName,
                isPrimary: obj.photos[0].isPrimary,
            }
            imageModel.append(one_image)

        }
        if (obj.socialProfiles.length != 1){
            for (var s = 0; s < obj.socialProfiles.length; s++) {
                var multi_social = {
                    typeName: obj.socialProfiles[s].typeName,
                    url_: obj.socialProfiles[s].url,
                    username_: obj.socialProfiles[s].username
                }
                    socialModel.append(multi_social)

            }

        }
         else if (obj.socialProfiles.length = 1){
            var one_social = {
                typeName: obj.socialProfiles.typeName,
                url_: obj.socialProfiles.url,
                username_: obj.socialProfiles.username
            }
                socialModel.append(one_social)
            }


        if (obj.contactInfo.websites.length != 1){
        for (var ii = 0; ii < obj.contactInfo.websites.length;  ii++) {
            var multi_websites = {websites_: obj.contactInfo.websites[i].url};
            console.log(obj.contactInfo.websites[i].url)
              websiteModel.append(multi_websites)
        }
        }

        else if (obj.contactInfo.websites.length = 1) {
            var one_website = {websites_: obj.contactInfo.websites[0].url};
            websiteModel.append(one_website);

        }

        if (obj.contactInfo.websites.length = 1) {
                    var name_data = {fullname_: obj.contactInfo.fullName, familyName_: obj.contactInfo.familyName, givenName_: obj.contactInfo.givenName};
                    nameModel.append(name_data);

                }


        banner.notify(qsTr('Likelihood: '+ obj.likelihood))


    }

    Component.onCompleted: {
         get(api, api_key, search_method, param)
    }

}
}
}
