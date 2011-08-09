import Qt 4.7

ListView {
    width: 300; height: 300
    delegate: Text { text: value }
    model: 3
}

