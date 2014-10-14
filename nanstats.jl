# Nan Statistics library for Julia
# @license MIT
# @author fox@tinybike.net (Fox Peterson)

module NanStats
export nanmedian, nanmean, nanstd, nanste, nansum, nancumsum

function nanmedian(array)
    cleanArray = array[isfinite(array)]
    if isempty(cleanArray)
        NaN
    else
        return median(cleanArray)
    end
end

function nanmean(array)
    cleanArray = array[isfinite(array)]
    if isempty(cleanArray)
        NaN
    else
       return mean(cleanArray)
    end
end


function nanstd(array)
    cleanArray = array[isfinite(array)]
    if isempty(cleanArray)
         NaN
    else
       return std(cleanArray)
    end
end

function nanste(array)
    cleanArray = array[isfinite(array)]
    if isempty(cleanArray)
        NaN
    else
        return nanmean(cleanArray)/sqrt(length(array))
    end
end

function nansum(array)
    cleanArray = array[isfinite(array)]
    if isempty(cleanArray)
        NaN
    else
        return sum(cleanArray)
    end
end

function nancumsum(array)
    cleanArray = array[isfinite(array)]
    if isempty(cleanArray)
        NaN
    else
        return cumsum(cleanArray)
    end
end

end