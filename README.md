NanStats.jl
==============

>> That feels of "I miss nanstd" from MATLAB, I know it bro.

How to use:
------------

    ```
    Pkg.add("nanstats")
    
    Using NanStats
    ```
    
Your options
---------------

* nanmedian : computes the median, even if there are nans in your array!
* nanmean : computes the mean, even if there are nans in your array!
* nanstd : computes the standard deviation.... yep, you get it.
* nanste : computes the standard error.... despite nan's!
* nansum : a sum, with nans!
* nancumsum : cumulatively sum up that vector, even if there are nans.

