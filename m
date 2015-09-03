From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-nb-wmi: Add wapf=4 quirk for X456UA/X456UF
Date: Thu, 3 Sep 2015 15:54:52 -0700
Message-ID: <20150903225452.GA60159@vmdeb7>
References: <1441231834-12873-1-git-send-email-drake@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49809 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752903AbbICWy4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 Sep 2015 18:54:56 -0400
Content-Disposition: inline
In-Reply-To: <1441231834-12873-1-git-send-email-drake@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Daniel Drake <drake@endlessm.com>
Cc: corentin.chary@gmail.com, acelan.kao@canonical.com, carlo@endlessm.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Wed, Sep 02, 2015 at 04:10:34PM -0600, Daniel Drake wrote:
> These laptops boot with wifi as hard-blocked, with no obvious way to
> enable it. Using a quirk to set wapf=4 solves the problem.
> 
> Signed-off-by: Daniel Drake <drake@endlessm.com>

Looks good.

Corentin, any concerns?

> ---
>  drivers/platform/x86/asus-nb-wmi.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index abdaed3..131fee2 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -128,6 +128,24 @@ static const struct dmi_system_id asus_quirks[] = {
>  	},
>  	{
>  		.callback = dmi_matched,
> +		.ident = "ASUSTeK COMPUTER INC. X456UA",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "X456UA"),
> +		},
> +		.driver_data = &quirk_asus_wapf4,
> +	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "ASUSTeK COMPUTER INC. X456UF",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "X456UF"),
> +		},
> +		.driver_data = &quirk_asus_wapf4,
> +	},
> +	{
> +		.callback = dmi_matched,
>  		.ident = "ASUSTeK COMPUTER INC. X501U",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> -- 
> 2.1.4
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
