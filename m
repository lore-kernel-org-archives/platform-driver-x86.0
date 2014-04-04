From: "Gerlach, Robert" <khnz@gmx.de>
Subject: Re: [PATCH] fujitsu-tablet: add support for Lifebook T901 and T902
Date: Fri, 04 Apr 2014 02:27:26 +0200
Message-ID: <b09d36c4970b5e95e932f518285adddf@kolab.home>
References: <5329ECD2.9020707@cottsay.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:52664 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753736AbaDDA1Y (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 Apr 2014 20:27:24 -0400
In-Reply-To: <5329ECD2.9020707@cottsay.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: Scott K Logan <logans@cottsay.net>, platform-driver-x86@vger.kernel.org

Am 19.03.2014 20:15, schrieb Scott K Logan:
> The button mappings for the Fujitsu Lifebook T901 and T902 are quite 
> different
> from the generic Lifebook T mappings that are defined. This patch adds
> mappings that are specific to the hardware on these machines, and 
> allows
> users to take advantage of features like screen rotation.
> 
> Signed-off-by: Scott K Logan <logans@cottsay.net>

Patch looks good to me. Please apply.

Acked-by: Robert Gerlach <khnz@gmx.de>


> ---
>  drivers/platform/x86/fujitsu-tablet.c | 65 
> +++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/drivers/platform/x86/fujitsu-tablet.c
> b/drivers/platform/x86/fujitsu-tablet.c
> index 570926c..c3784ba 100644
> --- a/drivers/platform/x86/fujitsu-tablet.c
> +++ b/drivers/platform/x86/fujitsu-tablet.c
> @@ -71,6 +71,44 @@ struct fujitsu_config {
>  	KEY_LEFTALT
>  };
>  +static unsigned short keymap_Lifebook_T901[KEYMAP_LEN] __initdata = {
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +	KEY_SCROLLDOWN,
> +	KEY_SCROLLUP,
> +	KEY_CYCLEWINDOWS,
> +	KEY_LEFTCTRL,
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +	KEY_LEFTMETA
> +};
> +
> +static unsigned short keymap_Lifebook_T902[KEYMAP_LEN] __initdata = {
> +	KEY_RESERVED,
> +	KEY_VOLUMEDOWN,
> +	KEY_VOLUMEUP,
> +	KEY_CYCLEWINDOWS,
> +	KEY_PROG1,
> +	KEY_PROG2,
> +	KEY_LEFTMETA,
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +	KEY_RESERVED,
> +};
> +
>  static unsigned short keymap_Lifebook_U810[KEYMAP_LEN] __initdata = {
>  	KEY_RESERVED,
>  	KEY_RESERVED,
> @@ -302,6 +340,33 @@ static int fujitsu_dmi_stylistic(const struct
> dmi_system_id *dmi)
>  static const struct dmi_system_id dmi_ids[] __initconst = {
>  	{
>  		.callback = fujitsu_dmi_lifebook,
> +		.ident = "Fujitsu Lifebook T901",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "LifeBook T901")
> +		},
> +		.driver_data = keymap_Lifebook_T901
> +	},
> +	{
> +		.callback = fujitsu_dmi_lifebook,
> +		.ident = "Fujitsu Lifebook T901",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK T901")
> +		},
> +		.driver_data = keymap_Lifebook_T901
> +	},
> +	{
> +		.callback = fujitsu_dmi_lifebook,
> +		.ident = "Fujitsu Lifebook T902",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK T902")
> +		},
> +		.driver_data = keymap_Lifebook_T902
> +	},
> +	{
> +		.callback = fujitsu_dmi_lifebook,
>  		.ident = "Fujitsu Siemens P/T Series",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
