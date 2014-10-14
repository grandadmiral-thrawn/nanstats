# 2-level moving window histogramming for Julia
# @license MIT
# @author fox@tinybike.net (Fox Peterson)

using NanStats 

function ensembleavg(x,y,n)

    # designate the edges of each bin
    bin_borders = round([1:length(x)/n:length(x)])

    # create the outermost edge of the rightmost bin
    push!(bin_borders,length(x))

    # n_bin_avg is the number of measurements to fit in each bin
    # ex. 5 and 4
    n_bin_avg = diff(bin_borders)

    # allocate output vectors
    y_avg = fill(NaN,length(n_bin_avg))
    y_std = fill(NaN,length(n_bin_avg))
    x_bins = fill(NaN,length(n_bin_avg))
    x_std = fill(NaN,length(n_bin_avg))

    # Averaging (ala median) y data, calculate standard deviations on x and y for errorbars if you need 'em'
    for i = 1:length(n_bin_avg)
        y_avg[i]    =   nanmedian(y[bin_borders[i]:bin_borders[i]+n_bin_avg[i]])
            
        y_std[i]    =   nanstd(y[bin_borders[i]:bin_borders[i]+n_bin_avg[i]]);
        
        x_bins[i]   =   nanmedian(x[bin_borders[i]:bin_borders[i]+n_bin_avg[i]]);
        
        x_std[i]    =   nanstd(x[bin_borders[i]:bin_borders[i]+n_bin_avg[i]]);
    end

    return y_avg, y_std, x_bins, x_std
end
