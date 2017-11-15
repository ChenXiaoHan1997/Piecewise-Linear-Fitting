function [a, b, indexes, e ] = SegFitRecu( x, y, i, j, k )
%对给定的一组点和函数值，进行分k段的线性拟合（递归）
% SegFitRecu( x, y, k )
%   x:  (n+1)个已知函数值的点
%   y:  (n+1)个已知点对应的函数值
%   i:  待分段拟合区间的起始点下标（从0算起）
%   j:  待分段拟合区间的终止点下标（从0算起）
%   k:  划分的段数

%   a:  k个区间线性拟合函数的一次项系数
%   b:  k个区间线性拟合函数的常数项系数
%   indexes:    (k-1)个分点的下标（从0算起）
%   e:  分段线性拟合的总误差
    
    if k == 1
        [a, b, e] = LinearFit(x, y, i, j);
        indexes = [];
    elseif k > 1
        best_e = Inf;
        best_a = zeros(1, k);
        best_b = zeros(1, k);
        best_indexes = zeros(1, k - 1);
        
        for m = (i + 1) : (j - 1)
            %xi~xm整个区间线性拟合
            [a0, b0, e1] = LinearFit(x, y, i, m);
            %xm~xj分(k-1)段线性拟合
            [a, b, indexes, e2] = SegFitRecu(x, y, m, j, k - 1);
            %保存当前误差最小，拟合效果最好的分区间情况
            if e1 + e2 < best_e
                best_a = [a0, a];
                best_b = [b0, b];
                best_e = e1 + e2;
                best_indexes = [m, indexes];
            end
        end
        
        a = best_a;
        b = best_b;
        e = best_e;
        indexes = best_indexes;
    end
end

