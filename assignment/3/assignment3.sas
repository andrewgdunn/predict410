title 'Assignment 3';

libname mydata '/scs/crb519/PREDICT_410/SAS_Data/' access=readonly;

* create a temporary variable (data source is read only);
* we will also do some transformations and only keep,;
* the variables that we're interested in for this study.;
data ames;
    set mydata.ames_housing_data;
    log_SalePrice = log(SalePrice);
    log_GrLivArea = log(GrLivArea);
    sqrt_SalePrice = sqrt(SalePrice);
    keep SalePrice log_salePrice sqrt_SalePrice GrLivArea log_GrLivArea MasVnrArea BsmtUnfSF BsmtFinSF1 FirstFlrSF TotalBsmtSF GarageArea;

ods graphics on;

* verify that we did indeed carry over the variables of interest;
proc print data=ames (obs=5);

* lets look at the linearity of the transformations;
proc sgscatter data=ames;
    title 'Normal and Transformed Variables';
    plot (SalePrice log_SalePrice) * (GrLivArea log_GrLivArea);

* comparing models where we do some re-expression;
proc reg data=ames;
    model SalePrice = GrLivArea;
    model SalePrice = log_GrLivArea;
    model log_SalePrice = GrLivArea;
    model log_SalePrice = log_GrLivArea;

* correlation with our re-expressed dependent variable;
proc corr data=ames nosimple rank;
  var GrLivArea MasVnrArea BsmtUnfSF BsmtFinSF1 FirstFlrSF TotalBsmtSF GarageArea;
  with log_saleprice;
  run;

proc sgscatter data=ames;
    title 'SalePrice and log_SalePrice vs GrLivArea';
    plot (SalePrice log_SalePrice) * GrLivArea;

proc reg data=ames;
    model SalePrice = GrLivArea;

proc reg data=ames;
    model sqrt_SalePrice = GrLivArea;

* identify outliers in SalePrice;
proc univariate normal plot data=ames;
    var SalePrice;
    histogram SalePrice / normal (color=red w=5);

* three bucket outlier classification;
data outliers;
    set ames;
    keep SalePrice price_outlier GrLivArea MasVnrArea BsmtUnfSF;
    if SalePrice <= 61500 then price_outlier = 1;
        else if SalePrice > 61500 & SalePrice < 457347 then price_outlier = 2;
        else if SalePrice >= 457347 then price_outlier = 3;

proc sort data=outliers;
    by price_outlier;

* means of each outlier bucket;
proc means data=outliers;
    by price_outlier;
    var SalePrice;

* prune the outlier data into a new data set;
data pruned;
    set outliers;
    if price_outlier = 1 then delete;
        else if price_outlier = 3 then delete;

proc univariate normal plot data=pruned;
    var SalePrice;
    histogram SalePrice / normal (color=red w=5);

* regression model for non-manipulated data set;
proc reg data=ames;
    model SalePrice = GrLivArea;
    model SalePrice = GrLivArea MasVnrArea;
    model SalePrice = GrLivArea MasVnrArea BsmtUnfSF;

* regression model for non-manipulated data set;
proc reg data=pruned;
    model SalePrice = GrLivArea;
    model SalePrice = GrLivArea MasVnrArea;
    model SalePrice = GrLivArea MasVnrArea BsmtUnfSF;

run;