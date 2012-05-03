From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH] apple-gmux: Add suspend/resume support for the backlight
Date: Thu, 3 May 2012 14:36:53 -0500
Message-ID: <20120503193653.GC23573@thinkpad-t410>
References: <1334850935-6659-1-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:56567 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758525Ab2ECTg5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 May 2012 15:36:57 -0400
Content-Disposition: inline
In-Reply-To: <1334850935-6659-1-git-send-email-seth.forshee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Ping. Any chance of getting this into 3.4?

On Thu, Apr 19, 2012 at 10:55:35AM -0500, Seth Forshee wrote:
> After S3, the brightness might not be restored to the pre-suspend value.
> Request status update calls from the backlight core on suspend/resume to
> ensure the brightness value is restored.
> 
> Reported-and-tested-by: Austin Lund <austin.lund@gmail.com>
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
> ---
>  drivers/platform/x86/apple-gmux.c |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index 8a582bd..6dcef4f 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -87,6 +87,9 @@ static int gmux_update_status(struct backlight_device *bd)
>  	struct apple_gmux_data *gmux_data = bl_get_data(bd);
>  	u32 brightness = bd->props.brightness;
>  
> +	if (bd->props.state & BL_CORE_SUSPENDED)
> +		brightness = 0;
> +
>  	/*
>  	 * Older gmux versions require writing out lower bytes first then
>  	 * setting the upper byte to 0 to flush the values. Newer versions
> @@ -102,6 +105,7 @@ static int gmux_update_status(struct backlight_device *bd)
>  }
>  
>  static const struct backlight_ops gmux_bl_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
>  	.get_brightness = gmux_get_brightness,
>  	.update_status = gmux_update_status,
>  };
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
