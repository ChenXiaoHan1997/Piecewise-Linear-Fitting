x = 1 : 10;
y = f(x);
e = 10;

plot(x, y, '*');

[k, indexes, as, bs, ee] = SegLinFit(x, y, e);

fprintf('\n至少要分%d段\n误差为%f\n', k, ee);
fprintf('每段的线性拟合函数为：\n');

if k == 1
    fprintf('%.2f*x+%.2f\n', as(1), bs(1));
else
    for i = 1 : k
        if i == 1
            s = 0;
        else
            s = indexes(i - 1);
        end
        if i == k
            t = length(x) - 1;
        else
            t = indexes(i);
        end
        fprintf('第%d段（x%d~x%d）：%.2f*x+%.2f\n', i, s, t, as(i), bs(i));
    end
end