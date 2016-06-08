From: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for HKEY
	version 0x200
Date: Wed, 8 Jun 2016 12:30:06 -0700
Message-ID: <20160608193006.GB28348@f23x64.localdomain>
References: <20160607235338.GA3147@khazad-dum.debian.net>
	<1465397665-9343-1-git-send-email-cpaul@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465397665-9343-1-git-send-email-cpaul-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Lyude <cpaul-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:THINKPAD ACPI EXTRAS DRIVER" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:THINKPAD ACPI EXTRAS DRIVER" <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Dennis Wassenberg <dennis.wassenberg-opNxpl+3fjRBDgjK7y7TUQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 08, 2016 at 10:54:25AM -0400, Lyude wrote:
> From: Dennis Wassenberg <dennis.wassenberg-opNxpl+3fjRBDgjK7y7TUQ@public.gmane.org>
> 
> Lenovo Thinkpad devices T460, T460s, T460p, T560, X260 use
> HKEY version 0x200 without adaptive keyboard.
> 
> HKEY version 0x200 has method MHKA with one parameter value.
> Passing parameter value 1 will get hotkey_all_mask (the same like
> HKEY version 0x100 without parameter). Passing parameter value 2 to
> MHKA method will retrieve hotkey_all_adaptive_mask. If 0 is returned in
> that case there is no adaptive keyboard available.
> 
> Signed-off-by: Dennis Wassenberg <dennis.wassenberg-opNxpl+3fjRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Lyude <cpaul-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Tested-by: Lyude <cpaul-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Tested-by: Marco Trevisan <marco-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
> Acked-by: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
> ---
> Changes since v1:
>  - Fix all of the indenting issues
>  - Add appropriate Tested-by's, Signed-off's, etc.
> 
>  drivers/platform/x86/thinkpad_acpi.c | 85 ++++++++++++++++++++++++++----------
>  1 file changed, 63 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 9255ff3..210ecf5 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -2043,6 +2043,7 @@ static int hotkey_autosleep_ack;
>  
>  static u32 hotkey_orig_mask;		/* events the BIOS had enabled */
>  static u32 hotkey_all_mask;		/* all events supported in fw */
> +static u32 hotkey_adaptive_all_mask;	/* all adaptive events supported in fw */
>  static u32 hotkey_reserved_mask;	/* events better left disabled */
>  static u32 hotkey_driver_mask;		/* events needed by the driver */
>  static u32 hotkey_user_mask;		/* events visible to userspace */
> @@ -2742,6 +2743,17 @@ static ssize_t hotkey_all_mask_show(struct device *dev,
>  
>  static DEVICE_ATTR_RO(hotkey_all_mask);
>  
> +/* sysfs hotkey all_mask ----------------------------------------------- */
> +static ssize_t hotkey_adaptive_all_mask_show(struct device *dev,
> +			   struct device_attribute *attr,
> +			   char *buf)
> +{
> +	return snprintf(buf, PAGE_SIZE, "0x%08x\n",
> +			hotkey_adaptive_all_mask | hotkey_source_mask);
> +}
> +
> +static DEVICE_ATTR_RO(hotkey_adaptive_all_mask);
> +
>  /* sysfs hotkey recommended_mask --------------------------------------- */
>  static ssize_t hotkey_recommended_mask_show(struct device *dev,
>  					    struct device_attribute *attr,
> @@ -2985,6 +2997,7 @@ static struct attribute *hotkey_attributes[] __initdata = {
>  	&dev_attr_wakeup_hotunplug_complete.attr,
>  	&dev_attr_hotkey_mask.attr,
>  	&dev_attr_hotkey_all_mask.attr,
> +	&dev_attr_hotkey_adaptive_all_mask.attr,
>  	&dev_attr_hotkey_recommended_mask.attr,
>  #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
>  	&dev_attr_hotkey_source_mask.attr,
> @@ -3321,20 +3334,6 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  	if (!tp_features.hotkey)
>  		return 1;
>  
> -	/*
> -	 * Check if we have an adaptive keyboard, like on the
> -	 * Lenovo Carbon X1 2014 (2nd Gen).
> -	 */
> -	if (acpi_evalf(hkey_handle, &hkeyv, "MHKV", "qd")) {
> -		if ((hkeyv >> 8) == 2) {
> -			tp_features.has_adaptive_kbd = true;
> -			res = sysfs_create_group(&tpacpi_pdev->dev.kobj,
> -					&adaptive_kbd_attr_group);
> -			if (res)
> -				goto err_exit;
> -		}
> -	}
> -
>  	quirks = tpacpi_check_quirks(tpacpi_hotkey_qtable,
>  				     ARRAY_SIZE(tpacpi_hotkey_qtable));
>  
> @@ -3357,18 +3356,16 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  	   A30, R30, R31, T20-22, X20-21, X22-24.  Detected by checking
>  	   for HKEY interface version 0x100 */
>  	if (acpi_evalf(hkey_handle, &hkeyv, "MHKV", "qd")) {
> -		if ((hkeyv >> 8) != 1) {
> -			pr_err("unknown version of the HKEY interface: 0x%x\n",
> -			       hkeyv);
> -			pr_err("please report this to %s\n", TPACPI_MAIL);
> -		} else {
> +		vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
> +			    "firmware HKEY interface version: 0x%x\n",
> +			    hkeyv);
> +
> +		switch (hkeyv >> 8) {
> +		case 1:
>  			/*
>  			 * MHKV 0x100 in A31, R40, R40e,
>  			 * T4x, X31, and later
>  			 */
> -			vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
> -				"firmware HKEY interface version: 0x%x\n",
> -				hkeyv);
>  
>  			/* Paranoia check AND init hotkey_all_mask */
>  			if (!acpi_evalf(hkey_handle, &hotkey_all_mask,
> @@ -3381,6 +3378,50 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  			} else {
>  				tp_features.hotkey_mask = 1;
>  			}
> +			break;
> +
> +		case 2:
> +			/*
> +			 * MHKV 0x200 in X1, T460s, X260, T560, X1 Tablet (2016)
> +			 */
> +
> +			/* Paranoia check AND init hotkey_all_mask */
> +			if (!acpi_evalf(hkey_handle, &hotkey_all_mask,
> +					"MHKA", "dd", 1)) {
> +				pr_err("missing MHKA handler, "
> +				       "please report this to %s\n",

Strings should be kept on the same line so they can be searched for in the
sources. I've corrected this here as well as the existing duplicate message in case 1.

Otherwise, queued for 4.8. Thanks.

-- 
Darren Hart
Intel Open Source Technology Center

------------------------------------------------------------------------------
What NetFlow Analyzer can do for you? Monitors network bandwidth and traffic
patterns at an interface-level. Reveals which users, apps, and protocols are 
consuming the most bandwidth. Provides multi-vendor support for NetFlow, 
J-Flow, sFlow and other flows. Make informed decisions using capacity 
planning reports. https://ad.doubleclick.net/ddm/clk/305295220;132659582;e
