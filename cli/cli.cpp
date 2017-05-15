#include "cli.h"
#include "../global/blou.h"
namespace Cli
{
	System::String^ Cli::Lol()
	{
		Blou lBlou;
		return gcnew System::String(lBlou.GetString().c_str());
	}
}
