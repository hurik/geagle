=begin
** Form generated from reading ui file 'mainwindow.ui'
**
** Created: Sun Oct 14 05:54:02 2012
**      by: Qt User Interface Compiler version 4.8.1
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_MainWindow
    attr_reader :centralWidget
    attr_reader :verticalLayout_3
    attr_reader :tabWidget
    attr_reader :createDiffImageTab
    attr_reader :verticalLayout_5
    attr_reader :repoGroupBox
    attr_reader :gridLayout
    attr_reader :selectRepoButton
    attr_reader :selectBranchComboBox
    attr_reader :selectBranchButton
    attr_reader :selectRepoEdit
    attr_reader :horizontalLayout1
    attr_reader :oldCommitGroupBox
    attr_reader :verticalLayout_2
    attr_reader :repoLog1
    attr_reader :commitFiles1
    attr_reader :horizontalLayout_2
    attr_reader :getSheetCountButton1
    attr_reader :sheetComboBox1
    attr_reader :sheetEdit1
    attr_reader :newCommitGroupBox_2
    attr_reader :verticalLayout_4
    attr_reader :repoLog2
    attr_reader :commitFiles2
    attr_reader :horizontalLayout_3
    attr_reader :getSheetCountButton2
    attr_reader :sheetComboBox2
    attr_reader :sheetEdit2
    attr_reader :createDiffImageButton
    attr_reader :optionsTab
    attr_reader :verticalLayout_8
    attr_reader :oGroupBox1
    attr_reader :horizontalLayout
    attr_reader :oEagleBinaryEdit
    attr_reader :oEagleBinaryButton
    attr_reader :oGroupBox2
    attr_reader :formLayout
    attr_reader :oSchematicLabel
    attr_reader :oSchematicEdit
    attr_reader :oBoardLabel
    attr_reader :oBoardEdit
    attr_reader :oGroupBox3
    attr_reader :verticalLayout
    attr_reader :oHorizontalLayout2
    attr_reader :oRepoPresetLabel
    attr_reader :oRepoPresetEdit
    attr_reader :oRepoPresetButton
    attr_reader :oHorizontalLayout3
    attr_reader :oRepoPresetBranchLabel
    attr_reader :oRepoPresetBranchEdit
    attr_reader :oGroupBox4
    attr_reader :verticalLayout_6
    attr_reader :oImageViewer
    attr_reader :oGroupBox5
    attr_reader :verticalLayout_7
    attr_reader :oHideTimezone
    attr_reader :oHorizontalLayout1
    attr_reader :oHorizontalSpacer
    attr_reader :oSaveButton
    attr_reader :oVerticalSpacer
    attr_reader :infoTab
    attr_reader :verticalLayout_9
    attr_reader :label
    attr_reader :statusBar

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(800, 600)
    mainWindow.layoutDirection = Qt::LeftToRight
    mainWindow.autoFillBackground = false
    @centralWidget = Qt::Widget.new(mainWindow)
    @centralWidget.objectName = "centralWidget"
    @verticalLayout_3 = Qt::VBoxLayout.new(@centralWidget)
    @verticalLayout_3.spacing = 6
    @verticalLayout_3.margin = 11
    @verticalLayout_3.objectName = "verticalLayout_3"
    @tabWidget = Qt::TabWidget.new(@centralWidget)
    @tabWidget.objectName = "tabWidget"
    @createDiffImageTab = Qt::Widget.new()
    @createDiffImageTab.objectName = "createDiffImageTab"
    @verticalLayout_5 = Qt::VBoxLayout.new(@createDiffImageTab)
    @verticalLayout_5.spacing = 6
    @verticalLayout_5.margin = 11
    @verticalLayout_5.objectName = "verticalLayout_5"
    @repoGroupBox = Qt::GroupBox.new(@createDiffImageTab)
    @repoGroupBox.objectName = "repoGroupBox"
    @gridLayout = Qt::GridLayout.new(@repoGroupBox)
    @gridLayout.spacing = 6
    @gridLayout.margin = 11
    @gridLayout.objectName = "gridLayout"
    @selectRepoButton = Qt::PushButton.new(@repoGroupBox)
    @selectRepoButton.objectName = "selectRepoButton"
    @sizePolicy = Qt::SizePolicy.new(Qt::SizePolicy::Fixed, Qt::SizePolicy::Fixed)
    @sizePolicy.setHorizontalStretch(0)
    @sizePolicy.setVerticalStretch(0)
    @sizePolicy.heightForWidth = @selectRepoButton.sizePolicy.hasHeightForWidth
    @selectRepoButton.sizePolicy = @sizePolicy

    @gridLayout.addWidget(@selectRepoButton, 0, 1, 1, 1)

    @selectBranchComboBox = Qt::ComboBox.new(@repoGroupBox)
    @selectBranchComboBox.objectName = "selectBranchComboBox"
    @selectBranchComboBox.enabled = false

    @gridLayout.addWidget(@selectBranchComboBox, 1, 0, 1, 1)

    @selectBranchButton = Qt::PushButton.new(@repoGroupBox)
    @selectBranchButton.objectName = "selectBranchButton"
    @selectBranchButton.enabled = false

    @gridLayout.addWidget(@selectBranchButton, 1, 1, 1, 1)

    @selectRepoEdit = Qt::LineEdit.new(@repoGroupBox)
    @selectRepoEdit.objectName = "selectRepoEdit"

    @gridLayout.addWidget(@selectRepoEdit, 0, 0, 1, 1)


    @verticalLayout_5.addWidget(@repoGroupBox)

    @horizontalLayout1 = Qt::HBoxLayout.new()
    @horizontalLayout1.spacing = 6
    @horizontalLayout1.objectName = "horizontalLayout1"
    @oldCommitGroupBox = Qt::GroupBox.new(@createDiffImageTab)
    @oldCommitGroupBox.objectName = "oldCommitGroupBox"
    @verticalLayout_2 = Qt::VBoxLayout.new(@oldCommitGroupBox)
    @verticalLayout_2.spacing = 6
    @verticalLayout_2.margin = 11
    @verticalLayout_2.objectName = "verticalLayout_2"
    @repoLog1 = Qt::TableView.new(@oldCommitGroupBox)
    @repoLog1.objectName = "repoLog1"
    @repoLog1.editTriggers = Qt::AbstractItemView::NoEditTriggers
    @repoLog1.selectionMode = Qt::AbstractItemView::SingleSelection
    @repoLog1.selectionBehavior = Qt::AbstractItemView::SelectRows
    @repoLog1.verticalScrollMode = Qt::AbstractItemView::ScrollPerItem
    @repoLog1.horizontalScrollMode = Qt::AbstractItemView::ScrollPerPixel
    @repoLog1.sortingEnabled = false

    @verticalLayout_2.addWidget(@repoLog1)

    @commitFiles1 = Qt::TableView.new(@oldCommitGroupBox)
    @commitFiles1.objectName = "commitFiles1"
    @commitFiles1.editTriggers = Qt::AbstractItemView::NoEditTriggers
    @commitFiles1.selectionMode = Qt::AbstractItemView::SingleSelection
    @commitFiles1.selectionBehavior = Qt::AbstractItemView::SelectRows
    @commitFiles1.horizontalScrollMode = Qt::AbstractItemView::ScrollPerPixel
    @commitFiles1.sortingEnabled = false

    @verticalLayout_2.addWidget(@commitFiles1)

    @horizontalLayout_2 = Qt::HBoxLayout.new()
    @horizontalLayout_2.spacing = 6
    @horizontalLayout_2.objectName = "horizontalLayout_2"
    @getSheetCountButton1 = Qt::PushButton.new(@oldCommitGroupBox)
    @getSheetCountButton1.objectName = "getSheetCountButton1"
    @getSheetCountButton1.enabled = false

    @horizontalLayout_2.addWidget(@getSheetCountButton1)

    @sheetComboBox1 = Qt::ComboBox.new(@oldCommitGroupBox)
    @sheetComboBox1.objectName = "sheetComboBox1"
    @sheetComboBox1.enabled = false

    @horizontalLayout_2.addWidget(@sheetComboBox1)

    @sheetEdit1 = Qt::LineEdit.new(@oldCommitGroupBox)
    @sheetEdit1.objectName = "sheetEdit1"
    @sheetEdit1.enabled = false

    @horizontalLayout_2.addWidget(@sheetEdit1)


    @verticalLayout_2.addLayout(@horizontalLayout_2)


    @horizontalLayout1.addWidget(@oldCommitGroupBox)

    @newCommitGroupBox_2 = Qt::GroupBox.new(@createDiffImageTab)
    @newCommitGroupBox_2.objectName = "newCommitGroupBox_2"
    @verticalLayout_4 = Qt::VBoxLayout.new(@newCommitGroupBox_2)
    @verticalLayout_4.spacing = 6
    @verticalLayout_4.margin = 11
    @verticalLayout_4.objectName = "verticalLayout_4"
    @repoLog2 = Qt::TableView.new(@newCommitGroupBox_2)
    @repoLog2.objectName = "repoLog2"
    @repoLog2.editTriggers = Qt::AbstractItemView::NoEditTriggers
    @repoLog2.selectionMode = Qt::AbstractItemView::SingleSelection
    @repoLog2.selectionBehavior = Qt::AbstractItemView::SelectRows
    @repoLog2.verticalScrollMode = Qt::AbstractItemView::ScrollPerItem
    @repoLog2.horizontalScrollMode = Qt::AbstractItemView::ScrollPerPixel

    @verticalLayout_4.addWidget(@repoLog2)

    @commitFiles2 = Qt::TableView.new(@newCommitGroupBox_2)
    @commitFiles2.objectName = "commitFiles2"
    @commitFiles2.editTriggers = Qt::AbstractItemView::NoEditTriggers
    @commitFiles2.selectionMode = Qt::AbstractItemView::SingleSelection
    @commitFiles2.selectionBehavior = Qt::AbstractItemView::SelectRows
    @commitFiles2.horizontalScrollMode = Qt::AbstractItemView::ScrollPerPixel

    @verticalLayout_4.addWidget(@commitFiles2)

    @horizontalLayout_3 = Qt::HBoxLayout.new()
    @horizontalLayout_3.spacing = 6
    @horizontalLayout_3.objectName = "horizontalLayout_3"
    @getSheetCountButton2 = Qt::PushButton.new(@newCommitGroupBox_2)
    @getSheetCountButton2.objectName = "getSheetCountButton2"
    @getSheetCountButton2.enabled = false

    @horizontalLayout_3.addWidget(@getSheetCountButton2)

    @sheetComboBox2 = Qt::ComboBox.new(@newCommitGroupBox_2)
    @sheetComboBox2.objectName = "sheetComboBox2"
    @sheetComboBox2.enabled = false

    @horizontalLayout_3.addWidget(@sheetComboBox2)

    @sheetEdit2 = Qt::LineEdit.new(@newCommitGroupBox_2)
    @sheetEdit2.objectName = "sheetEdit2"
    @sheetEdit2.enabled = false

    @horizontalLayout_3.addWidget(@sheetEdit2)


    @verticalLayout_4.addLayout(@horizontalLayout_3)


    @horizontalLayout1.addWidget(@newCommitGroupBox_2)


    @verticalLayout_5.addLayout(@horizontalLayout1)

    @createDiffImageButton = Qt::PushButton.new(@createDiffImageTab)
    @createDiffImageButton.objectName = "createDiffImageButton"

    @verticalLayout_5.addWidget(@createDiffImageButton)

    @tabWidget.addTab(@createDiffImageTab, Qt::Application.translate("MainWindow", "Create diff image", nil, Qt::Application::UnicodeUTF8))
    @optionsTab = Qt::Widget.new()
    @optionsTab.objectName = "optionsTab"
    @verticalLayout_8 = Qt::VBoxLayout.new(@optionsTab)
    @verticalLayout_8.spacing = 6
    @verticalLayout_8.margin = 11
    @verticalLayout_8.objectName = "verticalLayout_8"
    @oGroupBox1 = Qt::GroupBox.new(@optionsTab)
    @oGroupBox1.objectName = "oGroupBox1"
    @horizontalLayout = Qt::HBoxLayout.new(@oGroupBox1)
    @horizontalLayout.spacing = 6
    @horizontalLayout.margin = 11
    @horizontalLayout.objectName = "horizontalLayout"
    @oEagleBinaryEdit = Qt::LineEdit.new(@oGroupBox1)
    @oEagleBinaryEdit.objectName = "oEagleBinaryEdit"

    @horizontalLayout.addWidget(@oEagleBinaryEdit)

    @oEagleBinaryButton = Qt::PushButton.new(@oGroupBox1)
    @oEagleBinaryButton.objectName = "oEagleBinaryButton"

    @horizontalLayout.addWidget(@oEagleBinaryButton)


    @verticalLayout_8.addWidget(@oGroupBox1)

    @oGroupBox2 = Qt::GroupBox.new(@optionsTab)
    @oGroupBox2.objectName = "oGroupBox2"
    @formLayout = Qt::FormLayout.new(@oGroupBox2)
    @formLayout.spacing = 6
    @formLayout.margin = 11
    @formLayout.objectName = "formLayout"
    @oSchematicLabel = Qt::Label.new(@oGroupBox2)
    @oSchematicLabel.objectName = "oSchematicLabel"
    @oSchematicLabel.minimumSize = Qt::Size.new(60, 0)

    @formLayout.setWidget(0, Qt::FormLayout::LabelRole, @oSchematicLabel)

    @oSchematicEdit = Qt::LineEdit.new(@oGroupBox2)
    @oSchematicEdit.objectName = "oSchematicEdit"

    @formLayout.setWidget(0, Qt::FormLayout::FieldRole, @oSchematicEdit)

    @oBoardLabel = Qt::Label.new(@oGroupBox2)
    @oBoardLabel.objectName = "oBoardLabel"
    @oBoardLabel.minimumSize = Qt::Size.new(60, 0)

    @formLayout.setWidget(1, Qt::FormLayout::LabelRole, @oBoardLabel)

    @oBoardEdit = Qt::LineEdit.new(@oGroupBox2)
    @oBoardEdit.objectName = "oBoardEdit"

    @formLayout.setWidget(1, Qt::FormLayout::FieldRole, @oBoardEdit)


    @verticalLayout_8.addWidget(@oGroupBox2)

    @oGroupBox3 = Qt::GroupBox.new(@optionsTab)
    @oGroupBox3.objectName = "oGroupBox3"
    @verticalLayout = Qt::VBoxLayout.new(@oGroupBox3)
    @verticalLayout.spacing = 6
    @verticalLayout.margin = 11
    @verticalLayout.objectName = "verticalLayout"
    @oHorizontalLayout2 = Qt::HBoxLayout.new()
    @oHorizontalLayout2.spacing = 6
    @oHorizontalLayout2.objectName = "oHorizontalLayout2"
    @oRepoPresetLabel = Qt::Label.new(@oGroupBox3)
    @oRepoPresetLabel.objectName = "oRepoPresetLabel"
    @oRepoPresetLabel.minimumSize = Qt::Size.new(60, 0)

    @oHorizontalLayout2.addWidget(@oRepoPresetLabel)

    @oRepoPresetEdit = Qt::LineEdit.new(@oGroupBox3)
    @oRepoPresetEdit.objectName = "oRepoPresetEdit"

    @oHorizontalLayout2.addWidget(@oRepoPresetEdit)

    @oRepoPresetButton = Qt::PushButton.new(@oGroupBox3)
    @oRepoPresetButton.objectName = "oRepoPresetButton"

    @oHorizontalLayout2.addWidget(@oRepoPresetButton)


    @verticalLayout.addLayout(@oHorizontalLayout2)

    @oHorizontalLayout3 = Qt::HBoxLayout.new()
    @oHorizontalLayout3.spacing = 6
    @oHorizontalLayout3.objectName = "oHorizontalLayout3"
    @oRepoPresetBranchLabel = Qt::Label.new(@oGroupBox3)
    @oRepoPresetBranchLabel.objectName = "oRepoPresetBranchLabel"
    @oRepoPresetBranchLabel.minimumSize = Qt::Size.new(60, 0)

    @oHorizontalLayout3.addWidget(@oRepoPresetBranchLabel)

    @oRepoPresetBranchEdit = Qt::LineEdit.new(@oGroupBox3)
    @oRepoPresetBranchEdit.objectName = "oRepoPresetBranchEdit"

    @oHorizontalLayout3.addWidget(@oRepoPresetBranchEdit)


    @verticalLayout.addLayout(@oHorizontalLayout3)


    @verticalLayout_8.addWidget(@oGroupBox3)

    @oGroupBox4 = Qt::GroupBox.new(@optionsTab)
    @oGroupBox4.objectName = "oGroupBox4"
    @verticalLayout_6 = Qt::VBoxLayout.new(@oGroupBox4)
    @verticalLayout_6.spacing = 6
    @verticalLayout_6.margin = 11
    @verticalLayout_6.objectName = "verticalLayout_6"
    @oImageViewer = Qt::LineEdit.new(@oGroupBox4)
    @oImageViewer.objectName = "oImageViewer"

    @verticalLayout_6.addWidget(@oImageViewer)


    @verticalLayout_8.addWidget(@oGroupBox4)

    @oGroupBox5 = Qt::GroupBox.new(@optionsTab)
    @oGroupBox5.objectName = "oGroupBox5"
    @verticalLayout_7 = Qt::VBoxLayout.new(@oGroupBox5)
    @verticalLayout_7.spacing = 6
    @verticalLayout_7.margin = 11
    @verticalLayout_7.objectName = "verticalLayout_7"
    @oHideTimezone = Qt::CheckBox.new(@oGroupBox5)
    @oHideTimezone.objectName = "oHideTimezone"
    @oHideTimezone.checked = true

    @verticalLayout_7.addWidget(@oHideTimezone)


    @verticalLayout_8.addWidget(@oGroupBox5)

    @oHorizontalLayout1 = Qt::HBoxLayout.new()
    @oHorizontalLayout1.spacing = 6
    @oHorizontalLayout1.objectName = "oHorizontalLayout1"
    @oHorizontalSpacer = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @oHorizontalLayout1.addItem(@oHorizontalSpacer)

    @oSaveButton = Qt::PushButton.new(@optionsTab)
    @oSaveButton.objectName = "oSaveButton"

    @oHorizontalLayout1.addWidget(@oSaveButton)


    @verticalLayout_8.addLayout(@oHorizontalLayout1)

    @oVerticalSpacer = Qt::SpacerItem.new(20, 40, Qt::SizePolicy::Minimum, Qt::SizePolicy::Expanding)

    @verticalLayout_8.addItem(@oVerticalSpacer)

    @tabWidget.addTab(@optionsTab, Qt::Application.translate("MainWindow", "Options", nil, Qt::Application::UnicodeUTF8))
    @infoTab = Qt::Widget.new()
    @infoTab.objectName = "infoTab"
    @verticalLayout_9 = Qt::VBoxLayout.new(@infoTab)
    @verticalLayout_9.spacing = 6
    @verticalLayout_9.margin = 11
    @verticalLayout_9.objectName = "verticalLayout_9"
    @label = Qt::Label.new(@infoTab)
    @label.objectName = "label"
    @label.textFormat = Qt::AutoText
    @label.alignment = Qt::AlignHCenter|Qt::AlignTop
    @label.wordWrap = true
    @label.openExternalLinks = true

    @verticalLayout_9.addWidget(@label)

    @tabWidget.addTab(@infoTab, Qt::Application.translate("MainWindow", "Info", nil, Qt::Application::UnicodeUTF8))

    @verticalLayout_3.addWidget(@tabWidget)

    mainWindow.centralWidget = @centralWidget
    @statusBar = Qt::StatusBar.new(mainWindow)
    @statusBar.objectName = "statusBar"
    mainWindow.statusBar = @statusBar
    Qt::Widget.setTabOrder(@selectRepoEdit, @selectRepoButton)
    Qt::Widget.setTabOrder(@selectRepoButton, @selectBranchComboBox)
    Qt::Widget.setTabOrder(@selectBranchComboBox, @selectBranchButton)
    Qt::Widget.setTabOrder(@selectBranchButton, @repoLog1)
    Qt::Widget.setTabOrder(@repoLog1, @commitFiles1)
    Qt::Widget.setTabOrder(@commitFiles1, @getSheetCountButton1)
    Qt::Widget.setTabOrder(@getSheetCountButton1, @sheetComboBox1)
    Qt::Widget.setTabOrder(@sheetComboBox1, @sheetEdit1)
    Qt::Widget.setTabOrder(@sheetEdit1, @repoLog2)
    Qt::Widget.setTabOrder(@repoLog2, @commitFiles2)
    Qt::Widget.setTabOrder(@commitFiles2, @getSheetCountButton2)
    Qt::Widget.setTabOrder(@getSheetCountButton2, @sheetComboBox2)
    Qt::Widget.setTabOrder(@sheetComboBox2, @sheetEdit2)
    Qt::Widget.setTabOrder(@sheetEdit2, @createDiffImageButton)
    Qt::Widget.setTabOrder(@createDiffImageButton, @tabWidget)
    Qt::Widget.setTabOrder(@tabWidget, @oEagleBinaryEdit)
    Qt::Widget.setTabOrder(@oEagleBinaryEdit, @oEagleBinaryButton)
    Qt::Widget.setTabOrder(@oEagleBinaryButton, @oSchematicEdit)
    Qt::Widget.setTabOrder(@oSchematicEdit, @oBoardEdit)
    Qt::Widget.setTabOrder(@oBoardEdit, @oRepoPresetEdit)
    Qt::Widget.setTabOrder(@oRepoPresetEdit, @oRepoPresetButton)
    Qt::Widget.setTabOrder(@oRepoPresetButton, @oRepoPresetBranchEdit)
    Qt::Widget.setTabOrder(@oRepoPresetBranchEdit, @oImageViewer)
    Qt::Widget.setTabOrder(@oImageViewer, @oHideTimezone)
    Qt::Widget.setTabOrder(@oHideTimezone, @oSaveButton)

    retranslateUi(mainWindow)

    @tabWidget.setCurrentIndex(0)


    Qt::MetaObject.connectSlotsByName(mainWindow)
    end # setupUi

    def setup_ui(mainWindow)
        setupUi(mainWindow)
    end

    def retranslateUi(mainWindow)
    mainWindow.windowTitle = Qt::Application.translate("MainWindow", "Geagle", nil, Qt::Application::UnicodeUTF8)
    @repoGroupBox.title = Qt::Application.translate("MainWindow", "Repo", nil, Qt::Application::UnicodeUTF8)
    @selectRepoButton.text = Qt::Application.translate("MainWindow", "Open", nil, Qt::Application::UnicodeUTF8)
    @selectBranchButton.text = Qt::Application.translate("MainWindow", "Select", nil, Qt::Application::UnicodeUTF8)
    @oldCommitGroupBox.title = Qt::Application.translate("MainWindow", "Old commit", nil, Qt::Application::UnicodeUTF8)
    @getSheetCountButton1.text = Qt::Application.translate("MainWindow", "Count sheets", nil, Qt::Application::UnicodeUTF8)
    @newCommitGroupBox_2.title = Qt::Application.translate("MainWindow", "New commit", nil, Qt::Application::UnicodeUTF8)
    @getSheetCountButton2.text = Qt::Application.translate("MainWindow", "Count sheets", nil, Qt::Application::UnicodeUTF8)
    @createDiffImageButton.text = Qt::Application.translate("MainWindow", "Create diff image", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@createDiffImageTab), Qt::Application.translate("MainWindow", "Create diff image", nil, Qt::Application::UnicodeUTF8))
    @oGroupBox1.title = Qt::Application.translate("MainWindow", "Eagle binary", nil, Qt::Application::UnicodeUTF8)
    @oEagleBinaryButton.text = Qt::Application.translate("MainWindow", "Select", nil, Qt::Application::UnicodeUTF8)
    @oGroupBox2.title = Qt::Application.translate("MainWindow", "Image dpi", nil, Qt::Application::UnicodeUTF8)
    @oSchematicLabel.text = Qt::Application.translate("MainWindow", "Schematic", nil, Qt::Application::UnicodeUTF8)
    @oBoardLabel.text = Qt::Application.translate("MainWindow", "Board", nil, Qt::Application::UnicodeUTF8)
    @oGroupBox3.title = Qt::Application.translate("MainWindow", "Repo preset", nil, Qt::Application::UnicodeUTF8)
    @oRepoPresetLabel.text = Qt::Application.translate("MainWindow", "Repo", nil, Qt::Application::UnicodeUTF8)
    @oRepoPresetButton.text = Qt::Application.translate("MainWindow", "Select", nil, Qt::Application::UnicodeUTF8)
    @oRepoPresetBranchLabel.text = Qt::Application.translate("MainWindow", "Branch", nil, Qt::Application::UnicodeUTF8)
    @oGroupBox4.title = Qt::Application.translate("MainWindow", "Image Viewer", nil, Qt::Application::UnicodeUTF8)
    @oGroupBox5.title = Qt::Application.translate("MainWindow", "Repo view options", nil, Qt::Application::UnicodeUTF8)
    @oHideTimezone.text = Qt::Application.translate("MainWindow", "Hide timezone in repo view", nil, Qt::Application::UnicodeUTF8)
    @oSaveButton.text = Qt::Application.translate("MainWindow", "Save", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@optionsTab), Qt::Application.translate("MainWindow", "Options", nil, Qt::Application::UnicodeUTF8))
    @label.text = Qt::Application.translate("MainWindow", "<p><span style=\"font-size:16pt\"><strong>Geagle</strong></span></p><p><strong>Description:</strong><br />If you are working on an CadSoft EAGLE project with a team and you are tracking your progress with Git, this little programm can help you to see what your team has changed. It makes an diff image which shows the changes on the schematics and boards between the commits.</p><p><strong>Homepage:</strong><br /><a href=\"https://github.com/hurik/geagle\">https://github.com/hurik/geagle</a></p><p><strong>Author:</strong><br />  Andreas Giemza<br /><a href=\"mailto:andreas@giemza.net\">andreas@giemza.net</a><br /><a href=\"http://www.hurik.de\">http://www.hurik.de</a></p><p><strong>Credits:</strong><br />This little programm based on <a href=\"https://gitorious.org/gitedaous/eagle-converter\">eagle-converter</a> by Patrick Franken, he made the countSheets.ulp and the eagle calls.</p>", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@infoTab), Qt::Application.translate("MainWindow", "Info", nil, Qt::Application::UnicodeUTF8))
    end # retranslateUi

    def retranslate_ui(mainWindow)
        retranslateUi(mainWindow)
    end

end

module Ui
    class MainWindow < Ui_MainWindow
    end
end  # module Ui

