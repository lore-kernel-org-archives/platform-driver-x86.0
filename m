Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832243FF88C;
	Wed, 10 Jun 2026 11:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089667; cv=none; b=MWLA1jEPeL9nG5N8GMX9uOLIs9PvzNg2nGs83yrcexKHi3n5uCRP2xravoATC1MPxtB69AoyxikVU0SId6ff+tPhuUiWzAmkwl1pQZclldlA1RdIr5davZmATfXjvIyZxkxX2tYvk+kdSDjyIZ1i9yxbpc/scDPK3FFacHXg9VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089667; c=relaxed/simple;
	bh=LBwRND65Ok12QnQMcFVVAvEpz+ym1EWd1ubHjxjm4c0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=agw/G+ARV8L2TQ1nntN41WqcJ8iEGpOjmaYXTGbxTua3EI9H8tbrVrYtC4cUOZNY/1vkNUwbyyiFsVmVoRR6IVaEEufUPFjSkTTBAu1b3BK/Z6JJdziXnxW4JTlGJGqwq8fcagZwjc2QvVOvCU9NsZG7kcsDEhh4s878FAzkdsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCa+m5jL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCa+m5jL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781089661; x=1812625661;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LBwRND65Ok12QnQMcFVVAvEpz+ym1EWd1ubHjxjm4c0=;
  b=kCa+m5jLjm276cMvurs28VaEC6HC0nqEo2+3cEWQKsdQ5C9Hh0stdaJW
   Y33b2SJPprGpwjs408EqNVDHX7omkI29ShmzASluO9rs/6LtF43SLXiym
   1nK7M+cplVbUJ2Lf4Wjkkl26sOgWELn8pf4Pcb+SkiCyFh3DoPKHgKIOP
   9tvHb6LDRZ4rGPRwGFod+MDNGBvdaA2kUCYOElipcXBjNtHpmz53n9p4H
   iILqhH/F5pT1RMfOg2UkLZdamo/Y2ZreZvSlsJesPSWUS8eJRTrh0t4dD
   yZ6tCNnaNx1Zgo3SCkmHNQ9LAjR/NNlCp0h1thmARtv+517W99Go3tge8
   g==;
X-CSE-ConnectionGUID: ozFs8+BZTJqudmK1Y4+spw==
X-CSE-MsgGUID: Xm8PZYwrTamrJqty0UsYuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80894506"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="80894506"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:07:40 -0700
X-CSE-ConnectionGUID: YuUoSpmlSAOe/0z05+Mr2g==
X-CSE-MsgGUID: EQ+9ZvePSXm1c59OGlw9lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="251229392"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:07:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jun 2026 14:07:34 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: Re: [PATCH v4 7/7] platform/x86/amd/hsmp: Make metric table read
 locking use guard(mutex)
In-Reply-To: <20260528093954.2461272-8-muralidhara.mk@amd.com>
Message-ID: <dcba6372-7b4f-c630-c270-4a957c15b31f@linux.intel.com>
References: <20260528093954.2461272-1-muralidhara.mk@amd.com> <20260528093954.2461272-8-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 May 2026, Muralidhara M K wrote:

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
> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/hsmp.c | 20 ++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/hsmp.h |  3 +++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 67f0074bb532..fda57225939c 100644
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
> +
>  	msg.sock_ind	= sock_ind;
>  	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
>  	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
> @@ -524,6 +543,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>  		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>  		return -ENOMEM;
>  	}
> +
>  	return 0;

A spurious change.

>  }
>  EXPORT_SYMBOL_NS_GPL(hsmp_get_tbl_dram_base, "AMD_HSMP");
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

