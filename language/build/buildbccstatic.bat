cd ..\src
set path=%path%;c:\pwct19\ssbuild\borland\bcc55\bin\
bcc32 -tWM -d -6 -O2 -OS -Ov -Oi -Oc -I"../include" ring.c  ^
rstring.c rlist.c ritem.c ritems.c rhtable.c general.c state.c scanner.c parser.c hashlib.c vmgc.c ^
stmt.c expr.c codegen.c vm.c vmerror.c vmeval.c vmthreads.c vmexpr.c vmvars.c ^
vmlists.c vmfuncs.c ringapi.c vmoop.c vmcui.c ^
vmtry.c vmstr.c vmjump.c vmrange.c ^
vmperf.c vmexit.c vmstack.c vmstate.c genlib_e.c math_e.c file_e.c os_e.c list_e.c meta_e.c ^
ext.c dll_e.c objfile.c 

del *.obj
move ring.exe ..\..\bin
