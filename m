Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC0836680E;
	Wed,  1 Jul 2026 11:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906874; cv=none; b=tQjV9qtdTUpHRDE6MAWGMDi5ukOBNore8vcaSSXnc0tzYpmU9Jjv7jFBDNWzemasAVMocQY997fUA0G2sr4duGQjnefpEYf1BWN6a+eYCV2M+6lB9vIWJpGHEPZaW70RBl+mc/37pBGtutLtpVcH1+BRpu48jnfWkaamGTjzilA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906874; c=relaxed/simple;
	bh=CHEj1FbIiU6Zw4zLsFlajEPHvw7BCObMbTxKFaaR+Yg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QfKMOg4NUfecwlBGjOUXIDQNQYf+lZ1IP5lOFIy3/5sN1rB5oplaIfUwHlJWPutKdd793vojkAf5S9QbPbwAc7omeOvuU2V/8gFRl9jYkftn5eQTj0nCdNDgstI3BTAoOSSKOuhxc/M59lp9RqiyDM3s7RVgabz19hY2V2hxYYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/vK1Cj6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/vK1Cj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782906873; x=1814442873;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CHEj1FbIiU6Zw4zLsFlajEPHvw7BCObMbTxKFaaR+Yg=;
  b=O/vK1Cj6oJBVIyTp86jekPqjcQjODL+TVBBa2ewNRsokzGNC4fWbIMTY
   koJCHWI1oUhCgfPufr7GCW1Tg/oczQ0d6Jrh13h+tLOudCuMXjdEpiHiL
   ECrNfEE5WklJLFtyw55H2sWnvQp/rtMcZCm+B75BsLGrdXygk0K/BNTcq
   p7/DbOSp51DXSL7WDji4+kSk6f8MasHqMzOXTiHL1FERujzthvAnzy1Z2
   4SPRkKb4wq5riHmpd8oqmLddL0fNCtbfetMN5of+TOVQqBm3dIi/dj9gj
   0i0EQ2XeWL5xVrrAkWOxHeiX+23tThbwOa25nR6Gg9gjtFFkIL6wftQkr
   Q==;
X-CSE-ConnectionGUID: XifoCUAjR+mlSp9UOjFcAA==
X-CSE-MsgGUID: 1gApxnxbRL+CZzykgtnKKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="86183375"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="86183375"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:54:33 -0700
X-CSE-ConnectionGUID: JnHAUPpQTkCOPWdBVgk4NA==
X-CSE-MsgGUID: H9x79niySSa9pNvO1yextA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="248572852"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:54:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 1 Jul 2026 14:54:27 +0300 (EEST)
To: Mingyou Chen <qby140326@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] platform/x86: bitland-mifs-wmi: Fix NULL pointer
 dereference during suspend/resume
In-Reply-To: <20260620081805.63773-1-qby140326@gmail.com>
Message-ID: <a81f0fa3-c3c2-ea2a-969b-000c369f8487@linux.intel.com>
References: <20260620081805.63773-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 20 Jun 2026, Mingyou Chen wrote:

> The driver registers two distinct WMI devices: a control device
> (BITLAND_WMI_CONTROL) and an event device (BITLAND_WMI_EVENT). During
> the probe phase, the event device handling path returns early before
> initializing the platform profile device (data->pp_dev), leaving it
> NULL.
> 
> However, the PM sleep operations are registered globally for the WMI
> driver
> and are triggered for both devices. When entering suspend, the event
> device
> invokes bitland_mifs_wmi_suspend(), which passes the uninitialized
> data->pp_dev (NULL) into laptop_profile_get(). This leads to a NULL
> pointer
> dereference inside dev_get_drvdata(), causing a kernel Oops and halting
> the
> suspend sequence.
> 
> Fix this by adding a validity check for data->pp_dev in both the suspend
> and resume callbacks, safely skipping profile operations for the event
> device.
> 
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>

This seems to be missing a Fixes tag?

> ---
>  drivers/platform/x86/bitland-mifs-wmi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index b0d06a80e89e..3a373184519d 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -300,6 +300,10 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
>  	enum platform_profile_option profile;
>  	int ret;
>  
> +	/* Skip event device */
> +	if (!data->pp_dev)
> +		return 0;
> +
>  	ret = laptop_profile_get(data->pp_dev, &profile);
>  	if (ret == 0)
>  		data->saved_profile = profile;
> @@ -311,6 +315,10 @@ static int bitland_mifs_wmi_resume(struct device *dev)
>  {
>  	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
>  
> +	/* Skip event device */
> +	if (!data->pp_dev)
> +		return 0;
> +
>  	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
>  	return laptop_profile_set(dev, data->saved_profile);
>  }
> 
> base-commit: 1a3746ccbb0a97bed3c06ccde6b880013b1dddc1
> 

-- 
 i.

