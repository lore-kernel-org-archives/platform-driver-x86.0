From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: shut up unused-function warning
Date: Tue, 10 Jan 2017 12:41:17 -0800
Message-ID: <20170110204117.GB4371@f23x64.localdomain>
References: <20170110152857.3140948-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56628 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750747AbdAJUlU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Jan 2017 15:41:20 -0500
Content-Disposition: inline
In-Reply-To: <20170110152857.3140948-1-arnd@arndb.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jan 10, 2017 at 04:28:47PM +0100, Arnd Bergmann wrote:
> The newly added driver guards its "resume" callback with an #ifdef CONFIG_PM
> that should be CONFIG_PM_SLEEP instead, leading to a warning in some configurations:
> 
> drivers/platform/x86/surface3-wmi.c:248:12: error: 's3_wmi_resume' defined but not used [-Werror=unused-function]
> 
> Using a __maybe_unused annotation without an #ifdef avoids the mistake more
> reliably.

Thanks Arnd,

This appears to be the preferred approach from coding-style.rst 20) Conditional
Compilation - we have some cleanup to do in this area I guess.

Queued to next, thanks.

> 
> Fixes: 3dda3b3798f9 ("platform/x86: Add custom surface3 platform device for controlling LID")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/platform/x86/surface3-wmi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/surface3-wmi.c b/drivers/platform/x86/surface3-wmi.c
> index cbf4d83a7271..6ac1d1349d7e 100644
> --- a/drivers/platform/x86/surface3-wmi.c
> +++ b/drivers/platform/x86/surface3-wmi.c
> @@ -244,13 +244,11 @@ static int s3_wmi_remove(struct platform_device *device)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM
> -static int s3_wmi_resume(struct device *dev)
> +static int __maybe_unused s3_wmi_resume(struct device *dev)
>  {
>  	s3_wmi_send_lid_state();
>  	return 0;
>  }
> -#endif
>  static SIMPLE_DEV_PM_OPS(s3_wmi_pm, NULL, s3_wmi_resume);
>  
>  static struct platform_driver s3_wmi_driver = {
> -- 
> 2.9.0
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
