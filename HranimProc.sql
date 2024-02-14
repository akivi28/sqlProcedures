
--1

create proc infAboutAllGoods
as
begin
	select Goods.Name,Goods.CountOfGoodsInStock,
			Goods.Price,Goods.CostPrice,Manufacturer.Name as 'Manufacturer',
			TypeGoods.Name as 'Type of goods'
	from Goods,Manufacturer,TypeGoods
	where ManufacturerId = Manufacturer.Id and 
			TypeGoodsId = TypeGoods.Id
end

exec infAboutAllGoods


--2

create proc infAboutGoodsType
@inputType nvarchar(100) 
as
begin
	select Goods.Name,Goods.CountOfGoodsInStock,
			Goods.Price,Goods.CostPrice,Manufacturer.Name as 'Manufacturer'
	from Goods,Manufacturer,TypeGoods
	where ManufacturerId = Manufacturer.Id and 
			TypeGoodsId = TypeGoods.Id and 
			TypeGoods.Name = @inputType
end

exec infAboutGoodsType 'Защитное снаряжение'

--3

create proc top3Clients
as
begin
	select top(3)*
	from Client
	order by Client.DateRegistration asc
end

exec top3Clients

--4

create proc theBestSaller
as
begin
	select top(1) Seller.Name,Seller.Surname,Seller.LastName,sum(Goods.Price*Sales.Count) as res
	from Sales,Seller,Goods
	where SellerId = Seller.Id and
	GoodsId = Goods.Id
	group by Seller.Name, Seller.Surname , Seller.LastName
	order by res desc
end

exec theBestSaller

--5

create proc isThereAGoods
@inputNameOfManufacturer nvarchar(100)
as
begin
	if exists(select *
			  from Goods,Manufacturer
			  where ManufacturerId = Manufacturer.Id and
			  Manufacturer.Name = @inputNameOfManufacturer)
		print('yes')
	else
		print('no')
end

exec isThereAGoods 'Nike'

exec isThereAGoods 'Спорт, солнце и штанга'

--6

create proc theBestManufacturer
as
begin
	select top(1) Manufacturer.Name,sum(Goods.Price*Sales.Count) as 'sum'
	from Sales,Goods,Manufacturer
	where Sales.GoodsId = Goods.Id and
	Goods.ManufacturerId = Manufacturer.Id
	group by Manufacturer.Name
	order by sum desc
end

exec theBestManufacturer

--7

create proc delClient
@inputDate date
as
begin
	delete from Client where Client.DateRegistration > @inputDate
end

exec delClient '2023-01-01'