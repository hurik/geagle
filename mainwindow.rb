require './ui_mainwindow.rb'	

require 'grit'
require 'oily_png'
include ChunkyPNG::Color

class MainWindow < Qt::MainWindow

	slots	'on_selectRepoButton_clicked()',
			'on_selectBranchButton_clicked()',
			'on_repoLog1_clicked()',
			'on_commitFiles1_clicked()',
			'on_getSheetCountButton1_clicked()',			
			'on_repoLog2_clicked()',
			'on_commitFiles2_clicked()',
			'on_getSheetCountButton2_clicked()',
			'on_createDiffImageButton_clicked()',
			'on_oEagleBinaryButton_clicked()',
			'on_oRepoPresetButton_clicked()',
			'on_oSaveButton_clicked()'		


	########## Setup functions ##########

	def initialize(parent = nil)
		super(parent)
		@ui = Ui_MainWindow.new
		@ui.setupUi(self)

		setup()
	end

	def setup()
		@currentPath = Dir.getwd
		@tempPath = @currentPath + "/temp"

		loadOptions()

		@ui.selectRepoEdit.text = @ui.oRepoPresetEdit.text

		if @ui.selectRepoEdit.text != ""
			openRepo()
		end

		if @ui.selectRepoEdit.text != "" and @ui.oRepoPresetBranchEdit.text != ""
			selectBranch(@ui.oRepoPresetBranchEdit.text)
		end
	end	

	########## UI elements functions ##########

	def on_selectRepoButton_clicked()
		@ui.selectRepoEdit.text = Qt::FileDialog.getExistingDirectory(self, "Open repo", Qt::Dir::homePath(), Qt::FileDialog::ShowDirsOnly)
		
		openRepo()
	end
	
	def on_selectBranchButton_clicked()
		selectBranch(@ui.selectBranchComboBox.currentText())
	end
	
	def on_repoLog1_clicked()
		if @ui.repoLog1.selectionModel.currentIndex.row >= 0
			@tree1 = @repo.commit(@commitsLog.item(@ui.repoLog1.selectionModel.currentIndex.row, 2).text).tree
			
			@commitFiles1 = Qt::StandardItemModel.new(countFilesInCommit(@tree1), 2, self)
			
			@commitFiles1.setHorizontalHeaderItem(0, Qt::StandardItem.new("file"))
			@commitFiles1.setHorizontalHeaderItem(1, Qt::StandardItem.new("folder"))
			
			parseTree(@tree1, @commitFiles1)
			
			@ui.commitFiles1.setModel(@commitFiles1)
			@ui.commitFiles1.resizeColumnsToContents()
			@ui.commitFiles1.resizeRowsToContents()
		end
	end

	def on_repoLog2_clicked()
		if @ui.repoLog2.selectionModel.currentIndex.row >= 0
			@tree2 = @repo.commit(@commitsLog.item(@ui.repoLog2.selectionModel.currentIndex.row, 2).text).tree
			
			@commitFiles2 = Qt::StandardItemModel.new(countFilesInCommit(@tree2), 2, self)
			
			@commitFiles2.setHorizontalHeaderItem(0, Qt::StandardItem.new("file"))
			@commitFiles2.setHorizontalHeaderItem(1, Qt::StandardItem.new("folder"))
			
			parseTree(@tree2, @commitFiles2)
			
			@ui.commitFiles2.setModel(@commitFiles2)
			@ui.commitFiles2.resizeColumnsToContents()
			@ui.commitFiles2.resizeRowsToContents()
		end
	end

	def on_commitFiles1_clicked()
		if @ui.commitFiles1.selectionModel.currentIndex.row >= 0

			extension = @commitFiles1.item(@ui.commitFiles1.selectionModel.currentIndex.row, 0).text.split('.').last

			if extension == 'sch'
				@ui.getSheetCountButton1.setEnabled(true)
				@ui.sheetEdit1.setEnabled(true)
			else
				@ui.getSheetCountButton1.setEnabled(false)
				@ui.sheetComboBox1.setEnabled(false)
				@ui.sheetComboBox1.clear()
				@ui.sheetEdit1.setEnabled(false)
				@ui.sheetEdit1.text = ""
			end
		end
	end

	def on_commitFiles2_clicked()
		if @ui.commitFiles2.selectionModel.currentIndex.row >= 0

			extension = @commitFiles2.item(@ui.commitFiles2.selectionModel.currentIndex.row, 0).text.split('.').last

			if extension == 'sch'
				@ui.getSheetCountButton2.setEnabled(true)
				@ui.sheetEdit2.setEnabled(true)
			else
				@ui.getSheetCountButton2.setEnabled(false)
				@ui.sheetComboBox2.setEnabled(false)
				@ui.sheetComboBox2.clear()
				@ui.sheetEdit2.setEnabled(false)
				@ui.sheetEdit2.text = ""
			end
		end
	end
	
	def on_getSheetCountButton1_clicked()
		file = @commitFiles1.item(@ui.commitFiles1.selectionModel.currentIndex.row, 0).text
		folder = @commitFiles1.item(@ui.commitFiles1.selectionModel.currentIndex.row, 1).text

		countSheets(@tree1, file, folder, @ui.sheetComboBox1)
	end

	def on_getSheetCountButton2_clicked()
		file = @commitFiles2.item(@ui.commitFiles2.selectionModel.currentIndex.row, 0).text
		folder = @commitFiles2.item(@ui.commitFiles2.selectionModel.currentIndex.row, 1).text

		countSheets(@tree2, file, folder, @ui.sheetComboBox2)
	end

	def on_createDiffImageButton_clicked()
		if @ui.commitFiles1.selectionModel.currentIndex.row >= 0 and @ui.commitFiles2.selectionModel.currentIndex.row >= 0
			file1 = @commitFiles1.item(@ui.commitFiles1.selectionModel.currentIndex.row, 0).text
			folder1 = @commitFiles1.item(@ui.commitFiles1.selectionModel.currentIndex.row, 1).text
			sheet1 = nil

			extension = @commitFiles1.item(@ui.commitFiles1.selectionModel.currentIndex.row, 0).text.split('.').last

			if extension != "brd"
				if @ui.sheetComboBox1.currentText() != nil
					sheet1 = @ui.sheetComboBox1.currentText()
				elsif @ui.sheetEdit1.text != ""
					sheet1 = @ui.sheetEdit1.text
				else
					return				
				end
			end

			file2 = @commitFiles2.item(@ui.commitFiles2.selectionModel.currentIndex.row, 0).text
			folder2 = @commitFiles2.item(@ui.commitFiles2.selectionModel.currentIndex.row, 1).text
			sheet2 = nil

			extension = @commitFiles2.item(@ui.commitFiles2.selectionModel.currentIndex.row, 0).text.split('.').last

			if extension != "brd"
				if @ui.sheetComboBox2.currentText() != nil
					sheet2 = @ui.sheetComboBox2.currentText()
				elsif @ui.sheetEdit2.text != ""
					sheet2 = @ui.sheetEdit2.text
				else
					return				
				end
			end
			
			exportFile(@tree1, file1, folder1, sheet1, "old.png")
			exportFile(@tree2, file2, folder2, sheet2, "new.png")

			createDiffImage("#{@tempPath}/old.png", "#{@tempPath}/new.png", "#{@tempPath}/diff.png", extension)

			if @ui.oImageViewer.text == ""
				`#{@tempPath}/diff.png`
			else
				`#{@ui.oImageViewer.text} #{@tempPath}/diff.png`
			end
		end
	end

	########## Image function ##########

	def createDiffImage(oldImage, newImage, diffImage, extension)
		FileUtils.rm(Dir.glob(diffImage))

		images = [
			ChunkyPNG::Image.from_file(oldImage),
			ChunkyPNG::Image.from_file(newImage)
		]

		width = [images.first.width, images.last.width].max
		height = [images.first.height, images.last.height].max

		if extension != "brd"
			color = WHITE
		else
			color = BLACK
		end

		if images.first.width != width or images.first.height != height
			oldTemp = ChunkyPNG::Image.new(width, height, color)

			images.first.height.times do |y|
				images.first.row(y).each_with_index do |pixel, x|
					oldTemp[x,y] = pixel
				end
			end

			images[0] = oldTemp
		end

		if images.last.width != width or images.last.height != height
			newTemp = ChunkyPNG::Image.new(width, height, color)

			images.last.height.times do |y|
				images.last.row(y).each_with_index do |pixel, x|
					newTemp[x,y] = pixel
				end
			end

			images[1] = newTemp
		end

		output = ChunkyPNG::Image.new(width, height, color)

		images.first.height.times do |y|
			images.first.row(y).each_with_index do |pixel, x|
				if pixel == images.last[x,y]
					if pixel == color
						next
					else
						output[x,y] = interpolate_quick(pixel, color, 80)
					end
				elsif pixel == color
					output[x,y] = :green
				elsif images.last[x,y] == color
					output[x,y] = :red
				else
					output[x,y] = :grey
				end
			end
		end

		output.save(diffImage)
	end

	########## Eagle functions ##########



	########## Repo functions ##########

	def exportFile(tree, file, folder, sheet, target, currentFolder = "/")
		if tree.name != nil
			currentFolder = currentFolder + tree.name.to_s + "/"
		end

		tree.contents.each do |content|
			if content.kind_of? Grit::Blob
				if content.name == file and currentFolder == folder
					FileUtils.rm(Dir.glob("#{@tempPath}/#{target}"))

					if sheet == nil
						file = File.new("#{@tempPath}/board.brd", "w")
						file.puts(content.data)
						file.close

						`"#{@ui.oEagleBinaryEdit.text}" -C 'EXPORT IMAGE #{@tempPath}/#{target} #{@ui.oBoardEdit.text}; QUIT' #{@tempPath}/board.brd`

						FileUtils.rm(Dir.glob("#{@tempPath}/board.brd"))
					else
						file = File.new("#{@tempPath}/schematic.sch", "w")
						file.puts(content.data)
						file.close

						`"#{@ui.oEagleBinaryEdit.text}" -C 'EDIT .s#{sheet}; EXPORT IMAGE #{@tempPath}/#{target} #{@ui.oSchematicEdit.text}; QUIT' #{@tempPath}/schematic.sch`

						FileUtils.rm(Dir.glob("#{@tempPath}/schematic.sch"))
					end
				end
			end

			if content.kind_of? Grit::Tree
				exportFile(content, file, folder, sheet, target, currentFolder)
			end
		end
	end

	def countSheets(tree, file, folder, comboBox, currentFolder = "/")
		if tree.name != nil
			currentFolder = currentFolder + tree.name.to_s + "/"
		end

		tree.contents.each do |content|
			if content.kind_of? Grit::Blob
				if content.name == file and currentFolder == folder
					file = File.new("#{@tempPath}/countSheets.sch", "w")
					file.puts(content.data)
					file.close

					`"#{@ui.oEagleBinaryEdit.text}" -C "RUN #{@currentPath}/countSheets.ulp #{@tempPath}/sheetCount.txt; QUIT" #{@tempPath}/countSheets.sch`

					file = File.new("#{@tempPath}/sheetCount.txt", "r")
					sheets = file.readline.chomp.to_i
					file.close

					for i in 1..sheets do
							comboBox.addItem(i.to_s)
					end

					comboBox.setEnabled(true)

					FileUtils.rm(Dir.glob("#{@tempPath}/countSheets.sch"))
					FileUtils.rm(Dir.glob("#{@tempPath}/sheetCount.txt"))
				end
			end

			if content.kind_of? Grit::Tree
				countSheets(content, file, folder, comboBox, currentFolder)
			end
		end
	end

	def openRepo()
		@ui.selectBranchComboBox.clear()

		begin
			@repo = Grit::Repo.new(@ui.selectRepoEdit.text)
		rescue
			@ui.selectBranchComboBox.setEnabled(false)
			@ui.selectBranchButton.setEnabled(false)

			@ui.statusBar.showMessage("Not a valid git repo!", 5000) 

			return
		end
		
		@repo.heads.each do |head|
			@ui.selectBranchComboBox.addItem(head.name)
		end
		
		@ui.selectBranchComboBox.setEnabled(true)
		@ui.selectBranchButton.setEnabled(true)

		@ui.statusBar.showMessage("Opend repo ...", 5000) 
	end

	def selectBranch(branch)
		branchExist = false

		@repo.heads.each do |head|
			if head.name == branch
				branchExist = true
			end
		end

		if !branchExist
			@ui.statusBar.showMessage("Not a valid branch!", 5000) 

			return
		end

		@commitsLog = Qt::StandardItemModel.new(@repo.commits(@ui.selectBranchComboBox.currentText(), false).size, 3, self)

		@commitsLog.setHorizontalHeaderItem(0, Qt::StandardItem.new("date"))
		@commitsLog.setHorizontalHeaderItem(1, Qt::StandardItem.new("message"))
		@commitsLog.setHorizontalHeaderItem(2, Qt::StandardItem.new("commit"))

		row = 0
		
		@repo.commits(branch, false).each do |commit|
			if @ui.oHideTimezone.isChecked()
				@commitsLog.setItem(row, 0, Qt::StandardItem.new(commit.date.to_s[0..18]))
			else
				@commitsLog.setItem(row, 0, Qt::StandardItem.new(commit.date.to_s))
			end
			
			@commitsLog.setItem(row, 1, Qt::StandardItem.new(commit.message.to_s))
			@commitsLog.setItem(row, 2, Qt::StandardItem.new(commit.id.to_s))
			
			row = row + 1
		end
		
		@ui.repoLog1.setModel(@commitsLog)
		@ui.repoLog2.setModel(@commitsLog)

		@ui.repoLog1.resizeColumnsToContents()
		@ui.repoLog1.resizeRowsToContents()
		@ui.repoLog2.resizeColumnsToContents()
		@ui.repoLog2.resizeRowsToContents()

		@ui.statusBar.showMessage("Opend branch ...", 5000) 
	end

	def parseTree(tree, commitFiles, currentFolder = "/", row = 0)
		if tree.name != nil
			currentFolder = currentFolder + tree.name.to_s + "/"
		end

		tree.contents.each do |content|
			if content.kind_of? Grit::Blob
				type = content.name.split('.').last
				if type == 'sch' or type == 'brd'
					commitFiles.setItem(row, 0, Qt::StandardItem.new(content.name.to_s))
					commitFiles.setItem(row, 1, Qt::StandardItem.new(currentFolder))

					row = row + 1
				end
			end

			if content.kind_of? Grit::Tree
				row = parseTree(content, commitFiles, currentFolder, row)
			end
		end
		
		return row
	end

	# Counting the files in a commit
	def countFilesInCommit(tree, filesCount = 0)
		tree.contents.each do |content|
			if content.kind_of? Grit::Blob
				type = content.name.split('.').last
				if type == 'sch' or type == 'brd'
					filesCount = filesCount + 1
				end
			end

			if content.kind_of? Grit::Tree
				filesCount = countFilesInCommit(content, filesCount)
			end
		end
	
		return filesCount
	end	

	########## Option functions ##########

	def on_oEagleBinaryButton_clicked()
		@ui.oEagleBinaryEdit.text = Qt::FileDialog.getOpenFileName(self, "Select egale binary", Qt::Dir::homePath())
	end

	def on_oRepoPresetButton_clicked()
		@ui.oRepoPresetEdit.text = Qt::FileDialog.getExistingDirectory(self, "Open repo", Qt::Dir::homePath(), Qt::FileDialog::ShowDirsOnly)
	end	

	def on_oSaveButton_clicked()
		optionsFile = File.open("#{@currentPath}/options.txt", "w")
		optionsFile.puts(@ui.oEagleBinaryEdit.text)
		optionsFile.puts(@ui.oSchematicEdit.text)
		optionsFile.puts(@ui.oBoardEdit.text)
		optionsFile.puts(@ui.oRepoPresetEdit.text)
		optionsFile.puts(@ui.oRepoPresetBranchEdit.text)
		optionsFile.puts(@ui.oImageViewer.text)
		optionsFile.puts(@ui.oHideTimezone.isChecked())
		optionsFile.close

		@ui.statusBar.showMessage("Option saved!", 5000) 
	end

	def loadOptions()
		optionsFile = File.open("#{@currentPath}/options.txt", "r")
		@ui.oEagleBinaryEdit.text = optionsFile.readline.chomp
		@ui.oSchematicEdit.text = optionsFile.readline.chomp
		@ui.oBoardEdit.text = optionsFile.readline.chomp
		@ui.oRepoPresetEdit.text = optionsFile.readline.chomp
		@ui.oRepoPresetBranchEdit.text = optionsFile.readline.chomp
		@ui.oImageViewer.text = optionsFile.readline.chomp
		@ui.oHideTimezone.setChecked(stringToBool(optionsFile.readline.chomp))
		optionsFile.close
	end

	def stringToBool(string)
		if string == "false"
			return false
		else
			return true
		end
	end

end
