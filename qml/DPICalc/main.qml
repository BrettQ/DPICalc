import QtQuick 1.0

Rectangle {
    id: window;

    property int pixelWidth: 0;
    property int pixelHeight: 0;
    property real pixelDiag: Math.sqrt((pixelWidth*pixelWidth) + (pixelHeight*pixelHeight));
    property int screenWidth: 0;
    property int screenHeight: 0;
    property real screenDiag: 0;
    property real screenDiagCalc: Math.sqrt((screenWidth*screenWidth) + (screenHeight*screenHeight));
    property real ppi: screenDiag != 0 ? pixelDiag / screenDiag : pixelDiag / screenDiagCalc;
    property real touchAreaIn: 0;
    property real touchAreaCm: 1;

    width: 360
    height: 640
    color: "black";

    Column {
        id: appColumn;
        height: parent.height;
        width: parent.width;

        // screen resolution section
        Row {
            id: resBox;
            spacing: 0;
            width: parent.width;

            // horizontal resolution field
            Item {
                id: hResField;
                width: parent.width / 2;
                height: hResLabel.paintedHeight + hResBox.height + 4;

                // horizontal resolution label
                Text {
                    id: hResLabel;
                    text: "Horizontal Resolution";
                    color: "white";
                    font.pointSize: 8;
                    wrapMode: Text.WordWrap;
                    height: hResLabel.paintedHeight + 4;
                    width: parent.width - 4;
                    horizontalAlignment: Text.AlignHCenter;
                    verticalAlignment: Text.AlignVCenter;
                    anchors.left: parent.left;
                    anchors.right: parent.right;
                    anchors.top: parent.top;
                }

                // horizontal resolution box
                Rectangle {
                    id: hResBox;
                    anchors.right: parent.right;
                    anchors.rightMargin: 8;
                    anchors.left: parent.left;
                    anchors.leftMargin: 4;
                    anchors.top: hResLabel.bottom;
                    anchors.topMargin: 4;

                    // horizontal resolution input box
                    TextInput {
                        id: hResInput;
                        text: "";

                        validator: IntValidator{bottom: 1; top: 10000;}
                        anchors.fill: parent;
                        focus: true;
                    }
                }
            }
        }


    }

}
