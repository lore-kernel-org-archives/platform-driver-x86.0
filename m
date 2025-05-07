Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFCA72603
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2025 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746611070; cv=none; b=UjJ37OMD+uMXkA2nhqEVfzpvTidnP3ZOYuwTsVCDUkx8FqP5RuGgr+inpAmXuA99ah1FtvCzZBNFIJRJM2FEMeH1IknLQ2x6qpUuy3luECfdXG1IRiv+GcYXMIcyhNWwn+TjgMnV6R1CMuon4QOWzx468ZyGIk0e9Z8R77WaNr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746611070; c=relaxed/simple;
	bh=GIQW8AYp2zTLa7LP5kebVBxoyjPi3nRkx+fuBLguc1g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hgyUicN9JnktaA9khkykStzzfPCjhQMsh11yFfOZ8vn4maiTonlitTFC7rSI2CnTzkqi8QjYxNxd/r8HRqGx6/3WgViWCOe3ewtgq3eGztAkBqrdKwAm9fnUSl5A6OJDAJpKtbYpT7/aehiPy+bpOMIB7pVlifB3aeBKU0bPKKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VL0XZgPb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VL0XZgPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746611069; x=1778147069;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GIQW8AYp2zTLa7LP5kebVBxoyjPi3nRkx+fuBLguc1g=;
  b=VL0XZgPbOMtYfccccwNZVuy+P9m0wWkFq+weuqUvD7XgtaKIZneD1bSH
   FOj/PQ+0rtWUligQfrFsjCFLCdOfmL0qadXe33ecpWhsWl9eyf2PztvIF
   fvBPAUZd95z5DsnGZVgoJfw3mJONl2q+8aIWi6r5gSyNDh2thNl+NvNXL
   uRluFD5stT4Xt8A2Yv7fLaggNr0CCx8AJudaYZkbZ5IpmRY82NKRK9U/k
   08oDamGApYNDrK5CzK007L1IhXNISXKzjxoOSbE8snxG/W3nz5p1JZL+4
   flgbKHEiSIFijQN57qDWqrI4YplvJQD3zH1S2EWxednfyvQK0V47K1YFM
   g==;
X-CSE-ConnectionGUID: CFx91S+1QX2yVRUuV1KugQ==
X-CSE-MsgGUID: IU0Hd2unSuGbM1FVXBr7Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48341123"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48341123"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 02:44:28 -0700
X-CSE-ConnectionGUID: ElrxZsEDTAGyNW8NFtJEmQ==
X-CSE-MsgGUID: V8Jpu4hhS0uxmBv/y0rFgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136425436"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 02:44:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 7 May 2025 12:44:22 +0300 (EEST)
To: Mario Limonciello <superm1@kernel.org>
cc: mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com, 
    Hans de Goede <hdegoede@redhat.com>, dan.carpenter@linaro.org, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86/amd: pmf: Use device managed
 allocations
In-Reply-To: <20250507020838.2962896-1-superm1@kernel.org>
Message-ID: <b10d7dcd-4026-b06a-f278-b7d46b6a0fee@linux.intel.com>
References: <20250507020838.2962896-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 May 2025, Mario Limonciello wrote:

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
> v1->v2:
>  * Correct commit message with correct offending function root cause
>  * Switch to device managed allocations.
> 
>  drivers/platform/x86/amd/pmf/core.c   |  3 +--
>  drivers/platform/x86/amd/pmf/tee-if.c | 30 ++++++++-------------------
>  2 files changed, 10 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 96821101ec773..395c011e837f1 100644
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
> index d3bd12ad036ae..50c082a78cd9e 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -532,13 +532,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  	dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
>  	if (IS_ERR(dev->policy_base)) {
>  		ret = PTR_ERR(dev->policy_base);
> -		goto err_free_dram_buf;
> +		goto err_cancel_work;
>  	}
>  
> -	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
> +	dev->policy_buf = devm_kzalloc(dev->dev, dev->policy_sz, GFP_KERNEL);

Hi Mario,

Isn't ->policy_buf freed and another allocated in amd_pmf_get_pb_data() 
and this patch lacks any changes around there?? That switch of the buffer 
has been the reason why I've not suggested using devm_*() for earlier for 
it.

Please check all related code to the pointers you're changing if there 
are other similar traps you have not taken into account.

>  	if (!dev->policy_buf) {
>  		ret = -ENOMEM;
> -		goto err_free_dram_buf;
> +		goto err_cancel_work;
>  	}
>  
>  	memcpy_fromio(dev->policy_buf, dev->policy_base, dev->policy_sz);
> @@ -546,21 +546,21 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
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
> @@ -575,7 +575,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  		default:
>  			ret = -EINVAL;
>  			amd_pmf_tee_deinit(dev);
> -			goto err_free_prev_data;
> +			goto err_cancel_work;
>  		}
>  
>  		if (status)
> @@ -584,7 +584,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  
>  	if (!status && !pb_side_load) {
>  		ret = -EINVAL;
> -		goto err_free_prev_data;
> +		goto err_cancel_work;
>  	}
>  
>  	if (pb_side_load)
> @@ -600,12 +600,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
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
> @@ -621,11 +615,5 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
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

