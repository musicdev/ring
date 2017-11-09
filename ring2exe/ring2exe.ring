/*
**	Application : Ring To Executable (*.exe file)
**	Author	    : Mahmoud Fayed <msfclipper@yahoo.com>
**	Date	    : 2017.11.06
*/

/*
	Usage

		ring ring2exe.ring filename.ring  [Options]
		This will set filename.ring as input to the program 	

		The next files will be generated 
		filename.ringo	  (The Ring Object File - by Ring Compiler)
		filename.c	  (The C Source code file
				   Contains the ringo file content
				   Will be generated by this program)
		filename_buildvc.bat (Will be executed to build filename.c using Visual C/C++)
		filename_buildgcc.bat (Will be executed to build filename.c using GNU C/C++)
		filename_buildclang.bat (Will be executed to build filename.c using CLang C/C++)
		filename.obj	  (Will be generated by the Visual C/C++ compiler) 
		filename.exe 	  (Will ge generated by the Visual C/C++ Linker)
		filename	  (Executable File - On Linux & MacOS X platforms)

	Note
		We can use 
			ring ring2exe.ring ring2exe.ring 
		This will build ring2exe.exe
		We can use ring2exe.exe 

		ring2exe filename.ring 

		Or (Linux & MacOS X)

		./ring2exe filename.ring

	Testing 	
	
		ring2exe test.ring 
		test 

		Or (Linux & MacOS X)

		./ring2exe test.ring 
		./test

	Options

		-keep     : Don't delete Temp. Files
		-static   : Build Standalone Executable File (Don't use ring.dll/ring.so/ring.dylib)
		
*/

C_WINDOWS_NOOUTPUTNOERROR = " >nul 2>nul"
C_LINUX_NOOUTPUTNOERROR   = " > /dev/null"

func Main 
	aPara = sysargv
	aOptions = []
	# Get Options 
		for x = len(aPara) to 1 step -1
			if left(trim(aPara[x]),1) = "-"
				aOptions + lower(trim(aPara[x]))
				del(aPara,x)
			ok
		next
	nParaCount = len(aPara)
	if nParaCount >= 2
		cFile = aPara[nParaCount]
		See "Ring2EXE - Process File : " + cFile + nl
		BuildApp(cFile,aOptions)
	else 
		drawline()
		see "Application : Ring2EXE (Ring script to Executable file)" + nl
		see "Author      : 2017, Mahmoud Fayed <msfclipper@yahoo.com>" + nl
		see "Usage       : ring2exe filename.ring" + nl
		drawline()
	ok

func DrawLine 
	see copy("=",70) + nl

func BuildApp cFileName,aOptions
	msg("Start building the application...")
	# Generate the Object File 
		systemSilent(exefolder()+"../bin/ring " + cFileName + " -go -norun")
	# Generate the C Source Code File 
		cFile = substr(cFileName,".ring","")
		GenerateCFile(cFile)
	# Generate the Batch File 
		cBatch = GenerateBatch(cFile,aOptions)
	# Build the Executable File 
		msg("Build the Executable File...")
		systemSilent(cBatch)
		msg("End of building script...")
	# Clear Temp Files 	
		if not find(aOptions,"-keep")
			cleartempfiles()
		ok
		msg("End of building process...")

func GenerateCFile cFileName

	msg("Generate C source code file...")

	cFile = read(cFileName+".ringo")
	cHex = str2hex(cFile)
	cCode = '#include "ring.h"' + nl + nl +
	'int main( int argc, char *argv[])' + nl +  "{" + nl + nl +
	char(9) + 'unsigned char bytecode[] = { 
		  '
	
	nCol = 0
	for x = 1 to len(cHex) step 2
		if x != 1
			cCode += ", "
		ok
		cCode += "0x" + cHex[x] + cHex[x+1] 
		nCol++	
		if nCol = 10
			nCol = 0
		cCode += "
		"
		ok
	next
	
	cCode += ", EOF
	};"
	
	cCode += "

	RingState *pRingState ;
	pRingState = ring_state_new();	
	pRingState->argc = argc;
	pRingState->argv = argv;
	ring_state_runobjectstring(pRingState,(char *) bytecode);
	ring_state_delete(pRingState);

	return 0;" + nl + 
	"}"
	
	cCode = substr(cCode,nl,windowsnl())
	write(cFileName+".c",cCode)

func GenerateBatch cFileName,aOptions
	msg("Generate batch|script file...")
	if find(aOptions,"-static")
		return GenerateBatchStatic(cFileName)
	else 
		return GenerateBatchDynamic(cFileName)
	ok

func GenerateBatchDynamic cFileName 

	msg("Generate batch|script file for dynamic building...")

	cFile = substr(cFileName," ","_")

	# Generate Windows Batch (Visual C/C++)
		cCode = "call "+exefolder()+"../src/locatevc.bat" + nl +
			'cl #{f1}.c ..\lib\ring.lib -I"..\include" /link /SUBSYSTEM:CONSOLE,"5.01" /OUT:#{f1}.exe ' 
		cCode = substr(cCode,"#{f1}",cFile)
		cWindowsBatch = cFile+"_buildvc.bat"
		write(cWindowsBatch,cCode)
	
	# Generate Linux Script (GNU C/C++)
		cCode = 'gcc -rdynamic #{f1}.c -o #{f1} -L $PWD/../lib -lring  -I $PWD/../include  '
		cCode = substr(cCode,"#{f1}",cFile)
		cLinuxBatch = cFile+"_buildgcc.sh"
		write(cLinuxBatch,cCode)
	
	# Generate MacOS X Script (CLang C/C++)
		cCode = 'clang #{f1}.c $PWD/../lib/libring.dylib -o #{f1} -L $PWD/../lib  -I $PWD/../include  '
		cCode = substr(cCode,"#{f1}",cFile)
		cMacOSXBatch = cFile+"_buildclang.sh"
		write(cMacOSXBatch,cCode)
			
	# Return the script/batch file name
		if isWindows()	
			return cWindowsBatch
		but isLinux()
			systemSilent("chmod +x " + cLinuxBatch)
			return "./"+cLinuxBatch
		but isMacosx()
			systemSilent("chmod +x " + cMacOSXBatch)
			return "./"+cMacOSXBatch	
		ok

func GenerateBatchStatic cFileName 

	msg("Generate batch|script file for static building...")

	cFile = substr(cFileName," ","_")

	# Generate Windows Batch (Visual C/C++)
		cCode = "call "+exefolder()+"../src/locatevc.bat" + nl +
			'cl #{f1}.c #{f2} -I"..\include" -I"../src/" /link /SUBSYSTEM:CONSOLE,"5.01" /OUT:#{f1}.exe' 
		cCode = substr(cCode,"#{f1}",cFile)
		cCode = substr(cCode,"#{f2}","..\lib\ringstatic.lib")
		cWindowsBatch = cFile+"_buildvc.bat"
		write(cWindowsBatch,cCode)
	
	# Generate Linux Script (GNU C/C++)
		cCode = 'gcc -rdynamic #{f1}.c -o #{f1} #{f2} -lm -ldl  -I $PWD/../include  '
		cCode = substr(cCode,"#{f1}",cFile)
		cCode = substr(cCode,"#{f2}","-l$PWD/../lib/libringstatic.a")
		cLinuxBatch = cFile+"_buildgcc.sh"
		write(cLinuxBatch,cCode)
	
	# Generate MacOS X Script (CLang C/C++)
		cCode = 'clang #{f1}.c #{f2} -o #{f1} -lm -ldl  -I $PWD/../include  '
		cCode = substr(cCode,"#{f1}",cFile)
		cCode = substr(cCode,"#{f2}","-l$PWD/../lib/libringstatic.a")
		cMacOSXBatch = cFile+"_buildclang.sh"
		write(cMacOSXBatch,cCode)
			
	# Return the script/batch file name
		if isWindows()	
			return cWindowsBatch
		but isLinux()
			systemSilent("chmod +x " + cLinuxBatch)
			return "./"+cLinuxBatch
		but isMacosx()
			systemSilent("chmod +x " + cMacOSXBatch)
			return "./"+cMacOSXBatch	
		ok

func ClearTempFiles
	msg("Clear Temp. Files...")
	if isWindows()
		systemSilent("cleartemp.bat")
	else
		systemSilent("./cleartemp.sh")
	ok

func SystemSilent cCmd
	if isWindows()
		system(cCmd + C_WINDOWS_NOOUTPUTNOERROR)
	else 
		system(cCmd + C_LINUX_NOOUTPUTNOERROR)
	ok

func msg cMsg
	see "Ring2EXE: " + cMsg + nl
