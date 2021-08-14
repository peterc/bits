#include <cstdint>
#include <iostream>
using namespace std;

uint32_t swapbytes(uint32_t num) __attribute__((naked));

uint32_t swapbytes(uint32_t num) {
  //register uint32_t x __asm__("eax");

  //__asm__("mov $0xabcdabcd, %0" : "=r" (x));

  //__asm__("mov %%edi, %0" : "=r" (x));
  __asm__("mov $0xabcdabcd, %eax");
  //__asm__("bswap %0" : "=r" (x));


  //__asm__("xchg %eax, %ebx");


  //return x;
}

int main() {
  cout << hex << swapbytes(0xDEADBEEF) << endl;
  return 0;
}
