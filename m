From: Mattia Dongili <malattia@linux.it>
Subject: Re: [patch 3/3] sony-laptop: handle allocation failures
Date: Sun, 27 Feb 2011 21:14:42 +0900
Message-ID: <20110227121442.GC29319@kamineko.org>
References: <20110226125524.GK18043@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:56155
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751259Ab1B0MOn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Feb 2011 07:14:43 -0500
Content-Disposition: inline
In-Reply-To: <20110226125524.GK18043@bicker>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Feb 26, 2011 at 03:55:24PM +0300, Dan Carpenter wrote:
> Return -ENOMEM if kzalloc() fails.  The callers already handle error
> returns.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Mattia Dongili <malattia@linux.it>

> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index d0d0522..0db9049 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -768,6 +768,8 @@ static int sony_nc_handles_setup(struct platform_device *pd)
>  	int result;
>  
>  	handles = kzalloc(sizeof(*handles), GFP_KERNEL);
> +	if (!handles)
> +		return -ENOMEM;
>  
>  	sysfs_attr_init(&handles->devattr.attr);
>  	handles->devattr.attr.name = "handles";
> @@ -1458,6 +1460,8 @@ static int sony_nc_kbd_backlight_setup(struct platform_device *pd)
>  		return 0;
>  
>  	kbdbl_handle = kzalloc(sizeof(*kbdbl_handle), GFP_KERNEL);
> +	if (!kbdbl_handle)
> +		return -ENOMEM;
>  
>  	sysfs_attr_init(&kbdbl_handle->mode_attr.attr);
>  	kbdbl_handle->mode_attr.attr.name = "kbd_backlight";
-- 
mattia
:wq!
