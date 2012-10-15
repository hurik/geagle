#!/usr/bin/env ruby

require 'rubygems'
require 'Qt'
require './mainwindow.rb'

app = Qt::Application.new(ARGV)
geagle = MainWindow.new
geagle.show
app.exec
