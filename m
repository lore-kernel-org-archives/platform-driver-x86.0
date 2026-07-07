Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC6A380FFB;
	Tue,  7 Jul 2026 11:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783424685; cv=none; b=WmEp26+Xyj6/9198arC6bx/RyJi5dCBGxJtXYmDUzOn3SBJafaxgELmjIITAuqROnh2Dh6RmzHyVl4HgGyFi+B372JTt+24eYLOgDhVJvKts6S1l4yO2PP9GEtDP0fpyGWvnzLEyTXfxexZc/HWsc/lRiibCcnxm7fk6tMFFGoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783424685; c=relaxed/simple;
	bh=h10Iq3wOPd8qPJWHKrzUDOvC/4E5LX7wrhaHy5LOiqc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EYSVqh6wYQZCmkHgZTN3YItKuHYktGE7+qoEw8HE40CpiVdhsNxTd8XbsAxxIs0jxMlj4yBTBm2F5L+OyN8ZGZAs7WLM/nARmSylWgx+ZkILBskNKAyl0URBz4cuuoOJcDmDSS1MYEX9YAAhyKx6oLc3KiEyxW6Mdp4+zeS0CEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nz2rb33a; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nz2rb33a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783424683; x=1814960683;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=h10Iq3wOPd8qPJWHKrzUDOvC/4E5LX7wrhaHy5LOiqc=;
  b=nz2rb33aeU7/uvwgazjpYSr1q7PMMk4RUROn165JeExYO3irRMAMDhAH
   v/xxNx/96L0avk+5nD8wWI5SVW+oR7EjMTI0g08veFiXQAlJSrF1LQGYq
   PdNAvag1Tg7vpgx4J3PUcLLuDnlwjUWXZ6ipq2EQOzCy5YpQcVvZzWpRb
   FpTTZqg0llr5mjOQfbYKHIaN4UbqcISe9XWzTv1owgfJzlD2kJRTWCWtf
   9dO95xkvzPnGyObk1rHruUwX3UwBD/hg+SieCGGNWODAOR4k9emnUbfVR
   fhwnxYXzj/3wdKbPTnRn3j7RxALu0D0rWuz8w0DVOGc3+tl9gZXXB4gy+
   w==;
X-CSE-ConnectionGUID: U8a/WAJ4QmSA/+LaVzoGZg==
X-CSE-MsgGUID: wQkQWo4TRhih3MBfbFyjWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="84188916"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84188916"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 04:44:43 -0700
X-CSE-ConnectionGUID: gXCjC1O3TFGQ75AkbPDBkw==
X-CSE-MsgGUID: OQVT0sSdSDqwMcWMFIGvNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="257859965"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 04:44:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jul 2026 14:44:38 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    muthusamy.ramalingam@amd.com
Subject: Re: [PATCH v3 2/5] platform/x86/amd/hsmp: Map the metric table with
 ioremap() and unmap it explicitly
In-Reply-To: <20260707051630.3381945-1-muralidhara.mk@amd.com>
Message-ID: <d765e212-cd56-8400-5e10-6962208b3a57@linux.intel.com>
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
> +	 * the socket array itself is devm-managed.

One additional thought... While you cannot use devm for the ioremap(), you 
probably could still use devm_add_action_or_reset() to make the 
hsmp_unmap_metric_tbls() call using devres.

... And the same thing with the cleanup added in patch 3.

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

