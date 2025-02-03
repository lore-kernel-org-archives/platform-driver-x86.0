Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE28720896D
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Feb 2025 14:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593353; cv=none; b=F5TSCVoHz/0BEqldZ7OUILZira+kvREmogMTLOEhV86mcQlJ8heer45B91GWUNIOdn+MQc4PGwUzgM4Elq68x3u9oVGhbCZ/ACmB3KeBVO9ODMUj9nN8R+dEVhAnjddQMUZWCTyNwQZ8BUGqgrOa/JQYkaFJ9Dliy+VeMZnsC44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593353; c=relaxed/simple;
	bh=K/l+/UALiqgkmoB/qneoO+eMWkSRLKluV2rOrM1Tv/A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NkyclKfVq8z4n53WQ040DEt66gIvnGhq38PGZQ2TuRJtMajn7MwlfseRiwApTwTedpbLtbjq9Yt+NCMcoNEvKc0hJ7AKtP0+xtdY32VSBMvkZTmXt7JxMrqtTGGzbT8KXTpNwqFyjQ8bt3K8bGfoISOkD+bm2mkG+o83nwnn+0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HC2liFeK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HC2liFeK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738593352; x=1770129352;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=K/l+/UALiqgkmoB/qneoO+eMWkSRLKluV2rOrM1Tv/A=;
  b=HC2liFeKndEkdQ2hxGBJVNNuj3Ikm5ZNaFzCI2FphNMyY9v+YHStK9pQ
   JkH6msLdtjAQkpE5+abG5kRt/6TYINOCGwqdTS1inh5kJRdf9ZcOPkx51
   pge0AzfR5fI9Lv7wkr7YVxrCIm8R24kfIaOjyYx5njNGeaE5AoX32RwWW
   QDYaThvEiJs6u+NK+HrY59rwj94zDSOQHTphHjb7wg+42MVJ7bFFrr6TT
   6FJoNxydqoaYyyT0NpQXS3S1NtYtJkC9yA+RVEW5bxwG9Zs0sb7SKFuPa
   F8HPGu2MJAwBPbaSmQZMHLaIHTF+K6w5bRNlZRqrFBXXzjhWwJVZsEfhG
   w==;
X-CSE-ConnectionGUID: AB46rd32RzeIyg8pFV2cOg==
X-CSE-MsgGUID: WD9SjqdeTrmnNcX/k7eVhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49741167"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="49741167"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:35:51 -0800
X-CSE-ConnectionGUID: kwszh9cKQVyjdy4WcMXtgA==
X-CSE-MsgGUID: ucXSw+gJR0mY/N7aA+QULA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="115300281"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:35:48 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Feb 2025 16:35:45 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v5 09/12] platform: mellanox: Cosmetic changes to improve
 code style
In-Reply-To: <20250124172632.22437-10-vadimp@nvidia.com>
Message-ID: <0259fb04-d49e-1f6f-392a-d8e8a917fd33@linux.intel.com>
References: <20250124172632.22437-1-vadimp@nvidia.com> <20250124172632.22437-10-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Jan 2025, Vadim Pasternak wrote:

> Replace in 'for' loop - /i >= 0 ; i--/i >= 0 ;i--/.
> Replace in 'while' loop - /(--i >= 0)/(--i)/.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/platform/mellanox/mlx-platform.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
> index 4ed0f05449d5..ee72a53a8b06 100644
> --- a/drivers/platform/mellanox/mlx-platform.c
> +++ b/drivers/platform/mellanox/mlx-platform.c
> @@ -7850,7 +7850,7 @@ static int mlxplat_platdevs_init(struct mlxplat_priv *priv)
>  	while (--i)
>  		platform_device_unregister(priv->pdev_dpu[i]);
>  fail_platform_wd_register:
> -	while (--i >= 0)
> +	while (--i)
>  		platform_device_unregister(priv->pdev_wd[i]);

These are not equal, 0th element will not get unregistered. You need to 
use postdecrement so that value 1 becomes 0 while indexing it:

	while (i--)

There's one similar problem also in the code added in the previous patch.


>  fail_platform_fan_register:
>  	if (mlxplat_regs_io)
> @@ -7871,7 +7871,7 @@ static void mlxplat_platdevs_exit(struct mlxplat_priv *priv)
>  
>  	for (i = MLXPLAT_CPLD_DPU_MAX_DEVS - 1; i >= 0; i--)
>  		platform_device_unregister(priv->pdev_dpu[i]);
> -	for (i = MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >= 0 ; i--)
> +	for (i = MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >= 0; i--)
>  		platform_device_unregister(priv->pdev_wd[i]);
>  	if (priv->pdev_fan)
>  		platform_device_unregister(priv->pdev_fan);
> @@ -7916,7 +7916,7 @@ static int mlxplat_i2c_mux_topology_init(struct mlxplat_priv *priv)
>  	return mlxplat_i2c_mux_complition_notify(priv, NULL, NULL);
>  
>  fail_platform_mux_register:
> -	while (--i >= 0)
> +	while (--i)

Ditto.

>  		platform_device_unregister(priv->pdev_mux[i]);
>  	return err;
>  }
> @@ -7925,7 +7925,7 @@ static void mlxplat_i2c_mux_topology_exit(struct mlxplat_priv *priv)
>  {
>  	int i;
>  
> -	for (i = mlxplat_mux_num - 1; i >= 0 ; i--) {
> +	for (i = mlxplat_mux_num - 1; i >= 0; i--) {
>  		if (priv->pdev_mux[i])
>  			platform_device_unregister(priv->pdev_mux[i]);
>  	}
> 

-- 
 i.

