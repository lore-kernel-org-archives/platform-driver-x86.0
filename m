Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9413240B6E7;
	Thu, 11 Jun 2026 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781183893; cv=none; b=LV3s0y51ZESezGaTw9mOriW5HifSmf3+u5htw5kVCcLwFSpOFdFDSHwGZPZ5+JIV81BBsct7iMJ17QZxzCqcYyVPoofOoSdS52s2Zm3sjy6ckZw96xzo7YFHXViHGszADgqA9xwt62lZJyVRxlJY/iPde8pf6inVO+B0LuGdzuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781183893; c=relaxed/simple;
	bh=7BXYHw2xsIswVDnm3EjqgvqM74MYN7k5I3F/V27PUlo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Xyq7IHctv0PJTnwcHSU61GjtYD6lu++XUbyeQa4FE999dekH4jxCRCAwF7NzK2oZnCs+KlusSYAXMZ7CsYsOmnNcN9M8VMum4MMfK3n450ehZzQ2/Awgp4lUU2EhCe4coso/Phjmwa4wIwNka5dFo9wKj6FRHD3nw2QvpKIHCY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2JcGQKY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2JcGQKY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781183889; x=1812719889;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7BXYHw2xsIswVDnm3EjqgvqM74MYN7k5I3F/V27PUlo=;
  b=J2JcGQKYyrKBpjE1ceWm/PtzGQMPftU/nxD1AKsec/d6BphBjDlJs4+s
   lzCFl/Gvc3RInLLfcMBRC3Yz8/LkIEIjbW/U5LkhWl+ifOjiiQFgXQimH
   qPiizU9oNKg6HOlI13vChonGdA26fMWDIaC5m4f8ScszpzmMaLzXhgkYm
   DO/AaGGXo6C2klFOfG4UjJlvlU1Y3KM7GhHcH8PD8UD9g7ZK/PSomRy5o
   iCB5Mx3SOdS4BR+qw7A40aENA7LnyeHb4lhU8kEQTf39YLjS2WG2TAiMG
   mnEchohsUqpvQPuDvYDgd1njjD1knssKI0sdH6hFPMQu7JY4Li9jBNcsP
   Q==;
X-CSE-ConnectionGUID: XJGGibcoTtm0GEKFKQS38g==
X-CSE-MsgGUID: bSbFQ03ZTxu635fqiuxazg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99419955"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="99419955"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 06:18:09 -0700
X-CSE-ConnectionGUID: 3EyczrOvSd640plQnee+FA==
X-CSE-MsgGUID: fcPR58MfSVqrCjr2JyTyUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="243528902"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 06:18:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Jun 2026 16:18:01 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: Re: [PATCH v5 8/8] platform/x86/amd/hsmp: Make metric table read
 locking use guard(mutex)
In-Reply-To: <20260611052919.1095549-9-muralidhara.mk@amd.com>
Message-ID: <f4086725-9d83-31f0-77be-34b8ebceb2eb@linux.intel.com>
References: <20260611052919.1095549-1-muralidhara.mk@amd.com> <20260611052919.1095549-9-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 11 Jun 2026, Muralidhara M K wrote:

> hsmp_metric_tbl_read() refreshes the SMU-side metric table and then
> memcpy_fromio()'s the result. Without serialization, two parallel
> readers can interleave the refresh and the copy and the caller
> observes a torn (mixed old/new) snapshot. Add a per-socket
> metric_tbl_lock so the refresh-and-copy sequence is atomic from
> userspace's point of view.
> 
> Use scoped guard(mutex) so the lock is released on every return
> path without hand-written goto chains, and initialize the mutex
> with devm_mutex_init() so no explicit mutex_destroy() cleanup is
> required.
> 
> Initialize the mutex before devm_ioremap() so the invariant
> "sock->metric_tbl_addr != NULL implies metric_tbl_lock is usable"
> holds on every error exit. Both callers of hsmp_get_tbl_dram_base()
> (init_acpi() and init_platform_device()) intentionally only log a
> failure and continue probing, so initializing the mutex after a
> successful ioremap would leave sock->metric_tbl_addr populated with
> an uninitialized lock, and the next hsmp_metric_tbl_read() would
> take guard(mutex)() on garbage memory. With the order swapped, a
> devm_mutex_init() failure returns early before metric_tbl_addr is
> ever set, and the existing NULL check in hsmp_metric_tbl_read()
> keeps rejecting the read with -ENOMEM as before.
> 
> Reviewed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/hsmp.c | 19 +++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/hsmp.h |  3 +++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index a9dca97568b8..46e8dc7cfb60 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -479,6 +479,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>  	msg.msg_id	= HSMP_GET_METRIC_TABLE;
>  	msg.sock_ind	= sock->sock_ind;
>  
> +	guard(mutex)(&sock->metric_tbl_lock);
>  	ret = hsmp_send_message(&msg);
>  	if (ret)
>  		return ret;
> @@ -495,6 +496,24 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>  	phys_addr_t dram_addr;
>  	int ret;
>  
> +	/*
> +	 * Initialize the per-socket lock before anything that can set
> +	 * sock->metric_tbl_addr to a non-NULL value.  hsmp_metric_tbl_read()
> +	 * gates on sock->metric_tbl_addr being non-NULL and then takes
> +	 * metric_tbl_lock unconditionally; both callers of this function
> +	 * (init_acpi() and init_platform_device()) intentionally only log
> +	 * a failure here and continue probing, so an init order that left
> +	 * metric_tbl_addr populated while devm_mutex_init() failed would
> +	 * leave the read path locking an uninitialized mutex.  Doing the
> +	 * mutex init first preserves the invariant "metric_tbl_addr !=
> +	 * NULL implies the lock is usable" on every error exit.
> +	 */
> +	ret = devm_mutex_init(sock->dev, &sock->metric_tbl_lock);
> +	if (ret) {
> +		dev_err(sock->dev, "Failed to initialize metric table lock\n");
> +		return ret;
> +	}

Sashiko flags a concurrency problem here.

This fundamentally stems from earlier design decisions:

1) hsmp_acpi_probe() is not really doing any concurrency control for 
.is_probed access. I somehow seem to recall I did brought this up earlier 
with somebody else working with this driver earlier but apparently there 
still are not locks or other concurrency control in the probe. 
I don't remember anymore what happened with it back then.

(The problem #1 is not exactly mentioned by sashiko but it's there, 
AFAICT, nothing guarantees only one probe sees !hsmp_pdev->is_probed and 
assigns to ->sock.)

2) ->sock teardown being bound to which ever socket allocated ->sock. 
Leading to use-after-free in devm_ teardown for any remove that runs after 
it.

I think the early teardown of the misc device was the only thing that 
initially prevented use-after-frees. As it kind of worked, I never voiced 
my concerns about how fragile the teardown was. Looking through the 
history now, it seems things got broken after adding hwmon code which does 
use devm and calls hsmp_send_message(). As a result, removing this driver 
is currently broken. This patch adds to the problem.


I don't think is_probed is good solution here but the release of ->sock
should be properly reference counted and that might be reusable for the 
alloc side.

>  	msg.sock_ind	= sock_ind;
>  	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
>  	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index e7f051475728..f7b1cbf19932 100644
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
> +	/* Serializes concurrent metric table refreshes from the sysfs path */
> +	struct mutex metric_tbl_lock;
>  	void __iomem *virt_base_addr;
>  	struct semaphore hsmp_sem;
>  	char name[HSMP_ATTR_GRP_NAME_SIZE];
> 

-- 
 i.

