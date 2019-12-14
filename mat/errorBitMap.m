function Map = errorBitMap(poly,len_data,len_crc,type)
    %�������ɶ���ʽ�����ݳ��ȡ�У��λ����-�ɵõ������·��ERROR_BITӳ���
    %   poly:���ɶ���ʽ
    %	len_data:����λ��
    %	len_crc:У��λ��
    %
    %   ӳ��������Map�ַ���������,ע��crc���ܹ����������Ϊ
    %               len_data+len_crc < 2^len_crc
    
    Map = cell(5,1);
    if len_data+len_crc < 2^len_crc
        for i = 1:len_crc
            residue = module2divide(bitshift(1,i-1),poly,0,...
                len_data+len_crc,len_crc);
            if i>10
                message = ['crc[',num2str(i-1),']: '];
            else
                message = ['crc[',num2str(i-1),'] : '];
            end
            if type == 'h'
                Map(i)=cellstr(arr2hex(residue,ceil(len_crc/4)));
                message1=[message,arr2hex(residue,ceil(len_crc/4))];
            elseif type == 'b'
                Map(i)=cellstr(arr2bin(residue,len_crc));
                message1=[message,arr2bin(residue,len_crc)];
            end
            disp(message1);
        end
        for i = len_crc+1:len_crc+len_data
            residue = module2divide(bitshift(1,i-1),poly,0,...
                len_data+len_crc,len_crc);
            if i-len_crc > 10
                message = ['data[',num2str(i-1-len_crc),']:'];
            else
                message = ['data[',num2str(i-1-len_crc),']: '];
            end
            if type == 'h'
                Map(i)=cellstr(arr2hex(residue,ceil(len_crc/4)));
                message1=[message,arr2hex(residue,ceil(len_crc/4))];
            elseif type == 'b'
                Map(i)=cellstr(arr2bin(residue,len_crc));
                message1=[message,arr2bin(residue,len_crc)];
            end
            disp(message1);
        end
    else
        fprintf(['��Ƶ�ecc��·�޾�������������������ύ��','\n',...
            '��Ҫ����������len_data+len_crc < 2^len_crc\n']);
    end
    
