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