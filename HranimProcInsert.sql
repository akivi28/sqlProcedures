use SportShop1

INSERT INTO TypeGoods(Name)
VALUES ('������'),
       ('�����'),
       ('���������� ����������'),
       ('�������� ����������')

INSERT INTO Manufacturer(Name)
VALUES ('Nike'),
       ('Adidas'),
       ('Puma'),
       ('Under Armour'),
       ('Reebok'),
	   ('�����, ������ � ������')

INSERT INTO JobPosition(Name)
VALUES ('�������� �� ��������'),
       ('��������-�����������'),
       ('������������� ��������')

INSERT INTO Goods(Name,CountOfGoodsInStock,Price,CostPrice,ManufacturerId,TypeGoodsId)
VALUES  ('��������',100,700,500,(select id from Manufacturer where Name = 'Nike'),
								(select id from TypeGoods where Name = '������')),
		('�����',150,750,550,(select id from Manufacturer where Name = 'Nike'),
								(select id from TypeGoods where Name = '������')),
		('��������',50,800,600,(select id from Manufacturer where Name = 'Adidas'),
								(select id from TypeGoods where Name = '������')),
		('���������',40,2000,1500,(select id from Manufacturer where Name = 'Adidas'),
								(select id from TypeGoods where Name = '�����')),
		('���������',20,3000,2000,(select id from Manufacturer where Name = 'Nike'),
								(select id from TypeGoods where Name = '�����')),
		('��������� ��������',20,1700,1200,(select id from Manufacturer where Name = 'Puma'),
								(select id from TypeGoods where Name = '���������� ����������')),
		('�������',10,1000,800,(select id from Manufacturer where Name = 'Under Armour'),
								(select id from TypeGoods where Name = '���������� ����������')),
		('�����������',40,500,400,(select id from Manufacturer where Name = 'Reebok'),
								(select id from TypeGoods where Name = '�������� ����������')),
		('����',50,900,700,(select id from Manufacturer where Name = 'Reebok'),
								(select id from TypeGoods where Name = '�������� ����������')),
		('�������',100,1000,600,(select id from Manufacturer where Name = 'Nike'),
							(select id from TypeGoods where Name = '���������� ����������')),
		('���� ��� ��������',50,900,700,(select id from Manufacturer where Name = 'Adidas'),
								(select id from TypeGoods where Name = '�������� ����������')),
		('������� ��� ��������',50,1000,700,(select id from Manufacturer where Name = 'Adidas'),
								(select id from TypeGoods where Name = '�������� ����������'))


INSERT INTO Seller(Name,Surname,LastName,Salary,Sex,StartWorkDate,JobPositionId)
VALUES  ('����������','���������','��������',10000,'�������','2020-06-12',
		(select id from JobPosition where Name = '��������-�����������')),

		('������','������','���������',10000,'�������','2021-03-10',
		(select id from JobPosition where Name = '��������-�����������')),

		('���������','�������','�������������',25000,'�������','2014-01-11',
		(select id from JobPosition where Name = '�������� �� ��������')),

		('������','�������','������������',20000,'�������','2013-08-08',
		(select id from JobPosition where Name = '������������� ��������'))

insert into Client(Name,Surname,LastName,Phone,Email,Sex,Discount,Subscribe,DateRegistration)
values('���������','�������','��������','289083827','alex@gmail.com','�������',10,0,'2020-06-05'),
		('���������','��������','����������','38076362562','anna231@gmail.com','�������',0,0,'2018-01-01'),
		('������','������','���������','398348503','gsdgs@gmail.com','�������',5,1,'2019-08-05'),
		('�����','��������','����������','3809576236','olgaL09@gmail.com','�������',30,1,'2021-01-05'),
		('�����','��������','���������','23423452','alfdghjex@gmail.com','�������',0,0,'2021-02-02'),
		('�������','�������','���������','5665464356','sdfgse@gmail.com','�������',12,1,'2022-04-08'),
		('������','�������','��������','76534553','srgsdfg@gmail.com','�������',33,1,'2023-03-03')

insert into Sales(ClientId,SellerId,GoodsId,Count)
values((select id from Client where Name = '���������' and Surname = '�������'),
	   (select id from Seller where Name = '����������' and Surname = '���������'),
	   (select id from Goods where Name = '��������' and ManufacturerId = 
	   (select id from Manufacturer where Name = 'Nike')),10),

	   ((select id from Client where Name = '���������' and Surname = '��������'),
	   (select id from Seller where Name = '����������' and Surname = '���������'),
	   (select id from Goods where Name = '��������' and ManufacturerId = 
	   (select id from Manufacturer where Name = 'Adidas')),5),

	   ((select id from Client where Name = '������' and Surname = '������'),
	   (select id from Seller where Name = '������' and Surname = '������'),
	   (select id from Goods where Name = '���������' and ManufacturerId = 
	   (select id from Manufacturer where Name = 'Adidas')),2),

	   ((select id from Client where Name = '�����' and Surname = '��������'),
	   (select id from Seller where Name = '������' and Surname = '������'),
	   (select id from Goods where Name = '���������' and ManufacturerId = 
	   (select id from Manufacturer where Name = 'Adidas')),1),

	   ((select id from Client where Name = '�����' and Surname = '��������'),
	   (select id from Seller where Name = '���������' and Surname = '�������'),
	   (select id from Goods where Name = '�����������' and ManufacturerId = 
	   (select id from Manufacturer where Name = 'Reebok')),20),

	   ((select id from Client where Name = '�������' and Surname = '�������'),
	   (select id from Seller where Name = '������' and Surname = '�������'),
	   (select id from Goods where Name = '����' and ManufacturerId = 
	   (select id from Manufacturer where Name = 'Reebok')),15)


