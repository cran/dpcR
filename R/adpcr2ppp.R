#' Convert adpcr to ppp
#' 
#' Converts \code{\linkS4class{adpcr}} object to the list of \code{ppp.object}s.
#' 
#' @details 
#' Each array is independently converted by \code{ppp}
#' function. \code{marks} attached to each point represent values contained by
#' the \code{\linkS4class{adpcr}} object.
#' 
#' @param input Object of the \code{\linkS4class{adpcr}} class containing data
#' from one or more panels.
#' @param marks If \code{TRUE}, marks values for non-empty partitions. See 
#' \code{ppp} for more in-depth description.
#' @param plot If \code{TRUE}, array is plotted.
#' @return A list containing objects with class
#' \code{ppp.object} with the length equal to the number of
#' arrays (minimum 1).
#' @author Michal Burdukiewcz, Stefan Roediger.
#' @seealso \code{ppp.object}, \code{ppp}.
#' @keywords manip panel
#' @export adpcr2ppp
#' @examples
#' 
#' many_panels <- sim_adpcr(m = 400, n = 765, times = 1000, pos_sums = FALSE, 
#'                    n_panels = 5)
#' 
#' # Convert all arrays to ppp objects
#' adpcr2ppp(many_panels)
#' 
#' # Convert all arrays to ppp objects and get third plate
#' third_plate <- adpcr2ppp(many_panels)[[3]]
#' 
#' # Convert only third plate to ppp object
#' third_plate2 <- adpcr2ppp(extract_run(many_panels, 3))
#' 
#' # Check the class of a new object
#' class(third_plate2)
#' 
#' # It's a list with the length 1. The third plate is a first element on this 
#' #list
#' class(third_plate2[[1]])
#' 
adpcr2ppp <- function(input, marks = TRUE, plot = FALSE) {
  arrays <- adpcr2panel(input, breaks = FALSE)
  lapply(arrays, function(single_array)
    create_ppp(data_vector = single_array, nx_a = ncol(single_array), ny_a = nrow(single_array),
               marks = marks, plot = plot))
}


# create_ppp <- function(data_vector, nx_a, ny_a, plot, marks) {
#   #strange syntax, because spatstat use different localizations
#   #than dpcR.
#   
#   if(storage.mode(data_vector) == "character") {
#     data_vector <- unlist(lapply(strsplit(data_vector, ","), function(single_dp) {
#       mean(c(as.numeric(substr(single_dp[1], 2, nchar(single_dp[1]))),
#              as.numeric(substr(single_dp[2], 0, nchar(single_dp[2]) - 1))))
#     }))
#   }
#   
#   data_points <- which(matrix(data_vector, ncol = nx_a, nrow = ny_a) > 0,
#                        arr.ind = TRUE)
#   
#   data_points[, "row"] <- ny_a - data_points[, "row"] + 1
#   
#   if (plot)
#     plot(ppp(data_points[, 2], data_points[, 1], c(1, nx_a), c(1, ny_a)))
#   #check if marks are properly assigned
#   if (marks) {
#     ppp(data_points[, 2], data_points[, 1], c(1, nx_a), c(1, ny_a), 
#         marks = data_vector[data_vector != 0])
#   } else {
#     ppp(data_points[, 2], data_points[, 1], c(1, nx_a), c(1, ny_a))
#   }
# }

create_ppp <- function(data_vector, nx_a, ny_a, plot, marks) {
  #strange syntax, because spatstat use different localizations
  #than dpcR.
  data_points <- data.frame(row = as.vector(row(data_vector)), 
                            column = as.vector(col(data_vector)), 
                            value = as.vector(data_vector))
  
  data_points[, "row"] <- ny_a - data_points[, "row"] + 1
  
  data_points <- data_points[is.na(data_points[["value"]]) | data_points[["value"]] == 0, ]
  
  if (plot)
    plot(ppp(data_points[, 2], data_points[, 1], c(1, nx_a), c(1, ny_a)))
  #check if marks are properly assigned
  if (marks) {
    ppp(data_points[, 2], data_points[, 1], c(1, nx_a), c(1, ny_a), 
        marks = data_points[["value"]])
  } else {
    ppp(data_points[, 2], data_points[, 1], c(1, nx_a), c(1, ny_a))
  }
}
