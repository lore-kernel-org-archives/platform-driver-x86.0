Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ECA45948;
	Mon,  8 Jan 2024 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJk+JDKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704719580; x=1736255580;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Jwrg7KtdZFgcUhLSq6Y/8pkoZ65F9b6mNVMrhiR8lsQ=;
  b=QJk+JDKusL15AAi169TsqMAn9SyTdF7r8e9wkklISnN9FjvqYg4/0I5p
   LgpM7EVNNznzZKWhHl4qtRR7OgRoaBQcPcF7TECKmPPydKgPtMGBUDVay
   cv+l5nBQy/pNzvLTL7Yt7LY8XFOxOGMeLUM0Z0KUeCYwpWLpN7XVa/ICn
   QVBGBXmvk0t6Q8Dz8oRaiXRjFtiwb4D6itPIQvElnBjXUJSUVKnubSgQI
   wc+Q7exNhoCb5/bcTn4dE7DTkpsOrkpyMnX5kEib2j8LtVctHAuadX1H8
   6czbVy56yRAOZIRdGr4GiT5ZoqqLPUkSxUtcT5WaMv+Xn1mXL1+w5EhSK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="5248833"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; 
   d="scan'208";a="5248833"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 05:12:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="1112727167"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; 
   d="scan'208";a="1112727167"
Received: from stinti-mobl.ger.corp.intel.com ([10.249.37.10])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 05:12:55 -0800
Date: Mon, 8 Jan 2024 15:12:53 +0200 (EET)
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
Subject: Re: [PATCH v3 3/5] platform/x86: pmc_atom: Check state of PMC managed
 devices on s2idle
In-Reply-To: <20240108130238.540794-4-hdegoede@redhat.com>
Message-ID: <6e65393b-b245-d3f4-8d94-fdcc269fba1d@linux.intel.com>
References: <20240108130238.540794-1-hdegoede@redhat.com> <20240108130238.540794-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1603508042-1704719579=:1762"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1603508042-1704719579=:1762
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
> all hardware blocks in the South complex (controlled by the PMC)
> are in a state that allows the SoC to enter S0i3 and prints an error
> message for any device in D0.
> 
> Some blocks are not used on lower-featured versions of the SoC and
> these blocks will always report being in D0 on SoCs were they are
> not used. A false-positive mask is used to identify these blocks
> and for blocks in this mask the error is turned into a debug message
> to avoid false-positive error messages.
> 
> Note the pmc_atom code is enabled by CONFIG_X86_INTEL_LPSS which
> already depends on ACPI.
> 
> Signed-off-by: Johannes Stezenbach <js@sig21.net>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> [hdegoede: Use acpi_s2idle_dev_ops, ignore fused off blocks, PMIC I2C]
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Reword commit message
> - Drop confusing /* Low Part */ and /* High Part */ comments
> 
> Changes in v2:
> - Drop duplicated "pmc_atom: " prefix from pr_err() / pr_dbg() messages
> ---
>  drivers/platform/x86/pmc_atom.c | 64 +++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index 93a6414c6611..ec60b734b9cb 100644
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
> @@ -448,6 +450,64 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
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
> +	 */
> +	if (m->d3_sts_1	== byt_d3_sts_1_map) {
> +		/* Bay Trail */
> +		false_pos_sts_0 = BIT_GBE | BIT_SATA | BIT_PCIE_PORT0 |
> +			BIT_PCIE_PORT1 | BIT_PCIE_PORT2 | BIT_PCIE_PORT3 |
> +			BIT_LPSS2_F5_I2C5;
> +		false_pos_sts_1 = BIT_SMB | BIT_USH_SS_PHY | BIT_DFX;
> +	} else {
> +		/* Cherry Trail */
> +		false_pos_sts_0 = BIT_GBE | BIT_SATA | BIT_LPSS2_F7_I2C7;
> +		false_pos_sts_1 = BIT_SMB | BIT_STS_ISH;
> +	}
> +
> +	pmc_dev_state_check(d3_sts_0, m->d3_sts_0, func_dis, m->func_dis, false_pos_sts_0);
> +	pmc_dev_state_check(d3_sts_1, m->d3_sts_1, func_dis_2, m->func_dis_2, false_pos_sts_1);
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
> @@ -485,6 +545,10 @@ static int pmc_setup_dev(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		dev_warn(&pdev->dev, "platform clocks register failed: %d\n",
>  			 ret);
>  
> +#ifdef CONFIG_SUSPEND
> +	acpi_register_lps0_dev(&pmc_s2idle_ops);
> +#endif

I'm sorry I missed this in v2, this could have also used #else + 
dummy function.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>


-- 
 i.

--8323329-1603508042-1704719579=:1762--
