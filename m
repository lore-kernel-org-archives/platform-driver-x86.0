From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad-laptop: add a new WMI string for ESC key
Date: Wed, 11 May 2016 13:09:37 -0700
Message-ID: <20160511200937.GC4225@f23x64.localdomain>
References: <1462830577-1670360-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45391 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932082AbcEKUJp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 May 2016 16:09:45 -0400
Content-Disposition: inline
In-Reply-To: <1462830577-1670360-1-git-send-email-arnd@arndb.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ike Panhc <ike.pan@canonical.com>, Denis Gordienko <denis.gordienko.mail@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Josh Boyer <jwboyer@fedoraproject.org>, Philippe Coval <philippe.coval@open.eurogiciel.org>, Christian Hesse <mail@eworm.de>, Dmitry Tunin <hanipouspilot@gmail.com>, John Dahlstrom <jodarom@SDF.ORG>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, May 09, 2016 at 11:49:21PM +0200, Arnd Bergmann wrote:
> My patch to the ideapad-laptop driver to get the ESC key working on the
> Yoga 1170 (Yoga 3) failed to do the same for the following model, the
> Lenovo Yoga 700.
> 
> Denis Gordienko managed to get it working by adding another GUID for the
> new WMI interface. I have adapted his patch to normal coding style
> and simplified it a bit for inclusion, but this patch is currently
> untested.
> 
> Link: https://forums.lenovo.com/t5/Lenovo-Yoga-Series-Notebooks/YOGA-3-14-How-to-reclaim-my-Esc-key-and-permanently-disable/m-p/3317499
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Denis Gordienko <denis.gordienko.mail@gmail.com>

Looks good to me, but of course I would like to see some testing. Denis, I
presume you have a Yoga 700 you could verify this version of your patch on?
Would you be willing to do so?


> ---
>  drivers/platform/x86/ideapad-laptop.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 1d49db124753..531ecca9dbe3 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -48,7 +48,10 @@
>  #define CFG_CAMERA_BIT	(19)
>  
>  #if IS_ENABLED(CONFIG_ACPI_WMI)
> -static const char ideapad_wmi_fnesc_event[] = "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6";
> +static const char* ideapad_wmi_fnesc_events[] = {
> +	"26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", /* Yoga 3 */
> +	"56322276-8493-4CE8-A783-98C991274F5E", /* Yoga 700 */
> +};
>  #endif
>  
>  enum {
> @@ -93,6 +96,7 @@ struct ideapad_private {
>  	struct dentry *debug;
>  	unsigned long cfg;
>  	bool has_hw_rfkill_switch;
> +	const char *fnesc_guid;
>  };
>  
>  static bool no_bt_rfkill;
> @@ -990,8 +994,16 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  		ACPI_DEVICE_NOTIFY, ideapad_acpi_notify, priv);
>  	if (ret)
>  		goto notification_failed;
> +
>  #if IS_ENABLED(CONFIG_ACPI_WMI)
> -	ret = wmi_install_notify_handler(ideapad_wmi_fnesc_event, ideapad_wmi_notify, priv);
> +	for (i = 0; i < ARRAY_SIZE(ideapad_wmi_fnesc_events); i++) {
> +		ret = wmi_install_notify_handler(ideapad_wmi_fnesc_events[i],
> +						 ideapad_wmi_notify, priv);
> +		if (ret == AE_OK) {
> +			priv->fnesc_guid = ideapad_wmi_fnesc_events[i];
> +			break;
> +		}
> +        }
>  	if (ret != AE_OK && ret != AE_NOT_EXIST)
>  		goto notification_failed_wmi;
>  #endif
> @@ -1021,7 +1033,8 @@ static int ideapad_acpi_remove(struct platform_device *pdev)
>  	int i;
>  
>  #if IS_ENABLED(CONFIG_ACPI_WMI)
> -	wmi_remove_notify_handler(ideapad_wmi_fnesc_event);
> +	if (priv->fnesc_guid)
> +		wmi_remove_notify_handler(priv->fnesc_guid);
>  #endif
>  	acpi_remove_notify_handler(priv->adev->handle,
>  		ACPI_DEVICE_NOTIFY, ideapad_acpi_notify);
> -- 
> 2.7.0
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
