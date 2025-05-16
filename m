Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE5E3D69
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 May 2025 06:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747375477; cv=none; b=TmZoeatpC/p3c8SrZGj+MPhfo8Z0CX0416w8Nocq3uC0VQiuVWh5SKfxwMAA64w75WZa3Gm4U0TUFuIF5N+HwXwBI+FdRRoY0OFiRsyNitTh8faKnbLW/7tTg3cABCRlb53PAdvhKqniKBcZhN2q0tEU92iP5gHz2Sl7zB4k0n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747375477; c=relaxed/simple;
	bh=a2WgICQykR47KOS2D5Nw1on61yUFgFC7+AolV799EuM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hqCyO0n3OA07EsJSVcBAcOS7CtLDuLHm6TmCPLjkUJkQuy7sVPvAULJhslP8JetSX4T6vrJttMe43f8yLUAxjq+3pE9m1+Aw/K6cI0odn7QPHRanC5K4aYt5GYsm6TvrU2djaAwC1DJQ0CR2s8axf+l5yIJ/pNkT2tRfm+3eWBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDB4uIwU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDB4uIwU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747375475; x=1778911475;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=a2WgICQykR47KOS2D5Nw1on61yUFgFC7+AolV799EuM=;
  b=hDB4uIwUykCt/TDs/Zws6GnZMH2iZ942b/Z+e7qQ48N1Jkn+OtQx8Xfm
   NXgMQoLjQIKUFioS7Oy8m91Kz6B8NNhnc0j/A2HLEDGxczXwd8z3xdJwO
   uHbjAdoQxP+gZxAA55C5gVO9t7Njqhc0M2j+qIcvaHlHmyoB8l9QCc7Ck
   J/M9DxhcebbkJbV280R5/YfZBDmkdWB8bX06OxSR6FDjJWdow0O8dUsxo
   zmt3RQTNnV5OaK7hl+Ck1cgaQiaSAKuPmR7CnqkVBRbit4x1VwUuLpV05
   /5Pmh+l3TnvERnUqe2p2ahQV50fYp2eHmLykRsFRW9hPc2hrk6VfzAX9U
   Q==;
X-CSE-ConnectionGUID: Kv17MbiPQVqRl+29SJijhg==
X-CSE-MsgGUID: KTUuL6lrSumC0ebwLh4jbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48588344"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="48588344"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 23:04:34 -0700
X-CSE-ConnectionGUID: rRpE71hUSaqAiV893xJopw==
X-CSE-MsgGUID: pJQ7Rbj6ST+tAKiOI15+Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="143363464"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.94])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 23:04:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 16 May 2025 09:04:28 +0300 (EEST)
To: Mario Limonciello <superm1@kernel.org>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v4 1/3] platform/x86/amd: pmf: Use device managed
 allocations
In-Reply-To: <20250515162351.2111468-2-superm1@kernel.org>
Message-ID: <4570e60a-c313-56ac-d85b-072aa3395ec2@linux.intel.com>
References: <20250515162351.2111468-1-superm1@kernel.org> <20250515162351.2111468-2-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 May 2025, Mario Limonciello wrote:

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
> Link: https://lore.kernel.org/r/20250512211154.2510397-2-superm1@kernel.org
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v4:
>  * Handle failures from memory allocation on sideload (Ilpo)
>  * Allocate memory before copying from user (Ilpo)
> ---
>  drivers/platform/x86/amd/pmf/core.c   |  3 +-
>  drivers/platform/x86/amd/pmf/tee-if.c | 58 +++++++++------------------
>  2 files changed, 20 insertions(+), 41 deletions(-)
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
> index d3bd12ad036ae..6d85601812225 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -350,38 +350,30 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>  				   size_t length, loff_t *pos)
>  {
>  	struct amd_pmf_dev *dev = filp->private_data;
> -	unsigned char *new_policy_buf;
>  	int ret;
>  
>  	/* Policy binary size cannot exceed POLICY_BUF_MAX_SZ */
>  	if (length > POLICY_BUF_MAX_SZ || length == 0)
>  		return -EINVAL;
>  
> -	/* re-alloc to the new buffer length of the policy binary */
> -	new_policy_buf = memdup_user(buf, length);
> -	if (IS_ERR(new_policy_buf))
> -		return PTR_ERR(new_policy_buf);
> -
> -	kfree(dev->policy_buf);
> -	dev->policy_buf = new_policy_buf;
> +	devm_kfree(dev->dev, dev->policy_buf);
> +	dev->policy_buf = devm_kzalloc(dev->dev, length, GFP_KERNEL);
> +	if (IS_ERR(dev->policy_buf))
> +		return -ENOMEM;
>  	dev->policy_sz = length;
>  
> -	if (!amd_pmf_pb_valid(dev)) {
> -		ret = -EINVAL;
> -		goto cleanup;
> -	}
> +	if (copy_from_user(dev->policy_buf, buf, length))
> +		return -EFAULT;

Previously, if anything failed here, the old buffer was left in place.
I always assumed it was intentional. But after your change, first thing 
that happens is freeing the old policy_buf.

We're long past the point where I've started to lose confidence in this 
patch :-(. Could we like just make the minimal changes here to convert 
into devm_*() and nothing more? If you want to make any other changes, be 
it reordering logic, removal of the local variable, or whatever, please 
put those into own patch(es) and properly justify them.

-- 
 i.

> +
> +	if (!amd_pmf_pb_valid(dev))
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
> @@ -532,13 +524,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
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
> @@ -546,21 +538,21 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
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
> @@ -575,7 +567,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  		default:
>  			ret = -EINVAL;
>  			amd_pmf_tee_deinit(dev);
> -			goto err_free_prev_data;
> +			goto err_cancel_work;
>  		}
>  
>  		if (status)
> @@ -584,7 +576,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  
>  	if (!status && !pb_side_load) {
>  		ret = -EINVAL;
> -		goto err_free_prev_data;
> +		goto err_cancel_work;
>  	}
>  
>  	if (pb_side_load)
> @@ -600,12 +592,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
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
> @@ -621,11 +607,5 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
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
