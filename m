From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: dell-laptop: Add 2-in-1 devices to the DMI
 whitelist
Date: Thu, 25 Jan 2018 15:02:39 -0800
Message-ID: <20180125230239.GA3736@fury>
References: <20180125224857.3622-1-alexander.n.abrosimov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:57275 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751227AbeAYXCn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Jan 2018 18:02:43 -0500
Content-Disposition: inline
In-Reply-To: <20180125224857.3622-1-alexander.n.abrosimov@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alexander Abrosimov <alexander.n.abrosimov@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Mario Limonciello <mario.limonciello@dell.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 26, 2018 at 01:48:57AM +0300, Alexander Abrosimov wrote:
> SMBIOS 3.0.0 Specification introduced new Chassis Types field values for
> 2-in-1 devices like tablets, convertibles and detachables. Dell's
> Inspiron 2-in-1 and XPS 2-in-1 fall into this category and they have to
> be added to the DMI whitelist, so rfkill and backlight can be controlled
> for them as for other laptops.
> 
> Signed-off-by: Alexander Abrosimov <alexander.n.abrosimov@gmail.com>

Thanks Alexander. Looks good - just going to give Pali and +Mario a chance to
respond before merging...

> ---
>  drivers/platform/x86/dell-laptop.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index cd4725e7e0b5..23fc94d70ea1 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -110,6 +110,24 @@ static const struct dmi_system_id dell_device_table[] __initconst = {
>  		},
>  	},
>  	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_CHASSIS_TYPE, "30"), /*Tablet*/
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_CHASSIS_TYPE, "31"), /*Convertible*/
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_CHASSIS_TYPE, "32"), /*Detachable*/
> +		},
> +	},
> +	{
>  		.ident = "Dell Computer Corporation",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
> -- 
> 2.13.6
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
