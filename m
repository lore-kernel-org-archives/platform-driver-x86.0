From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v5 4/6] watchdog: iTCO_wdt: cleanup set/unset no_reboot
 calls
Date: Mon, 3 Apr 2017 20:22:59 -0700
Message-ID: <d50aed46-40e1-cfba-e3c2-a637f38f32b6@roeck-us.net>
References: <CAENHMvOyzbhDQzvpYFcxC9mvsfDGrco9RMy+rU=faT6RN_uW3A@mail.gmail.com>
 <26b8a87af5084168576cba4feaca689a84abd867.1491264643.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <26b8a87af5084168576cba4feaca689a84abd867.1491264643.git.sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, david.e.box-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rajneesh.bhardwaj-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On 04/03/2017 05:24 PM, Kuppuswamy Sathyanarayanan wrote:
> Both iTCO_wdt_unset_NO_REBOOT_bit() and iTCO_wdt_unset_NO_REBOOT_bit()

I think you mean s/set/unset/ once.

> functions has lot of common code between them. So merging these two
> functions would remove these unnecessary code duplications. This patch
> fixes this issue by creating single update function to handle both
> set/unset functionalities.
>
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/watchdog/iTCO_wdt.c | 53 ++++++++++++++++-----------------------------
>  1 file changed, 19 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 521ae95..cddfa00 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -172,50 +172,35 @@ static inline u32 no_reboot_bit(struct iTCO_wdt_private *p)
>  	return enable_bit;
>  }
>
> -static void iTCO_wdt_set_NO_REBOOT_bit(struct iTCO_wdt_private *p)
> +static int iTCO_wdt_update_no_reboot_flag(struct iTCO_wdt_private *p,

Why not stick with bit ?

> +					  bool status)

I think 'set' would be better than 'status'.

>  {
> -	u32 val32;
> +	u32 val32 = 0, newval32 = 0;
>
> -	/* Set the NO_REBOOT bit: this disables reboots */
>  	if (p->iTCO_version >= 2) {
>  		if (p->update_noreboot_flag)
> -			p->update_noreboot_flag(true);
> +			return p->update_noreboot_flag(status);
>  		else {
>  			val32 = readl(p->gcs_pmc);
> -			val32 |= no_reboot_bit(p);
> -			writel(val32, p->gcs_pmc);
> -		}
> -	} else if (p->iTCO_version == 1) {
> -		pci_read_config_dword(p->pci_dev, 0xd4, &val32);
> -		val32 |= no_reboot_bit(p);
> -		pci_write_config_dword(p->pci_dev, 0xd4, val32);
> -	}
> -}
> -
> -static int iTCO_wdt_unset_NO_REBOOT_bit(struct iTCO_wdt_private *p)
> -{
> -	u32 enable_bit = no_reboot_bit(p);
> -	u32 val32 = 0;
> +			if (status)
> +				val32 |= no_reboot_bit(p);
> +			else
> +				val32 &= ~no_reboot_bit(p);
>
> -	/* Unset the NO_REBOOT bit: this enables reboots */
> -	if (p->iTCO_version >= 2) {
> -		if (p->update_noreboot_flag)
> -			return p->update_noreboot_flag(false);
> -		else {
> -			val32 = readl(p->gcs_pmc);
> -			val32 &= ~enable_bit;
>  			writel(val32, p->gcs_pmc);
> -			val32 = readl(p->gcs_pmc);
> +			newval32 = readl(p->gcs_pmc);
>  		}
>  	} else if (p->iTCO_version == 1) {
>  		pci_read_config_dword(p->pci_dev, 0xd4, &val32);
> -		val32 &= ~enable_bit;
> +		if (status)
> +			val32 |= no_reboot_bit(p);
> +		else
> +			val32 &= ~no_reboot_bit(p);
>  		pci_write_config_dword(p->pci_dev, 0xd4, val32);
> -
> -		pci_read_config_dword(p->pci_dev, 0xd4, &val32);
> +		pci_read_config_dword(p->pci_dev, 0xd4, &newval32);
>  	}
>
> -	if (val32 & enable_bit)
> +	if (val32 != newval32)
>  		return -EIO;
>
>  	return 0;
> @@ -231,7 +216,7 @@ static int iTCO_wdt_start(struct watchdog_device *wd_dev)
>  	iTCO_vendor_pre_start(p->smi_res, wd_dev->timeout);
>
>  	/* disable chipset's NO_REBOOT bit */
> -	if (iTCO_wdt_unset_NO_REBOOT_bit(p)) {
> +	if (iTCO_wdt_update_no_reboot_flag(p, false)) {
>  		spin_unlock(&p->io_lock);
>  		pr_err("failed to reset NO_REBOOT flag, reboot disabled by hardware/BIOS\n");
>  		return -EIO;
> @@ -272,7 +257,7 @@ static int iTCO_wdt_stop(struct watchdog_device *wd_dev)
>  	val = inw(TCO1_CNT(p));
>
>  	/* Set the NO_REBOOT bit to prevent later reboots, just for sure */
> -	iTCO_wdt_set_NO_REBOOT_bit(p);
> +	iTCO_wdt_update_no_reboot_flag(p, true);
>
>  	spin_unlock(&p->io_lock);
>
> @@ -452,14 +437,14 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  	}
>
>  	/* Check chipset's NO_REBOOT bit */
> -	if (iTCO_wdt_unset_NO_REBOOT_bit(p) &&
> +	if (iTCO_wdt_update_no_reboot_flag(p, false) &&
>  	    iTCO_vendor_check_noreboot_on()) {
>  		pr_info("unable to reset NO_REBOOT flag, device disabled by hardware/BIOS\n");
>  		return -ENODEV;	/* Cannot reset NO_REBOOT bit */
>  	}
>
>  	/* Set the NO_REBOOT bit to prevent later reboots, just for sure */
> -	iTCO_wdt_set_NO_REBOOT_bit(p);
> +	iTCO_wdt_update_no_reboot_flag(p, true);
>
>  	/* The TCO logic uses the TCO_EN bit in the SMI_EN register */
>  	if (!devm_request_region(dev, p->smi_res->start,
>

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
