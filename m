From: Alan Cox <alan@linux.intel.com>
Subject: Re: [PATCH] gpio: Add PMIC GPIO block support
Date: Fri, 9 Jul 2010 14:35:57 +0100
Message-ID: <20100709143557.05a0974d@linux.intel.com>
References: <20100708170818.16711.74269.stgit@localhost.localdomain>
	<20100708193708.GA5319@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:61302 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755882Ab0GIOE4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Jul 2010 10:04:56 -0400
In-Reply-To: <20100708193708.GA5319@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

On Thu, 8 Jul 2010 20:37:08 +0100
Matthew Garrett <mjg59@srcf.ucam.org> wrote:

> On Thu, Jul 08, 2010 at 06:09:27PM +0100, Alan Cox wrote:
> > +	else if (offset < 14)/* it is GPOSW */
> > +		rc = intel_scu_ipc_update_register(GPOSWCTL0 +
> > offset - 8,
> > +				GPOSW_DRV | GPOSW_DOU | GPOSW_RDRV,
> > +				GPOSW_DRV | (value ? GPOSW_DOU :
> > 0));
> > +	else if (offset > 15 && offset < 24)/* it is GPO */
> 
> What happened to gpios 14 and 15?

Good question. I will double check this is correct but since everyone
is using the driver its probably right

> > +
> > +static int pmic_gpio_get(struct gpio_chip *chip, unsigned offset)
> > +{
> > +	u8 r;
> > +
> > +	/* we only have 8 GPIO pins we can use as input */
> > +	if (offset > 8)
> > +		return -1;
> 
> Is there any chance of this getting passed up to userspace? Using 
> something more descriptive would be nice (ditto for a couple of other 
> places)

No but it can get back to the caller. Right now gpiolib isn't really
internally sure what to do about gpio reads failing. Given that I might
as well hand back -Efoo codes.

> > +	if (intel_scu_ipc_ioread8(GPIO0 + offset, &r))
> > +		return -1;
> 
> ...especially since you get the same error for two different failure 
> modes :)
> 
> > +static int pmic_irq_type(unsigned irq, unsigned type)
> > +{
> > +	struct pmic_gpio *pg = get_irq_chip_data(irq);
> > +	u32 gpio = irq - pg->irq_base;
> > +	unsigned long flags;
> > +
> > +	if (gpio < 0 || gpio > pg->chip.ngpio)
> 
> It's unsigned, don't need to check that it's < 0.

Fixed

> I don't think it's really necessary to indicate that the driver's
> loaded here.

Agreed, fixed

> > +	if (!pdata || !pdata->gpio_base || !pdata->irq_base) {
> > +		dev_dbg(dev, "incorrect or missing platform
> > data\n");
> > +		return -EINVAL;
> > +	}
> 
> Shouldn't there be an is_mrst() check before trying to dereference
> this?

We check pdata == NULL so in the theoretical case someone loaded the
driver on the wrong platform and cooked up a device match you'd still
be ok

Alan
