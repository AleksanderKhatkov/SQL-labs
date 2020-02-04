Create procedure look
(@QQQ int)
as

Select fname+ +Lname, Htel_no from Buyer b, Viewing v, Property p 
Where b.buyer_no=v.Buyer_no 
and v.Property_no=p.Property_no and p.Owner_no=@QQQ;

exec look 7