From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Handle return error form
 dell_get_intensity.
Date: Wed, 8 Mar 2017 13:54:06 +0100
Message-ID: <20170308125406.GB30539@pali>
References: <1488975747-32184-1-git-send-email-arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1488975747-32184-1-git-send-email-arvind.yadav.cs@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi!

On Wednesday 08 March 2017 17:52:27 Arvind Yadav wrote:
> Here, dell_get_intensity can return an error.

Right. That is truth and we should check for errors.

> So we can assgine props.brightness as max_brightness.

But why to max_brightness? Seems that this is incorrect handling of
error too...

> This change is done using Coccinelle.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/platform/x86/dell-laptop.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index f57dd28..0891de3 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -2053,6 +2053,9 @@ static int __init dell_init(void)
>  
>  		dell_backlight_device->props.brightness =
>  			dell_get_intensity(dell_backlight_device);
> +		if (dell_backlight_device->props.brightness < 0) {
> +			dell_backlight_device->props.brightness = props.max_brightness;
> +		}
>  		backlight_update_status(dell_backlight_device);
>  	}
>  

-- 
Pali Rohár
pali.rohar@gmail.com
