#include<windows.h>

int WINAPI WinMain( HINSTANCE hInst, HINSTANCE hPrevInst, LPSTR lpszCmdLine, int nCmdShow ){
    MessageBoxW( NULL, L"hello Windows API", L"TEST", MB_OK );
return 0;
}
