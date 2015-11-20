From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba_acpi: Fix blank screen at boot if transflective
 backlight is supported
Date: Fri, 20 Nov 2015 15:16:32 -0800
Message-ID: <20151120231632.GC7413@malice.jf.intel.com>
References: <1447644767-356-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:55713 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759785AbbKTXQd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Nov 2015 18:16:33 -0500
Content-Disposition: inline
In-Reply-To: <1447644767-356-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Fabian Koester <fabian.koester@bringnow.com>

On Sun, Nov 15, 2015 at 08:32:47PM -0700, Azael Avalos wrote:
> If transflective backlight is supported and the brightness is zero
> (lowest brightness level), the set_lcd_brightness function will activate
> the transflective backlight, making the LCD appear to be turned off.
> 
> This patch fixes the issue by incrementing the brightness level, and
> by doing so, avoiding the activation of the tranflective backlight.

So... I'm not sure this is a bug or even wrong behavior. The lowest setting on
my Thinkpad Yoga 12 is also "off" in Linux. Same is true for my Mac Book Pro (in
Mac OS X).

From what I can tell, what this patch does is merely disable the lowest setting.

What is it about this behavior that is considered to be wrong?

> 
> Cc: <stable@vger.kernel.org> # 4.3+
> Reported-and-tested-by: Fabian Koester <fabian.koester@bringnow.com>
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
>  drivers/platform/x86/toshiba_acpi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 2ca3f91..b6a7dc9 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -2634,6 +2634,14 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
>  	brightness = __get_lcd_brightness(dev);
>  	if (brightness < 0)
>  		return 0;
> +	/*
> +	 * If transflective backlight is supported and the brightness is zero
> +	 * (lowest brightness level), the set_lcd_brightness function will
> +	 * activate the transflective backlight, making the LCD appear to be
> +	 * turned off, simply increment the brightness level to avoid that.
> +	 */
> +	if (dev->tr_backlight_supported && brightness == 0)
> +		brightness++;
>  	ret = set_lcd_brightness(dev, brightness);
>  	if (ret) {
>  		pr_debug("Backlight method is read-only, disabling backlight support\n");
> -- 
> 2.6.2
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
