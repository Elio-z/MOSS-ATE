#' @export
surv_SL_predict = function(ftime,
                          ftype,
                          trt,
                          adjustVars,
                          t_0,
                          trtOfInterest = 0:1,
                          gtol = 1e-3,
                          env,
                          ctimeMod,
                          ftimeMod,
                          trtMod
                          ) {
  adjustVars = data.frame(adjustVars)
  ftypeOfInterest = unique(ftype)
  n <- length(ftime)
  id <- seq_len(n)
  dat <- data.frame(id = id, ftime = ftime, ftype = ftype, trt = trt)
  if(!is.null(adjustVars)) dat <- cbind(dat, adjustVars)

  nJ <- length(ftypeOfInterest)
  allJ <- sort(unique(ftype[ftype != 0]))
  ofInterestJ <- sort(ftypeOfInterest)

  # calculate number of groups
  ntrt <- length(trtOfInterest)
  uniqtrt <- sort(trtOfInterest)



  # estimate trt probabilities
  message("Predict treatment propensity")

  dat <- predictTreatment(dat, adjustVars, trtMod,gtol=0.01)

  dataList <- makeDataList(dat = dat, J = allJ, ntrt = ntrt, uniqtrt = uniqtrt,
                           t0 = t_0, bounds = NULL)
  dataList <- predictCensoring(dataList,adjustVars,t0=t_0,gtol = 1e-3,env, ctimeMod)
  dataList <- predictHazards(dataList,J= allJ,adjustVars, ftimeMod,env)


  # extract g
  g_1 <- dat$g_1
  g_0 <- dat$g_0

  # extract hazard
  d1 <- dataList$`1`
  d0 <- dataList$`0`

  haz1 <- d1[,c('id', 't', 'Q1Haz')]
  haz1 <- tidyr::spread(haz1, t, Q1Haz)
  haz1 <- haz1[,-1] # remove the id column

  haz0 <- d0[,c('id', 't', 'Q1Haz')]
  haz0 <- tidyr::spread(haz0, t, Q1Haz)
  haz0 <- haz0[,-1] # remove the id column

  # extract S_{Ac}
  S_Ac_1 <- d1[,c('id', 't', 'G_dC')]
  S_Ac_1 <- tidyr::spread(S_Ac_1, t, G_dC)
  S_Ac_1 <- S_Ac_1[,-1] # remove the id column

  S_Ac_0 <- d0[,c('id', 't', 'G_dC')]
  S_Ac_0 <- tidyr::spread(S_Ac_0, t, G_dC)
  S_Ac_0 <- S_Ac_0[,-1] # remove the id column

  return(list(haz1, haz0, S_Ac_1, S_Ac_0, g_1, g_0))
}

