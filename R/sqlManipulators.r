

#' getSmallMolPeakData
#'
#' @param db NA
#' @param fileshas NA
#'
#' @return NA
#' @export
#'
#' @examples NA
getSmallMolPeakData <-   function(db, fileshas){
  
  sqlQ <- glue::glue_sql("
                          SELECT `smallMoleculePeaks`
                          FROM (SELECT *
                                  FROM `IndividualSpectra`
                                WHERE (`spectrumSHA` IN ({shas*})))
                          WHERE (`smallMoleculePeaks` IS NOT NULL)",
                         shas = fileshas,
                         .con = db
  )
  
  conn <- pool::poolCheckout(db)
  temp <- DBI::dbSendQuery(conn, sqlQ)
  temp <- DBI::dbFetch(temp)
  pool::poolReturn(conn)
  temp <- unname(unlist(temp,
                        recursive = FALSE))
  unlist(lapply(temp,
                function(x){
                  unserialize(memDecompress(x,
                                            type= "gzip"))
                })
  )
  
  
}


#' collapseSmallMolReplicates
#'
#' @param db NA
#' @param fileshas NA
#' @param smallMolPercentPresence NA
#' @param lowerMassCutoff NA
#' @param upperMassCutoff NA
#'
#' @return NA
#' @export
#'
#' @examples NA
collapseSmallMolReplicates <- function(db,
                                       fileshas,
                                       smallMolPercentPresence,
                                       lowerMassCutoff,
                                       upperMassCutoff){
  
  
  
  temp <- IDBacApp::getSmallMolPeakData(db = db,
                                        fileshas = fileshas)
  temp <- MALDIquant::binPeaks(temp,
                               tolerance = .02,
                               method = "relaxed")
  temp <- MALDIquant::filterPeaks(temp,
                                  minFrequency = smallMolPercentPresence / 100)
  temp <- MALDIquant::mergeMassPeaks(temp,
                                     method = "mean")
  temp <- MALDIquant::trim(object = temp,
                           range = c(lowerMassCutoff,
                                     upperMassCutoff))
}






#' getAllStrain_IDsfromSQL
#'
#' @param databaseConnection NA
#' @param table NA
#'
#' @return NA
#' @export
#'
#' @examples NA
getAllStrain_IDsfromSQL <- function(databaseConnection, table){
  # Gets unique Strain_IDs given a RSQLite database connecction and table name
  
  dbQuery <- glue::glue_sql("SELECT DISTINCT `Strain_ID`
                            FROM ({tab*})",
                            tab = table,
                            .con = databaseConnection)
  
  conn <- pool::poolCheckout(databaseConnection)
  dbQuery <- DBI::dbSendQuery(conn, dbQuery)
  dbQuery <- DBI::dbFetch(dbQuery)[ , 1]
  
  
}





