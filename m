From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Thu, 30 Dec 2010 10:04:29 +0000
Message-ID: <201012301004.29531.carlos@strangeworlds.co.uk>
References: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:60422 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753152Ab0L3KEi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 30 Dec 2010 05:04:38 -0500
Received: by wwi17 with SMTP id 17so11165848wwi.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Dec 2010 02:04:37 -0800 (PST)
In-Reply-To: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: vpivaini@cs.helsinki.fi, platform-driver-x86@vger.kernel.org

On Wednesday 29 December 2010 04:30:03 Joey Lee wrote:

[..]

> Maybe Wistron is the ODM (or OEM) to manufacture Lenovo Ideapad S12 ?
> Anyway,
> I added this Ideapad S12 to blacklist in acer-wmi driver because it must
> supported by ideapad-laptop driver.
> 
> I also added Cc. to Carlos Corbacho, need his review.

I suspect this is the same as all the Acer netbooks - they provide a dummy WMI 
interface which doesn't actually do anything. It would be nicer if there were 
a more generic way to do this, but this will do for now (I may try to play 
around with my Aspire One and see if I can figure out some way to detect the 
dummy interface, without needing to resort to DMI).

[..]

> From: Lee, Chun-Yi <jlee@novell.com>
> Date: Wed, 29 Dec 2010 00:17:23 +0800
> Subject: [PATCH] Add Lenovo Ideapad S12 to acer blacklist
> 
> The Lenovo Ideapad S12's _WDG have GUID that matches with AMW0, it causes
> acer-wmi driver auto-probe when system boot but there already have
> ideapad-laptop driver to support Ideapad serial.
> So, add Lenovo Ideapad S12 to acer blacklist to disable it.
> 
> Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
> Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>

Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>
> ---
>  drivers/platform/x86/acer-wmi.c |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c
> b/drivers/platform/x86/acer-wmi.c index 28288ad..387ac7c 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -310,6 +310,17 @@ static struct dmi_system_id __devinitdata
> acer_blacklist[] = { DMI_MATCH(DMI_PRODUCT_NAME, "AOA150"),
>  		},
>  	},
> +	/*
> +	 * The Lenovo Ideapad S12 have GUID that matches with AMW0 - disable it.
> +	 * There already have ideapad-laptop driver to support Ideapad serial.
> +	 */
> +	{
> +		.ident = "Lenovo Ideapad S12",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "20021,2959"),
> +		},
> +	},
>  	{}
>  };
