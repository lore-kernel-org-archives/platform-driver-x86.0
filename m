From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3] platform:x86: add Intel P-Unit mailbox IPC driver
Date: Mon, 31 Aug 2015 12:38:07 -0700
Message-ID: <20150831193807.GB88873@vmdeb7>
References: <1440607117-57683-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:59371 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752128AbbHaXzQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 31 Aug 2015 19:55:16 -0400
Content-Disposition: inline
In-Reply-To: <1440607117-57683-1-git-send-email-qipeng.zha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Qipeng Zha <qipeng.zha@intel.com>, Mika Westerberg <mika.westerberg@intel.com>, "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Cc: platform-driver-x86@vger.kernel.org

On Thu, Aug 27, 2015 at 12:38:37AM +0800, Qipeng Zha wrote:
> This driver provides support for P-Unit mailbox IPC on Intel platforms.
> The heart of the P-Unit is the Foxton microcontroller and its firmware,
> which provide mailbox interface for power management usage.
> 
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> 

Thanks Qipeng. In the future, please remember to Cc the people who have reviewed
previous versions so they can provide their Reviewed-by if they are satisfied
with the changes.

> ---
> change in v3
>  Fix compile issue in intel_punit_ipc.h, it happened when built-in
> and the header file is included in other source file.
> 
> change in v2
>  Fix issues in code style and comments;
>  Remove "default y" in Kconfig;
>  Remove some header files;
>  Replace request_mem_region with devm_request_mem_region,
> and same for request_irq;
>  Change to use prefix of IPC_PUNIT_ to define commands;

Thanks for including the changelog.

...

>  IOC3 ETHERNET DRIVER
>  M:	Ralf Baechle <ralf@linux-mips.org>
> diff --git a/arch/x86/include/asm/intel_punit_ipc.h b/arch/x86/include/asm/intel_punit_ipc.h
> new file mode 100644
> index 0000000..0537434
> --- /dev/null
> +++ b/arch/x86/include/asm/intel_punit_ipc.h
> @@ -0,0 +1,101 @@
> +#ifndef _ASM_X86_INTEL_PUNIT_IPC_H_
> +#define  _ASM_X86_INTEL_PUNIT_IPC_H_
> +
> +/* Commands supported on CPU core, are handled by different bars,
> + * unify these commands together here
> + */

Always include a leading /* empty line for multi-line comments please, this is
in CodingStyle, but checkpatch missed it - likely because /net has its own
rules. I've fixed this in the version I queued to "testing".

...

> +static int intel_punit_get_bars(struct platform_device *pdev)
> +{
> +	struct resource *res0, *res1;
> +	void __iomem *addr;
> +	int size;
> +
> +	res0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res0) {
> +		dev_err(&pdev->dev, "Failed to get iomem resource\n");
> +		return -EINVAL;
> +	}
> +	size = resource_size(res0);
> +	if (!devm_request_mem_region(&pdev->dev, res0->start,
> +				     size, pdev->name)) {
> +		dev_err(&pdev->dev, "Failed to request iomem resouce\n");
> +		return -EBUSY;
> +	}
> +
> +	res1 = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!res1) {
> +		dev_err(&pdev->dev, "Failed to get iomem resource1\n");
> +		return -EINVAL;
> +	}
> +	size = resource_size(res1);
> +	if (!devm_request_mem_region(&pdev->dev, res1->start,
> +				     size, pdev->name)) {
> +		dev_err(&pdev->dev, "Failed to request iomem resouce1\n");
> +		return -EBUSY;
> +	}

These return codes, -EINVAL and -EBUSY caught my eye. -EINVAL in particular
seemed odd, I would have expected -ENXIO or -EIO. Checking intel_pmc_ipc.c, I
see it uses -ENXIO for the comparable routine. Is there a justification for the
variability here? If not, I'd prefer to see continuity across these similar
drivers.

> +
> +	addr = ioremap_nocache(res0->start,
> +			       resource_size(res0) + resource_size(res1));
> +	if (!addr) {
> +		dev_err(&pdev->dev, "Failed to ioremap ipc base\n");
> +		return  -ENOMEM;
> +	}
> +	ipcdev.base[BIOS_MAILBOX] = addr;
> +	addr += MAILBOX_REGISTER_SPACE;
> +	ipcdev.base[GTDRIVER_MAILBOX] = addr;
> +	addr += MAILBOX_REGISTER_SPACE;
> +	ipcdev.base[ISPDRIVER_MAILBOX] = addr;
> +
> +	return 0;
> +}
> +
> +static int intel_punit_ipc_probe(struct platform_device *pdev)
> +{
> +	int irq, ret;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		ipcdev.irq = 0;
> +		dev_warn(&pdev->dev, "Invalid IRQ\n");
> +	} else {
> +		if (devm_request_irq(&pdev->dev, irq, intel_punit_ioc,
> +				     IRQF_NO_SUSPEND, "intel_punit_ipc",
> +				     &ipcdev)) {
> +			dev_err(&pdev->dev, "Failed to request irq: %d\n", irq);
> +			return -EBUSY;
> +		}
> +		ipcdev.irq = irq;
> +	}
> +
> +	ret = intel_punit_get_bars(pdev);
> +	if (ret)
> +		return ret;
> +

This white space usage of the ret, if(ret) return ret block is typical and
nicely separates the logical blocks of the function. There are many throughout
this file that do not use any whitespace. This is fairly minor, but if we're
respinning, please do a pass and add some newlines around similar blocks.


-- 
Darren Hart
Intel Open Source Technology Center
