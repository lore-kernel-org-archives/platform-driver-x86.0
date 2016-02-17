From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-nb-wmi: add wapf=4 quirk for ASUS X75VD
Date: Tue, 16 Feb 2016 23:33:23 -0800
Message-ID: <20160217073323.GD22091@dvhart-mobl5.amr.corp.intel.com>
References: <0cbfffd61495fe8bc060c53b424d9391@natalenko.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43303 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756450AbcBQHdY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 02:33:24 -0500
Content-Disposition: inline
In-Reply-To: <0cbfffd61495fe8bc060c53b424d9391@natalenko.name>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 12, 2016 at 03:35:21PM +0200, Oleksandr Natalenko wrote:
> Wi-Fi on ASUS X75VD laptop does not work unless asus_nb_wmi module
> is loaded with wapf=4 option. Add quirk for this.

Concept is fine, checkpatch complains bitterly about whitespace. Please ensure
you are not adding spaces at the beginning of lines in your editor or in your
patch submission process.

> 
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c
> b/drivers/platform/x86/asus-nb-wmi.c
> index 131fee2..091ca7a 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -272,6 +272,15 @@ static const struct dmi_system_id asus_quirks[] = {
>         },
>         {
>                 .callback = dmi_matched,
> +               .ident = "ASUSTeK COMPUTER INC. X75VD",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "X75VD"),
> +               },
> +               .driver_data = &quirk_asus_wapf4,
> +       },
> +       {
> +               .callback = dmi_matched,
>                 .ident = "ASUSTeK COMPUTER INC. 1015E",
>                 .matches = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> -- 
> 2.7.1
> 

-- 
Darren Hart
Intel Open Source Technology Center
