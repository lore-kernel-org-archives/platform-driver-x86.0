Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D4E4777A
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 17:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VdTBuReJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703092094; x=1734628094;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=v0oqYbedo5EMXztoC9ODCZj9PDhnrCopSjeuaQxIObk=;
  b=VdTBuReJXtaQIAoKSTJ41Wxa1o5wggds0C/E+1ijfRnZhCRmFTzPvdpp
   Y48MZWkv2t470PtWGkJ6X4rNeCk83F7ivPYZy/Pfrt/GeEQ4eyzas21R4
   Y0DUKSvt+RjKTUVCAQoi2yG10VvRRMy4BD8mAhSPFXmudnkuDcbCcqEo9
   XjH5BpH/0SyViLhnmuL+KxSXNBXUqDxhikiyoh8Hp4eEG6gfwKmItj+mD
   i7M2EQQfNfsgyYXlzc5UN0qLyPLU6YeBy+g6oBf/7n73s0g4kg30gaz9d
   lISguwIZbNaOjELpcod/qwVweVOke8QS0i/iYH021ua1ECgQgCl5lf1vr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="375997422"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="375997422"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:08:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="846795494"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="846795494"
Received: from alobakin-mobl.ger.corp.intel.com ([10.252.50.56])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:08:11 -0800
Date: Wed, 20 Dec 2023 19:08:09 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v2 3/7] platform/x86: Create static func to handle
 platdev
In-Reply-To: <20231220165528.1351200-4-suma.hegde@amd.com>
Message-ID: <4f6d95f-0e9-fba-52c-6efcb8925fd0@linux.intel.com>
References: <20231220165528.1351200-1-suma.hegde@amd.com> <20231220165528.1351200-4-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-908938457-1703092092=:1807"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-908938457-1703092092=:1807
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 20 Dec 2023, Suma Hegde wrote:

> Create a static function and call platform device alloc and add device,
> which will simplify handling acpi and plat device probing.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Changes since v1:
> 1. Replace -1 with PLATFORM_DEVID_NONE in platform_device_alloc()
> 2. Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"
> 
> ---
>  drivers/platform/x86/amd/hsmp.c | 33 ++++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 1a2abe4460f9..e3354683b138 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -551,6 +551,21 @@ static struct platform_driver amd_hsmp_driver = {
>  
>  static struct platform_device *amd_hsmp_platdev;
>  
> +static int hsmp_plat_dev_register(void)
> +{
> +	int ret;
> +
> +	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
> +	if (!amd_hsmp_platdev)
> +		return -ENOMEM;
> +
> +	ret = platform_device_add(amd_hsmp_platdev);
> +	if (ret)
> +		platform_device_put(amd_hsmp_platdev);
> +
> +	return ret;
> +}
> +
>  static int __init hsmp_plt_init(void)
>  {
>  	int ret = -ENODEV;
> @@ -573,22 +588,10 @@ static int __init hsmp_plt_init(void)
>  	if (ret)
>  		return ret;
>  
> -	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
> -	if (!amd_hsmp_platdev) {
> -		ret = -ENOMEM;
> -		goto drv_unregister;
> -	}
> -
> -	ret = platform_device_add(amd_hsmp_platdev);
> -	if (ret) {
> -		platform_device_put(amd_hsmp_platdev);
> -		goto drv_unregister;
> -	}
> -
> -	return 0;
> +	ret = hsmp_plat_dev_register();
> +	if (ret)
> +		platform_driver_unregister(&amd_hsmp_driver);
>  
> -drv_unregister:
> -	platform_driver_unregister(&amd_hsmp_driver);
>  	return ret;
>  }
>  
> 

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>


-- 
 i.

--8323329-908938457-1703092092=:1807--
