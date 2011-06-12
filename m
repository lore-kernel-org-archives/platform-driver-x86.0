From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 4/25] sony-laptop: new SNC setup and cleanup functions
Date: Mon, 13 Jun 2011 07:21:24 +0900
Message-ID: <20110612222123.GB31095@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE8FE7B.6090602@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:62939 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754437Ab1FLWV1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 12 Jun 2011 18:21:27 -0400
Received: by pvg12 with SMTP id 12so1872041pvg.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jun 2011 15:21:26 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DE8FE7B.6090602@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Fri, Jun 03, 2011 at 05:32:11PM +0200, Marco Chiappero wrote:
> New SNC setup and cleanup functions, sony_nc_snc_setup and
> sony_nc_snc_cleanup, to avoid eccessive tainting of sony_nc_add and
> sony_nc_remove, with cleaner and easier to read code, better event
> initialization and better error handling.
> 
> Signed-off-by: Marco Chiappero <marco@absence.it>
> ---
> 
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -1736,6 +1736,66 @@ static void sony_nc_backlight_cleanup(vo
>  		backlight_device_unregister(sony_bl_props.dev);
>  }
> 
> +static int sony_nc_snc_setup(struct platform_device *pd)

To be honest these sony_nc_snc_* functions are a bit poorly named.
sony_nc_ was already supposed to be a partial expansion of SNC so this
whole thing is a bit redundant now. what about
sony_nc_setup/sony_nc_cleanup?

> +{
> +	unsigned int i, string[4], bitmask, result;
> +
> +	for (i = 0; i < 4; i++) {
> +		if (acpi_callsetfunc(sony_nc_acpi_handle,
> +				"SN00", i, &string[i]))
> +			return -EIO;
> +	}
> +	if (strncmp("SncSupported", (char *) string, 0x10)) {
> +		pr_info("SNC device present but not supported by hardware");
> +		return -1;
> +	}

oh lord. For the record, this is:
	 Store (0x53636E53, Index (CFGI, Zero))
	 Store (0x6F707075, Index (CFGI, One))
	 Store (0x64657472, Index (CFGI, 0x02))

But does it ever happen that it's not supported? Also, not all models
seem to have those fields with exactly that string. I'd rather not have
this check here.

> +
> +	if (!acpi_callsetfunc(sony_nc_acpi_handle, "SN00", 0x04, &result)) {
> +		unsigned int model, i;
> +		for (model = 0, i = 0; i < 4; i++)
> +			model |= ((result >> (i * 8)) & 0xff) << ((3 - i) * 8);
> +		pr_info("found Vaio model ID: %u\n", model);
> +	}
> +
> +	/* retrieve the implemented offsets mask */
> +	if (acpi_callsetfunc(sony_nc_acpi_handle, "SN00", 0x10, &bitmask))
> +		return -EIO;

not all models seem to have this bitmask either, default to 0xffff as is
today if the call to SN00(0x10) returns an error please.

> +	/* retrieve the available handles, otherwise return */
> +	if (sony_nc_handles_setup(pd))
> +		return -2;

can't we just return the value from the function call instead of
-ENOENT?

> +
> +	/* setup found handles here */
> +	sony_nc_kbd_backlight_setup(pd);
> +	sony_nc_function_setup(sony_nc_acpi_device);
> +	sony_nc_rfkill_setup(sony_nc_acpi_device);
> +
> +	/* Enable all events for the found handles, otherwise return */
> +	if (acpi_callsetfunc(sony_nc_acpi_handle, "SN02", bitmask, &result))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int sony_nc_snc_cleanup(struct platform_device *pd)
> +{
> +	unsigned int result, bitmask;
> +
> +	/* retrieve the event enabled handles */
> +	acpi_callgetfunc(sony_nc_acpi_handle, "SN01", &bitmask);
> +
> +	/* disable the event generation	for every handle */
> +	acpi_callsetfunc(sony_nc_acpi_handle, "SN03", bitmask, &result);
> +
> +	/* cleanup handles here */
> +	sony_nc_kbd_backlight_cleanup(pd);
> +	sony_nc_rfkill_cleanup();
> +
> +	sony_nc_handles_cleanup(pd);
> +
> +	return 0;
> +}
> +
>  static int sony_nc_add(struct acpi_device *device)
>  {
>  	acpi_status status;
> @@ -1783,21 +1843,16 @@ static int sony_nc_add(struct acpi_devic
>  	if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "SN00",
>  					 &handle))) {
>  		dprintk("Doing SNC setup\n");
> -		result = sony_nc_handles_setup(sony_pf_device);
> -		if (result)
> -			goto outpresent;
> -		result = sony_nc_kbd_backlight_setup(sony_pf_device);
> -		if (result)
> +
> +		if (sony_nc_snc_setup(sony_pf_device))
>  			goto outsnc;
> -		sony_nc_function_setup(device);
> -		sony_nc_rfkill_setup(device);
>  	}
> 
>  	/* setup input devices and helper fifo */
>  	result = sony_laptop_setup_input(device);
>  	if (result) {
>  		pr_err("Unable to create input devices\n");
> -		goto outkbdbacklight;
> +		goto outsnc;
>  	}
> 
>  	if (acpi_video_backlight_support()) {
> @@ -1855,17 +1910,13 @@ static int sony_nc_add(struct acpi_devic
> 
>  	sony_laptop_remove_input();
> 
> -      outkbdbacklight:
> -	sony_nc_kbd_backlight_cleanup(sony_pf_device);
> -
>        outsnc:
> -	sony_nc_handles_cleanup(sony_pf_device);
> +	sony_nc_snc_cleanup(sony_pf_device);
> 
>        outpresent:
>  	sony_pf_remove();
> 
>        outwalk:
> -	sony_nc_rfkill_cleanup();
>  	return result;
>  }
> 
> @@ -1881,11 +1932,9 @@ static int sony_nc_remove(struct acpi_de
>  		device_remove_file(&sony_pf_device->dev, &item->devattr);
>  	}
> 
> -	sony_nc_kbd_backlight_cleanup(sony_pf_device);
> -	sony_nc_handles_cleanup(sony_pf_device);
> +	sony_nc_snc_cleanup(sony_pf_device);
>  	sony_pf_remove();
>  	sony_laptop_remove_input();
> -	sony_nc_rfkill_cleanup();
>  	dprintk(SONY_NC_DRIVER_NAME " removed.\n");
> 
>  	return 0;
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-- 
mattia
:wq!
