From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] platform/x86: (sony-laptop): Remove unused variables
Date: Thu, 26 May 2011 20:48:19 +0900
Message-ID: <20110526114817.GA9097@kamineko.org>
References: <1306392847-5993-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:34874 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757245Ab1EZLsY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 May 2011 07:48:24 -0400
Received: by pvg12 with SMTP id 12so266305pvg.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 May 2011 04:48:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1306392847-5993-1-git-send-email-linux@roeck-us.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

On Wed, May 25, 2011 at 11:54:07PM -0700, Guenter Roeck wrote:
> Remove unused variable 'handle' from functions sony_nc_get_brightness_ng()
> and sony_nc_update_status_ng().
> 
> This commit fixes the following build warnings:
> 
> drivers/platform/x86/sony-laptop.c: In function sony_nc_get_brightness_ng:
> drivers/platform/x86/sony-laptop.c:964: warning: unused variable handle
> drivers/platform/x86/sony-laptop.c: In function sony_nc_update_status_ng:
> drivers/platform/x86/sony-laptop.c:976: warning: unused variable handle
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Mattia Dongili <malattia@linux.it>

> ---
>  drivers/platform/x86/sony-laptop.c |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index 6fe8cd6..9a2c319 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -961,7 +961,6 @@ static int sony_backlight_get_brightness(struct backlight_device *bd)
>  static int sony_nc_get_brightness_ng(struct backlight_device *bd)
>  {
>  	int result;
> -	int *handle = (int *)bl_get_data(bd);
>  	struct sony_backlight_props *sdev =
>  		(struct sony_backlight_props *)bl_get_data(bd);

oh dear, thanks for catching it.
-- 
mattia
:wq!
