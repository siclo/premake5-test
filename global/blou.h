#ifndef GLOBAL_DLL  
	#define GLOBAL_DLL __declspec(dllimport)  
#endif

#include <string>

class GLOBAL_DLL Blou
{
public:
	std::string GetString();
};