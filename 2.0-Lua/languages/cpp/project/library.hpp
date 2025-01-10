#ifndef LIBRARY_HPP
#define LIBRARY_HPP

#include <iostream>
#include <string.h>

std::string VERSION {"1.0"};

class hello {
	public:
		std::string message {""};

		void showMessage( void ) {
			if (hello::message == "") {
				std::cout << "The string is empty" << '\n';
			} else {
				std::cout << hello::message << '\n';
			}
		}
};

#endif
