#include <iostream>
#include <vector>

#define testing(a, n) a % n == 0
template <typename T>
T LCPP_max_v(std::vector<T> InVector){
        T temp;
        for (T a : InVector){
                temp = a > temp ? a : temp;
        }
        return temp;
}

int main(){
    LCPP_max_v(asd);
    //std::cout << "testing";
    return testing (1, 2);
}
