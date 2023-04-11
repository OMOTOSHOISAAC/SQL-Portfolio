--DATA CLEANING

Select * 
from LagosHouseRent

--Removing the 'apartment' in the Housing_type column

Select housing_type
from LagosHouseRent

Select
PARSENAME(REPLACE(housing_type, '/', '.'), 2),
PARSENAME(REPLACE(housing_type, '/', '.'), 1)
From LagosHouseRent

ALter Table LagosHouseRent
Add HouseType nvarchar(255);

Update LagosHouseRent
Set HouseType = PARSENAME(REPLACE(housing_type, '/', '.'), 2)

ALter Table LagosHouseRent
Add ApartmentLabel nvarchar(255);

Update LagosHouseRent
Set ApartmentLabel = PARSENAME(REPLACE(housing_type, '/', '.'), 1)

Select *
from LagosHouseRent

--Replacing the Null Value(HouseType) with the Misplaced  value(ApartmentLabel)

Select HouseType, ApartmentLabel
from LagosHouseRent
where HouseType is null

Update LagosHouseRent
Set HouseType = ApartmentLabel
where HouseType is null

Alter Table LagosHouseRent
Drop Column ApartmentLabel

--Separating the Address Column to Location, Town and State

Select address 
from LagosHouseRent

Select
PARSENAME(REPLACE(address, ',', '.'), 3),
PARSENAME(REPLACE(address, ',', '.'), 2),
PARSENAME(REPLACE(address, ',', '.'), 1)
From LagosHouseRent

ALter Table LagosHouseRent
Add Location nvarchar(255);

Update LagosHouseRent
Set Location = PARSENAME(REPLACE(address, ',', '.'), 3)

ALter Table LagosHouseRent
Add Town nvarchar(255);

Update LagosHouseRent
Set Town = PARSENAME(REPLACE(address, ',', '.'), 2)

ALter Table LagosHouseRent
Add State nvarchar(255);

Update LagosHouseRent
Set State = PARSENAME(REPLACE(address, ',', '.'), 1)

Select Location, Town
from LagosHouseRent
where Location is null

Update LagosHouseRent
Set Location = Town
where Location is null

Alter Table LagosHouseRent
Drop Column housing_type, district, address

Select * 
from LagosHouseRent


