

--Cleaning Data

Select * 
From PortfolioProject.dbo.NashvilleHousing

--Standardize Date Format

Select SaleDateConverted,  CONVERT(Date,SaleDate)
From PortfolioProject.dbo.NashvilleHousing

Update NashvilleHousing
Set SaleDate = CONVERT(Date, SaleDate)

Alter Table NashvilleHousing
Add SaleDateConverted Date;

Update NashvilleHousing
Set SaleDateConverted = CONVERT(Date,SaleDate)


--Populated Property Address data

Select *
From PortfolioProject.dbo.NashvilleHousing
--Where PropertyAddress is null
order by ParcelID

Select a.ParcelID, a.PropertyAddress,b.ParcelID, b.PropertyAddress, ISNULL(a.Propertyaddress,b.PropertyAddress)
From PortfolioProject.dbo.NashvilleHousing a
Join PortfolioProject.dbo.NashvilleHousing b
 on a.ParcelID = b.ParcelID
  AND a. [UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

Update a
Set PropertyAddress = ISNULL(a.Propertyaddress,b.PropertyAddress)
From PortfolioProject.dbo.NashvilleHousing a
Join PortfolioProject.dbo.NashvilleHousing b
 on a.ParcelID = b.ParcelID
  AND a. [UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null



-- Breaking out Address into Individual Columns (Address, City, State)

Select PropertyAddress
From PortfolioProject.dbo.NashvilleHousing
--Where PropertyAddress is null
--order by ParcelID

Select 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)-1) as Address, 
SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress)+1, LEN(PropertyAddress)) as Address
From PortfolioProject.dbo.NashvilleHousing

Alter Table NashvilleHousing
Add PropertySplitAddress Nvarchar(255);

Update NashvilleHousing
Set PropertySplitAddress = Substring(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)-1)


Alter Table NashvilleHousing
Add PropertySplitCity Nvarchar(255);

Update NashvilleHousing
Set PropertySplitCity  = Substring(PropertyAddress, CHARINDEX(',',PropertyAddress)+1,LEN(PropertyAddress))


Select *

From PortfolioProject.dbo.NashvilleHousing





Select OwnerAddress
From PortfolioProject.dbo.NashvilleHousing

Select
PARSENAME(Replace(OwnerAddress,',','.'),3)
,PARSENAME(Replace(OwnerAddress,',','.'),2)
,PARSENAME(Replace(OwnerAddress,',','.'),1)
From PortfolioProject.dbo.NashvilleHousing


Alter Table NashvilleHousing
Add OwnerSplitAddress Nvarchar(255);

Update NashvilleHousing
Set OwnerSplitAddress = PARSENAME(Replace(OwnerAddress,',','.'),3)

Alter Table NashvilleHousing
Add OwnerSplitCity Nvarchar(255);

Update NashvilleHousing
Set OwnerSplitCity  = PARSENAME(Replace(OwnerAddress,',','.'),2)

Alter Table NashvilleHousing
Add OwnerSplitState Nvarchar(255);


Update NashvilleHousing
Set OwnerSplitState  = PARSENAME(Replace(OwnerAddress,',','.'),1)


--Change Y and N to Yes and No in "Sold as Vacant" field

Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From PortfolioProject.dbo.NashvilleHousing
Group by SoldAsVacant
order by 2


Select SoldAsVacant
, Case when SoldasVacant = 'Y'Then 'Yes'
       when SoldasVacant = 'N' THEN 'No'
	   Else SoldAsVacant
	   End
From PortfolioProject.dbo.NashvilleHousing

Update NashvilleHousing
Set SoldAsVacant = Case when SoldasVacant = 'Y'Then 'Yes'
       when SoldasVacant = 'N' THEN 'No'
	   Else SoldAsVacant
	   End


--Remove Duplicates
WITH RowNumCTE AS(
Select *,
   ROW_NUMBER() OVER (
   PARTITION BY PARCELID,
                PropertyAddress,
				SalePrice,
				SaleDate,
				LegalReference
				Order by 
				   UniqueID
				    )row_num

From PortfolioProject.dbo.NashvilleHousing
--order by ParcelID
)
Select *
From RowNumCTE
where row_num >1
Order by PropertyAddress


--Delete Unused Columns

Select * 
From PortfolioProject.dbo.NashvilleHousing

ALTER TABLE PortfolioProject.dbo.NashvilleHousing
Drop Column OwnerAddress,TaxDistrict,PropertyAddress

ALTER TABLE PortfolioProject.dbo.NashvilleHousing
Drop Column SaleDate



