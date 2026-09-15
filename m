Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4946B3FD960;
	Tue, 15 Sep 2026 20:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504708; cv=none; b=m6BrH6bhm6iNUPDeoFvX6SBLHuiGJS4UusQoaJ5bQ7P6QuQh1xiD29+ibc+pZNzRBPRY0D0IyDBysRL7wa/R/wJDwByNmemHJxsWeVePbIq2OtBVZD9oXWCoTQrH+4m8s98+nfm9m21v60YQQOAFr2FYhvybDLw4FAWhqOaxABM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504708; c=relaxed/simple;
	bh=6ONB6ibMbVQ199mUP936jHyXWbFew+w1fG5BpHb3UGY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ro9wdzPcHHr3cuEWpHZM+jwaO2CGOZ8vk6SGTmkrvQsiFkSrkwstXrFbiqip7Ebk+Sw3KQ3hmwe82AQsPw1yG6mnHYH3BUfbUBZzzSC0ViNLDNTaTj3aX1mE/ryr2/xjxw/Nv75qSoq5Iq6iIbbDyb3w1TgpYIOsBErpPDN49IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmUPwzF0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmUPwzF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789504706; x=1821040706;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6ONB6ibMbVQ199mUP936jHyXWbFew+w1fG5BpHb3UGY=;
  b=UmUPwzF0V9a0WzCdwIrk0h5m9h3v08SBrT1r0l094+62tbtZGphq902C
   ZjCl0CcuVth1c+t89h6nR3OnnE/WnfrzFAjyQq08rfdnIFsALbCFrC1J7
   ohiCjfYNQKQQ/jZFj29FZHBoyfwuwtj+rNeadF3WADsqh6bntwp1HY3HG
   TdxEgG+ha+Tqj0w+XhNqqKJLZ4QyI98D5OFcmff9tjoPMtBxdlIdmyQeP
   e7p/sYTsPIJ8Uxewm73IY1WsUKJIdmA6CBRrwkd1cQSczsTu6EDU6K+BN
   F/+o28FwAGGNc4eGUaHnN1S3jSt7Q7+nwITFbXdWoWPhS/GMyJrFzpXyA
   Q==;
X-CSE-ConnectionGUID: DkfHmszKTzmleepO8ZHpJQ==
X-CSE-MsgGUID: EeSNvE4eT6WOk7HyQMCHBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89924170"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89924170"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 13:38:25 -0700
X-CSE-ConnectionGUID: CkDRxUY6R0uslVa2ImoBFg==
X-CSE-MsgGUID: ZlqQhSOyQIWOuKnph306HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276648890"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 13:38:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Sep 2026 23:38:19 +0300 (EEST)
To: busybox11 <busybox11th@gmail.com>, Denis Benato <denis.benato@linux.dev>
cc: Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: asus-armoury: add dGPU disable fallback
 DEVID for ProArt H7606 series
In-Reply-To: <20260810-asus_armoury_dgpu_new_devid-v1-1-0a5c845414e4@gmail.com>
Message-ID: <40f1840a-e3e4-29d3-66b5-a13737224f99@linux.intel.com>
References: <20260810-asus_armoury_dgpu_new_devid-v1-1-0a5c845414e4@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 Aug 2026, busybox11 via B4 Relay wrote:

> From: busybox11 <busybox11th@gmail.com>
> 
> Newer ASUS ProArt laptops (e.g. H7606 series) implement dGPU power
> control on WMI DEVID 0x00090120 instead of the usual 0x00090020.
> The default DEVID returns 0xFFFFFFFE on these models, so the
> dgpu_disable firmware attribute is never created and the dGPU cannot
> be re-enabled from Linux at all.
> 
> Add a fallback probe for device ID 0x00090120 following the same
> approach as the gpu_mux_dev_id probe.
> 
> Details for 0x00090120 (confirmed on H7606W using direct WMNB calls
> and inspecting the DSDT DEVS handler):
>   - Reading DSTS returns 0x00010001 when the dGPU is off (CUMA=1),
> 	or 0x00010000 when it's on.
>   - Writing DEVS: 0 enables the dGPU (calls PG00._ON() + Notifies
> 	PEGP, Device Check), and 1 disables or ejects it.
> 
> This behavior matches the dgpu_disable attribute (1 = disabled).
> 
> Signed-off-by: busybox11 <busybox11th@gmail.com>

Unfortunately, we cannot accept anonymous or pseudonym signed 
contributions so please sign off with your real name. For more 
information about signing of patches, please see:

Documentation/process/submitting-patches.rst

> ---
>  drivers/platform/x86/asus-armoury.c        | 32 +++++++++++++++++++++++++-----
>  include/linux/platform_data/x86/asus-wmi.h |  3 +++
>  2 files changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 495dc1e31..f39b52451 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -93,6 +93,7 @@ struct asus_armoury_priv {
>  
>  	u32 mini_led_dev_id;
>  	u32 gpu_mux_dev_id;
> +	u32 dgpu_disable_dev_id;
>  };
>  
>  static struct asus_armoury_priv asus_armoury = {
> @@ -452,8 +453,8 @@ static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
>  	if (err)
>  		return err;
>  
> -	if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU)) {
> -		err = armoury_get_devstate(NULL, &result, ASUS_WMI_DEVID_DGPU);
> +	if (asus_armoury.dgpu_disable_dev_id) {
> +		err = armoury_get_devstate(NULL, &result, asus_armoury.dgpu_disable_dev_id);
>  		if (err)
>  			return err;
>  		if (result && !optimus) {
> @@ -507,7 +508,8 @@ static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
>  	}
>  
>  	scoped_guard(mutex, &asus_armoury.egpu_mutex) {
> -		err = armoury_set_devstate(attr, disable ? 1 : 0, NULL, ASUS_WMI_DEVID_DGPU);
> +		err = armoury_set_devstate(attr, disable ? 1 : 0, NULL,
> +					   asus_armoury.dgpu_disable_dev_id);
>  		if (err)
>  			return err;
>  	}
> @@ -516,7 +518,7 @@ static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
>  
>  	return count;
>  }
> -ASUS_WMI_SHOW_INT(dgpu_disable_current_value, ASUS_WMI_DEVID_DGPU);
> +ASUS_WMI_SHOW_INT(dgpu_disable_current_value, asus_armoury.dgpu_disable_dev_id);
>  ASUS_ATTR_GROUP_BOOL(dgpu_disable, "dgpu_disable", "Disable the dGPU");
>  
>  /* Values map for eGPU activation requests. */
> @@ -790,7 +792,6 @@ ASUS_ATTR_GROUP_INT_VALUE_ONLY_RO(nv_base_tgp, ATTR_NV_BASE_TGP, ASUS_WMI_DEVID_
>  static const struct asus_attr_group armoury_attr_groups[] = {
>  	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
>  	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
> -	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
>  	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
>  
>  	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
> @@ -934,6 +935,21 @@ static int asus_fw_attr_add(void)
>  		}
>  	}
>  
> +	asus_armoury.dgpu_disable_dev_id = 0;
> +	if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU))
> +		asus_armoury.dgpu_disable_dev_id = ASUS_WMI_DEVID_DGPU;
> +	else if (armoury_has_devstate(ASUS_WMI_DEVID_GPU_MODE))
> +		asus_armoury.dgpu_disable_dev_id = ASUS_WMI_DEVID_GPU_MODE;
> +
> +	if (asus_armoury.dgpu_disable_dev_id) {

Now I started to wonder why are we doing it like this and not using 
.is_visible?

This question applies to the similar, existing cases as well.

Denis?


-- 
 i.

> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> +					 &dgpu_disable_attr_group);
> +		if (err) {
> +			pr_err("Failed to create sysfs-group for dgpu_disable\n");
> +			goto err_remove_gpu_mux_group;
> +		}
> +	}
> +
>  	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
>  		if (!armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
>  			continue;
> @@ -971,6 +987,9 @@ static int asus_fw_attr_add(void)
>  			sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
>  					   armoury_attr_groups[i].attr_group);
>  	}
> +	if (asus_armoury.dgpu_disable_dev_id)
> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &dgpu_disable_attr_group);
> +err_remove_gpu_mux_group:
>  	if (asus_armoury.gpu_mux_dev_id)
>  		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
>  err_remove_mini_led_group:
> @@ -1143,6 +1162,9 @@ static void __exit asus_fw_exit(void)
>  					   armoury_attr_groups[i].attr_group);
>  	}
>  
> +	if (asus_armoury.dgpu_disable_dev_id)
> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &dgpu_disable_attr_group);
> +
>  	if (asus_armoury.gpu_mux_dev_id)
>  		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
>  
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index c29962d5b..faeae70f4 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -138,6 +138,9 @@
>  /* dgpu on/off */
>  #define ASUS_WMI_DEVID_DGPU		0x00090020
>  
> +/* dgpu power/mode switch, dgpu_disable fallback on some ProArt */
> +#define ASUS_WMI_DEVID_GPU_MODE		0x00090120
> +
>  #define ASUS_WMI_DEVID_APU_MEM		0x000600C1
>  
>  #define ASUS_WMI_DEVID_DGPU_BASE_TGP	0x00120099
> 
> ---
> base-commit: 3f008280327ba5ad132965abab0c7846283cef0c
> change-id: 20260810-asus_armoury_dgpu_new_devid-168aa5da290e
> 
> Best regards,
> --  
> busybox11 <busybox11th@gmail.com>
> 
> 
