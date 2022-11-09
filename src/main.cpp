#define UNICONE
#include<windows.h>
#include<string>

LRESULT CALLBACK WindowProc(HWND, UINT, WPARAM, LPARAM );

int WINAPI WinMain( HINSTANCE hInst, HINSTANCE hPrevInst, LPSTR lpszCmdLine, int nCmdShow ){
    std::wstring productName = L"main";

    // 1. Set up the window class.
    WNDCLASSEXW winc;
    winc.cbSize        = sizeof(WNDCLASSEX);
    winc.style         = CS_DBLCLKS;
    winc.lpfnWndProc   = WindowProc;
    winc.cbClsExtra    = 0;
    winc.cbWndExtra    = 0;
    winc.hInstance     = hInst;
    winc.hIcon         = LoadIcon( NULL, IDI_APPLICATION );
    winc.hIconSm       = winc.hIcon;
    winc.hCursor       = LoadCursor( NULL, IDC_ARROW );
    winc.hbrBackground = (HBRUSH)GetStockObject( WHITE_BRUSH );
    winc.lpszMenuName  = NULL;
    winc.lpszClassName = productName.c_str();

    // 2. Register the window class.
    if( !RegisterClassExW( &winc ) ) return 0;

    // 3. Create the window.
    HWND hWnd = CreateWindowExW(
        0,
        productName.c_str(), // The class name.
        productName.c_str(), // The title.
        WS_OVERLAPPEDWINDOW, // The style.
        CW_USEDEFAULT, CW_USEDEFAULT, // the X and the Y
        CW_USEDEFAULT, CW_USEDEFAULT, // the Width and the Height
        NULL,
        NULL, // Menu
        winc.hInstance,
        NULL
    );
    if( hWnd == NULL ) return 0;

    // 4. Show the window.
    ShowWindow( hWnd, nCmdShow );

    // 5. Reshow the window.
    UpdateWindow( hWnd );

    // 6. The massage loop.
    MSG msg;
    while( GetMessage( &msg, NULL, 0, 0 ) ){
        TranslateMessage( &msg );
        DispatchMessage( &msg );
    }
return msg.wParam;
}

LRESULT CALLBACK WindowProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam){
    switch (uMsg){
    case WM_CLOSE:
        PostQuitMessage( 0 );
        break;
    }
return DefWindowProcW( hWnd, uMsg, wParam, lParam );
}
