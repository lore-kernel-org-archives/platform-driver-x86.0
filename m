Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6113F8890;
	Tue,  7 Jul 2026 11:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783424444; cv=none; b=lZJ8oEXoUUIFG2cCVmGahdhGsjaA5E58VUIllAD2owee5IpyS78qS56dg5tr/jb96SgUsGMSrqZQnrZFHMQ4HKY0kjZYWh8TKuVCcUMillGYIgP8w1fhNz8LDCxXg8q0DE8jx/3ukcHkSJNo4zAIWMKSuY3rUupDQ6nZjzB7Mv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783424444; c=relaxed/simple;
	bh=ApGVzGMk+orgczzQ5w5g4w/ihiE/210jZKp3hCbQMlk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MlErWOtFbhoXcCMKHIOlIEwHqvGRbkfe4Ly91TGFkuzBfZZNpcSLHVZQgNVPpNTb7ktq3qagrw3CB7KT5EFkkzoiOWI7+jdwWALFx7Y1tURalmkzH6PhVqGdkHt1GBZjKdtrrjpUnQL6hqVh3t3yXOd8E1TXE6l2BYy9H+ATs10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FezlFXPF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FezlFXPF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783424443; x=1814960443;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ApGVzGMk+orgczzQ5w5g4w/ihiE/210jZKp3hCbQMlk=;
  b=FezlFXPFUSlG3AFF3pcdMP2C1AuYLtF7+48++YxjzVyXW8iYtmoypg8q
   M/+D31FswF7rTNkvNLIfRsCpyQhYdQl5rPK/NiAk+BoWzORN3jT3nUNrM
   PB5PLbp4Y+QN8V81otDJBahxMx/vFvVvpFUmcpzzmtvUsjnOC2KMhUX51
   JYU/FuUDRnAq+Y9KJtzV5LzsdYuDsW6jMAjYdp4iDz5vTHXTOTUlzL4c4
   ji13RuFddgh77Tu+cr8fc74qEjHwoUZalLhQpttbwBk/FIIVCKfvzbpUV
   BSsGh7MLzaO6m1qyxdzp2YVWfd90KOZWZZ42QrsXatnFkY7guIEz0ig/n
   w==;
X-CSE-ConnectionGUID: yiKI5B6NRsGmEFzmtyiWYQ==
X-CSE-MsgGUID: 42Xf60htQ4GJjfS0KxyMPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="84188658"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84188658"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 04:40:42 -0700
X-CSE-ConnectionGUID: US8UbAL/TdC9d4vD5pjl3A==
X-CSE-MsgGUID: 8DkZlnoPQ2OLZm/1DVEcXw==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 04:40:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jul 2026 14:40:36 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    muthusamy.ramalingam@amd.com
Subject: Re: [PATCH v3 1/5] platform/x86/amd/hsmp: Serialize ACPI HSMP
 is_probed with a probe mutex
In-Reply-To: <20260707051604.3381713-1-muralidhara.mk@amd.com>
Message-ID: <e75b4aa6-4f1c-9561-ea6a-186c723619a7@linux.intel.com>
References: <20260707051604.3381713-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Jul 2026, Muralidhara M K wrote:

> Add hsmp_acpi_probe_mutex and hold it across ACPI probe, remove, and
> init_acpi() so concurrent platform probes cannot race the global is_probed
> handshake or the one-time socket allocation.  Use lockdep_assert_held() in
> init_acpi() to catch incorrect locking under lockdep.
> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/acpi.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 72f68cef1297..206eb7897b61 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -18,8 +18,11 @@
>  #include <linux/device.h>
>  #include <linux/dev_printk.h>
>  #include <linux/ioport.h>
> +#include <linux/cleanup.h>
> +#include <linux/lockdep.h>
>  #include <linux/kstrtox.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/string.h>
>  #include <linux/sysfs.h>
> @@ -39,6 +42,8 @@
>  
>  static struct hsmp_plat_device *hsmp_pdev;
>  
> +static DEFINE_MUTEX(hsmp_acpi_probe_mutex);
> +
>  struct hsmp_sys_attr {
>  	struct device_attribute dattr;
>  	u32 msg_id;
> @@ -482,11 +487,17 @@ static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_att
>  	return len;
>  }
>  
> +/**
> + * init_acpi() - Parse ACPI mailbox resources for one socket and validate HSMP.
> + * @dev: ACPI companion device for this socket.
> + */
>  static int init_acpi(struct device *dev)
>  {
>  	u16 sock_ind;
>  	int ret;
>  
> +	lockdep_assert_held(&hsmp_acpi_probe_mutex);
> +
>  	ret = hsmp_get_uid(dev, &sock_ind);
>  	if (ret)
>  		return ret;
> @@ -607,6 +618,8 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  	if (!hsmp_pdev)
>  		return -ENOMEM;
>  
> +	guard(mutex)(&hsmp_acpi_probe_mutex);
> +
>  	if (!hsmp_pdev->is_probed) {
>  		hsmp_pdev->num_sockets = topology_max_packages();
>  		if (!hsmp_pdev->num_sockets) {
> @@ -642,6 +655,7 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  
>  static void hsmp_acpi_remove(struct platform_device *pdev)
>  {
> +	mutex_lock(&hsmp_acpi_probe_mutex);

Any particular reason why this too doesn't use guard()?

>  	/*
>  	 * We register only one misc_device even on multi-socket system.
>  	 * So, deregister should happen only once.
> @@ -650,6 +664,7 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
>  		hsmp_misc_deregister();
>  		hsmp_pdev->is_probed = false;
>  	}
> +	mutex_unlock(&hsmp_acpi_probe_mutex);
>  }
>  
>  static struct platform_driver amd_hsmp_driver = {
> 

-- 
 i.

