#ifndef OMEGA_H
#define OMEGA_H

#include <math.h>
#include<vector>

#include <stdlib.h>

class Omega
{
  public:
    Omega(unsigned int length);
    ~Omega();
    unsigned int GetN() const;

  private:
    unsigned int n; //size of the data

};


#endif // OMEGA_H
