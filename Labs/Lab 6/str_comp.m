function b = str_comp(str1, str2)
   b = 1;
   if length(str1) ~= length(str2)
       b = 0;
       return
   end
   lst =  str1 == str2;
   for i = 1:length(lst)
       b = b *lst(i);
   end

end