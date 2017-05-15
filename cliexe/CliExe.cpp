int Main(array<System::String ^> ^args)
{
    System::Console::WriteLine(L"Hello World");
	Cli::Cli lCli;
	auto lMessage = lCli.Lol();
	System::Windows::Forms::MessageBox::Show(lMessage);
    return 0;
}
