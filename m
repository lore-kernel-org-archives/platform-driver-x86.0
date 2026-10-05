Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F410123E325;
	Mon,  5 Oct 2026 16:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791217516; cv=none; b=HAdB0hM4H2aqErlYnj4rbBc/ax9ORNA8FVo4XLxCNa9umWpRnGWa7dKImVV4fBqseaT7pzj+jDdOkj7G3gkJo26dfIvc5fWJ3SOYqvKxrJ4zN+/V5tFofuC9lPIiQ/gb9uRpmY8PGNONI6VtjkWdLgHSC9x3Rb6AdZH19qK4gHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791217516; c=relaxed/simple;
	bh=3zqIELGtZtSiuggk3WqkgrDfPQNz73xp9mrfyzIwnpw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YjS6xvpVSovQza6rkUINIhryrglqd2iOhKMSDwuAullI6XBolUwmq+LqHZ3hAILsXEFCGQtOBB1kWZN4tC0RA6XzCwKBUF+xOSIL4KTSlMT+0wBjG4Rrs0v3M8gMBNPCGISq1EQpR9fCXUv/pbD8m0SYJD6nnt9A5/236yPzmFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N20u3J37; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N20u3J37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791217514; x=1822753514;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3zqIELGtZtSiuggk3WqkgrDfPQNz73xp9mrfyzIwnpw=;
  b=N20u3J37Q6cpz4xoI5wLa5CT50kHMDFlm/K61NwavBt+wpmmeQjPoK+g
   pnCyChLIwNJiSfVAyGKU0vs72Ojbwyfg3yiqW1tZQFfzRigA82VYAXqvs
   DQveh+TqfEMJNqgS90Vjm0v4rU8Htg2nC9E+ou2xrXeA1DA9n094QTykb
   HtJziqYdlSdUBtnTFlkuXPK2mgOkM/LeVdlZz8iodSYSaiGf3NwnFM1UJ
   bytku7ZRZpPXD+xUr7vsZsKE04bhZ/56OLC1nEPLpvOfla/UaaTDFHN1d
   VFsIIYkT2iXyAyPJT9QJObw9U2ul7VhumJV73u3L7M7uERIwqapm4+C5E
   A==;
X-CSE-ConnectionGUID: /+2jhcQqQOmmjNwnVRA7Pg==
X-CSE-MsgGUID: XD5+BZC4TMKyHDix2i1AOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="117410107"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="117410107"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 09:25:13 -0700
X-CSE-ConnectionGUID: iaft5f+LSiOxes56EVRDWg==
X-CSE-MsgGUID: 0jgu+f1NScK+iC0ohezY+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="276388098"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 09:25:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 Oct 2026 19:25:07 +0300 (EEST)
To: Rong Zhang <i@rong.moe>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
    Charles <hanker007@gmail.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/9] platform/x86: lenovo-wmi-capdata: Defer mutex
 initialization
In-Reply-To: <20260914-lwmi-wmi-new-api-v1-3-7a400f2f69f8@rong.moe>
Message-ID: <af408357-f912-53a4-9259-8244a82d335d@linux.intel.com>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe> <20260914-lwmi-wmi-new-api-v1-3-7a400f2f69f8@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Sep 2026, Rong Zhang wrote:

> In the following changes, priv->list may be freed if the first call to
> lwmi_cd_cache() fails due to WMI/ACPI errors, so the list_mutex must be
> initialized after it in order not to break lockdep, as there is no
> devm_mutex_destroy(). Considering that the first call to lwmi_cd_cache()
> doesn't need serialization as there is no other reader or writer this
> early, the initialization of list_mutex can be deferred.
> 
> Therefore, initialize list_mutex only after the first call to
> lwmi_cd_cache() succeeds, otherwise it remains uninitialized and can be
> devm_kfree()-ed.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/platform/x86/lenovo/wmi-capdata.c | 80 +++++++++++++++++++++++--------
>  1 file changed, 60 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
> index 880ac444c206..0123ec8f7b53 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -91,6 +91,7 @@ struct lwmi_cd_priv {
>  	struct wmi_device *wdev;
>  	struct cd_list *list;
>  	struct dentry *debugfs_dir;
> +	bool initialized;
>  
>  	/*
>  	 * A capdata device may be a component master of another capdata device.
> @@ -588,14 +589,14 @@ static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
>  /* ======== WMI interface ======== */
>  
>  /**
> - * lwmi_cd_cache() - Cache all WMI data block information
> + * __lwmi_cd_cache() - Cache all WMI data block information locklessly
>   * @priv: lenovo-wmi-capdata driver data.
>   *
> - * Loop through each WMI data block and cache the data.
> + * Loop through each WMI data block and cache the data locklessly.
>   *
>   * Return: 0 on success, or an error.
>   */
> -static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
> +static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
>  {
>  	size_t size;
>  	int idx;
> @@ -617,7 +618,6 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>  		return -EINVAL;
>  	}
>  
> -	guard(mutex)(&priv->list->list_mutex);
>  	for (idx = 0; idx < priv->list->count; idx++, p += size) {
>  		union acpi_object *ret_obj __free(kfree) = NULL;
>  
> @@ -635,14 +635,37 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>  	return 0;
>  }
>  
> +/**
> + * lwmi_cd_cache() - Cache all WMI data block information
> + * @priv: lenovo-wmi-capdata driver data.
> + *
> + * Loop through each WMI data block and cache the data.
> + *
> + * Return: 0 on success, or an error.
> + */
> +static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
> +{
> +	if (!priv->initialized)
> +		return __lwmi_cd_cache(priv);
> +
> +	switch (priv->info->type) {
> +	case LENOVO_CAPABILITY_DATA_01:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	guard(mutex)(&priv->list->list_mutex);
> +	return __lwmi_cd_cache(priv);
> +}
> +
>  /**
>   * lwmi_cd_fan_list_alloc_cache() - Alloc and cache Fan Test Data list
>   * @priv: lenovo-wmi-capdata driver data.
> - * @listptr: Pointer to returned cd_list pointer.
>   *
>   * Return: count of fans found, or an error.
>   */
> -static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_list **listptr)
> +static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
>  {
>  	struct cd_list *list;
>  	size_t size;
> @@ -688,6 +711,9 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_lis
>  	if (!list)
>  		return -ENOMEM;
>  
> +	list->count = count;
> +	priv->list = list;
> +
>  	for (idx = 0; idx < count; idx++) {
>  		/* Do not calculate array index using count, as it may be truncated. */
>  		list->cd_fan[idx] = (struct capdata_fan) {
> @@ -697,8 +723,7 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_lis
>  		};
>  	}
>  
> -	*listptr = list;
> -	return count;
> +	return 0;
>  }
>  
>  /**
> @@ -714,7 +739,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
>  {
>  	struct cd_list *list;
>  	size_t list_size;
> -	int count, ret;
> +	int count;
>  
>  	count = wmidev_instance_count(priv->wdev);
>  
> @@ -726,11 +751,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
>  		list_size = struct_size(list, cd01, count);
>  		break;
>  	case LENOVO_FAN_TEST_DATA:
> -		count = lwmi_cd_fan_list_alloc_cache(priv, &list);
> -		if (count < 0)
> -			return count;
> -
> -		goto got_list;
> +		return lwmi_cd_fan_list_alloc_cache(priv);
>  	default:
>  		return -EINVAL;
>  	}
> @@ -739,17 +760,32 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
>  	if (!list)
>  		return -ENOMEM;
>  
> -got_list:
> -	ret = devm_mutex_init(&priv->wdev->dev, &list->list_mutex);
> -	if (ret)
> -		return ret;
> -
>  	list->count = count;
>  	priv->list = list;
>  
>  	return 0;
>  }
>  
> +/**
> + * lwmi_cd_finalize() - Finalize the capability data initialization
> + * @priv: lenovo-wmi-capdata driver data.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +static int lwmi_cd_finalize(struct lwmi_cd_priv *priv)
> +{
> +	int ret;
> +
> +	if (priv->list) {
> +		ret = devm_mutex_init(&priv->wdev->dev, &priv->list->list_mutex);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	priv->initialized = 1;

Don't you need a barrier to ensure these are really done in the correct 
order?

> +	return 0;
> +}
> +
>  /**
>   * lwmi_cd_setup() - Cache all WMI data block information
>   * @priv: lenovo-wmi-capdata driver data.
> @@ -768,7 +804,11 @@ static int lwmi_cd_setup(struct lwmi_cd_priv *priv)
>  	if (ret)
>  		return ret;
>  
> -	return lwmi_cd_cache(priv);
> +	ret = lwmi_cd_cache(priv);
> +	if (ret)
> +		return ret;
> +
> +	return lwmi_cd_finalize(priv);
>  }
>  
>  /**
> 
> 

-- 
 i.

