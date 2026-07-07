Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D72B31355C;
	Tue,  7 Jul 2026 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412477; cv=none; b=hxb+OTD59vKARqippzx47PjUHieWIv9xtAkrsRvxyBEb0DcJulemQlCpcHazNkzI43nx4SX797fqPawDV17RxxntyyiQ4cmQcY9PIt9xL5wHz675b8my4ygHgHhZ8YrLCGRHLuMGs3TaCkpmyicYg8B301Ot73rTgB8hUTtqm98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412477; c=relaxed/simple;
	bh=/bnAiyDlrAce6AEFPONJ5IKTSPKeqc8pc+BhWjm5uiQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CoFaHhk+lmbLW3DWnHF3B7mo+w6VTvigr5R9+KVULuV1wwSSBjL+Pyk192LtY79w7YM9ea6e3aUqP5afbU3Y149icy9nCDlzRFE7hK7R3tqwgDi/cVzNZqCJ1nIEuC4nD0TcE5c0AcsP0t+oTN+NCu3Y0aE/BhuLo+IxfcXKEjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+oSxC2N; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+oSxC2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783412474; x=1814948474;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/bnAiyDlrAce6AEFPONJ5IKTSPKeqc8pc+BhWjm5uiQ=;
  b=J+oSxC2NK3xr0NHon6X4VTL9Bt2W6U9elBs3F41keWpuf6m/QELMMaku
   ku9HV5u5nm/0bzDDLiibzb/W2qbAPBCaJCkwUQjDqy1gqHyrTblm/4Z2u
   jxVsHIQPWdUXaNv9h073t2HTRYEeWsEGZm24qiwFhTxC/poAtesCAFMDH
   gAYiM/2nnnUuEyn/IRWUNSqQu2wlRQWxn5uZpSCFgNaQ1pGXpshSPaw5p
   gPUgqof2r/HAAvpSnVfdarck12Erqks6w5So6+kwetDnyVF/gItpChnjI
   Smm3OzVvLELZ5QMm00F+L8BVtE4lXPov0SG2PS47Py2d+g3vUYR14ubGg
   w==;
X-CSE-ConnectionGUID: J6JcYXeWSkaK7pHjmPXQYw==
X-CSE-MsgGUID: UdY4QjOXQ+mIVQTpaNPp4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="84243544"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84243544"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 01:21:13 -0700
X-CSE-ConnectionGUID: Maorq2rzQJSHMKayEbnw6w==
X-CSE-MsgGUID: QZk4/35GS0WYmlPjaREghQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="247565382"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 01:21:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jul 2026 11:21:07 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    muthusamy.ramalingam@amd.com
Subject: Re: [PATCH v3 2/5] platform/x86/amd/hsmp: Map the metric table with
 ioremap() and unmap it explicitly
In-Reply-To: <20260707051630.3381945-1-muralidhara.mk@amd.com>
Message-ID: <37ca941a-36fb-84b8-d526-bb44fc95d792@linux.intel.com>
References: <20260707051630.3381945-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Jul 2026, Muralidhara M K wrote:

> The metric table DRAM region is mapped with devm_ioremap(), tying its
> lifetime to the socket device.  The ACPI driver (a later patch) needs to

When referring to a patch that comes later in the series, please use

an upcoming change

(once a patch is accepted, it turns into a change.)

One space is enough.

> share the socket array across sockets and coordinate its own teardown, so
> the mapping can no longer be pinned to a single per-socket devres scope.
> 
> Switch hsmp_get_tbl_dram_base() to plain ioremap() and add
> hsmp_unmap_metric_tbls(), which drops every socket's metric_tbl_addr
> mapping.  Wire it into the platform driver's probe-failure and remove
> paths so the non-devm mapping is released explicitly; the socket array
> itself stays devm-managed.
> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/hsmp.c | 22 ++++++++++++++++++++--
>  drivers/platform/x86/amd/hsmp/hsmp.h |  1 +
>  drivers/platform/x86/amd/hsmp/plat.c | 14 ++++++++++++--
>  3 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 1a87931136fd..ccf21f2d230d 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -12,6 +12,7 @@
>  #include <linux/acpi.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/io.h>
>  #include <linux/semaphore.h>
>  #include <linux/sysfs.h>
>  
> @@ -414,6 +415,24 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>  }
>  EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
>  
> +void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev)
> +{
> +	u16 i;
> +
> +	if (!pdev->sock)

Can this happen?

> +		return;
> +
> +	for (i = 0; i < pdev->num_sockets; i++) {
> +		struct hsmp_socket *s = &pdev->sock[i];
> +
> +		if (s->metric_tbl_addr) {
> +			iounmap(s->metric_tbl_addr);
> +			s->metric_tbl_addr = NULL;
> +		}
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(hsmp_unmap_metric_tbls, "AMD_HSMP");
> +
>  int hsmp_get_tbl_dram_base(u16 sock_ind)
>  {
>  	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
> @@ -438,8 +457,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>  		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
>  		return -ENOMEM;
>  	}
> -	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
> -					     sizeof(struct hsmp_metric_table));
> +	sock->metric_tbl_addr = ioremap(dram_addr, sizeof(struct hsmp_metric_table));
>  	if (!sock->metric_tbl_addr) {
>  		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>  		return -ENOMEM;
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 0509a442eaae..98c82a4c0cc3 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -64,6 +64,7 @@ void hsmp_misc_deregister(void);
>  int hsmp_misc_register(struct device *dev);
>  int hsmp_get_tbl_dram_base(u16 sock_ind);
>  ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
> +void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev);
>  struct hsmp_plat_device *get_hsmp_pdev(void);
>  #if IS_ENABLED(CONFIG_HWMON)
>  int hsmp_create_sensor(struct device *dev, u16 sock_ind);
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index e07f68575055..e0a99e8f2be8 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -214,22 +214,32 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  	ret = init_platform_device(&pdev->dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> -		return ret;
> +		goto err_unmap;
>  	}
>  
>  	ret = hsmp_misc_register(&pdev->dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to register misc device\n");
> -		return ret;
> +		goto err_unmap;
>  	}
>  
>  	dev_dbg(&pdev->dev, "AMD HSMP is probed successfully\n");
>  	return 0;
> +
> +err_unmap:
> +	/*
> +	 * init_platform_device() may have ioremap()ed metric tables before
> +	 * failing.  They are no longer devm-managed, so drop them explicitly;

Don't write history style text into comments ("no longer"). In comments we 
document the current iteration of code, not how it came to that point.

One space is enough. It may be that your editor adds the second space 
after a full stop so it may be worth to take a look at your editor's 
settings.

> +	 * the socket array itself is devm-managed.
> +	 */
> +	hsmp_unmap_metric_tbls(hsmp_pdev);
> +	return ret;
>  }
>  
>  static void hsmp_pltdrv_remove(struct platform_device *pdev)
>  {
>  	hsmp_misc_deregister();
> +	hsmp_unmap_metric_tbls(hsmp_pdev);
>  }
>  
>  static struct platform_driver amd_hsmp_driver = {
> 

-- 
 i.

