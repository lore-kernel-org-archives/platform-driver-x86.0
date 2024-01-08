Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A551429B;
	Mon,  8 Jan 2024 11:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGjceOY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704713278; x=1736249278;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=oB+rd8K1bLg/hg5Xlfda7T/RZWHkbpT0yjSDv5R4OYE=;
  b=nGjceOY2K1jhi2eESnNgn9/fmvPPC6bpBhu4zKvxy3A/4fViWoYageqc
   5kCEJzI9ipTttzRWVjeNKKdN3uN/eA5giszU/x1fKB/sXZ+H12mMPvBP4
   86HEe0M0lfP8NMXl/1AOF3lBkjCqglM2LFid0BgR0owleeiPe6cWibG4z
   KOCadleIwCtuE/HAcAS6mZLM4NmmaKN/U1FB4U+NyKmyZcAhrK2jaWpim
   68B2jpp0qPa0Y4EQmhoXbdM82HYJItdPLzFbfa2APGOXIw+NIfNTEB2FP
   WKJ4lUKx7roqRPEbOfGtpTQWEAnhViCVS4Cly8L+8cEH6EiDYqO8wjRK0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="484037020"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="484037020"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 03:27:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="29766204"
Received: from stinti-mobl.ger.corp.intel.com ([10.249.37.10])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 03:27:53 -0800
Date: Mon, 8 Jan 2024 13:27:50 +0200 (EET)
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
Subject: Re: [PATCH v2 4/5] platform/x86: pmc_atom: Check state of PMC clocks
 on s2idle
In-Reply-To: <20240107140310.46512-5-hdegoede@redhat.com>
Message-ID: <8fbc514d-b660-d45a-38e8-fc9fa560c8f8@linux.intel.com>
References: <20240107140310.46512-1-hdegoede@redhat.com> <20240107140310.46512-5-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2052543399-1704713276=:1762"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2052543399-1704713276=:1762
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Sun, 7 Jan 2024, Hans de Goede wrote:

> Extend the s2idle check with checking that none of the PMC clocks
> is in the forced-on state. If one of the clocks is in forced on
> state then S0i3 cannot be reached.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Drop the PMC_CLK_* defines these are defined in
>   include/linux/platform_data/x86/pmc_atom.h now
> - Drop duplicated "pmc_atom: " prefix from pr_err() message
> ---
>  drivers/platform/x86/pmc_atom.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index 81ad66117365..d04f635c4075 100644
> --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -477,6 +477,7 @@ static void pmc_s2idle_check(void)
>  	u32 func_dis, func_dis_2;
>  	u32 d3_sts_0, d3_sts_1;
>  	u32 false_pos_sts_0, false_pos_sts_1;
> +	int i;
>  
>  	func_dis = pmc_reg_read(pmc, PMC_FUNC_DIS);
>  	func_dis_2 = pmc_reg_read(pmc, PMC_FUNC_DIS_2);
> @@ -504,6 +505,16 @@ static void pmc_s2idle_check(void)
>  
>  	/* High part */
>  	pmc_dev_state_check(d3_sts_1, m->d3_sts_1, func_dis_2, m->func_dis_2, false_pos_sts_1);
> +
> +	/* Check PMC clocks */

Kind of obvious comment, how about:

	/* Check PMC clocks don't prevent S0i3 */

Or

	/* Forced-on PMC clock prevents S0i3? */

?

> +	for (i = 0; i < PMC_CLK_NUM; i++) {
> +		u32 ctl = pmc_reg_read(pmc, PMC_CLK_CTL_OFFSET + 4 * i);
> +
> +		if ((ctl & PMC_MASK_CLK_CTL) != PMC_CLK_CTL_FORCE_ON)
> +			continue;
> +
> +		pr_err("clock %d is ON prior to freeze (ctl 0x%08x)\n", i, ctl);
> +	}
>  }
>  
>  static struct acpi_s2idle_dev_ops pmc_s2idle_ops = {
> 

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>


-- 
 i.

--8323329-2052543399-1704713276=:1762--
