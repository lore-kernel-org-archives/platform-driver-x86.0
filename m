From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [patch] ideapad: uninitialized data in ideapad_acpi_add()
Date: Wed, 20 Jun 2012 20:23:13 +0800
Message-ID: <4FE1C0B1.9050901@canonical.com>
References: <20120612162850.GB11077@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:57210 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753974Ab2FTMXW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 20 Jun 2012 08:23:22 -0400
In-Reply-To: <20120612162850.GB11077@elgon.mountain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

# cat /sys/kernel/debug/ideapad/cfg
cfg: 0xFFFF8800007DE140
       ^^^^^^^^ the uninitialized bit

I see your point, perhaps unsigned int will be better then int?


On 06/13/2012 12:28 AM, Dan Carpenter wrote:
> We only initialize the high bits of "cfg".  It probably doesn't cause
> a problem given that this is platform specific code and doesn't have to
> worry about endianness etc.  But it's sort of messy.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is a static checker fix and I don't have the hardware.  Sorry.
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 4f20f8d..17f6dfd 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -694,10 +694,10 @@ MODULE_DEVICE_TABLE(acpi, ideapad_device_ids);
>  static int __devinit ideapad_acpi_add(struct acpi_device *adevice)
>  {
>  	int ret, i;
> -	unsigned long cfg;
> +	int cfg;
>  	struct ideapad_private *priv;
>  
> -	if (read_method_int(adevice->handle, "_CFG", (int *)&cfg))
> +	if (read_method_int(adevice->handle, "_CFG", &cfg))
>  		return -ENODEV;
>  
>  	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> @@ -721,7 +721,7 @@ static int __devinit ideapad_acpi_add(struct acpi_device *adevice)
>  		goto input_failed;
>  
>  	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++) {
> -		if (test_bit(ideapad_rfk_data[i].cfgbit, &cfg))
> +		if (test_bit(ideapad_rfk_data[i].cfgbit, &priv->cfg))
>  			ideapad_register_rfkill(adevice, i);
>  		else
>  			priv->rfk[i] = NULL;
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
