from PySide.QtCore import *
from PySide.QtGui import *
from PySide.QtNetwork import *
from PySide.QtDeclarative import *

class Bugzilla (QAbstractListModel):

    # Role names
    TITLE = 0
    VALUE = 1

    def __init__(self, parent = None):
        QAbstractListModel.__init__(self, parent)
        self.manager = QNetworkAccessManager(self)
        self.manager.finished[QNetworkReply].connect(self.replyFinished)
        self._data = {
            'P1' : 0,
            'P2' : 0,
            'P3' : 0,
            'P4' : 0,
            'P5' : 0,
            'FIXED' : 0,
            'UNCONFIRMED' : 0,
            '---' : 0
        }
        self._maxValue = 0
        self.setRoleNames({self.TITLE : 'title', self.VALUE : 'value'})
        self.update()

    @Slot()
    def update(self):
        url = "http://bugs.pyside.org/buglist.cgi?bug_status=UNCONFIRMED&bug_status=NEW&bug_status=WAITING&bug_status=ASSIGNED&bug_status=REOPENED&bug_status=RESOLVED&bug_status=VERIFIED&product=PySide&query_format=advanced&resolution=---&resolution=FIXED&ctype=csv"
        self.manager.get(QNetworkRequest(QUrl(url)))

    @Slot(QNetworkReply)
    def replyFinished(self, reply):
        self._data = {
                'P1' : 0,
                'P2' : 0,
                'P3' : 0,
                'P4' : 0,
                'P5' : 0,
                'FIXED' : 0,
                'UNCONFIRMED' : 0,
                '---' : 0
            }

        while not reply.atEnd():
            d = str(reply.readLine()).split("\",\"")
            for i in (1, 4, 5):
                key = d[i]
                if key in self._data:
                    self._data[key] += 1

        self._maxValue = max(self._data['P1'], self._data['P2'], self._data['P3'], self._data['P4'], self._data['P5'])
        reply.deleteLater()
        self.dataChanged.emit(self.index(0, 0), self.index(4, 0))
        self.modelUpdated.emit()

    def getMaxValue(self):
        return self._maxValue

    modelUpdated = Signal()
    maxValue = Property(int, getMaxValue, notify = modelUpdated)

    def getUnconfirmedBugs(self):
        return self._data['UNCONFIRMED']
    unconfirmedBugs = Property(int, getUnconfirmedBugs, notify = modelUpdated)

    def getFixedBugs(self):
        return self._data['FIXED']
    fixedBugs = Property(int, getFixedBugs, notify = modelUpdated)

    def getOpenedBugs(self):
        return self._data['---']
    openedBugs = Property(int, getOpenedBugs, notify = modelUpdated)


    def rowCount(self, index):
        return 5

    def data(self, index, role):
        key = 'P%s' % (index.row() + 1)
        if role == self.TITLE:
            return key
        elif role == self.VALUE:
            return self._data[key]
        return None

def main():
    app = QApplication([])
    bug = Bugzilla()
    view = QDeclarativeView()
    view.rootContext().setContextProperty('bugmodel', bug)
    view.setSource(QUrl.fromLocalFile('bugqml.qml'))

    timer = QTimer()
    timer.timeout.connect(bug.update)
    timer.start(1000 * 60 * 1)

    view.show()
    app.exec_()


if __name__ == '__main__':
    main()
