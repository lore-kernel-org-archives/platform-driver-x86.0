Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FFD3F4852;
	Mon,  6 Jul 2026 11:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783338679; cv=none; b=W3/mzkRzC451Pk3VRdo62lgI6pfdp7Ac3ZflA2aO/P0bvLXMQyO2BSLk3WdgObtsG2zo+y+6nOERXuYbOY+dFOU9dfhodAqHbyOzNWDwgrQi2sqw4VNJdcmaB8AaZXGX1wm2Hkjcnj/g6M0yEuNcOsW8JhVAT7g9iKxOUPRefIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783338679; c=relaxed/simple;
	bh=szsn/dWlGwKLGbDcBuNq1olOidjOEOPFItqfP2D66Ug=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ET77EgneTBpQpQ8+Pdq9iSZwoEFZQEMLGAHfqANHxnT7MYVDWmMLlhnVqpdbxFLcSjh2bnv1SH7VrJtXUw4WddCqNSxAyxn2yrW8tKT6v7mN/IIHaL7oqCZprsSK4RgEnmuPCovYqA4e5GG8BYt2FZ2r9y9q5TiMD5vc/w+lREs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwYEwv4J; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwYEwv4J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783338677; x=1814874677;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=szsn/dWlGwKLGbDcBuNq1olOidjOEOPFItqfP2D66Ug=;
  b=NwYEwv4J4Vo77et20HRy55fKp2xzZbjAw4R2LPbsp/j6BtHdeNx4RZaH
   tmDKAPYPqpj7hH05OhEidedPhip+KutWodRYsqbGyOb9Nkzz4VTVwEQ2J
   ow0+N0y2PHDDsPJXVSs+93y9DkzFgqft5HfQUw5T7Rviu7QISQkXdxI47
   E8hEbFzUZxGq54aBFiaqHKmjE39vamfLykshp8b0ZpAS0wjyGbo4Areaa
   bKvHprb1Ei4dl8camRYZmIzgBJSXMNIqdtxSkB2sXXO7VOKHD7+RRJsNH
   l9bap/m8N4SY0908h+p1KFEJXANwWy7u9gfGl13NQhdBL7IMlxCfnfd7w
   A==;
X-CSE-ConnectionGUID: 6+QKhTL4R5yXyqq0zi2liQ==
X-CSE-MsgGUID: 4sZZuZNfSlmLd9ZF/+UbnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="109514102"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="109514102"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 04:51:15 -0700
X-CSE-ConnectionGUID: JgXIHjGGRsOl6wrd8Iet5A==
X-CSE-MsgGUID: XRSY+wDKQb6N3ZrSGoOlNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="278047396"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.95])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 04:51:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 6 Jul 2026 14:51:10 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: muthusamy.ramalingam@amd.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/7] platform/x86/amd/hsmp: Add explicit metric DRAM
 mapping and per-socket mutexes
In-Reply-To: <20260625123337.886435-4-muralidhara.mk@amd.com>
Message-ID: <75bbac3d-a43d-2092-2f34-48d4795a0e87@linux.intel.com>
References: <20260625123337.886435-1-muralidhara.mk@amd.com> <20260625123337.886435-4-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Jun 2026, Muralidhara M K wrote:

> Add hsmp_destroy_metric_read_locks(), hsmp_init_metric_read_locks(), and
> switch metric table DRAM from devm_ioremap() to ioremap() so ACPI can
> coordinate teardown.  Embed struct mutex metric_read_lock in each
> hsmp_socket for later serialization of metric table reads.
> 
> Call the new helpers from the platform driver probe and remove paths
> so non-ACPI builds initialize and tear down metric_read_lock consistently
> with the ACPI driver.
> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/hsmp.c | 38 ++++++++++++++++++++++++++--
>  drivers/platform/x86/amd/hsmp/hsmp.h |  5 ++++
>  drivers/platform/x86/amd/hsmp/plat.c | 16 ++++++++++--
>  3 files changed, 55 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 91be0cdb6af1..a96c59fcba0a 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -12,7 +12,11 @@
>  #include <linux/acpi.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/mutex.h>
> +#include <linux/nospec.h>
>  #include <linux/semaphore.h>
> +#include <linux/slab.h>
>  #include <linux/sysfs.h>
>  
>  #include "hsmp.h"
> @@ -410,6 +414,37 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>  }
>  EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
>  
> +void hsmp_init_metric_read_locks(struct hsmp_plat_device *pdev, u16 num_sockets)
> +{
> +	u16 i;
> +
> +	if (!pdev->sock || !num_sockets)
> +		return;
> +
> +	for (i = 0; i < num_sockets; i++)
> +		mutex_init(&pdev->sock[i].metric_read_lock);
> +}
> +EXPORT_SYMBOL_NS_GPL(hsmp_init_metric_read_locks, "AMD_HSMP");
> +
> +void hsmp_destroy_metric_read_locks(struct hsmp_plat_device *pdev, u16 num_sockets)
> +{
> +	u16 i;
> +
> +	if (!pdev->sock || !num_sockets)
> +		return;
> +
> +	for (i = 0; i < num_sockets; i++) {
> +		struct hsmp_socket *s = &pdev->sock[i];
> +
> +		if (s->metric_tbl_addr) {
> +			iounmap(s->metric_tbl_addr);
> +			s->metric_tbl_addr = NULL;
> +		}
> +		mutex_destroy(&s->metric_read_lock);
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(hsmp_destroy_metric_read_locks, "AMD_HSMP");
> +
>  int hsmp_get_tbl_dram_base(u16 sock_ind)
>  {
>  	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
> @@ -434,8 +469,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
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
> index 0509a442eaae..91bc21232646 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -15,6 +15,7 @@
>  #include <linux/hwmon.h>
>  #include <linux/kconfig.h>
>  #include <linux/miscdevice.h>
> +#include <linux/mutex.h>
>  #include <linux/pci.h>
>  #include <linux/semaphore.h>
>  #include <linux/sysfs.h>
> @@ -41,6 +42,8 @@ struct hsmp_socket {
>  	struct bin_attribute hsmp_attr;
>  	struct hsmp_mbaddr_info mbinfo;
>  	void __iomem *metric_tbl_addr;
> +	/* Protects metric table snapshot reads for this socket */
> +	struct mutex metric_read_lock;

After applying all the patches in your series (in this series only), I 
only see this:

~/linux/platform/drivers/platform/x86/amd/hsmp$ git grep -w metric_read_lock
hsmp.c:         mutex_init(&pdev->sock[i].metric_read_lock);
hsmp.c:         mutex_destroy(&s->metric_read_lock);
hsmp.h: struct mutex metric_read_lock;

Is this lock ever even taken???

--
 i.

>  	void __iomem *virt_base_addr;
>  	struct semaphore hsmp_sem;
>  	char name[HSMP_ATTR_GRP_NAME_SIZE];
> @@ -63,7 +66,9 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
>  void hsmp_misc_deregister(void);
>  int hsmp_misc_register(struct device *dev);
>  int hsmp_get_tbl_dram_base(u16 sock_ind);
> +void hsmp_init_metric_read_locks(struct hsmp_plat_device *pdev, u16 num_sockets);
>  ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
> +void hsmp_destroy_metric_read_locks(struct hsmp_plat_device *pdev, u16 num_sockets);
>  struct hsmp_plat_device *get_hsmp_pdev(void);
>  #if IS_ENABLED(CONFIG_HWMON)
>  int hsmp_create_sensor(struct device *dev, u16 sock_ind);
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index e07f68575055..685f2d2c574b 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -211,25 +211,37 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  	if (!hsmp_pdev->sock)
>  		return -ENOMEM;
>  
> +	hsmp_init_metric_read_locks(hsmp_pdev, hsmp_pdev->num_sockets);
> +
>  	ret = init_platform_device(&pdev->dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> -		return ret;
> +		goto err_destroy_locks;
>  	}
>  
>  	ret = hsmp_misc_register(&pdev->dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to register misc device\n");
> -		return ret;
> +		goto err_destroy_locks;
>  	}
>  
>  	dev_dbg(&pdev->dev, "AMD HSMP is probed successfully\n");
>  	return 0;
> +
> +err_destroy_locks:
> +	/*
> +	 * init_platform_device() may have ioremap()ed metric tables before
> +	 * failing.  hsmp_destroy_metric_read_locks() unmaps them and tears
> +	 * down the per-socket mutexes; the socket array itself is devm-managed.
> +	 */
> +	hsmp_destroy_metric_read_locks(hsmp_pdev, hsmp_pdev->num_sockets);
> +	return ret;
>  }
>  
>  static void hsmp_pltdrv_remove(struct platform_device *pdev)
>  {
>  	hsmp_misc_deregister();
> +	hsmp_destroy_metric_read_locks(hsmp_pdev, hsmp_pdev->num_sockets);
>  }
>  
>  static struct platform_driver amd_hsmp_driver = {
> 

