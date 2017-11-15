function [ k, indexes, as, bs, ee ] = SegLinFit( x, y, e )
%对给定的一组点和函数值，在满足精度的前提下，以最少的区间数进行分段线性拟合
%SegLinFit( x, y, e )
%   x:  (n+1)个已知函数值的点
%   y:  (n+1)个已知点对应的函数值
%   e:  容许的最大误差

%   k:  划分的最少段数
%   indexes:    (k-1)个分点的下标（从0算起）
%   a:  k个区间线性拟合函数的一次项系数
%   b:  k个区间线性拟合函数的常数项系数
%   ee: 最终分段线性拟合的误差

    %若x长度为n，则最多分成(n-1)段
    for k = 1 : (length(x) - 1)
        [as, bs, indexes, ee ] = SegFitRecu(x, y, 0, length(x) - 1, k);
        if ee <= e
            break;
        end
    end
end

