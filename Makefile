#Makefile for libarea

PREFIX	= /usr/local
HOME	= .
CXX     = g++
CC      = gcc
LD      = g++
LDFLAGS = -L/usr/local/lib -shared -rdynamic `python-config --ldflags` -lboost_python-mt
LIBS    = -lstdc++ `python-config --libs` 
CFLAGS  = -Wall -I/usr/include -I/usr/local/Cellar/boost/1.62.0/include `python-config --includes` -I./ -I./kbool/include -g -fPIC

LIBNAME	= area
LIBOBJS	= Arc.o Area.o AreaBoolean.o AreaDxf.o AreaOrderer.o AreaPocket.o booleng.o Circle.o Construction.o Curve.o dxf.o Finite.o graph.o graphlst.o instonly.o kurve.o line.o link.o lpoint.o Matrix.o node.o offset.o PythonStuff.o record.o scanbeam.o
LIBDIR	= .libs/
LIBOUT	= $(LIBDIR)$(LIBNAME).so

all:	$(LIBOUT)

$(LIBOUT): $(LIBOBJS)
	@-mkdir -p $(LIBDIR)
	$(LD) $(LDFLAGS) -fPIC -Wl $(LIBOBJS) -o $(LIBOUT) $(LIBS)

clean:
	@-rm -f $(LIBOBJS)
	@-rm -f $(LIBOUT)
	@-rmdir $(LIBDIR)

install: $(LIBOUT)
	strip $^
	chmod 644 $^
	mkdir -p $(DESTDIR)`python -c "from distutils.sysconfig import get_python_lib; print get_python_lib(plat_specific=1, standard_lib=0, prefix='$(PREFIX)')"`
	install $^ $(DESTDIR)`python -c "from distutils.sysconfig import get_python_lib; print get_python_lib(plat_specific=1, standard_lib=0, prefix='$(PREFIX)')"`

test:
	python test.py

Arc.o: Arc.cpp
	$(CC) -c $? ${CFLAGS} -o $@

Area.o: Area.cpp
	$(CC) -c $? ${CFLAGS} -o $@

AreaBoolean.o: AreaBoolean.cpp
	$(CC) -c $? ${CFLAGS} -o $@

AreaDxf.o: AreaDxf.cpp
	$(CC) -c $? ${CFLAGS} -o $@

AreaOrderer.o: AreaOrderer.cpp
	$(CC) -c $? ${CFLAGS} -o $@

AreaPocket.o: AreaPocket.cpp
	$(CC) -c $? ${CFLAGS} -o $@

booleng.o: kbool/src/booleng.cpp
	$(CC) -c $? ${CFLAGS} -o $@

Circle.o: Circle.cpp
	$(CC) -c $? ${CFLAGS} -o $@

Construction.o: kurve/Construction.cpp
	$(CC) -c $? ${CFLAGS} -o $@

Curve.o: Curve.cpp
	$(CC) -c $? ${CFLAGS} -o $@

dxf.o: dxf.cpp
	$(CC) -c $? ${CFLAGS} -o $@

Finite.o: kurve/Finite.cpp
	$(CC) -c $? ${CFLAGS} -o $@

graph.o: kbool/src/graph.cpp
	$(CC) -c $? ${CFLAGS} -o $@

graphlst.o: kbool/src/graphlst.cpp
	$(CC) -c $? ${CFLAGS} -o $@

instonly.o: kbool/src/instonly.cpp
	$(CC) -c $? ${CFLAGS} -o $@

kurve.o: kurve/kurve.cpp
	$(CC) -c $? ${CFLAGS} -o $@

line.o: kbool/src/line.cpp
	$(CC) -c $? ${CFLAGS} -o $@

link.o: kbool/src/link.cpp
	$(CC) -c $? ${CFLAGS} -o $@

lpoint.o: kbool/src/lpoint.cpp
	$(CC) -c $? ${CFLAGS} -o $@

Matrix.o: kurve/Matrix.cpp
	$(CC) -c $? ${CFLAGS} -o $@

node.o: kbool/src/node.cpp
	$(CC) -c $? ${CFLAGS} -o $@

offset.o: kurve/offset.cpp
	$(CC) -c $? ${CFLAGS} -o $@

PythonStuff.o: PythonStuff.cpp
	$(CC) -c $? ${CFLAGS} -o $@

record.o: kbool/src/record.cpp
	$(CC) -c $? ${CFLAGS} -o $@

scanbeam.o: kbool/src/scanbeam.cpp
	$(CC) -c $? ${CFLAGS} -o $@

