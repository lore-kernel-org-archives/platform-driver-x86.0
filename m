Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F9A15350B;
	Sun, 29 Dec 2024 16:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735491534; cv=none; b=OC9TXFRbvQ3xRmEnJLkvpZZmoUoypX5gnrV7jWLRIhzWRol0zZst/38GW/QsHlUb9PlulvWwS6pzvCUDDL9Se4uB9tTFQ3weCzlrlsYdyjqutgNEuJUifBFh8uqy1bGImZVue/6lLItDYSwE4jz/xgNVj+lq8VRnPoUNzZMbvBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735491534; c=relaxed/simple;
	bh=haGGIuuo7yFdaNq/t5ENabsZQYOKHuNbCBQZliRqlR8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UpENT9xrKndbJ8pDauJ0ngjYTCu7K69S1A0NWEXJ6O7gPNnU6/TlnxyJM3DAQdsDDuv3UuAKd3YaF2Lt4lnAINpoJO71I9a6EBTsnCyh06c2rsGMjFhO8JKpazhMEafp3dmiqUOZHTwhetm7+nqvzMqgbU7voLWzZmcv6FKIwNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HufbOywf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HufbOywf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735491533; x=1767027533;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=haGGIuuo7yFdaNq/t5ENabsZQYOKHuNbCBQZliRqlR8=;
  b=HufbOywfWVQ2pEWUPV2hYFhiC/5KB5/ZSctbMgiU0UPO5XMHlQfLhrqT
   2OEpXk3A2XUfqCBY/wXN6EOrGYlTu6ZqfCnO5bReEr3m/UJciZYv5wWKe
   thhODgeCxJIsuLt4npheMz6hjdzCv2BdxthuF5xXURwuZsx5bilmuPrbW
   Sw927V0/m7g7dyGAvKYtohZX0aFR5lXbO2naXlglW+1X8/oyBxTOWhfds
   Ys0UAie6T/8bO2Q5r3dgc5t44befQsrjE0PMxRJOpo3PK3dqYjg+7ZPiK
   mGZXAqO8omjUhXwzIQ7ARxTsrOEcB8AP8R/jBjl1/stBGPnfw+OmWxkAl
   Q==;
X-CSE-ConnectionGUID: fQxMwDIyRM6Sl7GK9OJ2UQ==
X-CSE-MsgGUID: kVrnf1r/St6bi7E/E5sP+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="23393023"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="23393023"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 08:58:52 -0800
X-CSE-ConnectionGUID: 3OxJ1zJ1Tlq8vRyQ9pEr0w==
X-CSE-MsgGUID: Y0v5ZtmGTy+MKGlyQvt8Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="100772198"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 08:58:50 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sun, 29 Dec 2024 18:58:46 +0200 (EET)
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/amd/pmc: Only disable IRQ1 wakeup where
 i8042 actually enabled it
In-Reply-To: <d5ed5ffc88fed17e1b1eb988c942e44fb540a68b.1735490591.git.mail@maciej.szmigiero.name>
Message-ID: <a5781d0a-0a58-a708-1f8f-f9ade14ade52@linux.intel.com>
References: <d5ed5ffc88fed17e1b1eb988c942e44fb540a68b.1735490591.git.mail@maciej.szmigiero.name>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 29 Dec 2024, Maciej S. Szmigiero wrote:

> Wakeup for IRQ1 should be disabled only in cases where i8042 had actually
> enabled it, otherwise "wake_depth" for this IRQ will try do drop below zero
> and there will be an unpleasant WARN() logged:
> kernel: atkbd serio0: Disabling IRQ1 wakeup source to avoid platform firmware bug
> kernel: ------------[ cut here ]------------
> kernel: Unbalanced IRQ 1 wake disable
> kernel: WARNING: CPU: 10 PID: 6431 at kernel/irq/manage.c:920 irq_set_irq_wake+0x147/0x1a0
> 
> To fix this call the PMC suspend handler only from the same set of
> dev_pm_ops handlers as i8042_pm_suspend() is called, which currently means
> just the ".suspend" handler.
> Previously, the code would use DEFINE_SIMPLE_DEV_PM_OPS() to define its
> dev_pm_ops, which also called this handler on ".freeze" and ".poweroff".
> 
> To reproduce this issue try hibernating (S4) the machine after a fresh boot
> without putting it into s2idle first.
> 
> Fixes: 8e60615e8932 ("platform/x86/amd: pmc: Disable IRQ1 wakeup for RN/CZN")
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 26b878ee5191..a254debb9256 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -947,6 +947,10 @@ static int amd_pmc_suspend_handler(struct device *dev)
>  {
>  	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
>  
> +	/*
> +	 * Must be called only from the same set of dev_pm_ops handlers
> +	 * as i8042_pm_suspend() is called: currently just from .suspend.
> +	 */
>  	if (pdev->disable_8042_wakeup && !disable_workarounds) {
>  		int rc = amd_pmc_wa_irq1(pdev);
>  
> @@ -959,7 +963,9 @@ static int amd_pmc_suspend_handler(struct device *dev)
>  	return 0;
>  }
>  
> -static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmc_pm, amd_pmc_suspend_handler, NULL);
> +static const struct dev_pm_ops amd_pmc_pm = {
> +	.suspend = amd_pmc_suspend_handler,
> +};

???

I cannot see what this change is supposed to achieve. 

#define _DEFINE_DEV_PM_OPS(name, \
                           suspend_fn, resume_fn, \
                           runtime_suspend_fn, runtime_resume_fn, idle_fn) \
const struct dev_pm_ops name = { \
        SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
        RUNTIME_PM_OPS(runtime_suspend_fn, runtime_resume_fn, idle_fn) \
}

#define DEFINE_SIMPLE_DEV_PM_OPS(name, suspend_fn, resume_fn) \
        _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)

#define SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
        .suspend = pm_sleep_ptr(suspend_fn), \
        .resume = pm_sleep_ptr(resume_fn), \
        .freeze = pm_sleep_ptr(suspend_fn), \
        .thaw = pm_sleep_ptr(resume_fn), \
        .poweroff = pm_sleep_ptr(suspend_fn), \
        .restore = pm_sleep_ptr(resume_fn),

#define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))

Under what circumstances does this change result in some difference?

-- 
 i.

