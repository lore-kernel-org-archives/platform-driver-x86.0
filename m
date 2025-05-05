Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892AC20297E
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 May 2025 11:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445353; cv=none; b=tC/jN+Gh173gIKzPPVpBg/edOlJ6/t99StZH52xIE+fC4HzlZnB8ir++vnAfDmnguC4e1BRQqIy9klPrcJmnKb6H9oTVP7RtyZ1OKMnR57ZbSPZHeczduIOVjglv9Uk9rW/C1YG57KnI5xmypIHW2Q1+WwUuWWSheW+AAfgOxMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445353; c=relaxed/simple;
	bh=8UZ9wwSJ7+6YDGWVsjuRglmoxkb3HqXDfGtS/EVe74Q=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hJ7SaFkuuKLaCh1+LRTb4YOV/Q21m8OF84KIEfIV881vu8ggNlG8vPAMUrsE/D8ndHaDlnvIKi1QeQyfgYDRNYsT72gGCdGhnUKidxT/mFjiWiXBEpvkIi8hZeEj0oEMmh01OPWx0rDI5koaC85Fzl/B+LUVM4iPIhHdD5I1+XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csSXOkob; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csSXOkob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746445352; x=1777981352;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8UZ9wwSJ7+6YDGWVsjuRglmoxkb3HqXDfGtS/EVe74Q=;
  b=csSXOkobTnST0T2m12cQ2FsVWTFJ2bxsatcpiFS5fOWtvkpJ8537GZ1t
   c7/japMRtrMbyIyOQHHRInZouY/mr8mgN2cZAMAJultewhZCGjFy+qtEB
   eT7dqGybpjuw9uzeb+TdileA5on2P2zHzP6/b7hVrroDpYT8WsMCrBZAs
   T4ybErDnxbqoEpNnH3Pw9eASDS0gZG1u3LOL1HsjQ7dOnXgyPri3hhy5q
   fmj/r3OXsii2N7FMf74XKFYl3AZhMAp6uokWAOkIWBmDigM6ZXI7p1X5m
   vsMX7ZVgeY+TNez3mOBsMA0Eb60mRTkFErzYX27rCgC3iVeTsJIqtJGOh
   g==;
X-CSE-ConnectionGUID: xz5SF0gbSjizOANlCpZE0A==
X-CSE-MsgGUID: GCK3hHrmRlqZgsUSJZgl/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="47308549"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="47308549"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 04:42:31 -0700
X-CSE-ConnectionGUID: 3Uflu4BcTaCFK9Jz5/esGQ==
X-CSE-MsgGUID: Nts58rBlQSeYio9/y9jZJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="135564672"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.68])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 04:42:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 May 2025 14:42:25 +0300 (EEST)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    dan.carpenter@linaro.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next 1/1] platform/mellanox: mlxreg-dpu: Fix
 smatch warnings
In-Reply-To: <20250504165404.6877-1-vadimp@nvidia.com>
Message-ID: <a24badb9-6893-c52b-7ec7-8e726836c3fa@linux.intel.com>
References: <20250504165404.6877-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 4 May 2025, Vadim Pasternak wrote:

> Add missed call to release adapter.
> Remove wrong error pointer conversion.
> 
> Fixes: 3e75f2954116 ("platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU")
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/platform/mellanox/mlxreg-dpu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-dpu.c b/drivers/platform/mellanox/mlxreg-dpu.c
> index 277e4b8cc5cb..805b9bfbc85f 100644
> --- a/drivers/platform/mellanox/mlxreg-dpu.c
> +++ b/drivers/platform/mellanox/mlxreg-dpu.c
> @@ -535,8 +535,10 @@ static int mlxreg_dpu_probe(struct platform_device *pdev)
>  		return -EPROBE_DEFER;
>  
>  	mlxreg_dpu = devm_kzalloc(&pdev->dev, sizeof(*mlxreg_dpu), GFP_KERNEL);
> -	if (!mlxreg_dpu)
> +	if (!mlxreg_dpu) {
> +		i2c_put_adapter(data->hpdev.adapter);
>  		return -ENOMEM;
> +	}

Why this doesn't reuse the existing rollbacks??

>  
>  	/* Create device at the top of DPU I2C tree. */
>  	data->hpdev.client = i2c_new_client_device(data->hpdev.adapter,
> @@ -562,7 +564,6 @@ static int mlxreg_dpu_probe(struct platform_device *pdev)
>  	if (err) {
>  		dev_err(&pdev->dev, "Failed to sync regmap for client %s at bus %d at addr 0x%02x\n",
>  			data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
> -		err = PTR_ERR(regmap);
>  		goto regcache_sync_fail;
>  	}
>  
> 

-- 
 i.

