#! /usr/bin/env ruby

#---------------------------------------------------------------------------#
#utarコマンドを使ってDownloadディレクトリに複数ある「zip」「rar」ファイルを解凍するスクリプト
#
#---------------------------------------------------------------------------


#unarコマンドを使う
def unar(str)
	puts "「#{str}」を解凍します"
	%x(unar '#{str}')	
end

#ファイルを削除する
def remove(str)
	puts "「#{str}」を削除します"
	%x(rm '#{str}')
end


def main()
	Dir::foreach(".") do |f|
		if File::ftype(f) == "file" && (File.extname(f) == ".zip" || File.extname(f) == ".rar")
			unar(f)
			remove(f)
		end
	end
end

main
