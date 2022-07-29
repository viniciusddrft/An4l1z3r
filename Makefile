all:
	@echo "--- START BUILD AN4L1Z3R ---"
	dart compile exe bin/an4l1z3r.dart -v
	@echo "--- DONE BUILD ---"	
clear:
	rm bin/an4l1z3r.exe
	@echo "--- DONE CLEAR ---"
