From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] gpio: Add PMIC GPIO block support
Date: Thu, 8 Jul 2010 20:37:08 +0100
Message-ID: <20100708193708.GA5319@srcf.ucam.org>
References: <20100708170818.16711.74269.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:57438 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758488Ab0GHThN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 8 Jul 2010 15:37:13 -0400
Content-Disposition: inline
In-Reply-To: <20100708170818.16711.74269.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org

On Thu, Jul 08, 2010 at 06:09:27PM +0100, Alan Cox wrote:
> +	else if (offset < 14)/* it is GPOSW */
> +		rc = intel_scu_ipc_update_register(GPOSWCTL0 + offset - 8,
> +				GPOSW_DRV | GPOSW_DOU | GPOSW_RDRV,
> +				GPOSW_DRV | (value ? GPOSW_DOU : 0));
> +	else if (offset > 15 && offset < 24)/* it is GPO */

What happened to gpios 14 and 15?

> +
> +static int pmic_gpio_get(struct gpio_chip *chip, unsigned offset)
> +{
> +	u8 r;
> +
> +	/* we only have 8 GPIO pins we can use as input */
> +	if (offset > 8)
> +		return -1;

Is there any chance of this getting passed up to userspace? Using 
something more descriptive would be nice (ditto for a couple of other 
places)

> +	if (intel_scu_ipc_ioread8(GPIO0 + offset, &r))
> +		return -1;

...especially since you get the same error for two different failure 
modes :)

> +static int pmic_irq_type(unsigned irq, unsigned type)
> +{
> +	struct pmic_gpio *pg = get_irq_chip_data(irq);
> +	u32 gpio = irq - pg->irq_base;
> +	unsigned long flags;
> +
> +	if (gpio < 0 || gpio > pg->chip.ngpio)

It's unsigned, don't need to check that it's < 0.

> +static int __devinit platform_pmic_gpio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int irq = platform_get_irq(pdev, 0);
> +	struct intel_pmic_gpio_platform_data *pdata = dev->platform_data;

I don't think it's really necessary to indicate that the driver's loaded 
here.

> +	if (!pdata || !pdata->gpio_base || !pdata->irq_base) {
> +		dev_dbg(dev, "incorrect or missing platform data\n");
> +		return -EINVAL;
> +	}

Shouldn't there be an is_mrst() check before trying to dereference this?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
