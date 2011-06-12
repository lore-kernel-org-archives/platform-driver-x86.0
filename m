From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 2/25] sony-laptop: simple_strtoul replaced by
 strict_strtoul
Date: Mon, 13 Jun 2011 06:56:58 +0900
Message-ID: <20110612215657.GA31095@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE8FD88.9050302@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.212.179]:52818 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754233Ab1FLV5A (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 12 Jun 2011 17:57:00 -0400
Received: by pxi2 with SMTP id 2so2578602pxi.10
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jun 2011 14:56:59 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DE8FD88.9050302@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Fri, Jun 03, 2011 at 05:28:08PM +0200, Marco Chiappero wrote:
> Any occurrence of simple_strtoul has been replaced with the better
> strict_strtoul.

you should probably say why it's better.

> Signed-off-by: Marco Chiappero <marco@absence.it>
> ---
> 
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -919,7 +919,8 @@ static ssize_t sony_nc_sysfs_store(struc
>  	if (count > 31)
>  		return -EINVAL;
> 
> -	value = simple_strtoul(buffer, NULL, 10);
> +	if (strict_strtoul(buffer, 10, &value))
> +		return -EINVAL;
> 
>  	if (item->validate)
>  		value = item->validate(SNC_VALIDATE_IN, value);
> @@ -2437,7 +2438,9 @@ static ssize_t sony_pic_wwanpower_store(
>  	if (count > 31)
>  		return -EINVAL;
> 
> -	value = simple_strtoul(buffer, NULL, 10);
> +	if (strict_strtoul(buffer, 10, &value))
> +		return -EINVAL;
> +
>  	mutex_lock(&spic_dev.lock);
>  	__sony_pic_set_wwanpower(value);
>  	mutex_unlock(&spic_dev.lock);
> @@ -2474,7 +2477,9 @@ static ssize_t sony_pic_bluetoothpower_s
>  	if (count > 31)
>  		return -EINVAL;
> 
> -	value = simple_strtoul(buffer, NULL, 10);
> +	if (strict_strtoul(buffer, 10, &value))
> +		return -EINVAL;
> +
>  	mutex_lock(&spic_dev.lock);
>  	__sony_pic_set_bluetoothpower(value);
>  	mutex_unlock(&spic_dev.lock);
> @@ -2513,7 +2518,9 @@ static ssize_t sony_pic_fanspeed_store(s
>  	if (count > 31)
>  		return -EINVAL;
> 
> -	value = simple_strtoul(buffer, NULL, 10);
> +	if (strict_strtoul(buffer, 10, &value))
> +		return -EINVAL;
> +
>  	if (sony_pic_set_fanspeed(value))
>  		return -EIO;
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-- 
mattia
:wq!
