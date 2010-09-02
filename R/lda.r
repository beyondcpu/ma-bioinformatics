#    lda.r
#
#    Author:    Amsha Nahid, Jairus Bowne, Gerard Murray
#    Purpose:    Perform Linear Discriminant Analysis (LDA)
#
#    Input:    Data matrix as specified in Data-matrix-format.pdf
#    Output:    LDA plot
#
#    Notes:    Missing values (if any) are replaced by the half of the lowest
#              value in the entire data matrix.


#
#    Load necessary libraries, and install them if they are missing
#
tryCatch(library(MASS), error=function(err)
    install.packages("MASS",repos="http://cran.ms.unimelb.edu.au/"))

#
#    Prepare the data matrix
#
# Read in the .csv file
data<-read.csv("input.csv", sep=",", row.names=1, header=TRUE)
# Get groups information
groups<-data[,1]
# Remove groups for data processing
lda_data<-data[,-1]
# Replace any missing values (see Notes)
lda_data[is.na(lda_data)]<-0.5*(min(lda_data,na.rm=TRUE))

#
#    Perform the LDA
#
lda_result<-lda(lda_data,groups)

#
#    Generate the figures (on screen)
#
#    Image generation - function definition
pic_onscr<-function(matrix, title, cex_val=1)
    {x11()
    par(mgp=c(5,2,0),                           # axis margins
                                                # (title, labels, line)
        mar=c(7,4,4,2),                         # plot margins (b,l,t,r)
        las=1)                                  # horizontal labels
    plot(matrix,                                # data to plot
        cex=cex_val,                            # font size
        dimen=2                                 # dimensions to plot
        )
    title(main=title)                           # title of plot
    }
# Plot LDA scores with sample names
pic_onscr(lda_result,"Linear Discriminant Analysis")
# For plotting with larger font size, use a different value of cex:
# pic_onscr(lda_result, "LDA Plot", dimen=2, cex=3)

#
#    Generate figures as image files
#
#    (Uncomment blocks as necessary)

##### jpeg #####
# pic_jpg<-function(filename, matrix, title, cex_val=1)
#     {# Start jpeg device with basic settings
#     jpeg(filename,
#         quality=100,                            # image quality (percent)
#         bg="white",                             # background colour
#         res=300,                                # image resolution (dpi)
#         units="in", width=8.3, height=5.8       # image dimensions (inches)
#         )
#     par(mgp=c(5,2,0),                           # axis margins 
#                                                 #  (title, labels, line)
#         mar=c(7,4,4,2),                         # plot margins (b,l,t,r)
#         las=1                                   # horizontal labels
#         )
#     # Draw the plot
#     plot(matrix,                                # data to plot
#         cex=cex_val,                            # font size
#         dimen=2                                 # dimensions to plot
#         )
#     title(main=title)                           # title of plot
# 
#     dev.off()
#     }
# pic_jpg("LDA.jpg", lda_result, "Linear Discriminant Analysis")
##### end jpeg #####

##### png #####
# pic_png<-function(filename, matrix, title, cex_val=1)
#     {# Start png device with basic settings
#     png(filename,
#         bg="white",                             # background colour
#         res=300,                                # image resolution (dpi)
#         units="in", width=8.3, height=5.8       # image dimensions (inches)
#         )
#     par(mgp=c(5,2,0),                           # axis margins 
#                                                 #  (title, labels, line)
#         mar=c(7,4,4,2),                         # plot margins (b,l,t,r)
#         las=1                                   # horizontal labels
#         )
#     # Draw the plot
#     plot(matrix,                                # data to plot
#         cex=cex_val,                            # font size
#         dimen=2                                 # dimensions to plot
#         )
#     title(main=title)                           # title of plot
# 
#     dev.off()
#     }
# pic_png("LDA.png", lda_result, "Linear Discriminant Analysis")
##### end png #####

##### tiff #####
# pic_tiff<-function(filename, matrix, title, cex_val=1)
#     {# Start tiff device with basic settings
#     tiff(filename,
#         bg="white",                             # background colour
#         res=300,                                # image resolution (dpi)
#         units="in", width=8.3, height=5.8,      # image dimensions (inches)
#         compression="none"                      # image compression 
#                                                 #  (one of none, lzw, zip)
#         )
#     par(mgp=c(5,2,0),                           # axis margins 
#                                                 #  (title, labels, line)
#         mar=c(7,4,4,2),                         # plot margins (b,l,t,r)
#         las=1                                   # horizontal labels
#         )
#     # Draw the plot
#     plot(matrix,                                # data to plot
#         cex=cex_val,                            # font size
#         dimen=2                                 # dimensions to plot
#         )
#     title(main=title)                           # title of plot
# 
#     dev.off()
#     }
# pic_tiff("LDA.tif", lda_result, "Linear Discriminant Analysis")
##### end tiff #####
