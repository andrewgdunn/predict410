discussion
==========

# Week 1

## What is Predictive Analytics?
We are all part of a graduate program in “Predictive Analytics”, and we are
taking a course titled “Predictive Modeling I”. What is “predictive analytics”,
and what is “predictive modeling”? How do they differ?

__Response__:

I was thrown a bit by this inquiry, however I feel like the best way to
differentiate between 'predictive modeling' and 'predictive analytics' is to say
that when 'predictive modeling' is deployed commercially it is commonly called
'predictive analytics' [^1][^2]. It appears that within the 'predictive
analytics' nomenclature there can be more 'types' than 'predictive modeling', to
include descriptive models and decision models [^0].

[^0]: Predictive analytics. (2015, March 24). In Wikipedia, The Free Encyclopedia. Retrieved 23:03, April 4, 2015, from http://en.wikipedia.org/w/index.php?title=Predictive_analytics&oldid=653358275
[^1]: Predictive modelling. (2015, March 30). In Wikipedia, The Free Encyclopedia. Retrieved 23:03, April 4, 2015, from http://en.wikipedia.org/w/index.php?title=Predictive_modelling&oldid=654248228
[^2]: A Predictive Analytics Primer. (2014, September 2). In Harvard Business Review. Retrieved 23:03, April 4, 2015, from https://hbr.org/2014/09/a-predictive-analytics-primer


## Statistical Graphics and Exploratory Data Analysis
Statistical graphics are commonly used throughout the modeling process. How are
statistical graphics used in exploratory data analysis?

The term “data visualization” is frequently used in conjunction with the term
“analytics”. Is there a difference between the term “data visualization” and the
term “statistical graphics”?

__Response__:

Data visualization generally aims to provide a mechanism for visual
communication [^0]. In essence; tell a story from some underlying data. This can
mean that the creator uses creative license to illustrate the message intended
for the audience [^2]. Statistical graphics are use to visualize quantitative
data, they are direct representations of the data, and directly computed values
from the data with the only creative license being in the modeling techniques.

[^0]: Data visualization. (2015, February 18). In Wikipedia, The Free Encyclopedia. Retrieved 14:11, April 5, 2015, from http://en.wikipedia.org/w/index.php?title=Data_visualization&oldid=647781355
[^1]: The Quick and Dirty on Data Visualization. (2014, April 16). In Harvard Business Review. Retrieved 14:11, April 5, 2015, from https://hbr.org/2014/04/the-quick-and-dirty-on-data-visualization/
[^2]: When Data Visualization Works -- And When it Doesn't. (2013, March 27). In Harvard Business Review. Retrieved 23:03, April 4, 2015, from https://hbr.org/2013/03/when-data-visualization-works-and/

## Regression at Work
A primary topic of this course is “regression analysis”, also called linear
regression, Ordinary Least Squares (OLS) regression, or the Gaussian linear
model. Do you use regression at work? If so, how do you use regression at work?

__Response__:

We more commonly will elicit distribution parameters to provide us with a
variable to randomly sample during a simulation [^0]. I've personally
implemented several optimization strategies and think that a rigorous exposure
to regression methods will help me to more clearly understand some of the
comparative operations within the fitness comparison of various strategies.

[^0]: Discrete event simulation. (2015, March 21). In Wikipedia, The Free Encyclopedia. Retrieved 16:37, April 5, 2015, from http://en.wikipedia.org/w/index.php?title=Discrete_event_simulation&oldid=652840591


# Week 2

## Exploratory Data Analysis and Linear Regression
Before we start fitting regression models, we begin the model building process
by performing an Exploratory Data Analysis (EDA). Given that we have a response
variable Y and four predictor variables X1, X2, X3, and X4, how do we perform an
EDA for a simple linear regression model? Suppose that X1 and X2 are continuous
and that X3 and X4 are categorical. Does your approach to EDA for X1 and X2
differ from X3 and X4? If we want to fit a multiple regression model, does our
EDA change?

__Response__:

EDA involves both graphical depiction and numerical summaries of the data. The
approach will be different for continuous and categorical variables. We will
perform a univariate analysis (look at one variable) on the continuous
variables, then perform a multivariate (in this case bivariate) analysis on the
same continuous variables. If we had more continuous variables, we would perform
univariate analysis on each of them before performing multivariate analysis. For
categorical variables we will perform a univariate analysis via a tabulation of
the frequencies, with a calculation of the fraction/percent of observations that
falls into each category.

The goals remain the same between continuous and categorical. We're trying to
understand the relationship between each X on Y.

## Statistical Inference versus Predictive Modeling
We can build statistical models for inference purposes or predictive purposes.
Imagine that we fit a simple linear regression model Y = b0 + b1X. If we fit
this model for the purpose of statistical inference, what are our primary
motivations and what are the types of conclusions that we would like to draw?
What statistical tests are used to help us make these conclusions?

Now, if we are building this model for predictive purposes, is statistical
inference important? What is important? Are we interested in the results of
statistical tests or are there other metrics that of more importance? How do we
evaluate a model for predictive purposes? What metrics can we use?

__Response__:

I struggled with this question and turned to CrossValidated eventually. This was
mentioned in the lecture video by Dr. Bhatti titled "Estimation and Inference
for Ordinary Least Squares Regression", however consulting my notes I still felt
confused bout the inquiry.

After finding [0], I feel more confident in stating:

 - Causal inference is characterizing how Y behaves when you change X.
 - Prediction is characterizing the production of the next Y, given X.

If we are constructing the model for inference purposes, we'll want a
characterization of Y given X that is minimally biased. If we are constructing
the model for prediction purposes, we'll be willing to accept more bias if it
reduces the overall variance of the prediction.

[^0]: Relation between causal inference and prediction. (2013, April 23). In CrossValidated. Retrieved 16:07, April 10, 2015, from http://stats.stackexchange.com/questions/56909/relation-between-causal-inference-and-prediction-classification-and-regression

## Statistical Graphics and Model Validation
The term “model” is actually a general term in statistics. We typically think of
the term “model” as explicitly referring to a particular model, such as a
specific SLR model like log(Y) = b0 + b1X1, but it can apply to any set of
statistical assumptions. In our library reserves you will find the article

Anscombe (1973). Graphs in Statistical Analysis. American Statistician 27 (1):
17-21.

In this article, what is the statistical model and how are statistical graphics
used to validate this model?

__Response__:

The article illustrates, through a fictional data set, the shortcomings of
summary information from a linear regression model. The scatter plots used on
page 19 and 20 show how very different the four data sets are, when their
descriptive statistics were all the same. Figure 3 and 4 depict situations where
a single observation has significant influence on the regression, where as
figure 2 depicts a more subtle situation where the model would need to be
revised (instead of the considered observations).

# Week 3

## General Model Validation
Why do we need to validate statistical models? Does the scope of this validation
change depending on the intended use of the model? In general we can build
models for two primary purposes: statistical inference and predictive modeling.
Is the model validation process the same for both of these purposes? If not, how
does it differ?

__Response__:

[^0] States succinctly: regression model validation is the process of deciding
whether the numerical results quantifying hypothesized relationships between
variables, obtained from regression analysis, are acceptable as descriptions of
the data.

Dr. Bhatti in [^1] presents that there are two reasons to build statistical
models: (1) for inference, (2) for prediction.

For statistical inference model validation is generally referred to as the
assessment of goodness-of-fit. For predictive modeling model validation is
generally referred to as assessment of predictive accuracy.

One of the noteworthy differences between these two validation methodologies is
that for inference you're making underlying assumptions about the probabilistic
structures of the model, so if data does not conform to these probabilistic
assumptions the inference will be incorrect. For predictive modeling, due to
intent, we can be much more tolerant of violations of the underlying
probabilistic assumptions.

If you've not already watched [^1], please do, Dr. Bhatti presents the material
more thoroughly than I discussed here.

[^0]: Regression model validation. (2015, April 18). In Wikipedia, The Free Encyclopedia. Retrieved 17:12, April 18, 2015, from http://en.wikipedia.org/w/index.php?title=Regression_model_validation&oldid=656997441
[^1]: Bhatti, D.C. 2011e. Statistical inference versus predictive modeling in OLS regression. http://nwuniversity.adobeconnect.com/p5vo4o95h0r/.

## Statistical Graphics and the Analysis of Goodness-Of-Fit
What actions constitute an analysis of goodness-of-fit for a regression model?
What are the typical graphical displays used in this analysis of goodness-of-
fit? Why do we assess the goodness-of-fit of a regression model? What can go
wrong in the interpretation of the results and the use of a regression model
that would be deemed to “fit poorly”?

__Response__:

I'll paraphrase from Dr. Bhatti [^1] again:

 - Goodness-Of-Fit (GOF) is assessed within sample
 - The objective is to confirm the model assumptions
 - In OLS regression the GOF is typically assessed using graphical procedures (scatterplots) for the model residuals

Within an OLS aggression, where our probabilistic assumption is based on the
normal distribution:

To validate the normality assumption one would produce a Quantile-Quantile plot
(QQ-Plot) of the residuals to compare their distribution to a normal distribution.

To validate the homoscedasticity assumption one would produce a scatterplot of
the residuals against each predictor variable. If there is any structure in this
plot, then the model will need a re-expression of the independent variable or
the addition of another independent variable.

One would also interpret the R-Square measure for the model. This can be used as
a simplistic measure for model comparison. By itself R-Square is not an
exclusive measure of GOF. It's a measure of GOF providing that the previous
mentioned conditions are satisfied.

[^1]: Bhatti, D.C. 2011e. Statistical inference versus predictive modeling in OLS regression. http://nwuniversity.adobeconnect.com/p5vo4o95h0r/.

## Only Traditional Goodness-Of-Fit Model Validation?
When we validate a statistical model, should we only consider the traditional
Goodness-Of-Fit measures? Are there other ways in which the model should be
validated? Should the validation be application specific or purely statistical?
Do we have any examples that we can share with the class?

__Response__:

We could consider our model to be good based on the GOF criteria for a specific
subset of the data that we've decided to examine. In a case where you have large
amounts of data points (now days we'd consider Big Data) you might do your
initial model construction on a random sample of a percentage of the data. From
here you may want to run the model on multiple other samples from the raw data
set.

There is a need to perform some contextual validation also, your domain specific
experience with the phenomena might tell you that a model that satisfies GOF
conditions still isn't robust for your purposes.

# Week 4

## Why do we need data transformations?
How do we identify the need for a data transformation? Does the need for a data
transformation become apparent from exploratory data analysis or from model
validation? Are there situations where we would know a priori that we will need
a data transformation?

__Response__:

In our reading [^0] we've found that non-linear re-expression
of the variables may be necessary when any of the following apply:

 - The residuals have a skewed distribution. The purpose of a transformation is to obtain residuals that are approximately symmetrically distributed.
 - The spread of the residuals changes systematically with the values of the dependent variable. The purpose of the transformation is to remove that systematic change in spread, achieving approximate homoscedasticity.
 - A desire to linearize a relationship.
 - When the context of the data expects, e.g. chemistry concentrations are expressed commonly as logarithms.
 - A desire to simplify the model, e.g. when a log-transform can simplify the number and complexity of interaction terms.

Furthermore, a log-transform is specifically indicated instead of another
transform when:

 - The residuals have a "strongly" positively skewed distribution. Tukey in [^1] provides quantitative ways to estimate the transformation based on rank statistics of the residuals. However, it domes down to: if a log-transform symmetrizes the residuals it was likely the right re-expression.
 - When the standard deviation of the residuals is directly proportional to the fitted values.
 - When the relationship is close to exponential.

Some non-reasons to use a re-expression include:

 - Making outliers look less like outliers. Wuber in [^2] states: an outlier is a datum that does not fit some parsimonious relatively simple description of the data. To change one's perspective to make outliers look better is usually an incorrect reversal of priorities.
 - Letting the software automatically do it (without you're desiring so).
 - When making 'bad' data appear to be well behaved.
 - For visualization. If you need a re-expression for visualization, ensure that you're not doing it within the model also.


[^0]: W. A. Huber, “In linear regression, when is it appropriate to use the log of an independent variable instead of the actual values?” 2010. [Online]. Available: http://stats.stackexchange.com/questions/298/in-linear-regression-when-is-it-appropriate-to-use-the-log-of-an-independent-va. [Accessed: 17-Apr-2015]
[^1]: J. W. Tukey, “Exploratory data analysis,” 1977.
[^2]: W. A. Huber, “Logistic regression: Transforming variables,” 2010. [Online]. Available: http://stats.stackexchange.com/questions/4831/logistic-regression-transforming-variables. [Accessed: 17-Apr-2015]

## Indicator Variables

Are indicator, or dummy, variables a data transformation? Are there
parameterizations where indicator variables are a data transformation and
parameterizations where they are not?

__Response__:

The creation of indicator or dummy variables can involve a re-expression, but
some dependent variables already are expressed in a form that is useful for
dummy variable analysis.


## Outliers

What is an “outlier”? Are outliers easy to identify? Do they affect your
statistical models? How? Does this effect matter more, less, or the same if you
have a small number of data points, say 50, versus a larger number like 1,000,
100,000, or 1,000,000? Do we need to worry about individual outliers when we
have a large number of data points, or does this concept have a different name?

__Response__:

From An outlier is a data point that comes from a different population /
distribution / data generating process, than the one you intend to study [^0].

One proposed method of identifying an outlier is that if your model increases in
performance once that observation is removed it can be considered an outlier.

[^0]: gung, "Rigorous Definition of an Outlier", 2011. [Online]. Available: http://stats.stackexchange.com/questions/7155/rigorous-definition-of-an-outlier/20197#20197

# Week 5

## Adjusted R-Squared, AIC, BIC, and Mallow’s Cp
What are the adjusted R-squared, AIC, BIC, and Mallow’s Cp metrics? How can we
use these metrics in the modeling process, and what advantage do they have over
the R-squared metric? Are there any other metrics that we should consider in
this discussion?

__Response__:

Each of these are methods that can be used to calculate criteria for evaluating
regression models [^0]. These methods calculate criteria that can be used as a
'fitness' of the regression model it's calculated from. The relatively 'fitness'
provides criteria for model comparison, and as such can be used for model
selection methods. Each method provides criterion that elicits different
characteristics about a model. We've already learned that R-Square, and Adj.
R-Square will always increase as regressors are added to the model, the other
criterion calculations don't all have the same flaw. (If the number of
regressors is fixed between models, its not necessarily a flaw).

[^0]: Montgomery, D. C., Peck, E. A., & Vining, G. G. (2012). Introduction to linear regression analysis (Vol. 821). John Wiley & Sons.

## Forward, Backward, and Stepwise Variable Selection
Consider the automated variable selection procedures of forward, backward, and
stepwise variable selection. How do these automated variable selection
procedures select which variables to keep and which variables to discard? Be
specific. What are the statistical fundamentals of each of these algorithms?

Should any method be generally preferred over the others? Are there scenarios
where one method should be preferred over the other?

__Response__:

It is typically computationally expensive, or even intractable (greater than
time available) to evaluate an entire design space of regression models. Methods
have been developed for evaluating only a small subset of the model design space
by either adding or deleting regressors one at a time [^0]. These methods are
typically referred to as stepwise-type-procedures.

_Forward selection_, which involves starting with no variables in the model,
testing the addition of each variable using a chosen model comparison criterion,
adding the variable (if any) that improves the model the most, and repeating
this process until none improves the model [^1].

_Backward elimination_, which involves starting with all candidate variables,
testing the deletion of each variable using a chosen model comparison criterion,
deleting the variable (if any) that improves the model the most by being
deleted, and repeating this process until no further improvement is possible
[^1].

_Stepwise regression_, introduced in [^2], is a modification of forward
selection in which at each step all regressors entered into the model previously
are reassessed via their partial F statistics [^0]. A regressors added at an
earlier step may now be redundant because of the relationships between it and
regressors now incorporated into the model.

There is a reason that stepwise regression is considered to be popular, by
taking into account the possibility that a regressor might become redundant and
removing it from the model it doesn't settle into local minima as early within
its design space search.

[^0]: Montgomery, D. C., Peck, E. A., & Vining, G. G. (2012). Introduction to linear regression analysis (Vol. 821). John Wiley & Sons.
[^1]: Stepwise regression. (2014, June 27). In Wikipedia, The Free Encyclopedia. Retrieved 00:28, May 3, 2015, from http://en.wikipedia.org/w/index.php?title=Stepwise_regression&oldid=614585833 
[^2]: Efroymson, M. A. "Multiple regression analysis." Mathematical methods for digital computers 1 (1960): 191-203.

## Determining the Importance of a Predictor Variable
How should we determine the importance of a predictor variable? If an automated
variable selection algorithm selects a variable is it important? (What does it
mean for a variable to be important?)

One type of importance is “statistical significance”. What does it mean for a
predictor variable to be statistically significant? (Be very specific.) Does
statistical significance translate to predictive accuracy? Explain.

__Response__:

Automated variable selection selects components based on the criteria that the
variable selection procedure is designed or instructed to operate on. A variable
can be valuable from an explanatory perspective, but not statistically
significant. An example would be selection based on information loss criteria
(AIC), which is a tradeoff between goodness-of-fit and model complexity, a
variable selected with this criterion could not be statistically significant.

# Week 6

## Multicollinearity
Multicollinearity is always a relevant issue when building models in industry.
Let’s take some time to understand what multicollinearity is, how we detect it,
and how we can mitigate it.

    What is multicollinearity?
    How do we detect multicollinearity?
    How can we mitigate or remedy multicollinearity?
    Is multicollinearity a statistical issue or a linear algebra issue?

__Response__:

Multicollinearity, or near-linear dependence, is When two or more predictor
variables in multiple regression are highly correlated, meaning that one can be
linearly predicted from the others with a non-trivial degree of accuracy [^0].
The same resource [^0] provides a list of detection criteria, here we re-state
some from their list:

 - Large changes in the estimated regression coefficients when a predictor variable is added or deleted
 - Insignificant regression coefficients for the affected variables in the multiple regression, but a rejection of the joint hypothesis that those coefficients are all zero (using an F-test)
 - If a multivariable regression finds an insignificant coefficient of a particular explanator, yet a simple linear regression of the explained variable on this explanatory variable shows its coefficient to be significantly different from zero, this situation indicates multicollinearity in the multivariable regression.

[^1] is one of the Authors that propose formal detection-tolerance based on the
variance inflation factor.

One method is to begin dropping variables to improve the coefficients of the
model. Dropping a variable means you're loosing information for the model, if
you choose a variable that is 'relevent' (may not be possible not to) the model
will result in biased coefficient estimates for the remaining explanatory
variables, as they are correlated to some degree with the dropped variable.

Principal Components analysis as a preconditioner for regression analysis can
initially reduce the independent variables.

Multicollinearity is an issue that manifests within multiple regression models,
however it can be expressed and examined in closed form with linear algebra. 

[^0]: Multicollinearity. (2015, April 28). In Wikipedia, The Free Encyclopedia. Retrieved 15:00, May 9, 2015, from http://en.wikipedia.org/w/index.php?title=Multicollinearity&oldid=659714193 
[^1]: Montgomery, D. C., Peck, E. A., & Vining, G. G. (2012). Introduction to linear regression analysis (Vol. 821). John Wiley & Sons.

## Principal Components Analysis
What are two benefits of using Principal Components Analysis (PCA)? Are there
any limitations to using PCA?

__Response__:

PCA has widespread applications because it reveals simple underlying structures
in complex data sets using analytical solutions from linear algebra [^1]. A
primary benefit of PCA arises from quantifying the importance of each dimension
for describing the variability of a data set. PCA can be used as a method to
create a reduced rank approximation to the covariance structure, i.e. it can be
used to approximate the variation in p predictor variables using k < p principal
components. This is commonly referred to as dimensionality reduction.

PCA is sensitive to the scale of the data. Many software tools will internally
scale/standardize our data, however one must be aware. There has been a proposed
scale independent algorithm to perform PCA [^0]. There is also some limitations
within the fundamental formulation of the methodology, where first PCA explores
a vector, the next vector is required to be orthogonal to the first [^1].

[^0]: Leznik, M., & Tofallis, C. (2005). Estimating invariant principal components using diagonal regression.
[^1]: Shlens, J. (2014). A tutorial on principal component analysis. arXiv preprint arXiv:1404.1100.

## Selecting the Number of Principal Components
Given a set of eigenvalues: 7.2 6.1 4.3 2.2 1.4 1.3 0.8 0.1, how many principal
components should we keep, and what is the cumulative percent of the total
variation captured by the principal components that we will keep? Explain your
decision rule. Is this the only decision rule or are there other decision rules
that could be considered?

What options are available in SAS to help us make this decision?

__Response__:

We will first calculate the total variance explained by the set of eigenvalues:

7.2 + 6.1 + 4.3 + 2.2 + 1.4 + 1.3 + 0.8 + 0.1 = 23.4

7.2 / 23.4 = 0.307692307692
6.1 / 23.4 = 0.260683760684
4.3 / 23.4 = 0.183760683761
2.2 / 23.4 = 0.0940170940171
1.4 / 23.4 = 0.0598290598291
1.3 / 23.4 = 0.0555555555556
0.8 / 23.4 = 0.034188034188
0.1 / 23.4 = 0.0042735042735

We can observe from this that the first three principal components account for
75.21 percent of the variation within our data set. If we had some arbitrary
threshold to achieve an over 80 percent, then we could take the first four
principal components for 84.61 percent. Our decision rule could be based on a
threshold, on the graph shape (plotting the variation explanation), or a desire
to reduce to the minimum possible variables.

# Week 7

## Exploratory Factor Analysis
What are two benefits of using Exploratory Factor Analysis (EFA)? Are there any
limitations to using EFA?

__Response__:

Factor analysis can elicit an unobserved relationship that the analyst thinks
may be occurring between variables. Factor analysis can also facilitate
dimension reduction from observed measurement variables to a smaller set of
unobserved latent variables. Some methods of factor analysis can provide metrics
for model goodness-of-fit. Factor analysis requires our data to all have the
same scaling.

## Factor Rotations
What role do factor rotations play in Factor Analysis? What does it mean to be
an “orthogonal” rotation? What does it mean to be an “oblique” rotation? What
are examples of each of these rotation types? Should one type of rotation be
preferred over the other in all occasions, or does it depend on the application,
or the data? Explain.

__Response__:

Factor rotations are a method to improve interpretation of the factor structure.

 - __Orthogonal__ rotations will yield orthogonal factors after the rotation. The most common orthogonal rotation is the __Varimax__ rotation.
 - __Oblique__ rotations will yield correlated factors after the rotation. The most common oblique rotation is the __Promax__ rotation.

In practice, decisions or rotations are are subjective and considered to be the
analysts prerogative.


## Selecting the Number of Factors
How do we select the “proper” number of factors to keep when using Factor
Analysis? Is there a simple rule for making this decision, or are there multiple
rules that could be considered?

What options are available in SAS to help us make this decision?

__Response__:

Once a method of fitting the common factor model is selected, the important
decision for the analyst is choosing the amount of factors within the model. [^0]
states: "This decision has long been recognized as one of the great challenges
facing researchers when conducting EFA...". [^0] further states that there is a
wealth of literature for methodologies of choosing factors. [^0] goes on to list
many criteria, such as eigenvalues-greater-than-one-rule, scree plot, Horn's
parallel analysis, and several more.

Within SAS, there are several methods to invoke selection criteria for factors,
[^1] discusses Kaiser-Guttman, Percentage of Variance, and Scree Test.


[^0]: Fabrigar, Leandre R., and Duane T. Wegener. Exploratory factor analysis. Oxford University Press, 2011.
[^1]: http://www.ats.ucla.edu/stat/sas/library/factor_ut.htm