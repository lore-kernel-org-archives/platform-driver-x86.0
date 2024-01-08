Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA30D14284;
	Mon,  8 Jan 2024 11:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A67/it+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704712690; x=1736248690;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=B1VylUtaCrS8pDKCE/sjv19CDZ5DsjEX0gQhMkw4e/4=;
  b=A67/it+BF0kZQqjA1nyJKG58r0JJt3q57/c5UINAUZr/qvOWIrMHkZit
   /A3kEr0oFQLAk6cLa9DddbEL8LT9wzeQ1be+k6wRf3XgxV9JHck0g9jlU
   7N6MycAifLqL37OhNODDmf08OAeutmvCM2HAuU1tjEmecMEmV+/h73jg9
   tVrNno5XeOsjr7pKkV00PjbNrhX8KP21ty94RbPQWlS/d2uUVBnu2oxyy
   s1glD9vy4aNXD6a1su/Nu2+grGENO2773VhKrYd5XQ6uPjqLoUo1AHkgS
   dPK4P13aEQgVYEGgaulfDZCR2Cr3fB0/wXIafAtlL5RcJF1ots6fJVV/g
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="429036616"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="429036616"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 03:18:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="871846054"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="871846054"
Received: from stinti-mobl.ger.corp.intel.com ([10.249.37.10])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 03:18:05 -0800
Date: Mon, 8 Jan 2024 13:18:02 +0200 (EET)
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
Subject: Re: [PATCH v2 3/5] platform/x86: pmc_atom: Check state of PMC managed
 devices on s2idle
In-Reply-To: <20240107140310.46512-4-hdegoede@redhat.com>
Message-ID: <a4d814a2-66bd-6429-539c-196fabbf48ae@linux.intel.com>
References: <20240107140310.46512-1-hdegoede@redhat.com> <20240107140310.46512-4-hdegoede@redhat.com>
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
> This is a port of "pm: Add pm suspend debug notifier for South IPs"
> from the latte-l-oss branch of:
> from https://github.com/MiCode/Xiaomi_Kernel_OpenSource latte-l-oss

If this is to be included at all, don't place it first but last in the 
commit message. That is, focus on the change itself, not where the patch 
came from.

> With the new acpi_s2idle_dev_ops and acpi_register_lps0_dev()
> functionality this can now finally be ported to the mainline kernel

What is "this" (and no, don't point it to some external patch in some 
random branch).

> without requiring adding non-upstreamable hooks into the cpu_idle
> driver mechanism.

Somehow this entire paragraph (and the one preceeding it) has a flawed way 
to look things, it focuses on stuff that seems largely irrelevant. 
Instead, there should be "a problem statement", what is problem this patch 
is addressing / why.

> This adds a check that all hardware blocks in the South complex
> (controlled by PMC) are in a state that allows the SoC to enter S0i3
> and prints an error message for any device in D0.
> 
> Note the pmc_atom code is enabled by CONFIG_X86_INTEL_LPSS which
> already depends on ACPI.
> 
> Signed-off-by: Johannes Stezenbach <js@sig21.net>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> [hdegoede: Use acpi_s2idle_dev_ops, ignore fused off blocks, PMIC I2C]
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Drop duplicated "pmc_atom: " prefix from pr_err() / pr_dbg() messages
> ---
>  drivers/platform/x86/pmc_atom.c | 67 +++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index 93a6414c6611..81ad66117365 100644
> --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -6,6 +6,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/acpi.h>
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/dmi.h>
> @@ -17,6 +18,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pci.h>
>  #include <linux/seq_file.h>
> +#include <linux/suspend.h>
>  
>  struct pmc_bit_map {
>  	const char *name;
> @@ -448,6 +450,67 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
>  	return 0;
>  }
>  
> +#ifdef CONFIG_SUSPEND
> +static void pmc_dev_state_check(u32 sts, const struct pmc_bit_map *sts_map,
> +				u32 fd, const struct pmc_bit_map *fd_map,
> +				u32 sts_possible_false_pos)
> +{
> +	int index;
> +
> +	for (index = 0; sts_map[index].name; index++) {
> +		if (!(fd_map[index].bit_mask & fd) &&
> +		    !(sts_map[index].bit_mask & sts)) {
> +			if (sts_map[index].bit_mask & sts_possible_false_pos)
> +				pm_pr_dbg("%s is in D0 prior to s2idle\n",
> +					  sts_map[index].name);
> +			else
> +				pr_err("%s is in D0 prior to s2idle\n",
> +				       sts_map[index].name);
> +		}
> +	}
> +}
> +
> +static void pmc_s2idle_check(void)
> +{
> +	struct pmc_dev *pmc = &pmc_device;
> +	const struct pmc_reg_map *m = pmc->map;
> +	u32 func_dis, func_dis_2;
> +	u32 d3_sts_0, d3_sts_1;
> +	u32 false_pos_sts_0, false_pos_sts_1;
> +
> +	func_dis = pmc_reg_read(pmc, PMC_FUNC_DIS);
> +	func_dis_2 = pmc_reg_read(pmc, PMC_FUNC_DIS_2);
> +	d3_sts_0 = pmc_reg_read(pmc, PMC_D3_STS_0);
> +	d3_sts_1 = pmc_reg_read(pmc, PMC_D3_STS_1);
> +
> +	/*
> +	 * Some blocks are not used on lower-featured versions of the SoC and
> +	 * always report D0, add these to false_pos mask to log at debug level.

Please explain this also in the commit message.

> +	 */
> +	if (m->d3_sts_1	== byt_d3_sts_1_map) {
> +		/* BYT */

Can these be written open into the longer form.

> +		false_pos_sts_0 = BIT_GBE | BIT_SATA | BIT_PCIE_PORT0 |
> +			BIT_PCIE_PORT1 | BIT_PCIE_PORT2 | BIT_PCIE_PORT3 |
> +			BIT_LPSS2_F5_I2C5;
> +		false_pos_sts_1 = BIT_SMB | BIT_USH_SS_PHY | BIT_DFX;
> +	} else {
> +		/* CHT */
> +		false_pos_sts_0 = BIT_GBE | BIT_SATA | BIT_LPSS2_F7_I2C7;
> +		false_pos_sts_1 = BIT_SMB | BIT_STS_ISH;
> +	}

Perhaps move common bits out of the if blocks?

> +
> +	/* Low part */
> +	pmc_dev_state_check(d3_sts_0, m->d3_sts_0, func_dis, m->func_dis, false_pos_sts_0);
> +
> +	/* High part */
> +	pmc_dev_state_check(d3_sts_1, m->d3_sts_1, func_dis_2, m->func_dis_2, false_pos_sts_1);

The variables are called _0 and _1 but the comment talks about "low" and 
"high", could these be made consistent such that variabless end into _lo & 
_hi ?

After making that change, I don't think those comments add any value any 
further value to what is already plainly visible from the code itself.

> +}
> +
> +static struct acpi_s2idle_dev_ops pmc_s2idle_ops = {
> +	.check = pmc_s2idle_check,
> +};
> +#endif
> +
>  static int pmc_setup_dev(struct pci_dev *pdev, const struct pci_device_id *ent)
>  {
>  	struct pmc_dev *pmc = &pmc_device;
> @@ -485,6 +548,10 @@ static int pmc_setup_dev(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		dev_warn(&pdev->dev, "platform clocks register failed: %d\n",
>  			 ret);
>  
> +#ifdef CONFIG_SUSPEND
> +	acpi_register_lps0_dev(&pmc_s2idle_ops);
> +#endif
> +
>  	pmc->init = true;
>  	return ret;
>  }
> 

-- 
 i.

