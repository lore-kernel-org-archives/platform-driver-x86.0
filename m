Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3FB273D8D
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 07:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753255048; cv=none; b=hn9iUHV6ha91kRMOmAjbLWqdkN7iYHuW7I9vkWCRZaw+v8ZQTizYl/iSvajHhk4x1grtBIzSexidNcLBCmz2gdG8CZ3LPL/oeHrMgWK+j4m3SOi5HFBj5wvCApYBB94bCy9S4TmUS3eYYnIhPjV1YXcLcwfr3Ie+L0LbaIn9nyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753255048; c=relaxed/simple;
	bh=GZeW7CYchdsk1O3QKZh2bqAqkgfdqrx6CNEGvWPgB3s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tRyHIUAub/FqCUNFMxXnutcAOah/H3dFvc7EPMNHlEJxvXv3bhLtpyfx1xg+aa53TWrz4t8B+yltcUFFqt2EDg+vBLfcZXpftSOxr9/a34RkbvUO2P0q5cqhtoXGABn6ei0PRH6T874Yf2pIE4C7iIZRjdwEKpdzqDkpFdeNzwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7tqcran; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7tqcran"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753255046; x=1784791046;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GZeW7CYchdsk1O3QKZh2bqAqkgfdqrx6CNEGvWPgB3s=;
  b=W7tqcranDGfwOoZsfK8dd8hIxSNvyVRGbirS6LforbXS4rOzFb2f4RL+
   fSdl72Yt/k5aejJhNTVhSUeVEKpQd4WrrT8Zii8tyRm7s1J+G2MjwfGDd
   L310ctFMbzDTAHCEjl3QKavMB2dW1uQnQ08qIF5rOUT2NrH2QboQR3+P+
   jTC/8vv8Du1z1FnwoMDo204Ng4IzhRiY3oNrq+dUrRTAbTo4MVDS1ZpCY
   Gpd00/NsCfSCec22KwzPzVbbIDBEM8B9mj22mB+zYglxpPG5vX2oHBHVb
   L5ISlXyHaT7YZeulPgSgzh0sBh/NjsW/iHESaqj5AAswfl2oWH2ojiBqI
   g==;
X-CSE-ConnectionGUID: BYzavBCBRRK/Uo1CNcuk/A==
X-CSE-MsgGUID: PuOD+aisQ8C/TluHx8Ic/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55680478"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55680478"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 00:17:26 -0700
X-CSE-ConnectionGUID: WRR3CUS3QWetd72/YxWUoQ==
X-CSE-MsgGUID: /w3V5rG3Qv6g5TLKAccAxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="164811983"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.90])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 00:17:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 23 Jul 2025 10:17:19 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH v2 2/4] platform/x86/amd/hsmp: Add reference counter to
 track ACPI probe and removal
In-Reply-To: <20250723051251.3009625-3-suma.hegde@amd.com>
Message-ID: <117d9290-7e02-e7ce-fe19-eb91628e3f90@linux.intel.com>
References: <20250723051251.3009625-1-suma.hegde@amd.com> <20250723051251.3009625-3-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Jul 2025, Suma Hegde wrote:

> Implement reference counting to ensure that the memory allocated for
> the hsmp_pdev->sock structure is released, and the miscellaneous device
> is deregistered only after all socket's removal operations have been
> completed.
> 
> Also replace hsmp_pdev->is_probed with hsmp_pdev->ref_cnt.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v1:
> New patch
> 
>  drivers/platform/x86/amd/hsmp/acpi.c | 16 ++++++++--------
>  drivers/platform/x86/amd/hsmp/hsmp.c | 17 +++++++++++++++++
>  drivers/platform/x86/amd/hsmp/hsmp.h |  2 +-
>  3 files changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index b981ae3157ea..232105226407 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -23,6 +23,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> +#include <linux/slab.h>
>  #include <linux/sysfs.h>
>  #include <linux/uuid.h>
>  
> @@ -590,16 +591,15 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	guard(mutex)(&hsmp_lock);
>  
> -	if (!hsmp_pdev->is_probed) {
> +	if (!hsmp_pdev->ref_cnt) {
>  		hsmp_pdev->num_sockets = amd_num_nodes();
>  		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES) {
>  			dev_err(&pdev->dev, "Wrong number of sockets\n");
>  			return -ENODEV;
>  		}
>  
> -		hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
> -					       sizeof(*hsmp_pdev->sock),
> -					       GFP_KERNEL);
> +		hsmp_pdev->sock = kcalloc(hsmp_pdev->num_sockets, sizeof(*hsmp_pdev->sock),
> +					  GFP_KERNEL);
>  		if (!hsmp_pdev->sock)
>  			return -ENOMEM;
>  	}
> @@ -610,15 +610,15 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	if (!hsmp_pdev->is_probed) {
> +	if (!hsmp_pdev->ref_cnt) {
>  		ret = hsmp_misc_register(&pdev->dev);
>  		if (ret) {
>  			dev_err(&pdev->dev, "Failed to register misc device\n");
>  			return ret;
>  		}
> -		hsmp_pdev->is_probed = true;
>  		dev_dbg(&pdev->dev, "AMD HSMP ACPI is probed successfully\n");
>  	}
> +	hsmp_pdev->ref_cnt++;

Unfortunately, also this is buggy.

hsmp_pdev->sock is assigned before we're committed to increase ref_cnt 
which causes a memleak as the next one probing after the mutex is unlocked 
on return will overwrite hsmp_pdev->sock.

There are also linux/kref.h linux/refcount.h which should be considered 
instead of creating own ref count code.

>  	return 0;
>  }
> @@ -630,9 +630,9 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
>  	 * We register only one misc_device even on multi-socket system.
>  	 * So, deregister should happen only once.
>  	 */
> -	if (hsmp_pdev->is_probed) {
> +	if (!(--hsmp_pdev->ref_cnt)) {
>  		hsmp_misc_deregister();
> -		hsmp_pdev->is_probed = false;
> +		kfree(hsmp_pdev->sock);
>  	}
>  }
>  
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 885e2f8136fd..39804ee848ba 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -12,6 +12,8 @@
>  #include <linux/acpi.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
>  #include <linux/semaphore.h>
>  #include <linux/sysfs.h>
>  
> @@ -454,6 +456,21 @@ struct hsmp_plat_device *get_hsmp_pdev(void)
>  {
>  	return &hsmp_pdev;
>  }
> +
> +static int __init hsmp_common_init(void)
> +{
> +	hsmp_pdev.ref_cnt = 0;
> +
> +	return 0;
> +}
> +
> +static void __exit hsmp_common_exit(void)
> +{
> +}
> +
> +device_initcall(hsmp_common_init);
> +module_exit(hsmp_common_exit);
> +
>  EXPORT_SYMBOL_NS_GPL(get_hsmp_pdev, "AMD_HSMP");
>  
>  MODULE_DESCRIPTION("AMD HSMP Common driver");
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 0509a442eaae..1b16fd6a38e1 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -54,7 +54,7 @@ struct hsmp_plat_device {
>  	struct hsmp_socket *sock;
>  	u32 proto_ver;
>  	u16 num_sockets;
> -	bool is_probed;
> +	int ref_cnt;
>  };
>  
>  int hsmp_cache_proto_ver(u16 sock_ind);
> 

-- 
 i.

