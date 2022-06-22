Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CD9CCA481
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Jun 2022 09:52:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233876AbiFVJwv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Jun 2022 05:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357220AbiFVJvW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 05:51:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4BA0A396BB
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 02:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655891480;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AGZ9p2g/U8fGYmkmrh1NoNpbTsE/LGRIKrBM8g8RxnU=;
        b=FX1WV/aptvVk4ZJfYf8P+Xc5RKYvgZWYtdWlHiu2pvyoDwEHU2jE7fPcagsAU20pZM+ck7
        mxe3OuPjX8KfNVL4N0SLRtyPhPFScwG88xJax2aYCGPjI8NwsaDuXioeBPZ2b2qn6Kf1Xq
        DysS8NK4IixkdeI+xap2yEAsk+jaNDM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-RTtw1nNRO2CJFSyUe1qGwQ-1; Wed, 22 Jun 2022 05:51:19 -0400
X-MC-Unique: RTtw1nNRO2CJFSyUe1qGwQ-1
Received: by mail-ed1-f72.google.com with SMTP id z20-20020a05640235d400b0042dfc1c0e80so12921422edc.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 02:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AGZ9p2g/U8fGYmkmrh1NoNpbTsE/LGRIKrBM8g8RxnU=;
        b=pXPbWCIGZa3lrpigDos8wWvDIzOABvnsETGvFZr1vRnUDRRvu5LCODdTBggcWFsxQJ
         w8M+GJE7ZMeoD59MPXyQ0ZZ6jINpXpbg3t+j+WRIFKTc7/zMjGT/ZMxkDBWKjWp6F0Hv
         oCYsy7gugNQQ5G+cOftnGb9qYCqlan8GitJ0maZKdHII8QoMeAp/nst94shTOegzvs6C
         PjfVbsJ/ih3QO+6iqKnBOFwIXPqz/9m7kALytBXftt93Fvrya8F90kmbBlHcA2l3J9s1
         pf//rezyKAHGLJE7tYQsYtIO80/9a/gs4m0vdEfszZ9yHSkpzopviIP9PzG/SuDLiUEr
         pdgg==
X-Gm-Message-State: AJIora+gil04DpQWBr6mveoYmyoPiq1qOCNTZiRh5/kPm0j+dJicI1El
        eTPoq0MQTb7Z25t44tyQ/kdf9rSAmALLzIC5N/jbLwCwvIeS4AOdcSPhedlJ7soTtyYJ8PuVz2j
        GE7YvkRpVkv0N/nMqFtA4619mIlDlNS0q1g==
X-Received: by 2002:aa7:c1c7:0:b0:435:5cb2:c202 with SMTP id d7-20020aa7c1c7000000b004355cb2c202mr3204505edp.10.1655891477922;
        Wed, 22 Jun 2022 02:51:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ubuA42FoTpODjvdN2OwMJ8/yHM9zdjy7ZZKzwNtX27AJevTlsDlaJDAPUUXLrXzWjN+F5/FA==
X-Received: by 2002:aa7:c1c7:0:b0:435:5cb2:c202 with SMTP id d7-20020aa7c1c7000000b004355cb2c202mr3204485edp.10.1655891477719;
        Wed, 22 Jun 2022 02:51:17 -0700 (PDT)
Received: from [192.168.43.127] ([109.37.135.195])
        by smtp.gmail.com with ESMTPSA id 21-20020a170906309500b00706287ba061sm828849ejv.180.2022.06.22.02.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 02:51:17 -0700 (PDT)
Message-ID: <a83f93e6-3181-4305-1ceb-fe27a1394d44@redhat.com>
Date:   Wed, 22 Jun 2022 11:51:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/4] platform/x86: thinkpad-acpi: profile capabilities as
 integer
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
References: <markpearson@lenovo.com>
 <20220603170212.164963-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220603170212.164963-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/3/22 19:02, Mark Pearson wrote:
> Currently the active mode (PSC/MMC) is stored in an enum and queried
> throughout the driver.
> 
> Other driver changes will enumerate additional submodes that are relevant
> to be tracked, so instead track PSC/MMC in a single integer variable.
> 
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
>  drivers/platform/x86/thinkpad_acpi.c | 45 +++++++++++-----------------
>  1 file changed, 18 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index e6cb4a14cdd4..5d1e0a3a5c1e 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10299,21 +10299,15 @@ static struct ibm_struct proxsensor_driver_data = {
>  #define DYTC_DISABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_MMC_BALANCE, 0)
>  #define DYTC_ENABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_MMC_BALANCE, 1)
>  
> -enum dytc_profile_funcmode {
> -	DYTC_FUNCMODE_NONE = 0,
> -	DYTC_FUNCMODE_MMC,
> -	DYTC_FUNCMODE_PSC,
> -};
> -
> -static enum dytc_profile_funcmode dytc_profile_available;
>  static enum platform_profile_option dytc_current_profile;
>  static atomic_t dytc_ignore_event = ATOMIC_INIT(0);
>  static DEFINE_MUTEX(dytc_mutex);
> +static int dytc_capabilities;
>  static bool dytc_mmc_get_available;
>  
>  static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *profile)
>  {
> -	if (dytc_profile_available == DYTC_FUNCMODE_MMC) {
> +	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
>  		switch (dytcmode) {
>  		case DYTC_MODE_MMC_LOWPOWER:
>  			*profile = PLATFORM_PROFILE_LOW_POWER;
> @@ -10330,7 +10324,7 @@ static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *p
>  		}
>  		return 0;
>  	}
> -	if (dytc_profile_available == DYTC_FUNCMODE_PSC) {
> +	if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
>  		switch (dytcmode) {
>  		case DYTC_MODE_PSC_LOWPOWER:
>  			*profile = PLATFORM_PROFILE_LOW_POWER;
> @@ -10352,21 +10346,21 @@ static int convert_profile_to_dytc(enum platform_profile_option profile, int *pe
>  {
>  	switch (profile) {
>  	case PLATFORM_PROFILE_LOW_POWER:
> -		if (dytc_profile_available == DYTC_FUNCMODE_MMC)
> +		if (dytc_capabilities & BIT(DYTC_FC_MMC))
>  			*perfmode = DYTC_MODE_MMC_LOWPOWER;
> -		else if (dytc_profile_available == DYTC_FUNCMODE_PSC)
> +		else if (dytc_capabilities & BIT(DYTC_FC_PSC))
>  			*perfmode = DYTC_MODE_PSC_LOWPOWER;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED:
> -		if (dytc_profile_available == DYTC_FUNCMODE_MMC)
> +		if (dytc_capabilities & BIT(DYTC_FC_MMC))
>  			*perfmode = DYTC_MODE_MMC_BALANCE;
> -		else if (dytc_profile_available == DYTC_FUNCMODE_PSC)
> +		else if (dytc_capabilities & BIT(DYTC_FC_PSC))
>  			*perfmode = DYTC_MODE_PSC_BALANCE;
>  		break;
>  	case PLATFORM_PROFILE_PERFORMANCE:
> -		if (dytc_profile_available == DYTC_FUNCMODE_MMC)
> +		if (dytc_capabilities & BIT(DYTC_FC_MMC))
>  			*perfmode = DYTC_MODE_MMC_PERFORM;
> -		else if (dytc_profile_available == DYTC_FUNCMODE_PSC)
> +		else if (dytc_capabilities & BIT(DYTC_FC_PSC))
>  			*perfmode = DYTC_MODE_PSC_PERFORM;
>  		break;
>  	default: /* Unknown profile */
> @@ -10445,7 +10439,7 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
>  	if (err)
>  		goto unlock;
>  
> -	if (dytc_profile_available == DYTC_FUNCMODE_MMC) {
> +	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
>  		if (profile == PLATFORM_PROFILE_BALANCED) {
>  			/*
>  			 * To get back to balanced mode we need to issue a reset command.
> @@ -10464,7 +10458,7 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
>  				goto unlock;
>  		}
>  	}
> -	if (dytc_profile_available == DYTC_FUNCMODE_PSC) {
> +	if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
>  		err = dytc_command(DYTC_SET_COMMAND(DYTC_FUNCTION_PSC, perfmode, 1), &output);
>  		if (err)
>  			goto unlock;
> @@ -10483,12 +10477,12 @@ static void dytc_profile_refresh(void)
>  	int perfmode;
>  
>  	mutex_lock(&dytc_mutex);
> -	if (dytc_profile_available == DYTC_FUNCMODE_MMC) {
> +	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
>  		if (dytc_mmc_get_available)
>  			err = dytc_command(DYTC_CMD_MMC_GET, &output);
>  		else
>  			err = dytc_cql_command(DYTC_CMD_GET, &output);
> -	} else if (dytc_profile_available == DYTC_FUNCMODE_PSC)
> +	} else if (dytc_capabilities & BIT(DYTC_FC_PSC))
>  		err = dytc_command(DYTC_CMD_GET, &output);
>  
>  	mutex_unlock(&dytc_mutex);
> @@ -10517,7 +10511,6 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  	set_bit(PLATFORM_PROFILE_BALANCED, dytc_profile.choices);
>  	set_bit(PLATFORM_PROFILE_PERFORMANCE, dytc_profile.choices);
>  
> -	dytc_profile_available = DYTC_FUNCMODE_NONE;
>  	err = dytc_command(DYTC_CMD_QUERY, &output);
>  	if (err)
>  		return err;
> @@ -10530,13 +10523,12 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  		return -ENODEV;
>  
>  	/* Check what capabilities are supported */
> -	err = dytc_command(DYTC_CMD_FUNC_CAP, &output);
> +	err = dytc_command(DYTC_CMD_FUNC_CAP, &dytc_capabilities);
>  	if (err)
>  		return err;
>  
> -	if (output & BIT(DYTC_FC_MMC)) { /* MMC MODE */
> -		dytc_profile_available = DYTC_FUNCMODE_MMC;
> -
> +	if (dytc_capabilities & BIT(DYTC_FC_MMC)) { /* MMC MODE */
> +		pr_debug("MMC is supported\n");
>  		/*
>  		 * Check if MMC_GET functionality available
>  		 * Version > 6 and return success from MMC_GET command
> @@ -10547,8 +10539,8 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  			if (!err && ((output & DYTC_ERR_MASK) == DYTC_ERR_SUCCESS))
>  				dytc_mmc_get_available = true;
>  		}
> -	} else if (output & BIT(DYTC_FC_PSC)) { /* PSC MODE */
> -		dytc_profile_available = DYTC_FUNCMODE_PSC;
> +	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) { /* PSC MODE */
> +		pr_debug("PSC is supported\n");
>  	} else {
>  		dbg_printk(TPACPI_DBG_INIT, "No DYTC support available\n");
>  		return -ENODEV;
> @@ -10574,7 +10566,6 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  
>  static void dytc_profile_exit(void)
>  {
> -	dytc_profile_available = DYTC_FUNCMODE_NONE;
>  	platform_profile_remove();
>  }
>  

