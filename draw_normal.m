function draw_normal(cor_pdm)
    for i = 1: length(cor_pdm)/2
        %drawArrow([cor_pdm(2*i - 1,1); pdm(2*i - 1, 1)], [cor_pdm(2*i,1); pdm(2*i,1)])
        %plot([cor_pdm(2*i - 1,1), pdm(2*i - 1, 1)], [cor_pdm(2*i,1), pdm(2*i,1)]);
        %hold on;
    end
    plot(cor_pdm(1:2:length(cor_pdm),:), cor_pdm(2:2:length(cor_pdm),:))
    plot(pdm(1:2:length(cor_pdm),:), pdm(2:2:length(cor_pdm),:))
    hold off;
end