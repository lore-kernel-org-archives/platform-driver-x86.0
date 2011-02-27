From: Mattia Dongili <malattia@linux.it>
Subject: Re: [patch 1/4] sony-laptop: make a couple variables static
Date: Sun, 27 Feb 2011 21:12:59 +0900
Message-ID: <20110227121259.GB29319@kamineko.org>
References: <20110226125427.GI18043@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:56152
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751576Ab1B0MNC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Feb 2011 07:13:02 -0500
Content-Disposition: inline
In-Reply-To: <20110226125427.GI18043@bicker>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Feb 26, 2011 at 03:54:27PM +0300, Dan Carpenter wrote:
> Sparse complains that these variables should be static.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Mattia Dongili <malattia@linux.it>

> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index a0ba0e7..a7b9c72 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -745,7 +745,7 @@ struct sony_nc_handles {
>  	struct device_attribute devattr;
>  };
>  
> -struct sony_nc_handles *handles;
> +static struct sony_nc_handles *handles;
>  
>  static ssize_t sony_nc_handles_show(struct device *dev,
>  		struct device_attribute *attr, char *buffer)
> @@ -1358,7 +1358,7 @@ struct kbd_backlight {
>  	struct device_attribute timeout_attr;
>  };
>  
> -struct kbd_backlight *kbdbl_handle;
> +static struct kbd_backlight *kbdbl_handle;
>  
>  static ssize_t __sony_nc_kbd_backlight_mode_set(u8 value)
>  {
-- 
mattia
:wq!
