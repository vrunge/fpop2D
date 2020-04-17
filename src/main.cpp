#include <iostream>
#include <string>
#include<math.h>


#include"Omega.h"

#include<Rcpp.h>

using namespace Rcpp;

// [[Rcpp::export]]
List fpop2DTransfer(DataFrame df, double penalty, NumericVector vectWeight, bool testMode)
{
  Omega omega = Omega(5);

  Rcpp::List res = Rcpp::List::create(
    _["changepoints"] = 1,
    _["param"] = omega.GetN(),
    _["cost"] = 2
  );

  return res;
}
