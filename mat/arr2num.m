function num = arr2num(array)
    % ��������������洢������ת��Ϊ����
    %   ����arrayΪbit����
    num = 0;
    for i=length(array):-1:1
        num = bitshift(array(i),i-1)+num;
    end
end

