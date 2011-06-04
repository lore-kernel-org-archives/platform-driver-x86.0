From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 10/25] sony-laptop: keyboard backlight support extended
 to newer Vaios
Date: Sat, 4 Jun 2011 16:58:17 +0900
Message-ID: <20110604075815.GA7194@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE9008D.7040504@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:35995 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753072Ab1FDH6N (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 4 Jun 2011 03:58:13 -0400
Received: by pzk9 with SMTP id 9so1123772pzk.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Jun 2011 00:58:12 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DE9008D.7040504@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Fri, Jun 03, 2011 at 05:41:01PM +0200, Marco Chiappero wrote:
> Added support for handle 0x0143 (Vaio SA/SB/SC, CA/CB). Minor
> corrections included.
> 
> Signed-off-by: Marco Chiappero <marco@absence.it>
> ---
> 
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -127,7 +127,7 @@ MODULE_PARM_DESC(minor,
>  		 "default is -1 (automatic)");
>  #endif
> 
> -static int kbd_backlight;	/* = 1 */
> +static int kbd_backlight;	/* = 0 */
>  module_param(kbd_backlight, int, 0444);
>  MODULE_PARM_DESC(kbd_backlight,
>  		 "set this to 0 to disable keyboard backlight, "
> @@ -140,15 +140,6 @@ MODULE_PARM_DESC(kbd_backlight_timeout,
>  		 "1 for 30 seconds, 2 for 60 seconds and 3 to disable timeout "
>  		 "(default: 0)");
> 
> -static void sony_nc_kbd_backlight_resume(void);
> -
> -enum sony_nc_rfkill {
> -	SONY_WIFI,
> -	SONY_BLUETOOTH,
> -	SONY_WWAN,
> -	SONY_WIMAX,
> -	N_SONY_RFKILL,
> -};

removing this enum seems superfluous (it's re-added some patches later)
and breaks compilation at this point.

>  static int sony_rfkill_handle;
>  static struct rfkill *sony_rfkill_devices[N_SONY_RFKILL];
> @@ -1356,38 +1347,33 @@ static int sony_nc_rfkill_setup(struct a
>  }
> 
>  /* Keyboard backlight feature */
> -#define KBDBL_HANDLER	0x137
> -#define KBDBL_PRESENT	0xB00
> -#define	SET_MODE	0xC00
> -#define SET_STATE	0xD00
> -#define SET_TIMEOUT	0xE00
> -
>  struct kbd_backlight {
> -	int mode;
> -	int timeout;
> +	unsigned int base;
> +	unsigned int mode;
> +	unsigned int timeout;
>  	struct device_attribute mode_attr;
>  	struct device_attribute timeout_attr;
>  };
> -
>  static struct kbd_backlight *kbdbl_handle;
> +static int sony_kbd_handle = -1;

there seems to be no real point initializing this to -1. Also, can it be
made part of the struct above?

> -static ssize_t __sony_nc_kbd_backlight_mode_set(u8 value)
> +static int __sony_nc_kbd_backlight_mode_set(u8 value)
>  {
>  	unsigned int result;
> 
>  	if (value > 1)
>  		return -EINVAL;
> 
> -	if (sony_call_snc_handle(KBDBL_HANDLER,
> -				(value << 0x10) | SET_MODE, &result))
> +	if (sony_call_snc_handle(sony_kbd_handle, (value << 0x10) |
> +				(kbdbl_handle->base), &result))
>  		return -EIO;
> 
> -	/* Try to turn the light on/off immediately */
> -	sony_call_snc_handle(KBDBL_HANDLER, (value << 0x10) | SET_STATE,
> -			&result);
> -
>  	kbdbl_handle->mode = value;
> 
> +	/* Try to turn the light on/off immediately */
> +	sony_call_snc_handle(sony_kbd_handle, (value << 0x10) |
> +				(kbdbl_handle->base + 0x100), &result);
> +
>  	return 0;
>  }
> 
> @@ -1415,7 +1401,9 @@ static ssize_t sony_nc_kbd_backlight_mod
>  		struct device_attribute *attr, char *buffer)
>  {
>  	ssize_t count = 0;
> +
>  	count = snprintf(buffer, PAGE_SIZE, "%d\n", kbdbl_handle->mode);
> +
>  	return count;
>  }
> 
> @@ -1426,8 +1414,8 @@ static int __sony_nc_kbd_backlight_timeo
>  	if (value > 3)
>  		return -EINVAL;
> 
> -	if (sony_call_snc_handle(KBDBL_HANDLER,
> -				(value << 0x10) | SET_TIMEOUT, &result))
> +	if (sony_call_snc_handle(sony_kbd_handle, (value << 0x10) |
> +				(kbdbl_handle->base + 0x200), &result))
>  		return -EIO;
> 
>  	kbdbl_handle->timeout = value;
> @@ -1459,18 +1447,36 @@ static ssize_t sony_nc_kbd_backlight_tim
>  		struct device_attribute *attr, char *buffer)
>  {
>  	ssize_t count = 0;
> +
>  	count = snprintf(buffer, PAGE_SIZE, "%d\n", kbdbl_handle->timeout);
> +
>  	return count;
>  }
> 
>  static int sony_nc_kbd_backlight_setup(struct platform_device *pd)
>  {
> -	unsigned int result;
> +	unsigned int result, base_cmd;
> +	bool found = false;
> 
> -	if (sony_call_snc_handle(KBDBL_HANDLER, KBDBL_PRESENT, &result))
> -		return 0;
> -	if (!(result & 0x02))
> +	/* verify the kbd backlight presence, some models do not have it */
> +	if (sony_kbd_handle == 0x0137) {
> +		if (sony_call_snc_handle(sony_kbd_handle, 0x0B00, &result))
> +			return -EIO;
> +
> +		found = !!(result & 0x02);
> +		base_cmd = 0x0C00;
> +	} else {
> +		if (sony_call_snc_handle(sony_kbd_handle, 0x0100, &result))
> +			return -EIO;
> +
> +		found = result & 0x01;
> +		base_cmd = 0x4000;
> +	}
> +
> +	if (!found) {
> +		dprintk("no backlight keyboard found\n");
>  		return 0;
> +	}
> 
>  	kbdbl_handle = kzalloc(sizeof(*kbdbl_handle), GFP_KERNEL);
>  	if (!kbdbl_handle)
> @@ -1494,6 +1500,8 @@ static int sony_nc_kbd_backlight_setup(s
>  	if (device_create_file(&pd->dev, &kbdbl_handle->timeout_attr))
>  		goto outmode;
> 
> +	kbdbl_handle->base = base_cmd;
> +
>  	__sony_nc_kbd_backlight_mode_set(kbd_backlight);
>  	__sony_nc_kbd_backlight_timeout_set(kbd_backlight_timeout);
> 
> @@ -1516,28 +1524,32 @@ static int sony_nc_kbd_backlight_cleanup
>  		device_remove_file(&pd->dev, &kbdbl_handle->timeout_attr);
> 
>  		/* restore the default hw behaviour */
> -		sony_call_snc_handle(KBDBL_HANDLER, 0x1000 | SET_MODE, &result);
> -		sony_call_snc_handle(KBDBL_HANDLER, SET_TIMEOUT, &result);
> +		sony_call_snc_handle(sony_kbd_handle,
> +				kbdbl_handle->base | 0x10000, &result);
> +		sony_call_snc_handle(sony_kbd_handle,
> +				kbdbl_handle->base + 0x200, &result);
> 
>  		kfree(kbdbl_handle);
> +		kbdbl_handle = NULL;
>  	}
>  	return 0;
>  }
> 
>  static void sony_nc_kbd_backlight_resume(void)
>  {
> -	unsigned int ignore = 0;
> +	unsigned int result;
> 
>  	if (!kbdbl_handle)
>  		return;
> 
>  	if (kbdbl_handle->mode == 0)
> -		sony_call_snc_handle(KBDBL_HANDLER, SET_MODE, &ignore);
> +		sony_call_snc_handle(sony_kbd_handle,
> +				kbdbl_handle->base, &result);
> 
>  	if (kbdbl_handle->timeout != 0)
> -		sony_call_snc_handle(KBDBL_HANDLER,
> -				(kbdbl_handle->timeout << 0x10) | SET_TIMEOUT,
> -				&ignore);
> +		sony_call_snc_handle(sony_kbd_handle,
> +				(kbdbl_handle->base + 0x200) |
> +				(kbdbl_handle->timeout << 0x10), &result);
>  }
> 
>  static void sony_nc_backlight_ng_read_limits(int handle,
> @@ -1676,6 +1688,8 @@ static void sony_nc_snc_setup_handles(st
>  			ret = sony_nc_function_setup(handle);
>  			break;
>  		case 0x0137:
> +		case 0x0143:
> +			sony_kbd_handle = handle;
>  			ret = sony_nc_kbd_backlight_setup(pd);
>  			break;
>  		case 0x0124:
> @@ -1710,6 +1724,7 @@ static void sony_nc_snc_cleanup_handles(
> 
>  		switch (handle) {
>  		case 0x0137:
> +		case 0x0143:
>  			sony_nc_kbd_backlight_cleanup(pd);
>  			break;
>  		case 0x0124:
> @@ -1814,6 +1829,7 @@ static int sony_nc_snc_resume(void)
>  			sony_nc_rfkill_update();
>  			break;
>  		case 0x0137: /* kbd + als */
> +		case 0x0143:
>  			sony_nc_kbd_backlight_resume();
>  			break;
>  		default:
-- 
mattia
:wq!
