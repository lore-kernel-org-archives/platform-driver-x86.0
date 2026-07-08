Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4950C424660;
	Wed,  8 Jul 2026 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505850; cv=none; b=LbWo2WC+5Wi0vQ1s3jcWo+Xye2GUWllWgOOB7HFLaY+kDJOeIGP2o8d65BnJ3hQeJfxFQZPT9q+LnvdEeFuc9ROzxmPLZSox+GmLzebdiRbxOr8mEqBwrJiTo+e22Ec+KhJc7y0bL83G7GjK/NNdJRJhyRY1ueEc+eBSGIbEzow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505850; c=relaxed/simple;
	bh=z+fJlh5UrXzY/pW/XnlyhfBeYFddzjTX6YmG4k/I9fs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qucsKHvm6zh5Eq54hHIP3QZkuIoT9DG7APh469eDBL4RR7QXg3Q1NM/6vS4zEHYbUae6PBz19c9wQbL5wDN+qQ7G2XB/40dp3qNP+fHlERcot3fop7SlPScNGFvgQo4JQdWsoJrNm3z3+rOiVz6P+SYkuqzx5re1TMrUet1wRH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=musjK1/E; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="musjK1/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783505849; x=1815041849;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=z+fJlh5UrXzY/pW/XnlyhfBeYFddzjTX6YmG4k/I9fs=;
  b=musjK1/ETZhEy/SnoY/WxEjU7CtrmtgbhDWDPtoCY73RI38B+8MA5Jqo
   enZTNRj5IH+56mHKMizIbVLorMWalwFnfvzN3oLmhbRbXO+92qyigtpK/
   yBgZfnp5yGZeas8+DLPp3Svsuu+9G2V7Ua7gcPFoRlqxJENH/v5zJZXVL
   3xbQ+rgqePV6uS/oOKgyA7v9EV5QfR+CBVxgS+5s+pc8yL7raidJINv/t
   7L5YwYuP0kh6LY5FJuuWGWJjeUJqqxJo34JunnYl5cEQdlbGFgUGqH2kx
   l0JIMiepLIKw73nieM+Bat2wzIBPjlXPH0rO2jcJzjq+vcM/iTimd1fxk
   g==;
X-CSE-ConnectionGUID: KCTTYtaaQduPN4EZPxuQBg==
X-CSE-MsgGUID: xlOPMyUsSHWii6wVo9fBcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83276398"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83276398"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 03:17:28 -0700
X-CSE-ConnectionGUID: ZwxbmL06Qc2kUBJWLmDfOA==
X-CSE-MsgGUID: XWds02OXRKCDM3pqaExstQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="252511542"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.169])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 03:17:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 8 Jul 2026 13:17:22 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/6] platform/x86/amd/hsmp: Map the metric table with
 ioremap() and unmap it explicitly
In-Reply-To: <20260708042405.3758294-3-muralidhara.mk@amd.com>
Message-ID: <46ccc6c2-f3d7-abb6-a6e2-3a74b48a9cae@linux.intel.com>
References: <20260708042405.3758294-1-muralidhara.mk@amd.com> <20260708042405.3758294-3-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Jul 2026, Muralidhara M K wrote:

> The metric table DRAM region is mapped with devm_ioremap(), tying its
> lifetime to the socket device. An upcoming change lets the ACPI front-end
> share the socket array across sockets and coordinate its own teardown, so
> the mapping can no longer be pinned to a single per-socket devres scope.
> 
> Switch hsmp_get_tbl_dram_base() to plain ioremap() and add
> hsmp_unmap_metric_tbls(), which drops every socket's metric_tbl_addr
> mapping. On the platform driver register it with devm_add_action_or_reset()
> so the mapping is released on both remove and probe failure;

I feel the explanation is quite basic level description of devres 
functionality. I'd say something like this instead:

The unmapping for all sockets as whole is still devres managed using 
devm_add_action_or_reset().

> the socket array itself stays devm-managed.

devres managed is probably the better term in textual form. "devm" is C 
codish way to say it in a short way.
 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/hsmp.c | 19 +++++++++++++++++--
>  drivers/platform/x86/amd/hsmp/hsmp.h |  1 +
>  drivers/platform/x86/amd/hsmp/plat.c | 14 ++++++++++++++
>  3 files changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 1a87931136fd..4586d86f72a3 100644
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
> @@ -414,6 +415,21 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>  }
>  EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
>  
> +void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev)
> +{
> +	u16 i;
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
> @@ -438,8 +454,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
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
> index e07f68575055..e7ee6e701e5a 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -201,6 +201,16 @@ static int init_platform_device(struct device *dev)
>  	return 0;
>  }
>  
> +/*
> + * The metric tables are mapped with ioremap() rather than devm, so release
> + * them explicitly. Registered as a devres action so it also runs on a probe
> + * failure after init_platform_device() has mapped some of them.

Please put "Registered..." into own paragraph. It's sort of different 
thing it's talking about that the first sentence, and you'll be adding to 
the first paragraph in the other patch as well.

/*
 * Paragraph 1.
 *
 * Paragraph 2.

> + */
> +static void hsmp_pltdrv_release(void *data)
> +{
> +	hsmp_unmap_metric_tbls(hsmp_pdev);
> +}
> +
>  static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  {
>  	int ret;
> @@ -211,6 +221,10 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  	if (!hsmp_pdev->sock)
>  		return -ENOMEM;
>  
> +	ret = devm_add_action_or_reset(&pdev->dev, hsmp_pltdrv_release, NULL);
> +	if (ret)
> +		return ret;
> +
>  	ret = init_platform_device(&pdev->dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> 

-- 
 i.

