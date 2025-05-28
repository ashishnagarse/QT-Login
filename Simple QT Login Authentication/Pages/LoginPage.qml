import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import CBPM

Page {

    id: loginpage
    background: null  // <- This disables Page's default background

    signal loginSuccessful(string email)

    property bool isLoginMode: true

    Component.onCompleted: {
        if (database.hasSavedCredentials()) {
            emailInput.text = database.getSavedEmail()
            passwordInput.text = database.getSavedPassword()
            rememberMeCheckBox.checked = true
        }
    }

    width: 400
    height: 700
    visible: true

    Rectangle{
        anchors.fill: parent
        color: "#fafafa"
        radius: 40


        ColumnLayout{
            anchors{
                fill: parent

                margins: 20

                bottomMargin: 50
            }

            spacing: 0

            Image{
                Layout.fillWidth: true
                Layout.preferredHeight: 200
                source: "qrc:/Images/BgImage.png"
            }

            Label{
                text: isLoginMode ? qsTr("Welcome Back") : qsTr("Create Account")

                color: "#1a1a1a"
                font{
                    pointSize: 16
                    weight: Font.DemiBold
                }
                Layout.alignment: Qt.AlignHCenter
            }

            Text{
                text: isLoginMode ? qsTr("Sign in to account") : qsTr("Register new account")

                color: "#777"
                font{
                    pointSize: 10
                    weight: Font.Normal
                }
                Layout.alignment: Qt.AlignHCenter
            }


            Item{
                Layout.preferredHeight: 10
            }

            CustomInput{
                id: emailInput
                Layout.fillWidth: true
                placeholderText: qsTr("Enter your Email")
                imageSource:"qrc:/Images/mail.svg"
            }

            Item{
                Layout.preferredHeight: 10
            }


            CustomInput{
                id: passwordInput
                Layout.fillWidth: true
                placeholderText: qsTr("Enter your Password")
                echoMode: TextField.Password
                imageSource:"qrc:/Images/lock.svg"
            }

            Item{
                Layout.preferredHeight: 10
            }

            RowLayout{
                Layout.fillWidth: true
                visible: isLoginMode

                CustomCheckBox{
                    id: rememberMeCheckBox
                    text: qsTr("Remember Me")
                    font.pointSize: 12
                }

                Item{
                    Layout.fillWidth: true // Eat all the space between checkbox and forgot button
                }

                Label{
                    text: qsTr("Forgot Password ?")
                    font.pointSize: 12
                    color: "#ff3951"
                }
            }

            Item{
                Layout.fillHeight: true // Eat all the height
            }

            CustomButton{
                Layout.fillWidth: true
                text: isLoginMode ? qsTr("Login >") : qsTr("Register >")
                onClicked: {
                    if (isLoginMode) {
                        if (database.loginUser(emailInput.text, passwordInput.text)) {
                            console.log("Login successful")
                            if (rememberMeCheckBox.checked) {
                                database.saveCredentials(emailInput.text, passwordInput.text)
                            } else {
                                database.clearSavedCredentials()
                            }
                            loginSuccessful(emailInput.text)
                        } else {
                            console.log("Login failed")
                        }
                    } else {
                        if (database.registerUser(emailInput.text, passwordInput.text)) {
                            console.log("Registration successful")
                            isLoginMode = true
                        } else {
                            console.log("Registration failed")
                        }
                    }
                }
            }

            Item{
                Layout.preferredHeight: 10
            }

            Label{
                Layout.alignment: Qt.AlignHCenter
                text: isLoginMode ? 
                    qsTr("New Member? <font color='#ff3951'><b>Register Now</b></font>") :
                    qsTr("Already have an account? <font color='#ff3951'><b>Login</b></font>")
                font{
                    pointSize: 10
                    weight: Font.Normal
                }
                color: "#1e1e1e"
                textFormat: Text.RichText

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        isLoginMode = !isLoginMode
                        emailInput.text = ""
                        passwordInput.text = ""
                        if (!isLoginMode) {
                            rememberMeCheckBox.checked = false
                            database.clearSavedCredentials()
                        }
                    }
                }
            }



        }

    }









    Action{ // A way to add shortcuts
        shortcut:  "Ctrl+q"
        onTriggered: Qt.quit()
    }
}
