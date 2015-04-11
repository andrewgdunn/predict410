title 'Assignment 2';

libname mydata '/scs/crb519/PREDICT_410/SAS_Data/' access=readonly;

* create temporary variable (data source is read only);
data ames;
    set mydata.ames_housing_data;

* initial examination of the correlation to saleprice;
proc corr data=ames nosimple;
    var saleprice;
    with _numeric_;


/*
* variables of interest with saleprice;
proc corr data=ames nosimple plots=all;
    var saleprice;
    with LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodel TotalBsmtSF FirstFlrSF SecondFlrSF GrLivArea;
*/

/*
proc sort data=ames out=sorted;
   by saleprice;

proc print data=sorted;
    var saleprice;

proc sort data=ames out=sorted;
   by LotFrontage;

proc print data=sorted;
    var LotFrontage;

proc sort data=ames out=sorted;
   by LotArea;

proc print data=sorted;
    var LotArea;
*/

ods graphics on;

proc corr data=ames nosimple rank plots=(scatter);
   var MasVnrArea TotalBsmtSF FirstFlrSF GrLivArea GarageArea;
   with SalePrice;
   run;

proc sgscatter data=ames;
    compare x=(MasVnrArea TotalBsmtSF FirstFlrSF GrLivArea GarageArea)
            y=saleprice;
            
proc sgscatter data=ames;
    compare x=(MasVnrArea TotalBsmtSF FirstFlrSF GrLivArea GarageArea)
            y=saleprice / loess;


ods graphics off;

run;