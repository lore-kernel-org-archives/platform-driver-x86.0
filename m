From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v3 1/4] platform/x86: fujitsu-laptop: register backlight
 device in a separate function
Date: Fri, 10 Mar 2017 10:08:49 +0100
Message-ID: <20170310090849.GA13521@ozzy.nask.waw.pl>
References: <20170307101516.9852-1-kernel@kempniu.pl>
 <20170307101516.9852-2-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35198 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751024AbdCJJIy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Mar 2017 04:08:54 -0500
Received: by mail-lf0-f68.google.com with SMTP id v2so6382153lfi.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2017 01:08:53 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170307101516.9852-2-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> Move code responsible for backlight device registration to a separate
> function in order to simplify error handling and decrease indentation.
> Simplify initialization of struct backlight_properties.  Use
> KBUILD_MODNAME as device name to avoid repeating the same string literal
> throughout the module.
> 
> Signed-off-by: Michał Kępień <kernel@kempniu.pl>
> ---
>  drivers/platform/x86/fujitsu-laptop.c | 38 ++++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index e12cc3504d48..185c929898d9 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -685,6 +685,25 @@ static const struct dmi_system_id fujitsu_dmi_table[] __initconst = {
>  
>  /* ACPI device for LCD brightness control */
>  
> +static int fujitsu_backlight_register(void)
> +{
> +	struct backlight_properties props = {
> +		.brightness = fujitsu_bl->brightness_level,
> +		.max_brightness = fujitsu_bl->max_brightness - 1,
> +		.type = BACKLIGHT_PLATFORM
> +	};
> +	struct backlight_device *bd;
> +
> +	bd = backlight_device_register(KBUILD_MODNAME, NULL, NULL,
> +				       &fujitsu_bl_ops, &props);

I have only just now noticed that this effectively breaks userspace
interface as KBUILD_MODNAME is "fujitsu_laptop" while the previously
used device name was "fujitsu-laptop" (underscore vs. hyphen).

Jonathan, as this series is already long overdue, I suggest the
following course of action: please review these patches anyway and if
you find no other issues, please provide your Reviewed-by etc. as you
normally would.  Once you do that, I will post v4 which will use
"fujitsu-laptop" for backlight device name and will contain your v3
review tags.  Does that sound reasonable?

-- 
Best regards,
Michał Kępień
