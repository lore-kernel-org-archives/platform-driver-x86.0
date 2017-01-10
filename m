From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] platform/x86: shut up unused-function warning
Date: Tue, 10 Jan 2017 16:33:56 +0100
Message-ID: <20170110153356.GE2299@mail.corp.redhat.com>
References: <20170110152857.3140948-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:43452 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S937340AbdAJPeB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Jan 2017 10:34:01 -0500
Content-Disposition: inline
In-Reply-To: <20170110152857.3140948-1-arnd@arndb.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Jan 10 2017 or thereabouts, Arnd Bergmann wrote:
> The newly added driver guards its "resume" callback with an #ifdef CONFIG_PM
> that should be CONFIG_PM_SLEEP instead, leading to a warning in some configurations:
> 
> drivers/platform/x86/surface3-wmi.c:248:12: error: 's3_wmi_resume' defined but not used [-Werror=unused-function]
> 
> Using a __maybe_unused annotation without an #ifdef avoids the mistake more
> reliably.
> 
> Fixes: 3dda3b3798f9 ("platform/x86: Add custom surface3 platform device for controlling LID")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Ouch. Good catch.

Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

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
