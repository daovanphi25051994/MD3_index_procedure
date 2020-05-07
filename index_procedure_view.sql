use demo;
create table Products(
	Id int,
    productCode int ,
    productName varchar(50),
    productPrice float,
    productAmount int ,
    productDescription text,
    productStatus bit
);
create unique index  index_productCode on Products(productCode);
create unique index  Composite_name_price on Products(productName,productPrice );

EXPLAIN select * from Products;

create view newTable as
select productCode , productName , productPrice , productStatus from Products;

create or replace view newTable as
select productCode , productName , productPrice  from Products;

delimiter //
create procedure getAllColumn()
begin 
select * from Products;
end //
delimiter ;

call getAllColumn();

delimiter //
create procedure addProduct(in Id int,
    in productCode int ,
    in productName varchar(50),
    in productPrice float,
    in productAmount int ,
    in productDescription text,
    in productStatus bit)
begin 
insert into Products
values(Id, productCode, productName, productPrice, productAmount, productDescription, productStatus);
end //
delimiter ;

call getAllColumn();

call addProduct(3, 3, 'iphone', 6.7, 1, 'new', 1);


delimiter //
create procedure setProduct(in inID int,
    in inProductCode int ,
    in inProductName varchar(50),
    in inProductPrice float,
    in inProductAmount int ,
    in inProductDescription text,
    in inProductStatus bit)
begin 
update Products
set productCode = inProductCode, productName = inProductName, 
productPrice= inProductPrice, productAmount=inProductAmount, productDescription=inProductDescription, productStatus=inProductStatus
where Id = inID;
end //
delimiter ;

call setProduct(3, 4, 'iphoneold', 2.7, 2, 'old', 1);

delimiter //
create procedure removeProductById(in inID int)
begin 
delete from Products
where Id = inID;
end //
delimiter ;

call removeProductById(3);