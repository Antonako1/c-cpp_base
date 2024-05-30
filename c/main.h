#ifndef MAIN_H
#define MAIN_H


/*+++
Jos käytät C++:aa, niin C-koodi pitää kääriä vammasesti...
muuten c++ compiler alkaa vammaan
---*/
#ifdef __cplusplus
extern "C" {
#endif

void print_message(const char *str);
void cpp_call(int argc, char const *argv[]);

#ifdef __cplusplus
}
#endif


#endif // MAIN_H