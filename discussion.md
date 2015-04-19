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