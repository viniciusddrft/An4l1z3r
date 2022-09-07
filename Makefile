all:
	@echo "--- START BUILD AN4L1Z3R ---"
	-i mkdir build
	dart compile exe bin/an4l1z3r.dart -v -o build/an4l1z3r.exe
	@echo "--- DONE BUILD ---"	
clear:
	-i rm -rf build
	@echo "--- DONE CLEAR ---"
