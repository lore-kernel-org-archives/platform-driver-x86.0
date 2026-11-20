Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167458;
	b=3acBIWOYbhq+XaFMEF49KNRK8Ddn2NLcEB3axl6OShgLfj/FNP0fNqkBAPg9UbYBXHa/
	 ZUMBDYRVkgSff02nvi33T5/G7NQXBQMTDqM/rMxthbxYwvkMVyDLBD8uD4nSLTuH1I8L8
	 xJgYpTBpTEAp5NX5Jgs1QERnMeQSIeFZxttV908bgZby2YLk3fqCDax77KDv+9L+YM8k3
	 pfbXh+Vl8vFk4de3H3qgbdrVi4ZkLesNHUHmSBVPZUqQXOjrPFxgLtDElYYqSONVDR6je
	 XbSQrF5XfDw7OY4iARhdHPRakOseBFAx8/kmEFHZwoVSWN/NZT+sYSb+wjU4vfpYJuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167458;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=8nLhND4z49B5O4/mKsMBcq58154cDoOxducYzIreUC4=;
	b=RH1YPYrwy25igxlT11U8Guh3LobxkUt8QuK5EngNdWKgtKevwPTyTUWPWGgoSfoiYIgw
	 KL1s0787j9Krfu51NzLJCsF3Xl7uKZmBaSFiNNycqbLJmI8mYNnAHNqYbJlFugDK7wWZI
	 jJUZoZMZuHHFN8AHw3C2DLYXP9Qb8LoDVxZAlgJxwLmnj3hymgI7JC3XNVkOTCOl5pCgu
	 Lg/A/sI1W1XdM6WN4ctIzVlSYhGlpS/Z9j6gNm8zAkXpMAVFmibRuTty4RL3aiBbcfqjt
	 J6vWcqpfIoO18EgvH8bwetmsoLzQpProG/g7OMKDqzKbPHw+D0sBHV9iiaM+Fn+eTMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g6N60YvM;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BBD606A326
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 09:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1BBD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g6N60YvM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795167458; x=1826703458;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=705WnHOHa1K5mTgex1hh60dWU0zEIoGuT9aa1gOYljM=;
  b=g6N60YvMRDwQh3U0VyKVI2ITeCXD52SlmgXJDzDKYtf2K3A7Q0RzeWqo
   8SDGdXyQ/b0riGLtki/TkPVPiKqqVLyIPGddW6faBd8Jup1tXG0X0iJW3
   dTJ/BGdEWzOeujc5lAYVDIdcfNdN70f6md9XQ5qrx5QSkY3SkBnBBKZhk
   Epmo3hbbTXtNFVSc7HRxpK73D4ACZ1UmJclvswgRnZ3HFZH3Qr9CbZPW9
   sY7meeib/uuSTrWxLFJY4lQeM2gE00oU5o7xY91IAmKukdWqF64Qbd2Yz
   HgQk3fusFx4kQ5sbRwiQxPA37RCGA0HvYDxHFP9i/i1wB2mT0sDvEFvOo
   A==;
X-CSE-ConnectionGUID: O7+W8k9KTI2FQ0PVtXO3GQ==
X-CSE-MsgGUID: mVjln1yqQXCWmJJOcMzB/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3890339"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3890339"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 01:37:37 -0800
X-CSE-ConnectionGUID: 2wCLnRi8Sbqy9dOS46BE2A==
X-CSE-MsgGUID: Mjh7Kl4rTLqRY0LTu2jP1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10738377"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 01:37:35 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 20 Nov 2026 11:37:31 +0200 (EET)
To: Rosen Penev <rosenp@gmail.com>
cc: Stuart Hayes <stuart.w.hayes@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    Doug Warzecha <Douglas_Warzecha@dell.com>, Andrew Morton <akpm@osdl.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 3/4] platform/x86: dell: dcdbas: Release the SMI buffer
 in remove
In-Reply-To: <20261118035638.11773-4-rosenp@gmail.com>
Message-ID: <db9e6534-ed2b-4abb-6d4a-906fc7ad18dc@linux.intel.com>
References: <20261118035638.11773-1-rosenp@gmail.com> <20261118035638.11773-4-rosenp@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Nov 2026, Rosen Penev wrote:

> dcdbas_exit() frees the SMI data buffer before
> platform_device_unregister() removes the sysfs attributes, and without

This is very confusingly written, platform_device_unregister() does not 
remove sysfs attributes. dcdbas_remove() does as is written below.

I think the entire sysfs attribute discussion (which is also stating 
contradicting things) is sidetracking what looks to be the main problem, 
that something is done in dcdbas_exit() that should be done in 
dcdbas_remove(), I needed to read very much between the lines and had 
already misunderstood what the all-over-the-place changelog had spewn on 
my face.

Also, why isn't this driver using .dev_groups??

> holding smi_data_lock.

Not sure why this is relevant, this looks an ordering problem, not a 
locking problem??

It's further reinforced by the fact that you did not make smi_data_lock 
related changes in the patch, AFAICT.

> The comment claims that only at module exit can
> all sysfs attributes be released, but device attributes do not pin the
> module: while rmmod runs, smi_data_write() or smi_data_buf_size_store()
> can still be executing. They can then memcpy() into the buffer as it is
> freed, or allocate a new buffer that is never freed.
> 
> sysfs_remove_group() in dcdbas_remove() waits for running attribute
> handlers, and dcdbas_pdev is still valid at that point. Free the buffer
> there, or unmap the firmware-provided buffer when WSMT is in use, and
> also do it when probe fails after dcdbas_check_wsmt() mapped the
> firmware buffer. Reset the WSMT state with it so a later probe starts
> clean.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/platform/x86/dell/dcdbas.c | 44 ++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
> index 6bab3e0619bc..1f64f707744c 100644
> --- a/drivers/platform/x86/dell/dcdbas.c
> +++ b/drivers/platform/x86/dell/dcdbas.c
> @@ -97,6 +97,20 @@ static void smi_data_buf_free(void)
>  	dcdbas_smi_free(&smi_buf);
>  }
>  
> +/* Free the SMI data buffer, or unmap the firmware one when WSMT is in use */
> +static void dcdbas_release_buffer(void)
> +{
> +	if (wsmt_enabled) {
> +		memunmap(bios_buffer);
> +		bios_buffer = NULL;
> +		smi_buf = (struct smi_buffer){};
> +		max_smi_data_buf_size = MAX_SMI_DATA_BUF_SIZE;
> +		wsmt_enabled = false;
> +	} else {
> +		smi_data_buf_free();
> +	}
> +}
> +
>  /**
>   * smi_data_buf_realloc: grow SMI data buffer if needed
>   */
> @@ -683,11 +697,11 @@ static int dcdbas_probe(struct platform_device *dev)
>  	 */
>  	error = dma_set_coherent_mask(&dcdbas_pdev->dev, DMA_BIT_MASK(32));
>  	if (error)
> -		return error;
> +		goto err_release_buffer;
>  
>  	error = sysfs_create_group(&dev->dev.kobj, &dcdbas_attr_group);
>  	if (error)
> -		return error;
> +		goto err_release_buffer;
>  
>  	register_reboot_notifier(&dcdbas_reboot_nb);
>  
> @@ -695,12 +709,22 @@ static int dcdbas_probe(struct platform_device *dev)
>  		 DRIVER_DESCRIPTION, DRIVER_VERSION);
>  
>  	return 0;
> +
> +err_release_buffer:
> +	dcdbas_release_buffer();
> +	return error;
>  }
>  
>  static void dcdbas_remove(struct platform_device *dev)
>  {
>  	unregister_reboot_notifier(&dcdbas_reboot_nb);
>  	sysfs_remove_group(&dev->dev.kobj, &dcdbas_attr_group);
> +
> +	/*
> +	 * sysfs_remove_group() waited for any attribute handler still
> +	 * running, so nothing else uses the buffer now.
> +	 */
> +	dcdbas_release_buffer();
>  }
>  
>  static struct platform_driver dcdbas_driver = {
> @@ -749,22 +773,6 @@ static int __init dcdbas_init(void)
>   */
>  static void __exit dcdbas_exit(void)
>  {
> -	/*
> -	 * make sure functions that use dcdbas_pdev are called
> -	 * before platform_device_unregister
> -	 */
> -	unregister_reboot_notifier(&dcdbas_reboot_nb);
> -
> -	/*
> -	 * We have to free the buffer here instead of dcdbas_remove
> -	 * because only in module exit function we can be sure that
> -	 * all sysfs attributes belonging to this module have been
> -	 * released.
> -	 */
> -	if (dcdbas_pdev)
> -		smi_data_buf_free();
> -	if (bios_buffer)
> -		memunmap(bios_buffer);
>  	platform_device_unregister(dcdbas_pdev_reg);
>  	platform_driver_unregister(&dcdbas_driver);
>  }
> 

-- 
 i.
