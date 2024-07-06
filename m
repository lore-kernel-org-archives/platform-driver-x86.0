Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27F84C79
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jul 2024 13:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720271390; cv=none; b=Lqm+UpenchTwiD4z6DPzPLShqg1+0tfJ2Wb2R+Sem3AhGEFRczh8Pg92PquJfLVpn/SeoxBY5dGHU3Aj7XsUqnf3bO82LWi1xHCfCxDTZKEjSXHPvdaZOJUDxoCYrwpRqLGD3IbzyetKl+MePRal3zer/e8AGpvplQRc1UIl4OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720271390; c=relaxed/simple;
	bh=NngxDA5Qtarqs0Njaz/mNkL5lfXHwtv1C85kX+CG1Dk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OZAjA29tCxLXun8SjuGpBuIFFAK/222yxoH+0B7tkaa0RZWXLq9QBr4h0U9GVV5fl0mBZSW5i3Wl1VbGEWT+gDPGQy1e0w1K2rvx/GDaJ+K+yFsjq4xXUvfqfKlYKUManaBy6azYP8aKAMHFGgGqDrk90OkjrgTMB/Ja1RWcUBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9jhTkNe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9jhTkNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720271389; x=1751807389;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NngxDA5Qtarqs0Njaz/mNkL5lfXHwtv1C85kX+CG1Dk=;
  b=V9jhTkNed4F3Bb7R3zNNf0MNkuJ3NKpvnV/YfiLr8/BEhtd8KHUGAU9A
   iXfFFgLPGH4xR8DO/zg8wKX51oSNFNb/yy6KcesIszu4kZT5ENgWEYbCO
   Fk9uT0lh8bxDUNiE458n1cqRjjvr29Ii3b1ztLr7gMLHVjtMgO1GYNXej
   cT3pUVF2K63UH4Xh8RpYf+G3iyrCHcQHDT1HO5t26N3froJinXKS3HIuJ
   kp9L/Y9bydtQfibxrimwZpz0NTOMiNNYgOJVQ8ZqWW183JNXg7ispOXWp
   t0s2pfdAt0KLwaVUaVkttdftNty9JTyZxoKtCTPcRkp2ARI8U2VuVq3gq
   A==;
X-CSE-ConnectionGUID: wZ1bnORcTGq/xJDJnBBwpg==
X-CSE-MsgGUID: cFDeJVRwQSSeqW88yQ1iTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17674884"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="17674884"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 06:09:49 -0700
X-CSE-ConnectionGUID: ilKaNZMjSl2tqkX1CvAtlQ==
X-CSE-MsgGUID: +MTNjbs2TSubZ3JumXwb1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="47197216"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.111])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 06:09:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 6 Jul 2024 16:09:41 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH v1 1/2] platform/x86/amd/pmf: Use existing input event
 codes to update system states
In-Reply-To: <20240702080626.2902171-1-Shyam-sundar.S-k@amd.com>
Message-ID: <531d4d0a-9ba0-e67f-6f84-d11de1a0156e@linux.intel.com>
References: <20240702080626.2902171-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 Jul 2024, Shyam Sundar S K wrote:

> At present, the PMF driver employs custom system state codes to update
> system states. It is recommended to replace these with existing input

This change entirely removes the way userspace worked before this change?
We cannot take userspace functionality away like this.

-- 
 i.

> event codes (KEY_SLEEP, KEY_SUSPEND, and KEY_SCREENLOCK) to align system
> updates with the PMF-TA output actions.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h    |  2 +
>  drivers/platform/x86/amd/pmf/tee-if.c | 62 +++++++++++++++++++++------
>  2 files changed, 52 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index eeedd0c0395a..753d5662c080 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -12,6 +12,7 @@
>  #define PMF_H
>  
>  #include <linux/acpi.h>
> +#include <linux/input.h>
>  #include <linux/platform_profile.h>
>  
>  #define POLICY_BUF_MAX_SZ		0x4b000
> @@ -300,6 +301,7 @@ struct amd_pmf_dev {
>  	void __iomem *policy_base;
>  	bool smart_pc_enabled;
>  	u16 pmf_if_version;
> +	struct input_dev *pmf_idev;
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index b438de4d6bfc..b0449f912048 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -62,18 +62,12 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
>  	param[0].u.memref.shm_offs = 0;
>  }
>  
> -static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
> +static void amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
>  {
> -	char *envp[2] = {};
> -
> -	envp[0] = kasprintf(GFP_KERNEL, "EVENT_ID=%d", event);
> -	if (!envp[0])
> -		return -EINVAL;
> -
> -	kobject_uevent_env(&dev->dev->kobj, KOBJ_CHANGE, envp);
> -
> -	kfree(envp[0]);
> -	return 0;
> +	input_report_key(dev->pmf_idev, event, 1); /* key press */
> +	input_sync(dev->pmf_idev);
> +	input_report_key(dev->pmf_idev, event, 0); /* key release */
> +	input_sync(dev->pmf_idev);
>  }
>  
>  static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
> @@ -149,7 +143,20 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  			break;
>  
>  		case PMF_POLICY_SYSTEM_STATE:
> -			amd_pmf_update_uevents(dev, val);
> +			switch (val) {
> +			case 0:
> +				amd_pmf_update_uevents(dev, KEY_SLEEP);
> +				break;
> +			case 1:
> +				amd_pmf_update_uevents(dev, KEY_SUSPEND);
> +				break;
> +			case 2:
> +				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
> +				break;
> +			default:
> +				dev_err(dev->dev, "Invalid PMF policy system state: %d\n", val);
> +			}
> +
>  			dev_dbg(dev->dev, "update SYSTEM_STATE: %s\n",
>  				amd_pmf_uevent_as_str(val));
>  			break;
> @@ -368,6 +375,30 @@ static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id)
>  	return rc;
>  }
>  
> +static int amd_pmf_register_input_device(struct amd_pmf_dev *dev)
> +{
> +	int err;
> +
> +	dev->pmf_idev = devm_input_allocate_device(dev->dev);
> +	if (!dev->pmf_idev)
> +		return -ENOMEM;
> +
> +	dev->pmf_idev->name = "PMF-TA output events";
> +	dev->pmf_idev->phys = "amd-pmf/input0";
> +
> +	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SLEEP);
> +	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SCREENLOCK);
> +	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SUSPEND);
> +
> +	err = input_register_device(dev->pmf_idev);
> +	if (err) {
> +		dev_err(dev->dev, "Failed to register input device: %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
>  {
>  	u32 size;
> @@ -475,6 +506,10 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  	if (pb_side_load)
>  		amd_pmf_open_pb(dev, dev->dbgfs_dir);
>  
> +	ret = amd_pmf_register_input_device(dev);
> +	if (ret)
> +		goto error;
> +
>  	return 0;
>  
>  error:
> @@ -488,6 +523,9 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>  	if (pb_side_load && dev->esbin)
>  		amd_pmf_remove_pb(dev);
>  
> +	if (dev->pmf_idev)
> +		input_unregister_device(dev->pmf_idev);
> +
>  	cancel_delayed_work_sync(&dev->pb_work);
>  	kfree(dev->prev_data);
>  	dev->prev_data = NULL;
> 


