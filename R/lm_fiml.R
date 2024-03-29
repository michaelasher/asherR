#' Run a model that has lm syntax in lavaan with FIML
#'
#' This function is intended to allow you to avoid manually creating interaction
#' terms when you want to handle missing data with FIML.
#'
#' @importFrom magrittr "%>%"
#' @param model An lm model
#' @return Model output
#' @export
lm_fiml <- function(model) {

  lm_formula <- model$call %>% as.character()
  lm_formula <- lm_formula[2]

  if(class(eval(model$call[[2]])) == "character"){
    lm_formula <- eval(model$call[[2]]) %>% as.character()
  }

  dv <- colnames(model$model)[1]
  data <- model$call[3] %>% as.character() %>% str_extract("^[A-Za-z_0-9]*")
  data <- eval(parse(text = data))

  mod_matrix <- model.matrix(as.formula(lm_formula), model.frame(~ ., data, na.action=na.pass)) %>%
    as.data.frame() %>% dplyr::select(-`(Intercept)`)

  names(mod_matrix) <- stringr::str_replace_all(names(mod_matrix), pattern = ":", replacement = "_x_")

  lav_formula <-  paste0(names(mod_matrix), collapse = " + ")

  mod_matrix <- dplyr::bind_cols(dplyr::select(data, all_of(dv)), mod_matrix)

  mod_string <- stringr::str_c(dv, " ~ ", lav_formula)

  fit <- lavaan::sem(mod_string, data = mod_matrix, estimator = 'ML', missing = 'ML.x')
  out <- lavaan::parameterEstimates(fit, standardized = TRUE) %>%
    dplyr::filter(op == "~") %>%
    dplyr::select(term = rhs, beta = std.all, b = est, z, pvalue, dv = lhs)

  return(out)

}




