#include "cli.h"
#include "blou.h"
namespace Cli
{
	System::String^ Cli::Lol()
	{
		Blou lBlou;
		return gcnew System::String(lBlou.GetString().c_str());
	}
}
