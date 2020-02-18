install.packages("/opt/formatFusionCalls/annoFuse_0.1.8.tar.gz",repos = NULL)
library("annoFuse")

suppressPackageStartupMessages(library("readr"))
suppressPackageStartupMessages(library("tidyverse"))
suppressPackageStartupMessages(library("reshape2"))
suppressPackageStartupMessages(library("optparse"))

option_list <- list(
  make_option(c("-a", "--fusionfileArriba"),type="character",
              help="Formatted fusion calls from arriba"),
  make_option(c("-s", "--fusionfileStarFusion"),type="character",
              help="Formatted fusion calls from starfusion"),
  make_option(c("-o","--outputfile"),type="character",
              help="Formatted fusion calls from [STARfusion | Arriba] (.TSV)")
)

#read in caller results
opt <- parse_args(OptionParser(option_list=option_list))
Arribainputfile <- opt$fusionfileArriba
STARFusioninputfile <- opt$fusionfileStarFusion
outputfile <- opt$outputfile

# read files
STARFusioninputfile<-read_tsv(STARFusioninputfile)
Arribainputfile<-read_tsv(Arribainputfile)
colnames(Arribainputfile)[27]<-"annots"

# To have a general column with unique IDs associated with each sample
STARFusioninputfile$Sample <- STARFusioninputfile$tumor_id
Arribainputfile$Sample <- Arribainputfile$tumor_id
Arribainputfile$Caller <- "Arriba"
STARFusioninputfile$Caller <- "StarFusion"

# standardized fusion calls
standardizedSTARFusion<-fusion_standardization(fusion_calls = STARFusioninputfile,caller = "STARFUSION")
standardizedArriba<-fusion_standardization(fusion_calls = Arribainputfile,caller = "ARRIBA")

#merge standardized fusion calls
standardFusioncalls<-rbind(standardizedSTARFusion,standardizedArriba) %>% as.data.frame()

# General fusion QC for read support and red flags
fusionQCFiltered<-fusion_filtering_QC(standardFusioncalls=standardFusioncalls,readingFrameFilter="in-frame|frameshift|other",artifactFilter="GTEx_Recurrent|DGD_PARALOGS|Normal|BodyMap|ConjoinG",junctionReadCountFilter=1,spanningFragCountFilter=10,readthroughFilter=FALSE)

# write to outputfile
write.table(fusionQCFiltered,outputfile,sep="\t",quote=FALSE,row.names = FALSE)
