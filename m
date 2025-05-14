Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D3D25E823
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 May 2025 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747218122; cv=none; b=oijDFCOpJpVtSoDVZxbEh6RL3O9WJCeAfePHz4XuVloqdoVIdhZY5jpNgn9VjQheJZA9czkZ5vIHx8wBJdi6v0Ig7o60effdA+wcI4T2V/r+7wC0z1aMcnioWpceYJR5QV2CX5+S0WRwcasS5qiR4QNsBALQ+B1MXINS/jnJGSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747218122; c=relaxed/simple;
	bh=SboBGkb/8wkgkp0Z3EN6uP+HMKA0iOYfzNL6y067/Os=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ukZSeIzI3IKNLuAIffr0OSYKPLgzngBnk6F+MSgGhT0oFRZseHAmhCRIV5NL4denHzoMVZeNMoqwOeNVK5JxGxeynxYdTW03Fy7Qj+is9qezs5i/3gVNHRFAqVf6N3/KGSQjRhxaqA+azFZxUPyV1JskdSofZ8S+W5O6e0ymfss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ln09R6iK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ln09R6iK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747218121; x=1778754121;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SboBGkb/8wkgkp0Z3EN6uP+HMKA0iOYfzNL6y067/Os=;
  b=ln09R6iKorDAnyQirkgGXpikp7XKSunIMomlmoLcfSgdOpb3k/A1s76b
   LAq+HHM31DJW54L+doyIIItV6wQR2aNw3As0PvOgkK8hakH+3Q7uAG7Ck
   2PMUeR++sc2TXMhq3qiFHeG8c4urI1G8MxTvyxXydW6Y9VJgB6G657yC7
   OmzQYoRf6wjpYx/mZawH3L7p1naP8S7FFc4Gw61KNhRES9F4medB0RvqO
   sXoVzdShjkzkvVp4Vuj4i+ygFNNeFgGWOwMBKIVcb1yLt8a4jfXMS9rOf
   CpMxDEvNQcO84hreIk56o0ixFu1pdo2m682/fXTMt7m4Yn4aRv6wpY69S
   A==;
X-CSE-ConnectionGUID: ET+/Z4O9QfChJbPqcttQgw==
X-CSE-MsgGUID: WI1gwoPCSAm39TK52nVlEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48792513"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48792513"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 03:22:00 -0700
X-CSE-ConnectionGUID: CK18QT7cSmGfaCUj6Oh4MA==
X-CSE-MsgGUID: vxaijD2DRJ+chlEqdnU3dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138984091"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.231])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 03:21:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 May 2025 13:21:54 +0300 (EEST)
To: Mario Limonciello <superm1@kernel.org>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 1/3] platform/x86/amd: pmf: Use device managed
 allocations
In-Reply-To: <20250512211154.2510397-2-superm1@kernel.org>
Message-ID: <e344db1e-6978-3e99-2c4e-13d2df0a11e0@linux.intel.com>
References: <20250512211154.2510397-1-superm1@kernel.org> <20250512211154.2510397-2-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 May 2025, Mario Limonciello wrote:

> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> If setting up smart PC fails for any reason then this can lead to
> a double free when unloading amd-pmf.  This is because dev->buf was
> freed but never set to NULL and is again freed in amd_pmf_remove().
> 
> To avoid subtle allocation bugs in failures leading to a double free
> change all allocations into device managed allocations.
> 
> Fixes: 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in amd_pmf_init_smart_pc()")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c   |  3 +-
>  drivers/platform/x86/amd/pmf/tee-if.c | 48 +++++++++------------------
>  2 files changed, 16 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 96821101ec77..395c011e837f 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -280,7 +280,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
>  			dev_err(dev->dev, "Invalid CPU id: 0x%x", dev->cpu_id);
>  		}
>  
> -		dev->buf = kzalloc(dev->mtable_size, GFP_KERNEL);
> +		dev->buf = devm_kzalloc(dev->dev, dev->mtable_size, GFP_KERNEL);
>  		if (!dev->buf)
>  			return -ENOMEM;
>  	}
> @@ -493,7 +493,6 @@ static void amd_pmf_remove(struct platform_device *pdev)
>  	mutex_destroy(&dev->lock);
>  	mutex_destroy(&dev->update_mutex);
>  	mutex_destroy(&dev->cb_mutex);
> -	kfree(dev->buf);
>  }
>  
>  static const struct attribute_group *amd_pmf_driver_groups[] = {
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index d3bd12ad036a..513dbbe3f214 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -362,26 +362,20 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>  	if (IS_ERR(new_policy_buf))
>  		return PTR_ERR(new_policy_buf);
>  
> -	kfree(dev->policy_buf);
> -	dev->policy_buf = new_policy_buf;
> +	devm_kfree(dev->dev, dev->policy_buf);
> +	dev->policy_buf = devm_kmemdup(dev->dev, new_policy_buf, dev->policy_sz, GFP_KERNEL);

So now there are two memdups?? And there's no error handling either?!

>  	dev->policy_sz = length;
> +	kfree(new_policy_buf);
>  
> -	if (!amd_pmf_pb_valid(dev)) {
> -		ret = -EINVAL;
> -		goto cleanup;
> -	}
> +	if (!amd_pmf_pb_valid(dev))

Due to lack of error handling, this can deref NULL.

> +		return -EINVAL;
>  
>  	amd_pmf_hex_dump_pb(dev);
>  	ret = amd_pmf_start_policy_engine(dev);
>  	if (ret < 0)
> -		goto cleanup;
> +		return ret;
>  
>  	return length;
> -
> -cleanup:
> -	kfree(dev->policy_buf);
> -	dev->policy_buf = NULL;
> -	return ret;
>  }
>  
>  static const struct file_operations pb_fops = {
> @@ -532,13 +526,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  	dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
>  	if (IS_ERR(dev->policy_base)) {
>  		ret = PTR_ERR(dev->policy_base);
> -		goto err_free_dram_buf;
> +		goto err_cancel_work;
>  	}
>  
> -	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
> +	dev->policy_buf = devm_kzalloc(dev->dev, dev->policy_sz, GFP_KERNEL);
>  	if (!dev->policy_buf) {
>  		ret = -ENOMEM;
> -		goto err_free_dram_buf;
> +		goto err_cancel_work;
>  	}
>  
>  	memcpy_fromio(dev->policy_buf, dev->policy_base, dev->policy_sz);
> @@ -546,21 +540,21 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  	if (!amd_pmf_pb_valid(dev)) {
>  		dev_info(dev->dev, "No Smart PC policy present\n");
>  		ret = -EINVAL;
> -		goto err_free_policy;
> +		goto err_cancel_work;
>  	}
>  
>  	amd_pmf_hex_dump_pb(dev);
>  
> -	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
> +	dev->prev_data = devm_kzalloc(dev->dev, sizeof(*dev->prev_data), GFP_KERNEL);
>  	if (!dev->prev_data) {
>  		ret = -ENOMEM;
> -		goto err_free_policy;
> +		goto err_cancel_work;
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
>  		ret = amd_pmf_tee_init(dev, &amd_pmf_ta_uuid[i]);
>  		if (ret)
> -			goto err_free_prev_data;
> +			goto err_cancel_work;
>  
>  		ret = amd_pmf_start_policy_engine(dev);
>  		switch (ret) {
> @@ -575,7 +569,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  		default:
>  			ret = -EINVAL;
>  			amd_pmf_tee_deinit(dev);
> -			goto err_free_prev_data;
> +			goto err_cancel_work;
>  		}
>  
>  		if (status)
> @@ -584,7 +578,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  
>  	if (!status && !pb_side_load) {
>  		ret = -EINVAL;
> -		goto err_free_prev_data;
> +		goto err_cancel_work;
>  	}
>  
>  	if (pb_side_load)
> @@ -600,12 +594,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  	if (pb_side_load && dev->esbin)
>  		amd_pmf_remove_pb(dev);
>  	amd_pmf_tee_deinit(dev);
> -err_free_prev_data:
> -	kfree(dev->prev_data);
> -err_free_policy:
> -	kfree(dev->policy_buf);
> -err_free_dram_buf:
> -	kfree(dev->buf);
>  err_cancel_work:
>  	cancel_delayed_work_sync(&dev->pb_work);
>  
> @@ -621,11 +609,5 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>  		amd_pmf_remove_pb(dev);
>  
>  	cancel_delayed_work_sync(&dev->pb_work);
> -	kfree(dev->prev_data);
> -	dev->prev_data = NULL;
> -	kfree(dev->policy_buf);
> -	dev->policy_buf = NULL;
> -	kfree(dev->buf);
> -	dev->buf = NULL;
>  	amd_pmf_tee_deinit(dev);
>  }
> 

-- 
 i.

