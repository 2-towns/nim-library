#include <stdio.h>
#include <dlfcn.h>

int main() {
    // Load the shared library
    void* handle = dlopen("./libclock.so", RTLD_LAZY);
    if (!handle) {
        fprintf(stderr, "Error loading library: %s\n", dlerror());
        return 1;
    }

    // // Clear any existing error
    // dlerror();

    // Get function pointers
    void (*init_func)() = dlsym(handle, "initializeLibrary");
    void* (*new_func)() = dlsym(handle, "clock_new");

    // Check for errors
    char* error = dlerror();
    if (error != NULL) {
        fprintf(stderr, "Error finding functions: %s\n", error);
        dlclose(handle);
        return 1;
    }

    // Test the functions
    if (init_func) {
        printf("Calling initializeLibrary...\n");
        init_func();
        printf("initializeLibrary called\n");
    }

    if (new_func) {
        printf("Calling clock_new...\n");
        void* result = new_func();
        printf("clock_new returned: %p\n", result);
    }

    // Close the library
    dlclose(handle);
    return 0;
}
