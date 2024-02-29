Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1201CD07
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 17:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709227491; cv=none; b=DlWZRKUlvilXJeLvdBT8a53cxeOijcCguidrnVLRr2Y9GjV+KCgphistzGdmFjSEQdiAiI4JC2PeMbcJNjCy1RvxRe+UdX1bIbuISE5gNyi7OLReGDY6y50RUqhb3k3gKjA08SM6gnGhzI0AvGwzAvq9pW/PFo/1GqgwVRjUsrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709227491; c=relaxed/simple;
	bh=nNsF5dAYwRbtdi2hF7YRt48qoAzeAc55Yspkb8XSptY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4p8k1iMkSZDL1Z/oldDAxgPbhUu641nD22sKaHhGy3MxfZfE8rljut+Q+Zdd0/MKg0ca13LwDA7szje/ZtELVFu4jrvYMnENcbKDw2YP4qu/TUfBBXtg+/GR73gJmWLB+s6k/Ca1yW9mqiWy+o4Zyg2X17PNEitYnk5LO/YzLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QCDDwrq7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCDDwrq7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709227490; x=1740763490;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nNsF5dAYwRbtdi2hF7YRt48qoAzeAc55Yspkb8XSptY=;
  b=QCDDwrq7dWV6kZ5R4rmpPqFRVoKBHy8lLODkzn9L+09ALIdK7xR/mw7T
   HUS1PccTkyit5tglOrrRtMkJDycnoJoWa0SrrtuL4WIzAHaT5fLqrPeB9
   G2NltiMDk5ZsD7iLNz9eN2lpQudRdDZyA1XD397Irhu8B0gk2Rlj9ALqE
   MuJ0DlZqf6KEptCqVg65+EEg1uXpTwaYcuIJmjGDnphUWu7VEiJf43oAV
   GreXSM2i6ARXJjLz3m9HXrYL1mZlKFNoSCtyPVhB033MXzE2VaIOEavlw
   cFjybeg4S0mtcarKT16bzdDdVSNdQjfNgtkj2iGgHlUJtPby9ONtewQ4p
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14421092"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14421092"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 09:24:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7944845"
Received: from gditter-mobl1.amr.corp.intel.com (HELO [10.209.51.74]) ([10.209.51.74])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 09:24:49 -0800
Message-ID: <6f3f3240-ee75-4d52-8d38-5e6d10dfa714@linux.intel.com>
Date: Thu, 29 Feb 2024 09:24:48 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 4/7] platform/x86/amd/pmf: Add support to notify
 sbios heart beat event
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240229105901.455467-1-Shyam-sundar.S-k@amd.com>
 <20240229105901.455467-5-Shyam-sundar.S-k@amd.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240229105901.455467-5-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2/29/24 2:58 AM, Shyam Sundar S K wrote:
> Add support for newer revision of the heart beat notify events.
> This event is used to notify to the OEM BIOS on driver
> load/unload/suspend/resume scenarios.
>
> If OEM BIOS does not receive the heart beat event from PMF driver, OEM
> BIOS shall conclude that PMF driver is no more active and BIOS will
> update to the legacy system power thermals.
>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
Looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>  drivers/platform/x86/amd/pmf/acpi.c | 41 +++++++++++++++++++++++++++--
>  drivers/platform/x86/amd/pmf/core.c | 10 +++++++
>  drivers/platform/x86/amd/pmf/pmf.h  | 17 ++++++++++++
>  3 files changed, 66 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 13af83b187ac..f0360eea81e6 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -140,6 +140,43 @@ static void apmf_sbios_heartbeat_notify(struct work_struct *work)
>  	kfree(info);
>  }
>  
> +int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag)
> +{
> +	struct sbios_hb_event_v2 args = { };
> +	struct acpi_buffer params;
> +	union acpi_object *info;
> +
> +	args.size = sizeof(args);
> +
> +	switch (flag) {
> +	case ON_LOAD:
> +		args.load = 1;
> +		break;
> +	case ON_UNLOAD:
> +		args.unload = 1;
> +		break;
> +	case ON_SUSPEND:
> +		args.suspend = 1;
> +		break;
> +	case ON_RESUME:
> +		args.resume = 1;
> +		break;
> +	default:
> +		dev_dbg(dev->dev, "Failed to send v2 heartbeat event, flag:0x%x\n", flag);
> +		return -EINVAL;
> +	}
> +
> +	params.length = sizeof(args);
> +	params.pointer = &args;
> +
> +	info = apmf_if_call(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2, &params);
> +	if (!info)
> +		return -EIO;
> +
> +	kfree(info);
> +	return 0;
> +}
> +
>  int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx)
>  {
>  	union acpi_object *info;
> @@ -327,7 +364,7 @@ void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>  {
>  	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>  
> -	if (pmf_dev->hb_interval)
> +	if (pmf_dev->hb_interval && pmf_dev->pmf_if_version == PMF_IF_V1)
>  		cancel_delayed_work_sync(&pmf_dev->heart_beat);
>  
>  	if (is_apmf_func_supported(pmf_dev, APMF_FUNC_AUTO_MODE) &&
> @@ -351,7 +388,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>  		goto out;
>  	}
>  
> -	if (pmf_dev->hb_interval) {
> +	if (pmf_dev->hb_interval && pmf_dev->pmf_if_version == PMF_IF_V1) {
>  		/* send heartbeats only if the interval is not zero */
>  		INIT_DELAYED_WORK(&pmf_dev->heart_beat, apmf_sbios_heartbeat_notify);
>  		schedule_delayed_work(&pmf_dev->heart_beat, 0);
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 2230bc2b1f59..5e52eb32ab2b 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -300,6 +300,9 @@ static int amd_pmf_suspend_handler(struct device *dev)
>  	if (pdev->smart_pc_enabled)
>  		cancel_delayed_work_sync(&pdev->pb_work);
>  
> +	if (is_apmf_func_supported(pdev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
> +		amd_pmf_notify_sbios_heartbeat_event_v2(pdev, ON_SUSPEND);
> +
>  	return 0;
>  }
>  
> @@ -317,6 +320,9 @@ static int amd_pmf_resume_handler(struct device *dev)
>  	if (pdev->smart_pc_enabled)
>  		schedule_delayed_work(&pdev->pb_work, msecs_to_jiffies(2000));
>  
> +	if (is_apmf_func_supported(pdev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
> +		amd_pmf_notify_sbios_heartbeat_event_v2(pdev, ON_RESUME);
> +
>  	return 0;
>  }
>  
> @@ -444,6 +450,8 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	amd_pmf_dbgfs_register(dev);
>  	amd_pmf_init_features(dev);
>  	apmf_install_handler(dev);
> +	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
> +		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
>  
>  	dev_info(dev->dev, "registered PMF device successfully\n");
>  
> @@ -455,6 +463,8 @@ static void amd_pmf_remove(struct platform_device *pdev)
>  	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
>  
>  	amd_pmf_deinit_features(dev);
> +	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
> +		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_UNLOAD);
>  	apmf_acpi_deinit(dev);
>  	amd_pmf_dbgfs_unregister(dev);
>  	mutex_destroy(&dev->lock);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index f11d2a348696..5cad11369697 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -30,6 +30,7 @@
>  #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
>  #define APMF_FUNC_DYN_SLIDER_AC				11
>  #define APMF_FUNC_DYN_SLIDER_DC				12
> +#define APMF_FUNC_SBIOS_HEARTBEAT_V2			16
>  
>  /* Message Definitions */
>  #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
> @@ -85,6 +86,21 @@
>  
>  #define PMF_IF_V1		1
>  
> +struct sbios_hb_event_v2 {
> +	u16 size;
> +	u8 load;
> +	u8 unload;
> +	u8 suspend;
> +	u8 resume;
> +} __packed;
> +
> +enum sbios_hb_v2 {
> +	ON_LOAD,
> +	ON_UNLOAD,
> +	ON_SUSPEND,
> +	ON_RESUME,
> +};
> +
>  /* AMD PMF BIOS interfaces */
>  struct apmf_verify_interface {
>  	u16 size;
> @@ -600,6 +616,7 @@ int amd_pmf_get_power_source(void);
>  int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
>  int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
>  int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer);
> +int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
>  
>  /* SPS Layer */
>  int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

