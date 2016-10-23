From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1 5/6] intel_pmc_core: Add LTR IGNORE debug feature
Date: Sun, 23 Oct 2016 08:15:59 -0700
Message-ID: <20161023151559.GD120221@f23x64.localdomain>
References: <1475836277-4788-1-git-send-email-rajneesh.bhardwaj@intel.com>
 <1475836277-4788-6-git-send-email-rajneesh.bhardwaj@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:58168 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753245AbcJWPPq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Oct 2016 11:15:46 -0400
Content-Disposition: inline
In-Reply-To: <1475836277-4788-6-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: platform-driver-x86@vger.kernel.org, andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org

On Fri, Oct 07, 2016 at 04:01:16PM +0530, Rajneesh Bhardwaj wrote:
> SPT LTR_IGN register provides a means to make the PMC ignore the LTR values
> reported by the individual PCH devices.
> 
> echo <IP Offset> > /sys/kernel/debug/pmc_core/ltr_ignore.
> 
> When a particular IP Offset bit is set the PMC will ignore the LTR value
> reported by the corresponding IP when the PMC performs the latency
> coalescing.
> 
> IP Offset	IP Name
> 0		SPA
> 1		SPB
> 2		SATA
> 3		GBE
> 4		XHCI
> 5		RSVD
> 6		ME
> 7		EVA
> 8		SPC
> 9		Azalia/ADSP
> 10		RSVD
> 11		LPSS
> 12		SPD
> 13		SPE
> 14		Camera
> 15		ESPI
> 16		SCC
> 17		ISH
> 
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> ---
>  drivers/platform/x86/intel_pmc_core.c | 57 ++++++++++++++++++++++++++++++++++-
>  drivers/platform/x86/intel_pmc_core.h |  2 ++
>  2 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 4840158..5b867b7 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -19,11 +19,12 @@
>   */
>  
>  #include <linux/debugfs.h>
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/pci.h>
> -#include <linux/delay.h>
> +#include <linux/uaccess.h>
>  
>  #include <asm/cpu_device_id.h>
>  #include <asm/intel-family.h>
> @@ -373,6 +374,53 @@ static const struct file_operations pmc_core_pll_ops = {
>  	.release        = single_release,
>  };
>  
> +static ssize_t pmc_core_ltr_ignore_write(struct file *file, const char __user
> +*userbuf, size_t count, loff_t *ppos)
> +{
> +	u32 val, buf_size, fd;
> +	int err = 0;
> +	struct pmc_dev *pmcdev = &pmc;

Nit for future reference, declare in order of line length when possible, longest
first. I corrected in the series I pushed to 'testing'. No need to resend.

-- 
Darren Hart
Intel Open Source Technology Center
