Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CB7356756;
	Fri, 22 May 2026 10:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779447374; cv=none; b=abBUe/Fwu+MnDKPmPoa6hkvODST69iyBg34uRewW4eNqrjN1AdoMU7ZRIMaOimi+xYHJVeiE2VWwK38ATP3I7HsFXH9+fqP89bi6RbII/F1WS0ygDjsqZQcr41qOZElzJdywFQaJoMtn9aP9eU75JKwsTrPiUzlGiVvqByUXOYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779447374; c=relaxed/simple;
	bh=nyX6I0jfznk2OK89JuajnE4fJk/wXxt75H7jCcIm86I=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NMEUsUrRju2SK2ulB32DD8kkL45jikZcU9o8lTwSNcqajQC4dZhq4xmcWeV5VpOYerIDbYzIRsg79c/HjkvrQZnXYhmaVQIEvwgMmrGINEm5g4Mbao4/J2saEktgZRxxS6+5rC4Dwcgh0a+Ly8Qu3GcjqNtzivV6g65vOoM4jI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBJen+Hi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBJen+Hi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779447372; x=1810983372;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nyX6I0jfznk2OK89JuajnE4fJk/wXxt75H7jCcIm86I=;
  b=lBJen+HitG8AD/HQzSiVvsi4cTUlVh+KPM9y1TdoeIihlLgahA6K/A+7
   KHxRDcFLhZFGVBDGzlTC9f4+U+obr02nsnu8LeyJeIehJNc7t1roma/U9
   zyF187wACBBqg2XJ0/cEm4FUNqgUgOyl3my8DH1ixDDkY73AM8l9qB1BW
   D0iRuLRREofRpUC0QF/f0tfgwI9zuA+8S706I7myle70d6mMYoqFP9+RR
   TG+i1SrwjSsWo+t4ZWSzfFdPsQGmrXTJohHDzhdEZ3G3ODXMZj4ltk4Qq
   Or31fn7Jk4NG5mNcsiGgDemq41rj9sJwOHmCU/lImdjzI064E54UcVmgC
   w==;
X-CSE-ConnectionGUID: iF7vPADwSKOV9B4/QDtSoQ==
X-CSE-MsgGUID: UfOpHZKsRE2i4bTun0pB7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="67900520"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="67900520"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:56:02 -0700
X-CSE-ConnectionGUID: xixkVT/pR1aatRJO4MKK9A==
X-CSE-MsgGUID: I4EJ90tEQsukTMK1A30gjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="240936832"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:56:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 May 2026 13:55:56 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: Re: [PATCH v3 7/7] platform/x86/amd/hsmp: Make metric table read
 locking use guard(mutex)
In-Reply-To: <20260517151211.415627-8-muralidhara.mk@amd.com>
Message-ID: <1af1f3b6-7554-4e15-8ca1-665e821bced9@linux.intel.com>
References: <20260517151211.415627-1-muralidhara.mk@amd.com> <20260517151211.415627-8-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 17 May 2026, Muralidhara M K wrote:

> Add a per-socket mutex (metric_tbl_lock) to serialize concurrent reads
> on the metric table. Without serialization, two simultaneous
> readers could interleave the SMU refresh command and the
> memcpy_fromio(), producing a torn (mixed old/new) snapshot.
> 
> Use scoped guard(mutex) in hsmp_metric_tbl_read() so the lock is
> automatically released on all return paths. Initialize the mutex with
> devm_mutex_init() in hsmp_get_tbl_dram_base() and return an error if
> initialization fails, avoiding manual mutex_destroy() cleanup paths.
> 
> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
> Changes:
> v1->v2: Add lock
> v2->v3: Replace mutex_init to devm_mutex_init call
> 
>  drivers/platform/x86/amd/hsmp/hsmp.c | 8 ++++++++
>  drivers/platform/x86/amd/hsmp/hsmp.h | 3 +++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 3a02d683dea0..2fec897a95be 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -447,6 +447,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>  	msg.msg_id	= HSMP_GET_METRIC_TABLE;
>  	msg.sock_ind	= sock->sock_ind;
>  
> +	guard(mutex)(&sock->metric_tbl_lock);
>  	ret = hsmp_send_message(&msg);
>  	if (ret)
>  		return ret;
> @@ -492,6 +493,13 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>  		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>  		return -ENOMEM;
>  	}
> +
> +	ret = devm_mutex_init(sock->dev, &sock->metric_tbl_lock);
> +	if (ret) {
> +		dev_err(sock->dev, "Failed to initialize metric table lock\n");
> +		return ret;
> +	}

Sashiko notes a potential problem with this failing and that not resulting 
in a probe fail, which leaves the mutex uninitialized.

But the mutex could be initialized earlier to avoid the problem I think.

> +
>  	return 0;
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

