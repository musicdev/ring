# Form/Window Controller - Source Code File

load "frmView.ring"

import System.GUI

if IsMainSourceFile() {
	new App {
		StyleFusion()
		openWindow(:frmController)
		exec()
	}
}

class frmController from windowsControllerParent

	oView = new frmView
	load "hassounaLib.ring"
	t = new FormTools(oView.win)
	t.center()

	func test()
		str = t.inputBoxPass("Enter Password:")
		oView.lbl.setText(str)
