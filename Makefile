all:
	@echo "--- START BUILD AN4L1Z3R ---"
	mkdir -pv build
	dart compile exe bin/an4l1z3r.dart -v -o build/an4l1z3r.exe
	@echo "--- DONE BUILD ---"	
clear:
	@echo "--- START CLEAN AN4L1Z3R ---"
	rm -rifv build
	@echo "--- DONE CLEAR ---"
