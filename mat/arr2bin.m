function bin = arr2bin(array,n)
    % ��������������洢�������Զ������ַ�������ʽ��ʾ�ĺ���
    %   ����arrΪbit����
    bin = 0;
    for i=length(array):-1:1
        bin = bitshift(array(i),i-1)+bin;
    end
    bin = dec2bin(bin,n);
