Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9C8C433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Mar 2021 12:18:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AADB064E89
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Mar 2021 12:18:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbhCRMRd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Mar 2021 08:17:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41276 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231377AbhCRMRc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Mar 2021 08:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616069851;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Tjy6l1/ebTOf2wmffUgEXrQBRyuTZ6D/xUhtDOy4qV8=;
        b=S2rtx86le6pVox7ngAHKzN87O3rEgiZpsyRpqtrIlzI0ICMxAQbX9QltMqYAQR9Mp0v8qP
        C9NWaioCPOekKQGk4LwMMXSDp65c37XzBwL+QD5N9EqVMxt3hlxHKpHVuBa/IO4LCNtNtw
        3zUGkIdc68H1QiONgN/TMUUBAGCRxJ0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-yx6JavNSNmSkHwrOHm3MRA-1; Thu, 18 Mar 2021 08:17:30 -0400
X-MC-Unique: yx6JavNSNmSkHwrOHm3MRA-1
Received: by mail-ed1-f71.google.com with SMTP id t27so21030974edi.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Mar 2021 05:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Tjy6l1/ebTOf2wmffUgEXrQBRyuTZ6D/xUhtDOy4qV8=;
        b=frEjvOo37qqN2QOYdvNilRdY8KbsvE8qNVHlwkrUKweffvPPv3G6HEG6KZW2fPNVlN
         zMbn7NPzHmlXOtOcZDqrAw1FlxumfHpsB67QDDarcMM2acyOEaXx2y0EoRBKU5xe0Tj6
         Rtky3Md0T7nrgtSNbi41AUcZ3AQJ+xbiWHGd9Z/NfJbOB22ojS9iu/Vhz/y04QNlmhTG
         YyytxYWu1EWhdomb9tpNCGwedq2ESjqW+g6AdR6lvz4PhMRpNNCTvP/VDFxI0rumajQK
         a+mYis+i8XJq130fPvcerkM7x5huigghavUS2VOt3jWiSzzXald5y8OC6C2YLQQxFvIl
         NiFg==
X-Gm-Message-State: AOAM531TVTVySIkQMxQiaM3n+1zPqz1nNbR4wzbUaR1hNAt3z/JK6yJw
        dLlW33Z9wuUu+NXeVy3X/4OTX2RVvk1Xr7/kd3Ha+BoU4Qy47jgdj7I5r8kLzY8l24vdo6z96KD
        gnSKYvUL9lIlKBWR34KnMBm+ncw6ZL3kyQ1Bzom/bgd081aUkaPcrALdx+uXB1NXFBUm3FtGht1
        LLb956DlUwyg==
X-Received: by 2002:a17:906:b747:: with SMTP id fx7mr41604747ejb.474.1616069848763;
        Thu, 18 Mar 2021 05:17:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN26XXs3LOlAVPiK3KlEXpqGUDQ/VqKOR+3uPs+FCOB9IFlQGoGhcgVgYiN9R+a5FnOMFYNA==
X-Received: by 2002:a17:906:b747:: with SMTP id fx7mr41604721ejb.474.1616069848464;
        Thu, 18 Mar 2021 05:17:28 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id be27sm2003670edb.47.2021.03.18.05.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 05:17:28 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: check dytc version for
 lapmode sysfs
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20210311174843.3161-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <df908172-ba4e-3e13-a984-47c011db50df@redhat.com>
Date:   Thu, 18 Mar 2021 13:17:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210311174843.3161-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/11/21 6:48 PM, Mark Pearson wrote:
> Lenovo platforms with DYTC versions earlier than version 5 don't set
> the lapmode interface correctly, causing issues with thermald on
> older platforms.
> 
> Add checking to only create the dytc_lapmode interface for version
> 5 and later.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

I've added a:

Fixes: 1ac09656bded ("platform/x86: thinkpad_acpi: Add palm sensor support")

Tag, this will help with the patch automatically getting selected for
stable kernel-series which contain the patch pointed to by the Fixes: tag.

In this case this won't work since this patch seems to depend on code
introduced in:

commit c3bfcd4c676238 ("platform/x86: thinkpad_acpi: lap or desk mode interface")

So you will need to manually backport this and submit it to stable@vger.kernel.org
if you want it to be included in any of the stable kernel series.

Still it is always good to have the Fixes: tag present when a commit is actually
fixing a previous commit.

###

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans





> ---
>  drivers/platform/x86/thinkpad_acpi.c | 91 ++++++++++++++++++++--------
>  1 file changed, 65 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index b881044b31b0..f7de90a47e28 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9845,6 +9845,11 @@ static struct ibm_struct lcdshadow_driver_data = {
>   * Thinkpad sensor interfaces
>   */
>  
> +#define DYTC_CMD_QUERY        0 /* To get DYTC status - enable/revision */
> +#define DYTC_QUERY_ENABLE_BIT 8  /* Bit        8 - 0 = disabled, 1 = enabled */
> +#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revision */
> +#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
> +
>  #define DYTC_CMD_GET          2 /* To get current IC function and mode */
>  #define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
>  
> @@ -9855,6 +9860,7 @@ static bool has_palmsensor;
>  static bool has_lapsensor;
>  static bool palm_state;
>  static bool lap_state;
> +static int dytc_version;
>  
>  static int dytc_command(int command, int *output)
>  {
> @@ -9869,6 +9875,33 @@ static int dytc_command(int command, int *output)
>  	return 0;
>  }
>  
> +static int dytc_get_version(void)
> +{
> +	int err, output;
> +
> +	/* Check if we've been called before - and just return cached value */
> +	if (dytc_version)
> +		return dytc_version;
> +
> +	/* Otherwise query DYTC and extract version information */
> +	err = dytc_command(DYTC_CMD_QUERY, &output);
> +	/*
> +	 * If support isn't available (ENODEV) then don't return an error
> +	 * and don't create the sysfs group
> +	 */
> +	if (err == -ENODEV)
> +		return 0;
> +	/* For all other errors we can flag the failure */
> +	if (err)
> +		return err;
> +
> +	/* Check DYTC is enabled and supports mode setting */
> +	if (output & BIT(DYTC_QUERY_ENABLE_BIT))
> +		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
> +
> +	return 0;
> +}
> +
>  static int lapsensor_get(bool *present, bool *state)
>  {
>  	int output, err;
> @@ -9974,7 +10007,18 @@ static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
>  		if (err)
>  			return err;
>  	}
> -	if (has_lapsensor) {
> +
> +	/* Check if we know the DYTC version, if we don't then get it */
> +	if (!dytc_version) {
> +		err = dytc_get_version();
> +		if (err)
> +			return err;
> +	}
> +	/*
> +	 * Platforms before DYTC version 5 claim to have a lap sensor, but it doesn't work, so we
> +	 * ignore them
> +	 */
> +	if (has_lapsensor && (dytc_version >= 5)) {
>  		err = sysfs_create_file(&tpacpi_pdev->dev.kobj, &dev_attr_dytc_lapmode.attr);
>  		if (err)
>  			return err;
> @@ -9999,14 +10043,9 @@ static struct ibm_struct proxsensor_driver_data = {
>   * DYTC Platform Profile interface
>   */
>  
> -#define DYTC_CMD_QUERY        0 /* To get DYTC status - enable/revision */
>  #define DYTC_CMD_SET          1 /* To enable/disable IC function mode */
>  #define DYTC_CMD_RESET    0x1ff /* To reset back to default */
>  
> -#define DYTC_QUERY_ENABLE_BIT 8  /* Bit        8 - 0 = disabled, 1 = enabled */
> -#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revision */
> -#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
> -
>  #define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
>  #define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
>  
> @@ -10211,28 +10250,28 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  	if (err)
>  		return err;
>  
> +	/* Check if we know the DYTC version, if we don't then get it */
> +	if (!dytc_version) {
> +		err = dytc_get_version();
> +		if (err)
> +			return err;
> +	}
>  	/* Check DYTC is enabled and supports mode setting */
> -	if (output & BIT(DYTC_QUERY_ENABLE_BIT)) {
> -		/* Only DYTC v5.0 and later has this feature. */
> -		int dytc_version;
> -
> -		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
> -		if (dytc_version >= 5) {
> -			dbg_printk(TPACPI_DBG_INIT,
> -				   "DYTC version %d: thermal mode available\n", dytc_version);
> -			/* Create platform_profile structure and register */
> -			err = platform_profile_register(&dytc_profile);
> -			/*
> -			 * If for some reason platform_profiles aren't enabled
> -			 * don't quit terminally.
> -			 */
> -			if (err)
> -				return 0;
> +	if (dytc_version >= 5) {
> +		dbg_printk(TPACPI_DBG_INIT,
> +				"DYTC version %d: thermal mode available\n", dytc_version);
> +		/* Create platform_profile structure and register */
> +		err = platform_profile_register(&dytc_profile);
> +		/*
> +		 * If for some reason platform_profiles aren't enabled
> +		 * don't quit terminally.
> +		 */
> +		if (err)
> +			return 0;
>  
> -			dytc_profile_available = true;
> -			/* Ensure initial values are correct */
> -			dytc_profile_refresh();
> -		}
> +		dytc_profile_available = true;
> +		/* Ensure initial values are correct */
> +		dytc_profile_refresh();
>  	}
>  	return 0;
>  }
> 

