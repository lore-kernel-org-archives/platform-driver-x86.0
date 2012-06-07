From: walter harms <wharms@bfs.de>
Subject: Re: [patch] sony-laptop: fix a couple signedness bugs
Date: Thu, 07 Jun 2012 11:47:30 +0200
Message-ID: <4FD078B2.3060909@bfs.de>
References: <20120607082221.GA7582@elgon.mountain>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx01.sz.bfs.de ([194.94.69.103]:32456 "EHLO mx01.sz.bfs.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760546Ab2FGJrd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Jun 2012 05:47:33 -0400
In-Reply-To: <20120607082221.GA7582@elgon.mountain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mattia Dongili <malattia@linux.it>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 07.06.2012 10:22, schrieb Dan Carpenter:
> These need to be signed to handle negative error codes.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index 210d4ae..0a2f026 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -2113,7 +2113,7 @@ static ssize_t sony_nc_thermal_mode_show(struct device *dev,
>  		struct device_attribute *attr, char *buffer)
>  {
>  	ssize_t count = 0;
> -	unsigned int mode = sony_nc_thermal_mode_get();
> +	int mode = sony_nc_thermal_mode_get();
>  
>  	if (mode < 0)
>  		return mode;
> @@ -2480,7 +2480,7 @@ static void sony_nc_backlight_ng_read_limits(int handle,
>  	props->maxlvl = 0xff;
>  
>  	offset = sony_find_snc_handle(handle);

sony_find_snc_handle() should return an int, did something change ?

> -	if (offset < 0)
> +	if ((int)offset < 0)
>  		return;
>  
>  	/* try to read the boundaries from ACPI tables, if we fail the above
