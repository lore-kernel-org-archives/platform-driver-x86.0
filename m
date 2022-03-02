Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352F9C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Mar 2022 14:48:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243230AbiCBOsn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Mar 2022 09:48:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241521AbiCBOsm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Mar 2022 09:48:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6948A10FE6
        for <platform-driver-x86@vger.kernel.org>; Wed,  2 Mar 2022 06:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646232476;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XupR4D98oHCefTo859Ywqo2HMyr0Sne92+ZqBpxIpVo=;
        b=Fdpkavv6MDsJhg71hBIVlrUqsrVNY/TMqDkR2X2ZbV532g3K4Y5vxIYFIWm5IrBT+hTdV7
        aQV9logvLfpSTS13LtuE7r+sCx7DyFi9lRWXXwh9psf7IDWYkIW5nTG/KNMkaIleJXV8gv
        SNn+Yltyk83tggM1Yr+xhMffKj118z8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-_hlDZfypMSmDc313TAnOZg-1; Wed, 02 Mar 2022 09:47:51 -0500
X-MC-Unique: _hlDZfypMSmDc313TAnOZg-1
Received: by mail-ej1-f71.google.com with SMTP id m12-20020a1709062acc00b006cfc98179e2so1108206eje.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Mar 2022 06:47:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XupR4D98oHCefTo859Ywqo2HMyr0Sne92+ZqBpxIpVo=;
        b=FxaHfdyV/xo8kJsmDZU3Qx7yr7vcoCAnA/iCv6svxGqcUqKR/cZ2PHVuw9Mnu1EwWy
         fDXyzZJeaSWw2hDyzM2ArAn4srcv7N/vHfUP1382BPimDsswfqzcOqKoIwMrgbblcuvO
         ay2tNpCj3uVaFkM4tvOdoM5DPSdSfHzBx6HdLQdoVsbvtnYWlwvIDzx0yNKxwXjzzygb
         DyvNl6HRTdkgZ8Iws+2UB+sRIni8ZIweusHAbrVTHZ7KO5vzosFaJek5YEaYVk2idNR9
         3QXM7rOhUbJI+T33ldEB0hnmZ3JH0zNbYCUwzFdVm9AxA2hucM1NUimNurI6JCLP7UHf
         /Htw==
X-Gm-Message-State: AOAM530pRvJfLVToZxnVX5z+SuhREQPpyxHVbYWuen92y65CQg7ODa7w
        x5QoCrjzA/SKduBN0MXUTPi55hrVCPCeP1oSFuLzkvgM6qqt6XHTYQ664qpUZMgSXkBgdcpljmX
        m6cOMi+80DDivJvN8JJZ1nUNCn5a0tNdtcA==
X-Received: by 2002:a17:907:3ea5:b0:6da:6ef4:b058 with SMTP id hs37-20020a1709073ea500b006da6ef4b058mr1738036ejc.124.1646232469914;
        Wed, 02 Mar 2022 06:47:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxob8zNIou+tkCBFDR/q5r1DfLjbibEFoBhfyWgeqIvTGP72v2/9jwCLdRngTuR91MTWfO6pw==
X-Received: by 2002:a17:907:3ea5:b0:6da:6ef4:b058 with SMTP id hs37-20020a1709073ea500b006da6ef4b058mr1738018ejc.124.1646232469608;
        Wed, 02 Mar 2022 06:47:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id o21-20020a170906289500b006d144662b24sm6411057ejd.152.2022.03.02.06.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 06:47:49 -0800 (PST)
Message-ID: <81dfe7a3-5882-1f9f-7271-a952846d44cc@redhat.com>
Date:   Wed, 2 Mar 2022 15:47:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add PSC mode support
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20220225182505.7234-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220225182505.7234-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/25/22 19:25, Mark Pearson wrote:
> The Lenovo AMD platforms use PSC mode for providing platform
> profile support.
> 
> Detect if PSC mode is available and add support for setting the
> different profile modes appropriately.
> 
> Note - if both MMC mode and PSC mode are available then MMC mode
> will be used in preference.
> 
> Tested on T14 G1 AMD and T14s G2 AMD.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

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



p.s.

One small thing which I noticed which could be improved is to
move the 2 convert_profile_to_dytc() calls in dytc_profile_set()
to a single call at the top of the function (before taking the
lock even) to avoid code duplication between the DYTC_FUNCMODE_MMC
vs DYTC_FUNCMODE_PSC paths.

I didn't want to block merging the patch on this, if you can
do a follow up patch with that as cleanup that would be great.






> ---
>  drivers/platform/x86/thinkpad_acpi.c | 172 ++++++++++++++++++---------
>  1 file changed, 119 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index d0599e8a7b4d..d9117f824ce9 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10130,6 +10130,7 @@ static struct ibm_struct proxsensor_driver_data = {
>  
>  #define DYTC_CMD_FUNC_CAP     3 /* To get DYTC capabilities */
>  #define DYTC_FC_MMC           27 /* MMC Mode supported */
> +#define DYTC_FC_PSC           29 /* PSC Mode supported */
>  
>  #define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
>  #define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
> @@ -10140,12 +10141,17 @@ static struct ibm_struct proxsensor_driver_data = {
>  
>  #define DYTC_FUNCTION_STD     0  /* Function = 0, standard mode */
>  #define DYTC_FUNCTION_CQL     1  /* Function = 1, lap mode */
> -#define DYTC_FUNCTION_MMC     11 /* Function = 11, desk mode */
> +#define DYTC_FUNCTION_MMC     11 /* Function = 11, MMC mode */
> +#define DYTC_FUNCTION_PSC     13 /* Function = 13, PSC mode */
>  
> -#define DYTC_MODE_PERFORM     2  /* High power mode aka performance */
> -#define DYTC_MODE_LOWPOWER    3  /* Low power mode */
> -#define DYTC_MODE_BALANCE   0xF  /* Default mode aka balanced */
> -#define DYTC_MODE_MMC_BALANCE 0  /* Default mode from MMC_GET, aka balanced */
> +#define DYTC_MODE_MMC_PERFORM  2  /* High power mode aka performance */
> +#define DYTC_MODE_MMC_LOWPOWER 3  /* Low power mode */
> +#define DYTC_MODE_MMC_BALANCE  0xF  /* Default mode aka balanced */
> +#define DYTC_MODE_MMC_DEFAULT  0  /* Default mode from MMC_GET, aka balanced */
> +
> +#define DYTC_MODE_PSC_LOWPOWER 3  /* Low power mode */
> +#define DYTC_MODE_PSC_BALANCE  5  /* Default mode aka balanced */
> +#define DYTC_MODE_PSC_PERFORM  7  /* High power mode aka performance */
>  
>  #define DYTC_ERR_MASK       0xF  /* Bits 0-3 in cmd result are the error result */
>  #define DYTC_ERR_SUCCESS      1  /* CMD completed successful */
> @@ -10155,10 +10161,16 @@ static struct ibm_struct proxsensor_driver_data = {
>  	 (mode) << DYTC_SET_MODE_BIT | \
>  	 (on) << DYTC_SET_VALID_BIT)
>  
> -#define DYTC_DISABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BALANCE, 0)
> +#define DYTC_DISABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_MMC_BALANCE, 0)
> +#define DYTC_ENABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_MMC_BALANCE, 1)
>  
> -#define DYTC_ENABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BALANCE, 1)
> +enum dytc_profile_funcmode {
> +	DYTC_FUNCMODE_NONE = 0,
> +	DYTC_FUNCMODE_MMC,
> +	DYTC_FUNCMODE_PSC,
> +};
>  
> +static enum dytc_profile_funcmode dytc_profile_available;
>  static enum platform_profile_option dytc_current_profile;
>  static atomic_t dytc_ignore_event = ATOMIC_INIT(0);
>  static DEFINE_MUTEX(dytc_mutex);
> @@ -10166,19 +10178,37 @@ static bool dytc_mmc_get_available;
>  
>  static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *profile)
>  {
> -	switch (dytcmode) {
> -	case DYTC_MODE_LOWPOWER:
> -		*profile = PLATFORM_PROFILE_LOW_POWER;
> -		break;
> -	case DYTC_MODE_BALANCE:
> -	case DYTC_MODE_MMC_BALANCE:
> -		*profile =  PLATFORM_PROFILE_BALANCED;
> -		break;
> -	case DYTC_MODE_PERFORM:
> -		*profile =  PLATFORM_PROFILE_PERFORMANCE;
> -		break;
> -	default: /* Unknown mode */
> -		return -EINVAL;
> +	if (dytc_profile_available == DYTC_FUNCMODE_MMC) {
> +		switch (dytcmode) {
> +		case DYTC_MODE_MMC_LOWPOWER:
> +			*profile = PLATFORM_PROFILE_LOW_POWER;
> +			break;
> +		case DYTC_MODE_MMC_DEFAULT:
> +		case DYTC_MODE_MMC_BALANCE:
> +			*profile =  PLATFORM_PROFILE_BALANCED;
> +			break;
> +		case DYTC_MODE_MMC_PERFORM:
> +			*profile =  PLATFORM_PROFILE_PERFORMANCE;
> +			break;
> +		default: /* Unknown mode */
> +			return -EINVAL;
> +		}
> +		return 0;
> +	}
> +	if (dytc_profile_available == DYTC_FUNCMODE_PSC) {
> +		switch (dytcmode) {
> +		case DYTC_MODE_PSC_LOWPOWER:
> +			*profile = PLATFORM_PROFILE_LOW_POWER;
> +			break;
> +		case DYTC_MODE_PSC_BALANCE:
> +			*profile =  PLATFORM_PROFILE_BALANCED;
> +			break;
> +		case DYTC_MODE_PSC_PERFORM:
> +			*profile =  PLATFORM_PROFILE_PERFORMANCE;
> +			break;
> +		default: /* Unknown mode */
> +			return -EINVAL;
> +		}
>  	}
>  	return 0;
>  }
> @@ -10187,13 +10217,22 @@ static int convert_profile_to_dytc(enum platform_profile_option profile, int *pe
>  {
>  	switch (profile) {
>  	case PLATFORM_PROFILE_LOW_POWER:
> -		*perfmode = DYTC_MODE_LOWPOWER;
> +		if (dytc_profile_available == DYTC_FUNCMODE_MMC)
> +			*perfmode = DYTC_MODE_MMC_LOWPOWER;
> +		else if (dytc_profile_available == DYTC_FUNCMODE_PSC)
> +			*perfmode = DYTC_MODE_PSC_LOWPOWER;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED:
> -		*perfmode = DYTC_MODE_BALANCE;
> +		if (dytc_profile_available == DYTC_FUNCMODE_MMC)
> +			*perfmode = DYTC_MODE_MMC_BALANCE;
> +		else if (dytc_profile_available == DYTC_FUNCMODE_PSC)
> +			*perfmode = DYTC_MODE_PSC_BALANCE;
>  		break;
>  	case PLATFORM_PROFILE_PERFORMANCE:
> -		*perfmode = DYTC_MODE_PERFORM;
> +		if (dytc_profile_available == DYTC_FUNCMODE_MMC)
> +			*perfmode = DYTC_MODE_MMC_PERFORM;
> +		else if (dytc_profile_available == DYTC_FUNCMODE_PSC)
> +			*perfmode = DYTC_MODE_PSC_PERFORM;
>  		break;
>  	default: /* Unknown profile */
>  		return -EOPNOTSUPP;
> @@ -10266,25 +10305,39 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
>  	if (err)
>  		return err;
>  
> -	if (profile == PLATFORM_PROFILE_BALANCED) {
> -		/*
> -		 * To get back to balanced mode we need to issue a reset command.
> -		 * Note we still need to disable CQL mode before hand and re-enable
> -		 * it afterwards, otherwise dytc_lapmode gets reset to 0 and stays
> -		 * stuck at 0 for aprox. 30 minutes.
> -		 */
> -		err = dytc_cql_command(DYTC_CMD_RESET, &output);
> -		if (err)
> -			goto unlock;
> -	} else {
> +	if (dytc_profile_available == DYTC_FUNCMODE_MMC) {
> +		if (profile == PLATFORM_PROFILE_BALANCED) {
> +			/*
> +			 * To get back to balanced mode we need to issue a reset command.
> +			 * Note we still need to disable CQL mode before hand and re-enable
> +			 * it afterwards, otherwise dytc_lapmode gets reset to 0 and stays
> +			 * stuck at 0 for aprox. 30 minutes.
> +			 */
> +			err = dytc_cql_command(DYTC_CMD_RESET, &output);
> +			if (err)
> +				goto unlock;
> +		} else {
> +			int perfmode;
> +
> +			err = convert_profile_to_dytc(profile, &perfmode);
> +			if (err)
> +				goto unlock;
> +
> +			/* Determine if we are in CQL mode. This alters the commands we do */
> +			err = dytc_cql_command(DYTC_SET_COMMAND(DYTC_FUNCTION_MMC, perfmode, 1),
> +						&output);
> +			if (err)
> +				goto unlock;
> +		}
> +	}
> +	if (dytc_profile_available == DYTC_FUNCMODE_PSC) {
>  		int perfmode;
>  
>  		err = convert_profile_to_dytc(profile, &perfmode);
>  		if (err)
>  			goto unlock;
>  
> -		/* Determine if we are in CQL mode. This alters the commands we do */
> -		err = dytc_cql_command(DYTC_SET_COMMAND(DYTC_FUNCTION_MMC, perfmode, 1), &output);
> +		err = dytc_command(DYTC_SET_COMMAND(DYTC_FUNCTION_PSC, perfmode, 1), &output);
>  		if (err)
>  			goto unlock;
>  	}
> @@ -10302,10 +10355,14 @@ static void dytc_profile_refresh(void)
>  	int perfmode;
>  
>  	mutex_lock(&dytc_mutex);
> -	if (dytc_mmc_get_available)
> -		err = dytc_command(DYTC_CMD_MMC_GET, &output);
> -	else
> -		err = dytc_cql_command(DYTC_CMD_GET, &output);
> +	if (dytc_profile_available == DYTC_FUNCMODE_MMC) {
> +		if (dytc_mmc_get_available)
> +			err = dytc_command(DYTC_CMD_MMC_GET, &output);
> +		else
> +			err = dytc_cql_command(DYTC_CMD_GET, &output);
> +	} else if (dytc_profile_available == DYTC_FUNCMODE_PSC)
> +		err = dytc_command(DYTC_CMD_GET, &output);
> +
>  	mutex_unlock(&dytc_mutex);
>  	if (err)
>  		return;
> @@ -10332,6 +10389,7 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  	set_bit(PLATFORM_PROFILE_BALANCED, dytc_profile.choices);
>  	set_bit(PLATFORM_PROFILE_PERFORMANCE, dytc_profile.choices);
>  
> +	dytc_profile_available = DYTC_FUNCMODE_NONE;
>  	err = dytc_command(DYTC_CMD_QUERY, &output);
>  	if (err)
>  		return err;
> @@ -10343,27 +10401,34 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  	if (dytc_version < 5)
>  		return -ENODEV;
>  
> -	/* Check what capabilities are supported. Currently MMC is needed */
> +	/* Check what capabilities are supported */
>  	err = dytc_command(DYTC_CMD_FUNC_CAP, &output);
>  	if (err)
>  		return err;
> -	if (!(output & BIT(DYTC_FC_MMC))) {
> -		dbg_printk(TPACPI_DBG_INIT, " DYTC MMC mode not supported\n");
> +
> +	if (test_bit(DYTC_FC_MMC, (void *)&output)) { /* MMC MODE */
> +		dytc_profile_available = DYTC_FUNCMODE_MMC;
> +
> +		/*
> +		 * Check if MMC_GET functionality available
> +		 * Version > 6 and return success from MMC_GET command
> +		 */
> +		dytc_mmc_get_available = false;
> +		if (dytc_version >= 6) {
> +			err = dytc_command(DYTC_CMD_MMC_GET, &output);
> +			if (!err && ((output & DYTC_ERR_MASK) == DYTC_ERR_SUCCESS))
> +				dytc_mmc_get_available = true;
> +		}
> +	} else if (test_bit(DYTC_FC_PSC, (void *)&output)) { /*PSC MODE */
> +		dytc_profile_available = DYTC_FUNCMODE_PSC;
> +	} else {
> +		dbg_printk(TPACPI_DBG_INIT, "No DYTC support available\n");
>  		return -ENODEV;
>  	}
>  
>  	dbg_printk(TPACPI_DBG_INIT,
>  			"DYTC version %d: thermal mode available\n", dytc_version);
> -	/*
> -	 * Check if MMC_GET functionality available
> -	 * Version > 6 and return success from MMC_GET command
> -	 */
> -	dytc_mmc_get_available = false;
> -	if (dytc_version >= 6) {
> -		err = dytc_command(DYTC_CMD_MMC_GET, &output);
> -		if (!err && ((output & DYTC_ERR_MASK) == DYTC_ERR_SUCCESS))
> -			dytc_mmc_get_available = true;
> -	}
> +
>  	/* Create platform_profile structure and register */
>  	err = platform_profile_register(&dytc_profile);
>  	/*
> @@ -10381,6 +10446,7 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  
>  static void dytc_profile_exit(void)
>  {
> +	dytc_profile_available = DYTC_FUNCMODE_NONE;
>  	platform_profile_remove();
>  }
>  

