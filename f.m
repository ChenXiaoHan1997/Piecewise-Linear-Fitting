function [ y ] = f( x )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
    %y = 100 ./x + 5 ./ x.^2  - 66 * x.^2 + 2 * x + 3 * x.^3 - exp(x ./ 3.5);
    %y = - 3 .* x.^2 + 28 .* x + 22;
    y = zeros(1, length(x));
    for i = 1 : length(x)
        y = rand(1, 10) * 10;
    end
end

