Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FE9433CA;
	Wed, 15 Jan 2025 14:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736950702; cv=none; b=BQYbbkdvWkd2DMyKYFxW2J6KYt2VNz9jpohRBj/aaOFasJor4UivMOaZk7eidb9juxdbEp8A+Fqj93NL+h1Oa1wkpf9B94iQrXZjZjcjuNPPCEV357aP+DS3lNkaNzfRWyPv+pll0+QOgeSl7SrOLKr2bWWMMmCVyKrZhD0oy08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736950702; c=relaxed/simple;
	bh=8YlkkYt+Of4aiA55Nku/7h18wbeJoSlfGjpKs3bCcrI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LOyiEIa+0RAGNAVTWmr/zKTPINdI2vou6UyG8SCNVE3t5WCdnTbIs4gKzMS4uA6oo9RYxVvXZSMwCVJCOq4F80m3+sdadJhzs5uHvpSW53g3bxVRk1sDPczsyjYtt4CigNFIkRgZWGHb1JvlbgIFc/rFAsYxpU6uACTFNNanGCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvavuChN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvavuChN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736950702; x=1768486702;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8YlkkYt+Of4aiA55Nku/7h18wbeJoSlfGjpKs3bCcrI=;
  b=MvavuChNiJ/H8UGxQuGfhuslTCj3zzOUfpUI9LCvAL4fMnmvyzbeKtcZ
   3k8Rp8UFqqOqhbiZWTDOE5HRb7KWs3UcbNchkrey0P+kTNGiZKGPgKIvK
   7XvnL7k5PGDG9jf79BZDVKawzaDEbIoGMQk4szWNqlu/qKvIgir6h6BtQ
   MK1AnmaWGjPxEs3sfWMJc8GevnVKkKDxfCubd6UYiaN6nmtSu4YqCQ8Xl
   FBznYnxwENzWKn1WENexL+dwckrjQw67lHv20Gjb3i1iJdi1onexxLk/6
   OrO/gEbMHvMgaQmBJlsOkads88f7T8DxbCa+GSZTDqOfrKoltwJ5FhUPr
   w==;
X-CSE-ConnectionGUID: Q52+liJ8QoKd0FK4pQuVcg==
X-CSE-MsgGUID: JGTMKR8vQ26a10o/3vmIyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="59767519"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="59767519"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:18:21 -0800
X-CSE-ConnectionGUID: Vyv06lyDQAejkZ2CB0xSmA==
X-CSE-MsgGUID: Fsal9ytPTG2RGJv8YgcnLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="104988118"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:18:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 15 Jan 2025 16:18:14 +0200 (EET)
To: Ron Li <xiangrongl@nvidia.com>
cc: vadimp@nvidia.com, Hans de Goede <hdegoede@redhat.com>, 
    davthompson@nvidia.com, asmaa@nvidia.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] mlxbf-bootctl: Supports RTC battery status read and
 clear
In-Reply-To: <20250114232724.48492-1-xiangrongl@nvidia.com>
Message-ID: <b16a4f13-7572-0e99-d8bb-d758b019a31a@linux.intel.com>
References: <20250114232724.48492-1-xiangrongl@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi,

In the subject:

Supports -> Support

On Tue, 14 Jan 2025, Ron Li wrote:

> Enable read and clear of the RTC battery low voltage status bit from user space.
> 
> Signed-off-by: Xiangrong Li <xiangrongl@nvidia.com>
> Reviewed-by: David Thompson <davthompson@nvidia.com>
> ---
>  drivers/platform/mellanox/mlxbf-bootctl.c | 20 ++++++++++++++++++++
>  drivers/platform/mellanox/mlxbf-bootctl.h |  5 +++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-bootctl.c b/drivers/platform/mellanox/mlxbf-bootctl.c
> index c5b36837e694..bc31061f779c 100644
> --- a/drivers/platform/mellanox/mlxbf-bootctl.c
> +++ b/drivers/platform/mellanox/mlxbf-bootctl.c
> @@ -91,6 +91,7 @@ static const char * const mlxbf_rsh_log_level[] = {
>  static DEFINE_MUTEX(icm_ops_lock);
>  static DEFINE_MUTEX(os_up_lock);
>  static DEFINE_MUTEX(mfg_ops_lock);
> +static DEFINE_MUTEX(rtc_ops_lock);
>  
>  /*
>   * Objects are stored within the MFG partition per type.
> @@ -489,6 +490,23 @@ static ssize_t large_icm_store(struct device *dev,
>  	return res.a0 ? -EPERM : count;
>  }
>  
> +static ssize_t rtc_battery_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	struct arm_smccc_res res;
> +
> +	mutex_lock(&rtc_ops_lock);
> +	arm_smccc_smc(MLNX_HANDLE_GET_RTC_LOW_BATT, 0, 0, 0, 0,
> +		      0, 0, 0, &res);
> +	mutex_unlock(&rtc_ops_lock);
> +
> +	if (res.a0)
> +		return -EPERM;
> +
> +	return sysfs_emit(buf, "0x%lx\n", res.a1);
> +}
> +
>  static ssize_t os_up_store(struct device *dev,
>  			   struct device_attribute *attr,
>  			   const char *buf, size_t count)
> @@ -906,6 +924,7 @@ static DEVICE_ATTR_RW(sn);
>  static DEVICE_ATTR_RW(uuid);
>  static DEVICE_ATTR_RW(rev);
>  static DEVICE_ATTR_WO(mfg_lock);
> +static DEVICE_ATTR_RO(rtc_battery);
>  
>  static struct attribute *mlxbf_bootctl_attrs[] = {
>  	&dev_attr_post_reset_wdog.attr,
> @@ -925,6 +944,7 @@ static struct attribute *mlxbf_bootctl_attrs[] = {
>  	&dev_attr_uuid.attr,
>  	&dev_attr_rev.attr,
>  	&dev_attr_mfg_lock.attr,
> +	&dev_attr_rtc_battery.attr,
>  	NULL
>  };
>  
> diff --git a/drivers/platform/mellanox/mlxbf-bootctl.h b/drivers/platform/mellanox/mlxbf-bootctl.h
> index 1299750a8661..90bbbdc65879 100644
> --- a/drivers/platform/mellanox/mlxbf-bootctl.h
> +++ b/drivers/platform/mellanox/mlxbf-bootctl.h
> @@ -103,6 +103,11 @@
>   */
>  #define MLNX_HANDLE_OS_UP    0x82000014
>  
> +/*
> + * SMC function ID to get and clear the RTC low voltage bit
> + */
> +#define MLNX_HANDLE_GET_RTC_LOW_BATT   0x82000023
> +
>  /* SMC function IDs for SiP Service queries */
>  #define MLXBF_BOOTCTL_SIP_SVC_CALL_COUNT	0x8200ff00
>  #define MLXBF_BOOTCTL_SIP_SVC_UID		0x8200ff01

This change is missing Documentation/ABI for the new sysfs entry.
Please add the documentation and resubmit as v2.

-- 
 i.

