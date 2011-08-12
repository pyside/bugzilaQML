from PySide.QtCore import Qt, QTimer, QUrl
from PySide.QtGui import QApplication
from PySide.QtDeclarative import QDeclarativeView

from BuglistModel import Bugzilla

class FullScreenSwitcherView(QDeclarativeView):
    def keyPressEvent(self, event):
        if event.key() == Qt.Key_F11:
            self.setWindowState(self.windowState() ^ Qt.WindowFullScreen)
            event.accept()

        QDeclarativeView.keyPressEvent(self, event)

def main():
    app = QApplication([])
    bug = Bugzilla()
    view = FullScreenSwitcherView()
    view.setResizeMode(QDeclarativeView.SizeRootObjectToView)
    view.rootContext().setContextProperty('bugmodel', bug)
    view.setSource(QUrl.fromLocalFile('./qml/bugqml.qml'))

    timer = QTimer()
    timer.timeout.connect(bug.update)
    timer.start(1000 * 60 * 10)

    view.showFullScreen()
    app.exec_()


if __name__ == '__main__':
    main()
