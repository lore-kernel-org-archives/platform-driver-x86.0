From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] platform/x86: dell-laptop: Handle return error form
 dell_get_intensity.
Date: Tue, 14 Mar 2017 10:28:46 +0100
Message-ID: <20170314092846.GB7422@pali>
References: <1489038596-3765-1-git-send-email-arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:32895 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750742AbdCNJ2u (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Mar 2017 05:28:50 -0400
Content-Disposition: inline
In-Reply-To: <1489038596-3765-1-git-send-email-arvind.yadav.cs@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 09 March 2017 11:19:56 Arvind Yadav wrote:
> Here, This patch is to handle a return error from dell_get_intensity.
> This change is done using Coccinelle.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

Ok, seems good. You can add my Acked-By.

> ---
>  drivers/platform/x86/dell-laptop.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index f57dd28..7fcf680 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -2053,11 +2053,17 @@ static int __init dell_init(void)
>  
>  		dell_backlight_device->props.brightness =
>  			dell_get_intensity(dell_backlight_device);
> +		if (dell_backlight_device->props.brightness < 0) {
> +			ret = dell_backlight_device->props.brightness;
> +			goto fail_get_brightness;
> +		}
>  		backlight_update_status(dell_backlight_device);
>  	}
>  
>  	return 0;
>  
> +fail_get_brightness:
> +	backlight_device_unregister(dell_backlight_device);
>  fail_backlight:
>  	dell_cleanup_rfkill();
>  fail_rfkill:

-- 
Pali Rohár
pali.rohar@gmail.com
