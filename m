From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v1 1/7] mfd: intel_soc_pmic_bxtwc: fix TMU interrupt index
Date: Wed, 12 Apr 2017 11:45:51 +0100
Message-ID: <20170412104551.g2xkpihz2n2hju4m@dell>
References: <b8e952de94ed1902b922224de11f0814371b08b0.1491848776.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f174.google.com ([209.85.128.174]:35142 "EHLO
        mail-wr0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753306AbdDLKpz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Apr 2017 06:45:55 -0400
Received: by mail-wr0-f174.google.com with SMTP id o21so14712558wrb.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2017 03:45:55 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <b8e952de94ed1902b922224de11f0814371b08b0.1491848776.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: sathyanarayanan.kuppuswamy@linux.intel.com
Cc: gnurou@gmail.com, linus.walleij@linaro.org, edubezval@gmail.com, dvhart@infradead.org, rui.zhang@intel.com, andy@infradead.org, hdegoede@redhat.com, linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, sathyaosid@gmail.com

On Mon, 10 Apr 2017, sathyanarayanan.kuppuswamy@linux.intel.com wrote:

> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> TMU interrupts are registered as a separate interrupt chip, and
> hence it should start its interrupt index(BXTWC_TMU_IRQ) number
> from 0. But currently, BXTWC_TMU_IRQ is defined as part of enum
> bxtwc_irqs_level2 and its index value is 11. Since this index
> value is used when calculating .num_irqs of regmap_irq_chip_tmu,
> it incorrectly reports number of irqs as 12 instead of actual
> value of 1.
> 
> static const struct regmap_irq bxtwc_regmap_irqs_tmu[] = {
> 	REGMAP_IRQ_REG(BXTWC_TMU_IRQ, 0, 0x06),
> };
> 
> static struct regmap_irq_chip bxtwc_regmap_irq_chip_tmu = {
> 	.name = "bxtwc_irq_chip_tmu",
> 	.status_base = BXTWC_TMUIRQ,
> 	.mask_base = BXTWC_MTMUIRQ,
> 	.irqs = bxtwc_regmap_irqs_tmu,
> 	.num_irqs = ARRAY_SIZE(bxtwc_regmap_irqs_tmu),
> 	.num_regs = 1,
> };
> 
> This patch fixes this issue by creating new enum of tmu irqs and
> resetting its starting index to 0.
> 
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
>  drivers/mfd/intel_soc_pmic_bxtwc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Patch looks fine, but please remove the code segment from the commit
log.

For the code:

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
  
> diff --git a/drivers/mfd/intel_soc_pmic_bxtwc.c b/drivers/mfd/intel_soc_pmic_bxtwc.c
> index 699c8c7..bb18e20 100644
> --- a/drivers/mfd/intel_soc_pmic_bxtwc.c
> +++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
> @@ -94,7 +94,10 @@ enum bxtwc_irqs_level2 {
>  	BXTWC_GPIO0_IRQ,
>  	BXTWC_GPIO1_IRQ,
>  	BXTWC_CRIT_IRQ,
> -	BXTWC_TMU_IRQ,
> +};
> +
> +enum bxtwc_irqs_tmu {
> +	BXTWC_TMU_IRQ = 0,
>  };
>  
>  static const struct regmap_irq bxtwc_regmap_irqs[] = {

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
