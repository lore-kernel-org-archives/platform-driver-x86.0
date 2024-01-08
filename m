Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E2B14274;
	Mon,  8 Jan 2024 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYqEwqFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704711518; x=1736247518;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Xe3uRR2q3YbLM9EgMf3sRVLZRGE3oxMgYT9yokyH+Ck=;
  b=lYqEwqFaA3q4UCf1pP5aYazFEF63alcnJSqAH0WbgRRx6K+hJYLbtOpQ
   cWgBtVNCAOfj0lcmQ0aJvbf9kUL6r2hibwceRInbOq9F6XGXNsqn2yn2Y
   Y0iaEx8Tfjr14np+2Ip3OGOiOV658llHDQqxtv3l6AD+quy563eVqeCi5
   h7AZ0kPQpnUxMFlWs84jc7ndcR9Zj2calA5S2MEq0z9Pz1JH7EolD+zNx
   1X6ns6vAPni5vdFGIcOHQd0ugL198bc4MSAwBQZQMniedbxYjJNIEhud4
   R8WA3TWyBArOXPdcBRGIKNkc8O4vaaCBOGPEV8S2O9Y+iAnwayUKTojvo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="19349615"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="19349615"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 02:58:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="900340804"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="900340804"
Received: from stinti-mobl.ger.corp.intel.com ([10.249.37.10])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 02:58:33 -0800
Date: Mon, 8 Jan 2024 12:58:31 +0200 (EET)
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
Subject: Re: [PATCH v2 1/5] clk: x86: Move clk-pmc-atom register defines to
 include/linux/platform_data/x86/pmc_atom.h
In-Reply-To: <20240107140310.46512-2-hdegoede@redhat.com>
Message-ID: <a9c2c296-38f0-1cf-a5d9-3169786adf@linux.intel.com>
References: <20240107140310.46512-1-hdegoede@redhat.com> <20240107140310.46512-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-550535538-1704711516=:1762"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-550535538-1704711516=:1762
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Sun, 7 Jan 2024, Hans de Goede wrote:

> Move the register defines for the Atom (Bay Trail, Cherry Trail) PMC
> clocks to include/linux/platform_data/x86/pmc_atom.h.
> 
> This is a preparation patch to extend the S0i3 readiness checks
> in drivers/platform/x86/pmc_atom.c with checking that the PMC
> clocks are off on suspend entry.
> 
> Note these are added to include/linux/platform_data/x86/pmc_atom.h rather
> then to include/linux/platform_data/x86/clk-pmc-atom.h because the former
> already has all the other Atom PMC register defines.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/clk/x86/clk-pmc-atom.c             | 13 +------------
>  include/linux/platform_data/x86/pmc_atom.h | 13 +++++++++++++
>  2 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom.c
> index 2974dd0ec6f4..5ec9255e33fa 100644
> --- a/drivers/clk/x86/clk-pmc-atom.c
> +++ b/drivers/clk/x86/clk-pmc-atom.c
> @@ -11,23 +11,12 @@
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/platform_data/x86/clk-pmc-atom.h>
> +#include <linux/platform_data/x86/pmc_atom.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  
>  #define PLT_CLK_NAME_BASE	"pmc_plt_clk"
>  
> -#define PMC_CLK_CTL_OFFSET		0x60
> -#define PMC_CLK_CTL_SIZE		4
> -#define PMC_CLK_NUM			6
> -#define PMC_CLK_CTL_GATED_ON_D3		0x0
> -#define PMC_CLK_CTL_FORCE_ON		0x1
> -#define PMC_CLK_CTL_FORCE_OFF		0x2
> -#define PMC_CLK_CTL_RESERVED		0x3
> -#define PMC_MASK_CLK_CTL		GENMASK(1, 0)
> -#define PMC_MASK_CLK_FREQ		BIT(2)
> -#define PMC_CLK_FREQ_XTAL		(0 << 2)	/* 25 MHz */
> -#define PMC_CLK_FREQ_PLL		(1 << 2)	/* 19.2 MHz */
> -
>  struct clk_plt_fixed {
>  	struct clk_hw *clk;
>  	struct clk_lookup *lookup;
> diff --git a/include/linux/platform_data/x86/pmc_atom.h b/include/linux/platform_data/x86/pmc_atom.h
> index b8a701c77fd0..557622ef0390 100644
> --- a/include/linux/platform_data/x86/pmc_atom.h
> +++ b/include/linux/platform_data/x86/pmc_atom.h
> @@ -43,6 +43,19 @@
>  				BIT_ORED_DEDICATED_IRQ_GPSC | \
>  				BIT_SHARED_IRQ_GPSS)
>  
> +/* External clk generator settings */
> +#define PMC_CLK_CTL_OFFSET		0x60
> +#define PMC_CLK_CTL_SIZE		4
> +#define PMC_CLK_NUM			6
> +#define PMC_CLK_CTL_GATED_ON_D3		0x0
> +#define PMC_CLK_CTL_FORCE_ON		0x1
> +#define PMC_CLK_CTL_FORCE_OFF		0x2
> +#define PMC_CLK_CTL_RESERVED		0x3
> +#define PMC_MASK_CLK_CTL		GENMASK(1, 0)
> +#define PMC_MASK_CLK_FREQ		BIT(2)
> +#define PMC_CLK_FREQ_XTAL		(0 << 2)	/* 25 MHz */
> +#define PMC_CLK_FREQ_PLL		(1 << 2)	/* 19.2 MHz */

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Noting the last two look like:
#define PMC_CLK_FREQ_XTAL	FIELD_PREP(PMC_MASK_CLK_FREQ, 0) /* 25 MHz */
#define PMC_CLK_FREQ_PLL	FIELD_PREP(PMC_MASK_CLK_FREQ, 1) /* 19.2 MHz */


-- 
 i.

--8323329-550535538-1704711516=:1762--
