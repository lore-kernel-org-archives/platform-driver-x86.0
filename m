From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] dell-laptop: Add another Dell laptop to the DMI whitelist
Date: Thu, 16 Feb 2017 14:22:21 +0100
Message-ID: <20170216132221.GA22666@pali>
References: <1487249883-7013-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:36658 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753285AbdBPNW2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Feb 2017 08:22:28 -0500
Received: by mail-wr0-f193.google.com with SMTP id z61so1257568wrc.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2017 05:22:27 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1487249883-7013-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org

On Thursday 16 February 2017 20:58:03 Alex Hung wrote:
> This is to support Latitude 7480 and many other newer Dell laptops.
> 
> Signed-off-by: Alex Hung <alex.hung@canonical.com>

Looks good. Maybe should be this change backported to stable?

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

> ---
>  drivers/platform/x86/dell-laptop.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index 277656c..6174854 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -109,6 +109,12 @@ static const struct dmi_system_id dell_device_table[] __initconst = {
>  		},
>  	},
>  	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /*Notebook*/
> +		},
> +	},
> +	{
>  		.ident = "Dell Computer Corporation",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),

-- 
Pali Rohár
pali.rohar@gmail.com
