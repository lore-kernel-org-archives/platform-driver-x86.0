From: walter harms <wharms@bfs.de>
Subject: Re: [patch] sony-laptop: leak in error handling sony_nc_lid_resume_setup()
Date: Sat, 02 Feb 2013 10:51:43 +0100
Message-ID: <510CE1AF.3070101@bfs.de>
References: <20130201132826.GA23374@elgon.mountain>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx01.sz.bfs.de ([194.94.69.103]:8218 "EHLO mx01.sz.bfs.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753645Ab3BBJ7I (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 2 Feb 2013 04:59:08 -0500
In-Reply-To: <20130201132826.GA23374@elgon.mountain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mattia Dongili <malattia@linux.it>, Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 01.02.2013 14:28, schrieb Dan Carpenter:
> We need to decrement "i" first because the current "i" was not allocated
> succesfully.  Also we should go free the way down to zero to avoid a
> leak.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index 438c7fa..9557414 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -2351,7 +2351,7 @@ static int sony_nc_lid_resume_setup(struct platform_device *pd)
>  	return 0;
>  
>  liderror:
> -	for (; i > 0; i--)
> +	for (i--; i >= 0; i--)
>  		device_remove_file(&pd->dev, &lid_ctl->attrs[i]);
>  
>  	kfree(lid_ctl);

i have learned that most people get confused when you do loop
"the-other-way-around". (typical errors see above). Maybe it
would be better foe further generations to turn the loop on its
head like:

int c;
for(c=0; c < i ; c++)
    device_remove_file(&pd->dev, &lid_ctl->attrs[c]);
kfree(lid_ctl);

re,
 wh

yes, there is one var more

> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
