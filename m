From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-wmi: fix asus ux303ub brightness issue
Date: Sun, 28 Aug 2016 10:34:53 -0700
Message-ID: <20160828173453.GF96930@f23x64.localdomain>
References: <1472371926-7936-1-git-send-email-linzino7@gmai.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:54308 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755781AbcH1Re4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 28 Aug 2016 13:34:56 -0400
Content-Disposition: inline
In-Reply-To: <1472371926-7936-1-git-send-email-linzino7@gmai.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Zino Lin <linzino7@gmail.com>
Cc: corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>

On Sun, Aug 28, 2016 at 04:12:06PM +0800, Zino Lin wrote:
> From: zino lin <linzino7@gmail.com>
> 
> acpi_video0 doesn't work, asus-wmi brightness interface doesn't work, too.
> So, we use native brightness interface to handle the brightness adjustion,
> and add quirk_asus_ux303ub.

Thanks Zino,

+Rafael in case he has an opinion wrt to the acpi_video bit.

Looking for an Ack from Corentin, but otherwise this looks fine to me.

> 
> Signed-off-by: zino lin <linzino7@gmail.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
>  drivers/platform/x86/asus-wmi.c    |  3 +++
>  drivers/platform/x86/asus-wmi.h    |  1 +
>  3 files changed, 17 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index adecc1c..456ad8e 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -87,6 +87,10 @@ static struct quirk_entry quirk_no_rfkill_wapf4 = {
>  	.no_rfkill = true,
>  };
>  
> +static struct quirk_entry quirk_asus_ux303ub = {
> +	.wmi_backlight_native = true,
> +};
> +
>  static int dmi_matched(const struct dmi_system_id *dmi)
>  {
>  	quirks = dmi->driver_data;
> @@ -351,6 +355,15 @@ static const struct dmi_system_id asus_quirks[] = {
>  		},
>  		.driver_data = &quirk_no_rfkill,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "ASUSTeK COMPUTER INC. UX303UB",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "UX303UB"),
> +		},
> +		.driver_data = &quirk_asus_ux303ub,
> +	},
>  	{},
>  };
>  
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 7c093a0..ce6ca31 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2084,6 +2084,9 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	if (asus->driver->quirks->wmi_backlight_power)
>  		acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
>  
> +	if (asus->driver->quirks->wmi_backlight_native)
> +		acpi_video_set_dmi_backlight_type(acpi_backlight_native);
> +
>  	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
>  		err = asus_wmi_backlight_init(asus);
>  		if (err && err != -ENODEV)
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
> index 5de1df5..5e22041 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -43,6 +43,7 @@ struct quirk_entry {
>  	bool scalar_panel_brightness;
>  	bool store_backlight_power;
>  	bool wmi_backlight_power;
> +	bool wmi_backlight_native;
>  	int wapf;
>  	/*
>  	 * For machines with AMD graphic chips, it will send out WMI event
> -- 
> 2.7.4
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
