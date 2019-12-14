function crc = module2divide(dividend,poly,crc_init,len_data,len_crc)
    %���뱻���������ɶ���ʽ��crc��ʼֵ�����ݲ��жȡ�У���볤�ȣ��ɵõ�����ֵ����
    poly_factor = bitget(poly,1:len_crc);
    data_in = bitget(dividend,1:len_data);
    %����crc��ʼֵΪ0�������Ҳ����ֱ��zeros
    crc = bitget(crc_init,1:len_crc);
    for i=len_data:-1:1
        feedback = xor(crc(len_crc),data_in(i));
        for j=len_crc:-1:2
            crc(j) = xor(crc(j-1),(feedback&poly_factor(j)));
        end
        crc(1) = feedback;
    end