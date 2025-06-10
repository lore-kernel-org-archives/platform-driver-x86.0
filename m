Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341C41DDA18
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2025 16:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571280; cv=none; b=IqUdj0Sg7OffA86Tmu1Vz7VXDt27zU+cSour31omOM/zJV7HE5pBAzfVqyVaCH6gpwdySXS/sVUKiZ/F11X2krn9hg/mxlIgOqVmvVMNq4zyp3o0Kq01SGYbX8oeQ5EtFR+5/UKV2lwTzYsWSXbtr5v1e5NXI5oPQ73J8aPwBGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571280; c=relaxed/simple;
	bh=PN9Di4g51rrp+W4QtJMzGIs9srsqh/Bar4/udVaovV8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=stNFX68MZcliNsUQEqu7GFfCQ5Md+LQqlX1lSK9aWXebrKAZAxJt0NWtkVR61quuyhD8o8MuKw55DYDMBzWs0rZ8HQINVHpOTba0rL9mdEvAOvR3fakHmm4TIvNpqvd/bOGQRZqBoEn7oGDU3A1Fr1dI2pOVyWd3wFO0tIOJABs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1ChSpkQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1ChSpkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749571279; x=1781107279;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PN9Di4g51rrp+W4QtJMzGIs9srsqh/Bar4/udVaovV8=;
  b=G1ChSpkQuFwhFYi7cHrFPnJQxqkWAq7qkl1ICleKuWXrhPPRdtzEOpyD
   I2/eedfsDVKHm+KyJp8QSI3RdjhvogvVgCYYGad9OXYyrXRAfKzlF0+0B
   hARRtDA0/CGP7A6r5udCsdBYSVkwF6P9RwfL+JDqo35aoXMNMasdlqI/o
   FjOhXmfUHTp7IBmauy3rzE5sj+9JDe63Ec6gGjqtCzM0ak8XXK/VDOkYR
   s7+ahmJg6DCuIS+nmhM9pc7VdssELCTTqwKiqhX4jo9DbnWQh98aRsOMx
   vxsQFpMDVIyom80iMjiMGrnXNV19JzBsPXaSMsPJSxV9pKZ5gQpniao60
   g==;
X-CSE-ConnectionGUID: 7430hvY8QqO/2mb1YnjdjA==
X-CSE-MsgGUID: BjKWK1ZQTCKtObl/uCWGBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="39308975"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="39308975"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 09:01:19 -0700
X-CSE-ConnectionGUID: iUU+imdxTjCz3roScy1jsw==
X-CSE-MsgGUID: d+INqiEAQZiaIhD3kqAt4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="151760016"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 09:01:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 10 Jun 2025 19:01:12 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
Subject: Re: [PATCH 05/10] platform/x86/amd/pmf: Add helper to verify BIOS
 input notifications are enable/disable
In-Reply-To: <20250509072654.713629-6-Shyam-sundar.S-k@amd.com>
Message-ID: <6f77b3ff-959a-a4b6-a7b9-9360f09ac36c@linux.intel.com>
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com> <20250509072654.713629-6-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 May 2025, Shyam Sundar S K wrote:

> Implement a helper function to check if BIOS input notifications are
> enabled or disabled.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/acpi.c | 7 +++++++
>  drivers/platform/x86/amd/pmf/pmf.h  | 2 ++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index f75f7ecd8cd9..ab63582c9d0b 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -161,6 +161,11 @@ int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
>  	return !!(pdev->supported_func & BIT(index - 1));
>  }
>  
> +int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev)
> +{
> +	return !!(pdev->notifications & GENMASK(16, 7));

Name that GENMASK() although I wonder if custom_bios_inputs_v1 you 
introduced later on should be reused here to do this check. It would keep 
the code in cync

> +}
> +
>  int apts_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
>  				       struct amd_pmf_apts_granular_output *data, u32 apts_idx)
>  {
> @@ -385,6 +390,8 @@ static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
>  
>  	pdev->pmf_if_version = output.version;
>  
> +	pdev->notifications =  output.notification_mask;

Extra space

> +
>  	return 0;
>  }
>  
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 27458a7c221b..2deae43aca63 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -377,6 +377,7 @@ struct amd_pmf_dev {
>  	struct resource *res;
>  	struct apmf_sbios_req_v2 req; /* To get custom bios pending request */
>  	struct mutex cb_mutex;
> +	u32 notifications;
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> @@ -799,6 +800,7 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
>  int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
>  int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer);
>  int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
> +int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev);
>  
>  /* SPS Layer */
>  int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
> 

-- 
 i.

