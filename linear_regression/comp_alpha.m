function i = comp_alpha()
	data = load('ex1data2.txt');
	X = data(:, 1:2);
	y = data(:, 3);
	m = length(y);

	[X mu sigma] = featureNormalize(X);
	X = [ones(m, 1) X];

	num_iters = 400;
	a1 = 0.01;
	a2 = 0.03;
	a3 = 0.1;

	theta = zeros(3, 1);
	[theta J1] = gradientDescentMulti(X, y, zeros(3, 1), a1, num_iters);
	[theta J2] = gradientDescentMulti(X, y, zeros(3, 1), a2, num_iters);
	[theta J3] = gradientDescentMulti(X, y, zeros(3, 1), a3, num_iters);
	
	plot(1:50, J1(1:50), 'b');
	hold on;
	plot(1:50, J2(1:50), 'r');
	plot(1:50, J3(1:50), 'k');

end