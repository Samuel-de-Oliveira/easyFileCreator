#include <iostream>
#include "library.hpp"

int main( int argc, char *argv[] ) {
	hello Obj;
	Obj.message = "Hello, world!";
	Obj.showMessage();

	return 0;
}
