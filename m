From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 1/3] asus-laptop: fix is_visible return value
Date: Wed, 21 Jan 2015 10:25:50 -0800
Message-ID: <20150121182549.GB7386@vmdeb7>
References: <1421623526-20555-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47533 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752275AbbAUSZv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Jan 2015 13:25:51 -0500
Content-Disposition: inline
In-Reply-To: <1421623526-20555-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel@savoirfairelinux.com

On Sun, Jan 18, 2015 at 06:25:24PM -0500, Vivien Didelot wrote:
> With a Lucid platform, asus_sysfs_is_visible() returned a boolean for
> ls_switch and ls_level attributes.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Queued, thanks.

> ---
>  drivers/platform/x86/asus-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
> index f71700e..00f5e82 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -1616,7 +1616,7 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>  		else
>  			goto normal;
>  
> -		return supported;
> +		return supported ? attr->mode : 0;
>  	}
>  
>  normal:
> -- 
> 2.2.2
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
