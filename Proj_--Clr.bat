@echo off

set  P_=..\uKeil
set  "P0="

echo %cd%
echo %~dp0

call :Prn
@echo .
@echo .
echo ---------------------------------------------CYCLE----------------------------S
  call :SubDir %P_%
echo ---------------------------------------------CYCLE----------------------------E
@echo .
@echo .


call :Prn
pause
exit /b 0


pause


:SubDir
@pushd  %1
@set "P0=%P0%  '"

	del *.bak
	del *.d;*.dep;*.htm;*.lnp;*.scvd;
	del *.lst;*.map;
	del *.o;
	del *.axf;*.hex;

   for /d %%P in (*.*) do (
      echo  %P0%%%P
      call :SubDir %%P
    )
@set P0=%P0:~,-3%
@ popd
exit /b 0



:Prn
echo -----------------------------------------------PRINT----------------------------
echo P_:=	%P_%
echo cd:=	%cd%
echo dp0:=	%~dp0
echo -----------------------------------------------PRINT----------------------------
exit /b 0
