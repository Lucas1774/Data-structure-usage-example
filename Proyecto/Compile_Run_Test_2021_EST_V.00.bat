@echo off

REM === Mensaje bienvenida
echo Se va a compilar la practica 2020/2021 con las dependencias y restricciones

REM === Inputs ===
set SRC_DIR=%cd%\src
set BIN_DIR=\bin
set MAIN=es/uned/lsi/eped/pract2020_2021/Main
set JAVA_HOME_JDK="C:\Program Files\Java\jdk-17"
set TMP_FOLDER=%cd%\juego_de_pruebas_2021\tmp

IF %JAVA_HOME_JDK%=="" (

	IF "%JAVA_HOME%" == "" (
	    echo Modifica la variable del archivo bat JAVA_HOME_JDK 
	    pause
	    exit
	) ELSE (
	    set JAVA_HOME_JDK="%JAVA_HOME%"
	)
)


REM === Mostramos variables ===
echo Carpeta codigo = %SRC_DIR%
echo Carpeta bin = %BIN_DIR%
echo Clase principal = %MAIN%
echo JAVA_HOME_JDK = %JAVA_HOME_JDK%
echo. 
echo.

REM === Clean and make temp dir ===
echo Limpiando compilacion anterior 
rd /q /s "%TMP_FOLDER%"
pause
if not exist "%TMP_FOLDER%" mkdir "%TMP_FOLDER%" 
mkdir "%TMP_FOLDER%%BIN_DIR%"
mkdir "%TMP_FOLDER%\src"
mkdir "%TMP_FOLDER%\src\es"
mkdir "%TMP_FOLDER%\src\es\uned"
mkdir "%TMP_FOLDER%\src\es\uned\lsi"
mkdir "%TMP_FOLDER%\src\es\uned\lsi\eped"
mkdir "%TMP_FOLDER%\src\es\uned\lsi\eped\pract2020_2021"
xcopy /s/q "%SRC_DIR%\es\uned\lsi\eped\pract2020_2021" "%TMP_FOLDER%\src\es\uned\lsi\eped\pract2020_2021"
echo.
echo.
pause
REM ===

REM ===============
REM === Compile ===
REM ===============
echo Compilando en carpeta temporal
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\javac" -d "%TMP_FOLDER%%BIN_DIR%" -sourcepath "%TMP_FOLDER%\src" -cp "juego_de_pruebas_2021/lib/TAD_modified.jar" "%TMP_FOLDER%\src\%MAIN%.java"

%JAVA_HOME_JDK%"\bin\javac" -d "%TMP_FOLDER%%BIN_DIR%" -sourcepath "%TMP_FOLDER%\src" -cp "juego_de_pruebas_2021/lib/TAD_modified.jar" "%TMP_FOLDER%\src\%MAIN%.java"
if errorlevel 1 (
	echo Compilacion con errores
	pause
	exit /B 1
)

echo Compilacion sin errores
echo.
echo.
pause
REM ===


REM ==============================================================================

REM =============================
REM === Run BQ Estudiantes PP ===
REM =============================
echo Ejecutando el programa con bucket queue (pocos pacientes y pocas prioridades)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2021/lib/TAD_modified.jar" "%MAIN%" BQ "juego_de_pruebas_2021/pruebas/JuegoPruebas_Estudiantes_1000_10.dat" "juego_de_pruebas_2021/salida/Salida_Estudiantes_1000_10.dat"

%JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2021/lib/TAD_modified.jar" "%MAIN%" BQ "juego_de_pruebas_2021/pruebas/JuegoPruebas_Estudiantes_1000_10.dat" "juego_de_pruebas_2021/salida/Salida_Estudiantes_1000_10.dat"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)

echo Ejecucion sin errores
echo. 
echo.
pause

REM === Comprobacion Estudiantes PP ===
echo Comprobando bateria de pruebas para bucket queue (pocos pacientes y pocas prioridades)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2021/lib/Comparator.jar" "juego_de_pruebas_2021/salida/Salida_Estudiantes_1000_10.dat" "juego_de_pruebas_2021/salida/Salida_1000_10.dat" "erroresPP1.txt"

%JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2021/lib/Comparator.jar" "juego_de_pruebas_2021/salida/Salida_Estudiantes_1000_10.dat" "juego_de_pruebas_2021/salida/Salida_1000_10.dat" "erroresPP1.txt"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)
echo. 
echo.
pause

REM =========================================

REM ==============================
REM === Run BST Estudiantes PP ===
REM ==============================
echo Ejecutando el programa con arbol de busqueda (pocos pacientes y pocas prioridades)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2021/lib/TAD_modified.jar" "%MAIN%" BST "juego_de_pruebas_2021/pruebas/JuegoPruebas_Estudiantes_1000_10.dat" "juego_de_pruebas_2021/salida/Salida_Estudiantes_1000_10.dat"

%JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2021/lib/TAD_modified.jar" "%MAIN%" BST "juego_de_pruebas_2021/pruebas/JuegoPruebas_Estudiantes_1000_10.dat" "juego_de_pruebas_2021/salida/Salida_Estudiantes_1000_10.dat"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)

echo Ejecucion sin errores
echo. 
echo.
pause

REM === Comprobacion Estudiantes PP ===
echo Comprobando bateria de pruebas para arbol de busqueda (pocos pacientes y pocas prioridades)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2021/lib/Comparator.jar" "juego_de_pruebas_2021/salida/Salida_Estudiantes_1000_10.dat" "juego_de_pruebas_2021/salida/Salida_1000_10.dat" "erroresPP2.txt"

%JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2021/lib/Comparator.jar" "juego_de_pruebas_2021/salida/Salida_Estudiantes_1000_10.dat" "juego_de_pruebas_2021/salida/Salida_1000_10.dat" "erroresPP2.txt"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)
echo. 
echo.
pause


REM ==============================================================================

REM =============================
REM === Run BQ Estudiantes PM ===
REM =============================
echo Ejecutando el programa con bucket queue (pocos pacientes y muchas prioridades)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2021/lib/TAD_modified.jar" "%MAIN%" BQ "juego_de_pruebas_2021/pruebas/JuegoPruebas_Estudiantes_1000_1000.dat" "juego_de_pruebas_2021/salida/Salida_Estudiantes_1000_1000.dat"

%JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2021/lib/TAD_modified.jar" "%MAIN%" BQ "juego_de_pruebas_2021/pruebas/JuegoPruebas_Estudiantes_1000_1000.dat" "juego_de_pruebas_2021/salida/Salida_Estudiantes_1000_1000.dat"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)

echo Ejecucion sin errores
echo. 
echo.
pause

REM === Comprobacion Estudiantes PM ===
echo Comprobando bateria de pruebas para bucket queue (pocos pacientes y muchas prioridades)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2021/lib/Comparator.jar" "juego_de_pruebas_2021/salida/Salida_Estudiantes_1000_1000.dat" "juego_de_pruebas_2021/salida/Salida_1000_1000.dat" "erroresPM1.txt"

%JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2021/lib/Comparator.jar" "juego_de_pruebas_2021/salida/Salida_Estudiantes_1000_1000.dat" "juego_de_pruebas_2021/salida/Salida_1000_1000.dat" "erroresPM1.txt"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)
echo. 
echo.
pause

REM =========================================

REM ==============================
REM === Run BST Estudiantes PM ===
REM ==============================
echo Ejecutando el programa con arbol de busqueda (pocos pacientes y muchas prioridades)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2021/lib/TAD_modified.jar" "%MAIN%" BST "juego_de_pruebas_2021/pruebas/JuegoPruebas_Estudiantes_1000_1000.dat" "juego_de_pruebas_2021/salida/Salida_Estudiantes_1000_1000.dat"

%JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2021/lib/TAD_modified.jar" "%MAIN%" BST "juego_de_pruebas_2021/pruebas/JuegoPruebas_Estudiantes_1000_1000.dat" "juego_de_pruebas_2021/salida/Salida_Estudiantes_1000_1000.dat"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)

echo Ejecucion sin errores
echo. 
echo.
pause

REM === Comprobacion Estudiantes PM ===
echo Comprobando bateria de pruebas para arbol de busqueda (pocos pacientes y muchas prioridades)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2021/lib/Comparator.jar" "juego_de_pruebas_2021/salida/Salida_Estudiantes_1000_1000.dat" "juego_de_pruebas_2021/salida/Salida_1000_1000.dat" "erroresPM2.txt"

%JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2021/lib/Comparator.jar" "juego_de_pruebas_2021/salida/Salida_Estudiantes_1000_1000.dat" "juego_de_pruebas_2021/salida/Salida_1000_1000.dat" "erroresPM2.txt"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)
echo. 
echo.
pause


REM ==============================================================================

REM =============================
REM === Run BQ Estudiantes MP ===
REM =============================
echo Ejecutando el programa con bucket queue (muchos pacientes y pocas prioridades)
echo ATENCION: PUEDE TARDAR UN POCO
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2021/lib/TAD_modified.jar" "%MAIN%" BQ "juego_de_pruebas_2021/pruebas/JuegoPruebas_Estudiantes_20000_10.dat" "juego_de_pruebas_2021/salida/Salida_Estudiantes_20000_10.dat"

%JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2021/lib/TAD_modified.jar" "%MAIN%" BQ "juego_de_pruebas_2021/pruebas/JuegoPruebas_Estudiantes_20000_10.dat" "juego_de_pruebas_2021/salida/Salida_Estudiantes_20000_10.dat"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)

echo Ejecucion sin errores
echo. 
echo.
pause

REM === Comprobacion Estudiantes MP ===
echo Comprobando bateria de pruebas para bucket queue (muchos pacientes y pocas prioridades)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2021/lib/Comparator.jar" "juego_de_pruebas_2021/salida/Salida_Estudiantes_20000_10.dat" "juego_de_pruebas_2021/salida/Salida_20000_10.dat" "erroresMP1.txt"

%JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2021/lib/Comparator.jar" "juego_de_pruebas_2021/salida/Salida_Estudiantes_20000_10.dat" "juego_de_pruebas_2021/salida/Salida_20000_10.dat" "erroresMP1.txt"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)
echo. 
echo.
pause

REM =========================================

REM ==============================
REM === Run BST Estudiantes MP ===
REM ==============================
echo Ejecutando el programa con arbol de busqueda (muchos pacientes y pocas prioridades)
echo ATENCION: PUEDE TARDAR UN POCO
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2021/lib/TAD_modified.jar" "%MAIN%" BST "juego_de_pruebas_2021/pruebas/JuegoPruebas_Estudiantes_20000_10.dat" "juego_de_pruebas_2021/salida/Salida_Estudiantes_20000_10.dat"

%JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2021/lib/TAD_modified.jar" "%MAIN%" BST "juego_de_pruebas_2021/pruebas/JuegoPruebas_Estudiantes_20000_10.dat" "juego_de_pruebas_2021/salida/Salida_Estudiantes_20000_10.dat"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)

echo Ejecucion sin errores
echo. 
echo.
pause

REM === Comprobacion Estudiantes MP ===
echo Comprobando bateria de pruebas para arbol de busqueda (muchos pacientes y pocas prioridades)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2021/lib/Comparator.jar" "juego_de_pruebas_2021/salida/Salida_Estudiantes_20000_10.dat" "juego_de_pruebas_2021/salida/Salida_20000_10.dat" "erroresMP2.txt"

%JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2021/lib/Comparator.jar" "juego_de_pruebas_2021/salida/Salida_Estudiantes_20000_10.dat" "juego_de_pruebas_2021/salida/Salida_20000_10.dat" "erroresMP2.txt"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)
echo. 
echo.
pause


REM ==============================================================================

REM =============================
REM === Run BQ Estudiantes MM ===
REM =============================
echo Ejecutando el programa con bucket queue (muchos pacientes y muchas prioridades)
echo ATENCION: PUEDE TARDAR UN POCO
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2021/lib/TAD_modified.jar" "%MAIN%" BQ "juego_de_pruebas_2021/pruebas/JuegoPruebas_Estudiantes_20000_10000.dat" "juego_de_pruebas_2021/salida/Salida_Estudiantes_20000_10000.dat"

%JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2021/lib/TAD_modified.jar" "%MAIN%" BQ "juego_de_pruebas_2021/pruebas/JuegoPruebas_Estudiantes_20000_10000.dat" "juego_de_pruebas_2021/salida/Salida_Estudiantes_20000_10000.dat"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)

echo Ejecucion sin errores
echo. 
echo.
pause

REM === Comprobacion Estudiantes MM ===
echo Comprobando bateria de pruebas para bucket queue (muchos pacientes y muchas prioridades)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2021/lib/Comparator.jar" "juego_de_pruebas_2021/salida/Salida_Estudiantes_20000_10000.dat" "juego_de_pruebas_2021/salida/Salida_20000_10000.dat" "erroresMM1.txt"

%JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2021/lib/Comparator.jar" "juego_de_pruebas_2021/salida/Salida_Estudiantes_20000_10000.dat" "juego_de_pruebas_2021/salida/Salida_20000_10000.dat" "erroresMM1.txt"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)
echo. 
echo.
pause

REM =========================================

REM =============================
REM === Run BST Estudiantes MM ===
REM =============================
echo Ejecutando el programa con arbol de busqueda (muchos pacientes y muchas prioridades)
echo ATENCION: PUEDE TARDAR UN POCO
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2021/lib/TAD_modified.jar" "%MAIN%" BST "juego_de_pruebas_2021/pruebas/JuegoPruebas_Estudiantes_20000_10000.dat" "juego_de_pruebas_2021/salida/Salida_Estudiantes_20000_10000.dat"

%JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2021/lib/TAD_modified.jar" "%MAIN%" BST "juego_de_pruebas_2021/pruebas/JuegoPruebas_Estudiantes_20000_10000.dat" "juego_de_pruebas_2021/salida/Salida_Estudiantes_20000_10000.dat"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)

echo Ejecucion sin errores
echo. 
echo.
pause

REM === Comprobacion Estudiantes MM ===
echo Comprobando bateria de pruebas para arbol de busqueda (muchos pacientes y muchas prioridades)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2021/lib/Comparator.jar" "juego_de_pruebas_2021/salida/Salida_Estudiantes_20000_10000.dat" "juego_de_pruebas_2021/salida/Salida_20000_10000.dat" "erroresMM2.txt"

%JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2021/lib/Comparator.jar" "juego_de_pruebas_2021/salida/Salida_Estudiantes_20000_10000.dat" "juego_de_pruebas_2021/salida/Salida_20000_10000.dat" "erroresMM2.txt"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)
echo. 
echo.
pause