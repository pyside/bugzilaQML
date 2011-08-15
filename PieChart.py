from PySide.QtCore import Property, Signal
from PySide.QtGui import QColor, QGraphicsItem, QPainter, QPen, QBrush
from PySide.QtDeclarative import QDeclarativeItem, ListProperty, qmlRegisterType

class PieSlice (QDeclarativeItem):

    def __init__(self, parent = None):
        QDeclarativeItem.__init__(self, parent)
        # need to disable this flag to draw inside a QDeclarativeItem
        self.setFlag(QGraphicsItem.ItemHasNoContents, False)
        self._value = 0
        self.valueChanged.connect(self.needUpdate)

    def needUpdate(self):
        self.update()

    def getValue(self):
        return self._value

    def setValue(self, value):
        self._value = value
        self.valueChanged.emit()

    def paint(self, painter, options, widget):
        angleSpan = 0
        angle = 0
        index = 0
        sumValues = self.parentItem().sumValues
        if sumValues == 0:
            return

        for item in self.parentItem().children():
            angleSpan = (360.0 * item.value) / sumValues
            if item == self:
                break
            else:
                angle += angleSpan
                index += 1

        color = QColor.fromHslF(0.1 * index, 1.0, 0.5, 1.0)
        pen = QPen(color)
        brush = QBrush(color)

        painter.setPen(pen)
        painter.setBrush(brush)
        painter.setRenderHints(QPainter.Antialiasing, True)

        painter.drawPie(self.boundingRect(), angle * 16, angleSpan * 16);


    valueChanged = Signal()
    value = Property(int, getValue, setValue, notify=valueChanged)

class PieChart (QDeclarativeItem):

    def __init__(self, parent = None):
        QDeclarativeItem.__init__(self, parent)
        self._name = u''
        self._slices = []
        self._sum = 0

    def getName(self):
        return self._name

    def setName(self, value):
        self._name = value

    def getSum(self):
        return self._sum

    valuesChange = Signal()
    name = Property(unicode, getName, setName)
    sumValues = Property(float, getSum, notify=valuesChange)

    def updateSum(self):
        self._sum = 0
        for s in self._slices:
            self._sum += s.value
        self.valuesChange.emit()

    def appendSlice(self, _slice):
        _slice.setParentItem(self)
        self._slices.append(_slice)
        self._sum += _slice.value
        _slice.valueChanged.connect(self.updateSum)

    slices = ListProperty(PieSlice, appendSlice)

def registerComponents():
    qmlRegisterType(PieChart, 'Charts', 1, 0, 'PieChart');
    qmlRegisterType(PieSlice, 'Charts', 1, 0, 'PieSlice');
