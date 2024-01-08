Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09F641215;
	Mon,  8 Jan 2024 13:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idtB47c8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704719335; x=1736255335;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Ca+fEVHmUU2gRldXaInEe1FlKVXfoCfOHZ8Mj80pMVY=;
  b=idtB47c8vXpws6PZimmlRUcCEfa44qQjmM3Hh3scBhws55y4vslNZ47O
   53Ah+GTPi8jkXw+gehq+Dp7V4zp4HM+D3stb7vZ5Mep0tZMAuHreL3GWS
   pzL+K7fvepKOoFo7mXDt4c6z5yqfMLlocxW0LTxR7ij4EYtHv01zFAZ92
   XJ6yW9+wySGWRZKJn7DAjdemEQYMYLdAWvC7K99IkbZ1TwZ/p82z3M2ll
   /0UAS3LAwVDNwsxPtWphkJ55uNTl4CdHym22w8b8+ij7BsiHPgGRZe6MK
   HXmE7vIKfm1AZHawV/Pvw0jzgIas8Xlcgpt1Z7TbRcGPT+KLWgXIX9NJK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="429057536"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; 
   d="scan'208";a="429057536"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 05:08:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; 
   d="scan'208";a="29790259"
Received: from stinti-mobl.ger.corp.intel.com ([10.249.37.10])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 05:08:48 -0800
Date: Mon, 8 Jan 2024 15:08:45 +0200 (EET)
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
Subject: Re: [PATCH v3 5/5] x86/platform/atom: Check state of Punit managed
 devices on s2idle
In-Reply-To: <20240108130238.540794-6-hdegoede@redhat.com>
Message-ID: <4248c18-3e92-a2ee-f7a7-191548f94b0@linux.intel.com>
References: <20240108130238.540794-1-hdegoede@redhat.com> <20240108130238.540794-6-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1058733844-1704719331=:1762"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1058733844-1704719331=:1762
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Mon, 8 Jan 2024, Hans de Goede wrote:

> From: Johannes Stezenbach <js@sig21.net>
> 
> For the Bay Trail or Cherry Trail SoC to enter the S0i3 power-level
> at s2idle suspend requires most of the hw-blocks / devices in the SoC
> to be in D3 when entering s2idle suspend.
> 
> If some devices are not in D3 then the SoC will stay in a higher
> power state, consuming much more power from the battery then in S0i3.
> 
> Use the new acpi_s2idle_dev_ops and acpi_register_lps0_dev()
> functionality to register a new s2idle check function which checks that
> all hardware blocks in theNorth complex (controlled by Punit) are in

nit: missing space.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

> a state that allows the SoC to enter S0i3 and prints an error message
> for any device in D0.
> 
> Signed-off-by: Johannes Stezenbach <js@sig21.net>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> Acked-by: Borislav Petkov (AMD) <bp@alien8.de>
> [hdegoede: Use acpi_s2idle_dev_ops]
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Reword commit message
> - Add punit_s2idle_check_[un]register() helper functions
> ---
>  arch/x86/platform/atom/punit_atom_debug.c | 54 ++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/platform/atom/punit_atom_debug.c b/arch/x86/platform/atom/punit_atom_debug.c
> index f8ed5f66cd20..6b9c6deca8ba 100644
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
> @@ -117,6 +120,51 @@ static void punit_dbgfs_unregister(void)
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
> +		/* Skip MIO, it is on till the very last moment */
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
> +
> +static void punit_s2idle_check_register(struct punit_device *punit_device)
> +{
> +	punit_dev = punit_device;
> +	acpi_register_lps0_dev(&punit_s2idle_ops);
> +}
> +
> +static void punit_s2idle_check_unregister(void)
> +{
> +	acpi_unregister_lps0_dev(&punit_s2idle_ops);
> +}
> +#else
> +static void punit_s2idle_check_register(struct punit_device *punit_device) {}
> +static void punit_s2idle_check_unregister(void) {}
> +#endif
> +
>  #define X86_MATCH(model, data)						 \
>  	X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 6, INTEL_FAM6_##model, \
>  					   X86_FEATURE_MWAIT, data)
> @@ -131,19 +179,23 @@ MODULE_DEVICE_TABLE(x86cpu, intel_punit_cpu_ids);
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
> +	punit_s2idle_check_register(punit_device);
>  
>  	return 0;
>  }
>  
>  static void __exit punit_atom_debug_exit(void)
>  {
> +	punit_s2idle_check_unregister();
>  	punit_dbgfs_unregister();
>  }
>  
> 
--8323329-1058733844-1704719331=:1762--
