function hex = arr2hex(array,n)
    % ��������������洢��������ʮ�������ַ�����ʾ�ĺ���
    %   ����arrΪbit����
    hex = 0;
    for i=length(array):-1:1
        hex = bitshift(array(i),i-1)+hex;
    end
    hex = dec2hex(hex,n);