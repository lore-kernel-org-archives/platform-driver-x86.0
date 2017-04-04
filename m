From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 04/11] platform/x86: fujitsu-laptop: simplify
 set_lcd_level()
Date: Mon, 3 Apr 2017 17:01:02 -0700
Message-ID: <20170404000102.GD17322@fury>
References: <20170330103509.32509-1-kernel@kempniu.pl>
 <20170330103509.32509-5-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:56481 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751668AbdDDABE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Apr 2017 20:01:04 -0400
Content-Disposition: inline
In-Reply-To: <20170330103509.32509-5-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 30, 2017 at 12:35:02PM +0200, Michał Kępień wrote:
> acpi_execute_simple_method() takes a method parameter which tells it to
> look for the given method underneath the given handle, so calling
> acpi_get_handle() beforehand is redundant.  Replace the call to
> acpi_get_handle() with a call to acpi_execute_simple_method(), thus
> eliminating the need for a local variable storing the handle.  Also do
> not assign a default value to status as it has no influence on execution
> flow.
> 
> Signed-off-by: Michał Kępień <kernel@kempniu.pl>
> ---
>  drivers/platform/x86/fujitsu-laptop.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 5005400b57bb..b888ba190fb2 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -358,8 +358,7 @@ static enum led_brightness eco_led_get(struct led_classdev *cdev)
>  
>  static int set_lcd_level(int level)
>  {
> -	acpi_status status = AE_OK;
> -	acpi_handle handle = NULL;
> +	acpi_status status;
>  	char *method;
>  
>  	switch (use_alt_lcd_levels) {
> @@ -377,16 +376,13 @@ static int set_lcd_level(int level)
>  	if (level < 0 || level >= fujitsu_bl->max_brightness)
>  		return -EINVAL;
>  
> -	status = acpi_get_handle(fujitsu_bl->acpi_handle, method, &handle);
> +	status = acpi_execute_simple_method(fujitsu_bl->acpi_handle, method,
> +					    level);
>  	if (ACPI_FAILURE(status)) {
>  		vdbg_printk(FUJLAPTOP_DBG_ERROR, "%s not present\n", method);

So this changes behavior a little bit for debug messages. Previously, this
message only triggered if acpi_get_handle failed, now it will trigger if the
method exists but fails, whereas that was silent previously (see below). I think
printing in either case is fine, but we should adjust the message to reflect the
new code flow.

>  		return -ENODEV;
>  	}
>  
> -	status = acpi_execute_simple_method(handle, NULL, level);
> -	if (ACPI_FAILURE(status))
> -		return -ENODEV;
> -
>  	return 0;
>  }
>  
> -- 
> 2.12.1
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
