Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6C443D515;
	Mon, 11 May 2026 17:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778520460; cv=none; b=LUCbSHQB8HFZDrf3WKFxcqJ2VZkavVOgk82cFZl6K+VwrkjKR/SuMYAaCxSRQ1u2jxTycDAoBAhukZ0XWwHBu6B8REI8oEnDMjmTKI7KPaMYJz2XP5ScbzBLpW7TI5nZr1PTBQm/7lnSwXsmKOdVkDWc4B26Vo0vqD/euFxILMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778520460; c=relaxed/simple;
	bh=/kzZF/YOifgcQmLU9y0waEdN3TdI6aTk2vWhPLH9RMs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ug7KwwlSWwqwx5ljNFQ7smniUj/tn4YP7/pT6xI9exYgFNvbXeyKDjZkKYYzE3zE3BcmD/NuikuHGOXA5Vv9IEfHt+aop06EbXxWVWJRNGyB5WMgMJgQCAms4oPt2IBysVO7KH0ISkTqOur6hupyu28MdgpIvjZ6wZuI7KERp1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhA0tYHa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhA0tYHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778520459; x=1810056459;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/kzZF/YOifgcQmLU9y0waEdN3TdI6aTk2vWhPLH9RMs=;
  b=HhA0tYHaUwZ8RQ9vvM23JuvIgJ8znYg/OSj3wK/Esfes2L8ii4q9XCCO
   12OXPUb6Eujl3oLW+yfRJLagAFoHPbHfnx6/fFGgDlxkOtu08GT72WrAs
   yoGV9Y3ai76460bJKS8ujKp7Ur/t+CM8Hiy7fNvXTniqCjhs85sSOjXYG
   34+G/kkJMcKTAsrmcr1P1TBKxpjqClpI6QsJCfmqsomkf5lV4m7dRzVEZ
   hUrleGt+KNrLmwhYgpAV8V+VSx9jrAdiOxzOVfDLjdvHlGjGYqN+8LZfs
   3ZEpf8HoRaHftlAgLn2Yp2K3XfAf5qlk2H/wyU55KXdn47NO3zBfuiHEf
   A==;
X-CSE-ConnectionGUID: DcIRx10qQ2idZk3YpJHCIQ==
X-CSE-MsgGUID: J2aDqYXtTy2rnBwg9aFScQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="89721703"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="89721703"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 10:27:38 -0700
X-CSE-ConnectionGUID: TD491S3oTyWaAhMFhkQ+4g==
X-CSE-MsgGUID: YDLRWhI2RNS/cqitxuewKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="242479488"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 10:27:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 May 2026 20:27:31 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    driver-core@lists.linux.dev, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: Re: [PATCH v2 6/7] platform/x86/amd/hsmp: Make metric table read
 locking use guard(mutex)
In-Reply-To: <20260427155129.545327-7-muralidhara.mk@amd.com>
Message-ID: <9e34e44c-d19c-5994-1390-107b4058367c@linux.intel.com>
References: <20260427155129.545327-1-muralidhara.mk@amd.com> <20260427155129.545327-7-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 Apr 2026, Muralidhara M K wrote:

> Add a per-socket mutex (metric_tbl_lock) to serialize concurrent
> reads on the metric table sysfs file.  Without serialization, two
> simultaneous readers could interleave the SMU refresh command and
> the memcpy_fromio(), producing a torn (mixed old/new) snapshot.
> 
> Use the scoped guard(mutex) API from <linux/cleanup.h> so the lock
> is automatically released when hsmp_metric_tbl_read() returns,
> including on error paths.
> 
> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
> Changes v1->v2: New patch
> 
>  drivers/platform/x86/amd/hsmp/hsmp.c | 5 +++++
>  drivers/platform/x86/amd/hsmp/hsmp.h | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index d6e377078182..49e7ed9981e9 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -10,7 +10,9 @@
>  #include <asm/amd/hsmp.h>
>  
>  #include <linux/acpi.h>
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
> +#include <linux/mutex.h>
>  #include <linux/device.h>
>  #include <linux/semaphore.h>
>  #include <linux/sysfs.h>
> @@ -364,6 +366,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>  	msg.msg_id	= HSMP_GET_METRIC_TABLE;
>  	msg.sock_ind	= sock->sock_ind;
>  
> +	guard(mutex)(&sock->metric_tbl_lock);
>  	ret = hsmp_send_message(&msg);
>  	if (ret)
>  		return ret;
> @@ -408,6 +411,8 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>  		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>  		return -ENOMEM;
>  	}
> +
> +	mutex_init(&sock->metric_tbl_lock);

devm_mutex_init() + don't forget to handle errors. (without devm_ you'd 
have to handle mutex_destroy() calls too)

>  	return 0;
>  }
>  EXPORT_SYMBOL_NS_GPL(hsmp_get_tbl_dram_base, "AMD_HSMP");
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index e7f051475728..038678b8ab0e 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -16,6 +16,7 @@
>  #include <linux/kconfig.h>
>  #include <linux/miscdevice.h>
>  #include <linux/pci.h>
> +#include <linux/mutex.h>
>  #include <linux/semaphore.h>
>  #include <linux/sysfs.h>
>  
> @@ -41,6 +42,8 @@ struct hsmp_socket {
>  	struct bin_attribute hsmp_attr;
>  	struct hsmp_mbaddr_info mbinfo;
>  	void __iomem *metric_tbl_addr;
> +	/* Serializes concurrent metric table reads */
> +	struct mutex metric_tbl_lock;
>  	void __iomem *virt_base_addr;
>  	struct semaphore hsmp_sem;
>  	char name[HSMP_ATTR_GRP_NAME_SIZE];
> 

-- 
 i.

