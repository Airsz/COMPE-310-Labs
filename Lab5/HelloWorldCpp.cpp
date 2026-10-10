#include <iostream>
#include <string>
using namespace std;
/**
This code is perhaps the simplest C++ program that prints out the “Hello World” message
using OOP principles. A Greeting class is defined including a constructor and greeting
method. The main() routine then instantiates a Greeting class object, sets a greeting
message using the class constructor, and then uses the greeting() method to print out
“Hello World” to the monitor.
**/
class Greeting {
private:
string greetingMessage;
public:
Greeting(string message)
{
greetingMessage = message;
}
void greet()
{
cout << greetingMessage << endl ;
}
};
int main()
{
Greeting msg( "Hello World!" );
msg.greet();
return 0;
}