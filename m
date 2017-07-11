From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 1/7] platform/x86: fujitsu-laptop: constify
 attribute_group structures.
Date: Tue, 11 Jul 2017 20:44:36 +0930
Message-ID: <20170711111436.GA23993@marvin.atrad.com.au>
References: <1499770100-18632-1-git-send-email-arvind.yadav.cs@gmail.com>
 <1499770100-18632-2-git-send-email-arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:39884 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752175AbdGKLPc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jul 2017 07:15:32 -0400
Content-Disposition: inline
In-Reply-To: <1499770100-18632-2-git-send-email-arvind.yadav.cs@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: dvhart@infradead.org, andy@infradead.org, cezary.jackiewicz@gmail.com, corentin.chary@gmail.com, laforge@gnumonks.org, coproscefalo@gmail.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 11, 2017 at 04:18:14PM +0530, Arvind Yadav wrote:
> attribute_groups are not supposed to change at runtime. All functions
> working with attribute_groups provided by <linux/sysfs.h> work
> with const attribute_group. So mark the non-const structs as const.
> 
> File size before:
>    text	   data	    bss	    dec	    hex	filename
>    7474	   1205	     24	   8703	   21ff	drivers/platform/x86/fujitsu-laptop.o
> 
> File size After adding 'const':
>    text	   data	    bss	    dec	    hex	filename
>    7538	   1141	     24	   8703	   21ff	drivers/platform/x86/fujitsu-laptop.o
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

I have no objections to this patch - it seems like the sensible thing to do
in the interests of remaining consistent with the rest of the kernel. 
Thanks Arvind.

Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Regards
  jonathan

> ---
>  drivers/platform/x86/fujitsu-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index c1a8528..7973342 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -317,7 +317,7 @@ static ssize_t radios_show(struct device *dev, struct device_attribute *attr,
>  	NULL
>  };
>  
> -static struct attribute_group fujitsu_pf_attribute_group = {
> +static const struct attribute_group fujitsu_pf_attribute_group = {
>  	.attrs = fujitsu_pf_attributes
>  };
>  
> -- 
