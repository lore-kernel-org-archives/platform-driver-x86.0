Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6A0C433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Apr 2021 13:50:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0CCB61241
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Apr 2021 13:50:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbhDFNuP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Apr 2021 09:50:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48711 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244186AbhDFNuO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Apr 2021 09:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617717006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rdaZIj1oA1nI5P4G71oqT+FNgpznSHFNY6zygYjHL8E=;
        b=Hm5lv9I9OWu1Go+YCRBtIPCDpG3AbtliTYcma5oTO15Nu/idRwizi/wJ7HqWkczu5WSYE9
        5lEfr1KPu+0NhqCE9XdxfWLFJDX/vTGQqScxXZyjLQz2/je0a/IoQvygitt5nMOFyYCqFq
        hzTWf7pihGlWBeyjkv6avCKt1C0X7wI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-BGXBIcpNNTiA6MqxrJxckw-1; Tue, 06 Apr 2021 09:50:05 -0400
X-MC-Unique: BGXBIcpNNTiA6MqxrJxckw-1
Received: by mail-ed1-f70.google.com with SMTP id y23so5778650edl.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Apr 2021 06:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rdaZIj1oA1nI5P4G71oqT+FNgpznSHFNY6zygYjHL8E=;
        b=pCLBZOovejdYzODo/hwOWb0yAJZ8R8rIRqz6J/07bf1M7Rzaf5+nMyau9ky93y9Vly
         1PFW+neKvBBFNgSQ6dwQHwV651qzqXU5SQqtsvTuDCbkFnlWUpbaH/4wRQMdjNZvg4PZ
         7GhzZeaUsBBsVj6SwH1eg9HxbLmF1njHsbsGtNST72MY0j97kuSiIXjUjSoVuIPNfvsk
         OgQnRssTS+Lq8S5v3r+qPk8DR+bsa8d4QVhzNg5mayK8klQ0Jn0H0t4ZRvp9p3ZZp1tN
         5cpjkvAyQ33EyPUmezar202ACydcDLMoXIOlhFp/7/EF1rMizZNJsKu9bDI7lAJI3qEp
         McjA==
X-Gm-Message-State: AOAM531LO1iJZt9tj+UiFesIzEKHWe1IeyPk8nzMfH7+wDMyAP1jefCZ
        XrR1lwBuPofzkLONnMmbGDA5gtRaVPmAj3QgoIi62sVu9Ijm7FiIfa8iwkhKH67l5ISJO3NTGXX
        Ptm2wey2QxgBRuTcudaYrQibIfGOHEe31jZdnAkb28GT/lgJKI0FyGVLwYlOiTKvRKpdiwhk74M
        lNjdU7LL2a+A==
X-Received: by 2002:aa7:d84b:: with SMTP id f11mr12771119eds.149.1617717004042;
        Tue, 06 Apr 2021 06:50:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkYrY6mLyT88A0SYqWi40ouSouJP1OyCfUiEV64w8CpNtGi4kEi77N2ibAtCOOkUoq+ahZ9Q==
X-Received: by 2002:aa7:d84b:: with SMTP id f11mr12771100eds.149.1617717003827;
        Tue, 06 Apr 2021 06:50:03 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id m29sm7156032ejl.61.2021.04.06.06.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 06:50:03 -0700 (PDT)
Subject: Re: [PATCH] Add support for DYTC MMC_GET BIOS API.
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20210406022215.199998-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a9af6b1f-f667-99b5-efc4-11d7ae7afc3b@redhat.com>
Date:   Tue, 6 Apr 2021 15:50:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210406022215.199998-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/6/21 4:22 AM, Mark Pearson wrote:
> The BIOS team have added a new API that allows us to retrieve the
> current performance profile without having to disable/enable CQL
> mode. Adding the changes to use this API.
> 
> Tested on P15 and X1C8
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 0d9e2ddbf..4eb1ad443 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10050,6 +10050,7 @@ static struct ibm_struct proxsensor_driver_data = {
>   */
>  
>  #define DYTC_CMD_SET          1 /* To enable/disable IC function mode */
> +#define DYTC_CMD_MMC_GET      8 /* To get current MMC function and mode */
>  #define DYTC_CMD_RESET    0x1ff /* To reset back to default */
>  
>  #define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
> @@ -10066,6 +10067,10 @@ static struct ibm_struct proxsensor_driver_data = {
>  #define DYTC_MODE_PERFORM     2  /* High power mode aka performance */
>  #define DYTC_MODE_LOWPOWER    3  /* Low power mode */
>  #define DYTC_MODE_BALANCE   0xF  /* Default mode aka balanced */
> +#define DYTC_MODE_MMC_BALANCE 0  /* Default mode from MMC_GET, aka balanced */
> +
> +#define DYTC_ERR_MASK       0xF  /* Bits 0-3 in cmd result are the error result */
> +#define DYTC_ERR_SUCCESS      1  /* CMD completed successful */
>  
>  #define DYTC_SET_COMMAND(function, mode, on) \
>  	(DYTC_CMD_SET | (function) << DYTC_SET_FUNCTION_BIT | \
> @@ -10080,6 +10085,7 @@ static bool dytc_profile_available;
>  static enum platform_profile_option dytc_current_profile;
>  static atomic_t dytc_ignore_event = ATOMIC_INIT(0);
>  static DEFINE_MUTEX(dytc_mutex);
> +static bool dytc_mmc_get_available;
>  
>  static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *profile)
>  {
> @@ -10088,6 +10094,7 @@ static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *p
>  		*profile = PLATFORM_PROFILE_LOW_POWER;
>  		break;
>  	case DYTC_MODE_BALANCE:
> +	case DYTC_MODE_MMC_BALANCE:
>  		*profile =  PLATFORM_PROFILE_BALANCED;
>  		break;
>  	case DYTC_MODE_PERFORM:
> @@ -10165,7 +10172,6 @@ static int dytc_cql_command(int command, int *output)
>  		if (err)
>  			return err;
>  	}
> -
>  	return cmd_err;
>  }
>  
> @@ -10222,7 +10228,10 @@ static void dytc_profile_refresh(void)
>  	int perfmode;
>  
>  	mutex_lock(&dytc_mutex);
> -	err = dytc_cql_command(DYTC_CMD_GET, &output);
> +	if (dytc_mmc_get_available)
> +		err = dytc_command(DYTC_CMD_MMC_GET, &output);
> +	else
> +		err = dytc_cql_command(DYTC_CMD_GET, &output);
>  	mutex_unlock(&dytc_mutex);
>  	if (err)
>  		return;
> @@ -10271,6 +10280,17 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  	if (dytc_version >= 5) {
>  		dbg_printk(TPACPI_DBG_INIT,
>  				"DYTC version %d: thermal mode available\n", dytc_version);
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
> +		err = dytc_command(DYTC_CMD_QUERY, &output);

It seems this last:

		err = dytc_command(DYTC_CMD_QUERY, &output);

Line snuck in as a copy and paste error? Or is this intentional ?

If this is intentional, may I ask why this is done / needed ?

Regards,

Hans


>  		/* Create platform_profile structure and register */
>  		err = platform_profile_register(&dytc_profile);
>  		/*
> 

