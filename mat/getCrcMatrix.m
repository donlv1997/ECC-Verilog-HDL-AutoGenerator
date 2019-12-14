function M = getCrcMatrix(poly,len_data,len_crc)
    %GETCRCMATRIX �˴���ʾ�йش˺�����ժҪ
    %   �˴���ʾ��ϸ˵��
    M = zeros(len_crc,len_crc);
    for i=1:len_crc
        M(:,i) = module2divide(0,poly,bitshift(1,i-1),len_data,len_crc);
    end

