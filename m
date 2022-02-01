Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16294C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Feb 2022 15:37:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237717AbiBAPg7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Feb 2022 10:36:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36839 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233563AbiBAPg7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Feb 2022 10:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643729818;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4+mwvevp+lBx2C3TUC37a6/R8OnJgh4vzRavUG5FVEY=;
        b=YwJ9T1D11BYc+z8/ul9DEIt5uoGv0Q9HYt07mRDlfps1iA129/ogbR6hM2iVCoq7yphaI/
        pl/s8xaEg4mJ8QQAYg37FDUtdLjuL7As4esN63PNuP65MNBGT03cINmgbEvAJeDzvuanrm
        RgTSZutiRq1qFbujEa5nGLhFkmGeCjQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-cZoRoSUyOPqbcu-_L5MZnw-1; Tue, 01 Feb 2022 10:36:57 -0500
X-MC-Unique: cZoRoSUyOPqbcu-_L5MZnw-1
Received: by mail-ej1-f71.google.com with SMTP id q21-20020a17090622d500b006bb15a59a68so4788479eja.18
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Feb 2022 07:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4+mwvevp+lBx2C3TUC37a6/R8OnJgh4vzRavUG5FVEY=;
        b=5oz2xg1dCVl23IDxwiKc31kBqivY74s4V+V9XBOjpoHJwiMA9blUDt4mmcgzm32XI7
         LJE41QJy81YA84exqAyZubbq9bVpv+upuHiZeGybaAJPsuwp80xVoH7EEyeZL04qRNZJ
         befsBbZcNFfIAVkhOBAooFk6yv1JOULME2Izq9YposT4jHKezBZxmS11XeffNWB0cAJI
         TqoPRhMMIRlMWiKkya/Fd29ARMSZ1iZUJKdm9q70sSXZ666EDO14ldIH6cz7weTTSjeo
         GtDsPTdkQON4uBRN4dJeyG8fBcj5cuU3cvamJOCHnoDWUvpOkNtRuSADXYARXkHBtA4e
         i4oA==
X-Gm-Message-State: AOAM532+fvk+AXAfE5VBf0L199ZR61eglnWoDauzRt6pTXwE3e9JcxXT
        sWwqlVpNr0T//fj/BPekeCkhYmY2WqWGa2qRxNBBrl6p3IC1uVZCDCOnEPAyQQnMO19FqNidv7C
        ujsmebn3J8K5aIJZXJDMZFgaIQxhLAolkWw==
X-Received: by 2002:a17:906:5352:: with SMTP id j18mr21943163ejo.191.1643729816246;
        Tue, 01 Feb 2022 07:36:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9lknG99QhLjTpQgzODZzHQXW0Z9DGlwf6vyvFcFEhUjY7OhikCVLQ7wJ5f/aH7xQb7Sn82g==
X-Received: by 2002:a17:906:5352:: with SMTP id j18mr21943150ejo.191.1643729815968;
        Tue, 01 Feb 2022 07:36:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id j15sm14893577ejb.9.2022.02.01.07.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 07:36:55 -0800 (PST)
Message-ID: <10bef89e-c1bc-5268-f244-c5f6b763f0f7@redhat.com>
Date:   Tue, 1 Feb 2022 16:36:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix incorrect use of
 platform profile on AMD platforms
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20220127190358.4078-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220127190358.4078-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 1/27/22 20:03, Mark Pearson wrote:
> Lenovo AMD based platforms have been offering platform_profiles but they
> are not working correctly. This is because the mode we are using on the
> Intel platforms (MMC) is not available on the AMD platforms.
> 
> This commit adds checking of the functional capabilities returned by the
> BIOS to confirm if MMC is supported or not. Profiles will not be
> available if the platform is not MMC capable.
> 
> I'm investigating and working on an alternative for AMD platforms but
> that is still work-in-progress.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
> Changes in v2:
>  - Rebased on review-hans branch to be in sync with latest
>  - Return -ENODEV if funtion not available
> 
>  drivers/platform/x86/thinkpad_acpi.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 33f611af6e51..5e4de74586cd 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10119,6 +10119,9 @@ static struct ibm_struct proxsensor_driver_data = {
>  #define DYTC_CMD_MMC_GET      8 /* To get current MMC function and mode */
>  #define DYTC_CMD_RESET    0x1ff /* To reset back to default */
>  
> +#define DYTC_CMD_FUNC_CAP     3 /* To get DYTC capabilities */
> +#define DYTC_FC_MMC           27 /* MMC Mode supported */
> +
>  #define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
>  #define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
>  
> @@ -10331,6 +10334,15 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  	if (dytc_version < 5)
>  		return -ENODEV;
>  
> +	/* Check what capabilities are supported. Currently MMC is needed */
> +	err = dytc_command(DYTC_CMD_FUNC_CAP, &output);
> +	if (err)
> +		return err;
> +	if (!test_bit(DYTC_FC_MMC, (void *)&output)) {

Erm test_bit operates on longs, so it may read an entire long from
&output which is 64 bits on x86_64, thus exceeding the space allocated
on the stack by 32 bits.

To avoid this I've replaced the if with:

	if (!(output & BIT(DYTC_FC_MMC))) {

And verified on a x1c8 that the performance-profiles still work there
after this change.

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will include this patch in the upcoming pdx86 fixes for 5.17
pull-req which I will send out soon.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> +		dbg_printk(TPACPI_DBG_INIT, " DYTC MMC mode not supported\n");
> +		return -ENODEV;
> +	}
> +
>  	dbg_printk(TPACPI_DBG_INIT,
>  			"DYTC version %d: thermal mode available\n", dytc_version);
>  	/*
> 

