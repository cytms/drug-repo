class HomeController < ApplicationController
  def index
  	@path = []
  	Dir.foreach('public/models/Path/Index').each do |file|
  		next if file == '.' or file == '..'
  		arr = file.split('.')
  		@path << arr.first
  	end
  	@abc = []
  	Dir.foreach('public/models/ABC/Index').each do |file|
  		next if file == '.' or file == '..'
  		arr = file.split('.')
  		@abc << arr.first
  	end
  end
  def get_target
  	@data = {}
  	@model = params['model']
  	@drug = params['drug']
  	begin
	  	File.open("public/models/#{@model}/Index/#{@drug}.txt").each do |line|
	  		arr = line.strip.split("\t")
	  		@data[arr.first] = arr.last
	  	end
  	rescue
	end
  end
  def get_path
  	@data = []
  	@model = params['model']
  	@drug = params['drug']
  	@target = params['target']
  	begin
	  	File.open("public/models/#{@model}/#{@drug}/#{@target}").each do |line|
	  		arr = line.strip.split("\t")
	  		@data << arr
	  	end
	rescue
	end
  end
end
