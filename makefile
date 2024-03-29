FLAGS = -g -c --std=c++17


all:
	mkdir -p obj
	mkdir -p bin
	
	g++ $(FLAGS) src/tienda.cpp -o obj/tienda.o
	g++ $(FLAGS) src/producto.cpp -o obj/producto.o

	mkdir -p bin/include
	cp src/producto.h src/tienda.h ./bin/include

test1:
	mkdir -p obj
	mkdir -p bin

	g++ $(FLAGS) src/tienda.cpp -o obj/tienda.o
	g++ $(FLAGS) src/producto.cpp -o obj/producto.o
	g++ $(FLAGS) tests/test_producto.cpp -o bin/test_producto.o

	g++ -g -o bin/tests obj/producto.o bin/test_producto.o  -lgtest -lgtest_main -lpthread

clean:
	rm -Rf bin
	rm *.dat