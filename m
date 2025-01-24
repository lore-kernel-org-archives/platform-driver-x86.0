Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F161D61A3
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jan 2025 08:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737706428; cv=none; b=mxkSeuQZLUVeFf72hKb1v2ePeQP/Hid1JjZ5uyHCM9jg1SC7pbb0irlFFROy3c8Qp08mQKB0MUATMOyDFkfnxQpHRl2WVtePkINg8+86x2CYHyq9wAJZlo1SycsJjUS3r9JCzdTtsV1jgNOwMwNX7uwjaLOLHFZahZQXyPfQQOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737706428; c=relaxed/simple;
	bh=kxPGV2THqEMIkPE8kXIVSFl4FWPrHyZrmsRMHghZprc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eicptJCvvYqMIxYN2CDVwyqats0tdwM2ZPknQt2WKeINPbmcDvSlOGKFw3oOD/j73u9Ec3nHkAgxbyVNFYYx9R9jpSph5WzXFZvPP7ZCpz/EcnJ2BAeM7/0vHPnpoQ3bKwNYXq5d6n+uP3H/e6kpJTSaDFBw2dowMNR6ogXBsrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emWWm6yn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emWWm6yn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737706426; x=1769242426;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kxPGV2THqEMIkPE8kXIVSFl4FWPrHyZrmsRMHghZprc=;
  b=emWWm6yn6j/ubtlM6+x8WRt95euAFxvy5eREl7kXgG92D3Vd8k8TID0z
   8it3luDmiYYEqSlNFAnsADv5Wn0KLw7A0inlR2oYkbZYjx0ibO1OywpTH
   5RplULJWNwUPpbsUpjyReTnREBSYyLqknUPHIYL3++OfuKVcPGTW6MRU6
   EQTYuZeszWOIBnMJB72t8hO5lz0ofgvqvv9dlvCakcLRt9THHg47wplwY
   z5J0j5/ZnKY90cJxgEhMP0TlF8lA2ddtqdGRXatQcW9ZdFpn13O5iUyxi
   VDqoCzlDjXKUzxJMrCRS2w1SJfQucry5BIcEL9obmCvX6tPRtXDSAvlfr
   w==;
X-CSE-ConnectionGUID: SizVbAFtTm28JdsAHgVgwA==
X-CSE-MsgGUID: O7j5xdWqQGGDDVnhEnAOMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="63587535"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="63587535"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 00:13:46 -0800
X-CSE-ConnectionGUID: Bd02FL6lQKeyYvHHCGUPtA==
X-CSE-MsgGUID: 7hlyBOjXRhOfwDQdCDqo5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="107511220"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.158])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 00:13:42 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Jan 2025 10:13:38 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 06/12] platform/mellanox: Rename field to improve code
 readability
In-Reply-To: <20250123190818.3834-7-vadimp@nvidia.com>
Message-ID: <3d7206a6-ad2d-6946-3da9-5de68b8e9408@linux.intel.com>
References: <20250123190818.3834-1-vadimp@nvidia.com> <20250123190818.3834-7-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Jan 2025, Vadim Pasternak wrote:

> Rename filed 'item' in structure 'mlxreg_core_item' to 'item_count'.

field -> field

'item' -> 'count'

However, this did not rename 'counter' (that's in the other struct) which 
was what I suggested you should consider changing.

Also in mlxreg_core_item, 'count' field seems to be the number of elements 
in 'data' so 'item_count' doesn't sound so good name in this particular 
case (in the other case 'counter' counts the number of items in 'item', 
thus my suggestion to use 'item_count').

--
 i.

> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/platform/mellanox/mlx-platform.c   | 108 ++++++++++-----------
>  drivers/platform/mellanox/mlxreg-hotplug.c |   8 +-
>  drivers/platform/mellanox/nvsw-sn2201.c    |   8 +-
>  include/linux/platform_data/mlxreg.h       |   4 +-
>  4 files changed, 64 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
> index bd3bb06ff8f2..9e49bc46ef3d 100644
> --- a/drivers/platform/mellanox/mlx-platform.c
> +++ b/drivers/platform/mellanox/mlx-platform.c
> @@ -777,7 +777,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_PSU_MASK_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
>  		.mask = MLXPLAT_CPLD_PSU_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -786,7 +786,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_PWR_MASK_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
>  		.mask = MLXPLAT_CPLD_PWR_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_items_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -795,7 +795,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_FAN_MASK_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
>  		.mask = MLXPLAT_CPLD_FAN_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_fan_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_fan_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -804,7 +804,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_ASIC_MASK_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
>  		.mask = MLXPLAT_CPLD_ASIC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
>  		.inversed = 0,
>  		.health = true,
>  	},
> @@ -816,7 +816,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_comex_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_CARRIER,
>  		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
>  		.mask = MLXPLAT_CPLD_PSU_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -825,7 +825,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_comex_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_CARRIER,
>  		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
>  		.mask = MLXPLAT_CPLD_PWR_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_items_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -834,7 +834,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_comex_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_CARRIER,
>  		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
>  		.mask = MLXPLAT_CPLD_FAN_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_fan_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_fan_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -843,7 +843,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_comex_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_ASIC_MASK_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
>  		.mask = MLXPLAT_CPLD_ASIC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
>  		.inversed = 0,
>  		.health = true,
>  	},
> @@ -865,7 +865,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_wc_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_CARRIER,
>  		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
>  		.mask = MLXPLAT_CPLD_PSU_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -874,7 +874,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_wc_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_CARRIER,
>  		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
>  		.mask = MLXPLAT_CPLD_PWR_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_items_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -883,7 +883,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_wc_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_ASIC_MASK_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
>  		.mask = MLXPLAT_CPLD_ASIC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
>  		.inversed = 0,
>  		.health = true,
>  	},
> @@ -931,7 +931,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn21xx_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_PWR_MASK_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
>  		.mask = MLXPLAT_CPLD_PWR_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_msn21xx_pwr_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_msn21xx_pwr_items_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -940,7 +940,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn21xx_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_ASIC_MASK_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
>  		.mask = MLXPLAT_CPLD_ASIC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
>  		.inversed = 0,
>  		.health = true,
>  	},
> @@ -1022,7 +1022,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn274x_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
>  		.mask = MLXPLAT_CPLD_PSU_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_msn274x_psu_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_msn274x_psu_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -1031,7 +1031,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn274x_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
>  		.mask = MLXPLAT_CPLD_PWR_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_pwr_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_pwr_items_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -1040,7 +1040,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn274x_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
>  		.mask = MLXPLAT_CPLD_FAN_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_msn274x_fan_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_msn274x_fan_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -1049,7 +1049,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn274x_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
>  		.mask = MLXPLAT_CPLD_ASIC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
>  		.inversed = 0,
>  		.health = true,
>  	},
> @@ -1087,7 +1087,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn201x_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_PWR_MASK_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
>  		.mask = MLXPLAT_CPLD_PWR_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_msn201x_pwr_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_msn201x_pwr_items_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -1096,7 +1096,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn201x_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_ASIC_MASK_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
>  		.mask = MLXPLAT_CPLD_ASIC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
>  		.inversed = 0,
>  		.health = true,
>  	},
> @@ -1193,7 +1193,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_ng_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
>  		.mask = MLXPLAT_CPLD_PSU_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_psu_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_psu_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -1202,7 +1202,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_ng_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
>  		.mask = MLXPLAT_CPLD_PWR_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_pwr_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_pwr_items_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -1211,7 +1211,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_ng_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
>  		.mask = MLXPLAT_CPLD_FAN_NG_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -1220,7 +1220,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_ng_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
>  		.mask = MLXPLAT_CPLD_ASIC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
>  		.inversed = 0,
>  		.health = true,
>  	},
> @@ -1302,7 +1302,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ext_items[] = {
>  		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
>  		.mask = MLXPLAT_CPLD_PSU_EXT_MASK,
>  		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -1312,7 +1312,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ext_items[] = {
>  		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
>  		.mask = MLXPLAT_CPLD_PWR_EXT_MASK,
>  		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -1321,7 +1321,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ext_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
>  		.mask = MLXPLAT_CPLD_FAN_NG_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -1330,7 +1330,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ext_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
>  		.mask = MLXPLAT_CPLD_ASIC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
>  		.inversed = 0,
>  		.health = true,
>  	},
> @@ -1339,7 +1339,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ext_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_ASIC2_HEALTH_OFFSET,
>  		.mask = MLXPLAT_CPLD_ASIC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic2_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic2_items_data),
>  		.inversed = 0,
>  		.health = true,
>  	}
> @@ -1352,7 +1352,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ng800_items[] = {
>  		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
>  		.mask = MLXPLAT_CPLD_PSU_EXT_MASK,
>  		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_psu_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_psu_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -1362,7 +1362,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ng800_items[] = {
>  		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
>  		.mask = MLXPLAT_CPLD_PWR_EXT_MASK,
>  		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_ng800_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_ng800_items_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -1371,7 +1371,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ng800_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
>  		.mask = MLXPLAT_CPLD_FAN_NG_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -1380,7 +1380,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ng800_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
>  		.mask = MLXPLAT_CPLD_ASIC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
>  		.inversed = 0,
>  		.health = true,
>  	},
> @@ -2133,7 +2133,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
>  		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
>  		.mask = MLXPLAT_CPLD_PSU_EXT_MASK,
>  		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -2143,7 +2143,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
>  		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
>  		.mask = MLXPLAT_CPLD_PWR_EXT_MASK,
>  		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -2152,7 +2152,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
>  		.mask = MLXPLAT_CPLD_FAN_NG_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -2161,7 +2161,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
>  		.mask = MLXPLAT_CPLD_ASIC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_asic_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_modular_asic_items_data),
>  		.inversed = 0,
>  		.health = true,
>  	},
> @@ -2171,7 +2171,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
>  		.reg = MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET,
>  		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_pr_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_pr_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -2181,7 +2181,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
>  		.reg = MLXPLAT_CPLD_LPC_REG_LC_VR_OFFSET,
>  		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_ver_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_ver_items_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -2191,7 +2191,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
>  		.reg = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
>  		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_pg_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_pg_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -2201,7 +2201,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
>  		.reg = MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
>  		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_ready_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_ready_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -2211,7 +2211,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
>  		.reg = MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
>  		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_synced_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_synced_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -2221,7 +2221,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
>  		.reg = MLXPLAT_CPLD_LPC_REG_LC_OK_OFFSET,
>  		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_act_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_act_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -2231,7 +2231,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
>  		.reg = MLXPLAT_CPLD_LPC_REG_LC_SD_OFFSET,
>  		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_sd_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_sd_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -2263,7 +2263,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_chassis_blade_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_GWP_OFFSET,
>  		.mask = MLXPLAT_CPLD_GWP_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_global_wp_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_global_wp_items_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -2317,7 +2317,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_rack_switch_items[] = {
>  		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
>  		.mask = MLXPLAT_CPLD_PSU_EXT_MASK,
>  		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -2327,7 +2327,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_rack_switch_items[] = {
>  		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
>  		.mask = MLXPLAT_CPLD_PWR_EXT_MASK,
>  		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -2336,7 +2336,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_rack_switch_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
>  		.mask = MLXPLAT_CPLD_FAN_NG_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -2345,7 +2345,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_rack_switch_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_EROT_OFFSET,
>  		.mask = MLXPLAT_CPLD_EROT_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_erot_ap_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_erot_ap_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -2354,7 +2354,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_rack_switch_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_EROTE_OFFSET,
>  		.mask = MLXPLAT_CPLD_EROT_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_erot_error_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_erot_error_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -2472,7 +2472,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
>  		.mask = MLXPLAT_CPLD_FAN_NG_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -2481,7 +2481,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_EROT_OFFSET,
>  		.mask = MLXPLAT_CPLD_EROT_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_erot_ap_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_erot_ap_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -2490,7 +2490,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_EROTE_OFFSET,
>  		.mask = MLXPLAT_CPLD_EROT_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_erot_error_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_erot_error_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -2499,7 +2499,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_PWRB_OFFSET,
>  		.mask = MLXPLAT_CPLD_PWR_BUTTON_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_pwr_events_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_pwr_events_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -2508,7 +2508,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
>  		.mask = MLXPLAT_CPLD_L1_CHA_HEALTH_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_health_events_items_data),
> +		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_health_events_items_data),
>  		.inversed = 1,
>  		.health = false,
>  		.ind = 8,
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index c525b8754d48..f756dff48c88 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -288,7 +288,7 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
>  		/* Go over all unmasked units within item. */
>  		mask = item->mask;
>  		k = 0;
> -		count = item->ind ? item->ind : item->count;
> +		count = item->ind ? item->ind : item->item_count;
>  		for_each_set_bit(j, &mask, count) {
>  			if (data->capability) {
>  				/*
> @@ -425,7 +425,7 @@ mlxreg_hotplug_health_work_helper(struct mlxreg_hotplug_priv_data *priv,
>  	u32 regval;
>  	int i, ret = 0;
>  
> -	for (i = 0; i < item->count; i++, data++) {
> +	for (i = 0; i < item->item_count; i++, data++) {
>  		/* Mask event. */
>  		ret = regmap_write(priv->regmap, data->reg +
>  				   MLXREG_HOTPLUG_MASK_OFF, 0);
> @@ -620,7 +620,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
>  		 * interrupt capability for some of components.
>  		 */
>  		data = item->data;
> -		for (j = 0; j < item->count; j++, data++) {
> +		for (j = 0; j < item->item_count; j++, data++) {
>  			/* Verify if the attribute has capability register. */
>  			if (data->capability) {
>  				/* Read capability register. */
> @@ -702,7 +702,7 @@ static void mlxreg_hotplug_unset_irq(struct mlxreg_hotplug_priv_data *priv)
>  			     MLXREG_HOTPLUG_EVENT_OFF, 0);
>  
>  		/* Remove all the attached devices in group. */
> -		count = item->count;
> +		count = item->item_count;
>  		for (j = 0; j < count; j++, data++)
>  			mlxreg_hotplug_device_destroy(priv, data, item->kind);
>  	}
> diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
> index abe7be602f84..9cfe1a2bcdb9 100644
> --- a/drivers/platform/mellanox/nvsw-sn2201.c
> +++ b/drivers/platform/mellanox/nvsw-sn2201.c
> @@ -481,7 +481,7 @@ static struct mlxreg_core_item nvsw_sn2201_items[] = {
>  		.aggr_mask = NVSW_SN2201_CPLD_AGGR_PSU_MASK_DEF,
>  		.reg = NVSW_SN2201_PS_PRSNT_STATUS_OFFSET,
>  		.mask = NVSW_SN2201_CPLD_PSU_MASK,
> -		.count = ARRAY_SIZE(nvsw_sn2201_psu_items_data),
> +		.item_count = ARRAY_SIZE(nvsw_sn2201_psu_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -490,7 +490,7 @@ static struct mlxreg_core_item nvsw_sn2201_items[] = {
>  		.aggr_mask = NVSW_SN2201_CPLD_AGGR_PWR_MASK_DEF,
>  		.reg = NVSW_SN2201_PS_DC_OK_STATUS_OFFSET,
>  		.mask = NVSW_SN2201_CPLD_PWR_MASK,
> -		.count = ARRAY_SIZE(nvsw_sn2201_pwr_items_data),
> +		.item_count = ARRAY_SIZE(nvsw_sn2201_pwr_items_data),
>  		.inversed = 0,
>  		.health = false,
>  	},
> @@ -499,7 +499,7 @@ static struct mlxreg_core_item nvsw_sn2201_items[] = {
>  		.aggr_mask = NVSW_SN2201_CPLD_AGGR_FAN_MASK_DEF,
>  		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
>  		.mask = NVSW_SN2201_CPLD_FAN_MASK,
> -		.count = ARRAY_SIZE(nvsw_sn2201_fan_items_data),
> +		.item_count = ARRAY_SIZE(nvsw_sn2201_fan_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -508,7 +508,7 @@ static struct mlxreg_core_item nvsw_sn2201_items[] = {
>  		.aggr_mask = NVSW_SN2201_CPLD_AGGR_ASIC_MASK_DEF,
>  		.reg = NVSW_SN2201_ASIC_STATUS_OFFSET,
>  		.mask = NVSW_SN2201_CPLD_ASIC_MASK,
> -		.count = ARRAY_SIZE(nvsw_sn2201_sys_items_data),
> +		.item_count = ARRAY_SIZE(nvsw_sn2201_sys_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
> index d9f679752226..6eb9d56ec509 100644
> --- a/include/linux/platform_data/mlxreg.h
> +++ b/include/linux/platform_data/mlxreg.h
> @@ -169,7 +169,7 @@ struct mlxreg_core_data {
>   * @capability_bit: started bit in attribute capability register;
>   * @capability_mask: mask in attribute capability register;
>   * @cache: last status value for elements fro the same group;
> - * @count: number of available elements in the group;
> + * @item_count: number of available elements in the group;
>   * @ind: element's index inside the group;
>   * @inversed: if 0: 0 for signal status is OK, if 1 - 1 is OK;
>   * @health: true if device has health indication, false in other case;
> @@ -184,7 +184,7 @@ struct mlxreg_core_item {
>  	u32 capability_bit;
>  	u32 capability_mask;
>  	u32 cache;
> -	u8 count;
> +	u8 item_count;
>  	u8 ind;
>  	u8 inversed;
>  	u8 health;
> 
