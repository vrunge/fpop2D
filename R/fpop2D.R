##  GPL-3 License
## Copyright (c) 2020 Vincent Runge

#' Functional pruning optimal partitioning for 2d time-series (fpop2D)
#'
#' @description Functional pruning optimal partitioning for 2d time-series
#' @param df dataframe of size n x 2
#' @param data1 vector of data 1st dimension
#' @param data2 vector of data 1st dimension
#' @param penalty a positive number to penalize the introduction of changepoints
#' @param weights vector of weights (positive numbers), same size as data
#' @param testMode boolean. False by default. Used to debug the code
#' @return a fpop2d object = (changepoints, parameters, globalCost)
#' \describe{
#' \item{\code{changepoints}}{is the vector of changepoints (we give the last element of each segment)}
#' \item{\code{parameters}}{is the vector of successive parameters of each segment}
#' \item{\code{globalCost}}{is a number equal to the total loss: the minimal cost for the optimization problem with all penalty values excluded}
#'  }
fpop2D <- function(df, data1, data2, penalty, weights = NULL, testMode = FALSE)
{

  if(is.null(weights)){weights <- 0}
  ###########################
  ### CALL Rcpp functions ###
  ###########################

  res <- fpop2DTransfer(df, penalty, weights, testMode)

  response <- list(changepoints = res$changepoints, parameters = res$param, globalCost = res$cost)

  attr(response, "class") <- "fpop2D"
  return(response)
}
