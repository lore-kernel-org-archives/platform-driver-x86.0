Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF052575D;
	Mon,  8 Jan 2024 11:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2a0uJMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704714004; x=1736250004;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=AwhbznBYUDrwNqn9p+/THKs4qKiMCqIqZYM6nVaj4QA=;
  b=P2a0uJMyhsCefA6mr8PFGaTTikB93LERPHhdiyuVDRnpYmJ2opeJ/qFV
   IsLjYN+I/pwrdgIbgTIL8o93JTCv0bmNBWNjhP+fYyqjB0LvgX9uYr8qy
   /8tj5GsJ7iZwZaJgshoBEGb81DWnD2x7kf4u+zkjTOLk8vSlCMcHuNvIB
   kQR652FivhHDlsf/d9oFrfSffuIjZVBAtUZ1Oc4r5Z/fwND6iDXyOzjAj
   9rzBBhBOdNUAQIQQrY/WP0n/BRW6ermBVbhXdtT3eq7kSryv5to+u+zPf
   h4cmuvZzE+gl0SuOq8spwi8k1j9XxRJGZvGRMjTHfh2qPg/ITWCWrHbAH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="395023008"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="395023008"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 03:40:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="774468631"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="774468631"
Received: from stinti-mobl.ger.corp.intel.com ([10.249.37.10])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 03:39:59 -0800
Date: Mon, 8 Jan 2024 13:39:56 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
cc: Johannes Stezenbach <js@sig21.net>, Takashi Iwai <tiwai@suse.de>, 
    Andy Shevchenko <andy@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
    Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    "H . Peter Anvin" <hpa@zytor.com>, 
    Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, platform-driver-x86@vger.kernel.org, 
    x86@kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 5/5] x86/platform/atom: Check state of Punit managed
 devices on s2idle
In-Reply-To: <20240107140310.46512-6-hdegoede@redhat.com>
Message-ID: <8f8af87e-a797-bf36-5411-83a715765a9@linux.intel.com>
References: <20240107140310.46512-1-hdegoede@redhat.com> <20240107140310.46512-6-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 7 Jan 2024, Hans de Goede wrote:

> From: Johannes Stezenbach <js@sig21.net>
> 
> This is a port of "pm: Add pm suspend debug notifier for North IPs"
> from the latte-l-oss branch of:
> from https://github.com/MiCode/Xiaomi_Kernel_OpenSource latte-l-oss
> 
> With the new acpi_s2idle_dev_ops and acpi_register_lps0_dev()
> functionality this can now finally be ported to the mainline kernel
> without requiring adding non-upstreamable hooks into the cpu_idle
> driver mechanism.

Same problems with the commit message as in one of the earlier patches.

> This adds a check that all hardware blocks in the North complex
> (controlled by Punit) are in a state that allows the SoC to enter S0i3
> and prints an error message for any device in D0.
>
> Signed-off-by: Johannes Stezenbach <js@sig21.net>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> [hdegoede: Use acpi_s2idle_dev_ops]
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  arch/x86/platform/atom/punit_atom_debug.c | 45 ++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/platform/atom/punit_atom_debug.c b/arch/x86/platform/atom/punit_atom_debug.c
> index f8ed5f66cd20..03ae08c99155 100644
> --- a/arch/x86/platform/atom/punit_atom_debug.c
> +++ b/arch/x86/platform/atom/punit_atom_debug.c
> @@ -7,6 +7,9 @@
>   * Copyright (c) 2015, Intel Corporation.
>   */
>  
> +#define pr_fmt(fmt) "punit_atom: " fmt
> +
> +#include <linux/acpi.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/device.h>
> @@ -117,6 +120,37 @@ static void punit_dbgfs_unregister(void)
>  	debugfs_remove_recursive(punit_dbg_file);
>  }
>  
> +#if defined(CONFIG_ACPI) && defined(CONFIG_SUSPEND)
> +static const struct punit_device *punit_dev;
> +
> +static void punit_s2idle_check(void)
> +{
> +	const struct punit_device *punit_devp;
> +	u32 punit_pwr_status, dstate;
> +	int status;
> +
> +	for (punit_devp = punit_dev; punit_devp->name; punit_devp++) {
> +		/* Skip MIO this is on till the very last moment */

Skip MIO, it is on ...

> +		if (punit_devp->reg == MIO_SS_PM)
> +			continue;
> +
> +		status = iosf_mbi_read(BT_MBI_UNIT_PMC, MBI_REG_READ,
> +				       punit_devp->reg, &punit_pwr_status);
> +		if (status) {
> +			pr_err("%s read failed\n", punit_devp->name);
> +		} else  {
> +			dstate = (punit_pwr_status >> punit_devp->sss_pos) & 3;
> +			if (!dstate)
> +				pr_err("%s is in D0 prior to s2idle\n", punit_devp->name);
> +		}
> +	}
> +}
> +
> +static struct acpi_s2idle_dev_ops punit_s2idle_ops = {
> +	.check = punit_s2idle_check,
> +};
> +#endif
> +
>  #define X86_MATCH(model, data)						 \
>  	X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 6, INTEL_FAM6_##model, \
>  					   X86_FEATURE_MWAIT, data)
> @@ -131,19 +165,28 @@ MODULE_DEVICE_TABLE(x86cpu, intel_punit_cpu_ids);
>  
>  static int __init punit_atom_debug_init(void)
>  {
> +	struct punit_device *punit_device;
>  	const struct x86_cpu_id *id;
>  
>  	id = x86_match_cpu(intel_punit_cpu_ids);
>  	if (!id)
>  		return -ENODEV;
>  
> -	punit_dbgfs_register((struct punit_device *)id->driver_data);
> +	punit_device = (struct punit_device *)id->driver_data;
> +	punit_dbgfs_register(punit_device);
> +#if defined(CONFIG_ACPI) && defined(CONFIG_SUSPEND)
> +	punit_dev = punit_device;
> +	acpi_register_lps0_dev(&punit_s2idle_ops);
> +#endif
>  
>  	return 0;
>  }
>  
>  static void __exit punit_atom_debug_exit(void)
>  {
> +#if defined(CONFIG_ACPI) && defined(CONFIG_SUSPEND)
> +	acpi_unregister_lps0_dev(&punit_s2idle_ops);
> +#endif

I'd move these into new functions in the existing #if defined(CONFIG_ACPI) 
&& defined(CONFIG_SUSPEND) block and add #else block which has dummy 
functions for them.

>  	punit_dbgfs_unregister();
>  }
>  
> 

-- 
 i.

