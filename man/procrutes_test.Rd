% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/procrutes-test.R
\name{procrutes_test}
\alias{procrutes_test}
\title{Procrutes test for dissimilarity matrices}
\usage{
procrutes_test(
  spec,
  env,
  group = NULL,
  procrutes_fun = "protest",
  spec_select = NULL,
  env_select = NULL,
  use = "everything",
  spec_pre_fun = "identity",
  spec_pre_params = list(),
  env_pre_fun = spec_pre_fun,
  env_pre_params = spec_pre_params,
  seed = 123,
  ...
)
}
\arguments{
\item{spec, env}{data frame object.}

\item{group}{vector for rows grouping.}

\item{procrutes_fun}{string, name of procrutes test function.
 \itemize{
   \item{\code{"protest"} will use \code{vegan::protest()} (default).}
   \item{\code{"procuste.randtest"} will use \code{ade4::procuste.randtest()}.}
   \item{\code{"procuste.rtest"} will use \code{ade4::procuste.rtest()}.}
}}

\item{spec_select, env_select}{NULL (default), numeric or character vector index of columns.}

\item{use}{one of "everything", "complete" or "pairwise".}

\item{spec_pre_fun, env_pre_fun}{string, function name of transform the input data.}

\item{spec_pre_params, env_pre_params}{list, extra parameters for \code{spec/env_pre_fun}.}

\item{seed}{a integer value.}

\item{...}{extra params passing to \code{procrutes_fun}.}
}
\value{
a data frame.
}
\description{
Perform procrutes test quickly and tidy up the data to
data frame.
}
\examples{
\dontrun{
library(vegan)
data("varespec")
data("varechem")
procrutes_test(varespec, varechem)
procrutes_test(varespec, varechem, procrutes_fun = "procuste.randtest")
procrutes_test(varespec, varechem,
               spec_select = list(spec01 = 1:6, spec02 = 7:12))
procrutes_test(varespec, varechem, spec_pre_fun = "mono_mds",
               spec_select = list(spec01 = 1:6, spec02 = 7:12),
               env_select = list(env01 = 1:4, env02 = 5:14))
set.seed(20191224)
sam_grp <- sample(paste0("sample", 1:3), 24, replace = TRUE)
procrutes_test(varespec, varechem, group = sam_grp)
}
}
\author{
Hou Yun

Hou Yun
}
