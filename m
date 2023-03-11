Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B889C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Sat, 11 Mar 2023 11:13:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbjCKLN1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 11 Mar 2023 06:13:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbjCKLNT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Mar 2023 06:13:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99BF524124
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Mar 2023 03:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678533154;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rCCwmyApAihxP4yvLbt76+J6ZESYZiBkoYCjepoizvE=;
        b=gHfgADgTEE/i/bEUScVS28r6ILLnFgyoBR8S02/XgTqQn3HQMS+uuTNAFY+Ri1jMbwXSvw
        WshOePEMsVSRGXOVte/Qf3jtaUfj0csg+ULZbP7a1AYkSo5QEfuA0Pxl3UfEEL3Nvi0lLk
        AJy4jPAgFZZahgfrVzfdLjIlJeGwLFs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-NO8jY67lMuS3dYckReHTtw-1; Sat, 11 Mar 2023 06:12:33 -0500
X-MC-Unique: NO8jY67lMuS3dYckReHTtw-1
Received: by mail-ed1-f71.google.com with SMTP id da22-20020a056402177600b004c60694083eso10897727edb.5
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Mar 2023 03:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533152;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rCCwmyApAihxP4yvLbt76+J6ZESYZiBkoYCjepoizvE=;
        b=rZvpLnKe38JgIEbnCqLiZp5wb0nfNTKRLz1xpDaoMK9e4Y+l7+OvUe4elXi6G8Z4WL
         1HoxT7VasIgz0ruMkxNGlYah1C7eCDqo/jvXxzShApIuVYh7y9kDh/aa2W5vd674aUEE
         FCTMTNn0EkqE4JujuA452NUhGpSTLyb9h+00KISf24kd8i8N7i54VPgkbemc2nYHia/G
         Jy7v1twbBCMHPdLc24+6wmEppaI4z7LtJJjGw8OiSMnyNf6adRDbmC2hHfdD4bhHhdPc
         9phOCxvS50Lb9fZXWPIXx6wVbiEz//SkjHyKSlhJTYjtJNaxbnpFoBBRwlmdywQYklIX
         VVbw==
X-Gm-Message-State: AO0yUKUVBWl+NZI31Hz6JKPtUTCeGDDrAbZiki3BGeeXmpWvNAapfj1T
        yco0EunEzLzpxcIPhiOatDkx86os8pGr6A5OAUlkZLvrhzB8HyMhWcmknQWAnKshc3Sdh7q3ffN
        tqgXYlS06gSMNBG2BmAzJzKICMy6Uc/iuIw==
X-Received: by 2002:a17:906:16d0:b0:921:1c2c:48 with SMTP id t16-20020a17090616d000b009211c2c0048mr1295522ejd.49.1678533151889;
        Sat, 11 Mar 2023 03:12:31 -0800 (PST)
X-Google-Smtp-Source: AK7set80mysco1BuArjgjjwOJ+1BuiwMLI8EfFzqxX5yuGct88NWCGQJKR5qdZJEYfSQcMxULaaSNg==
X-Received: by 2002:a17:906:16d0:b0:921:1c2c:48 with SMTP id t16-20020a17090616d000b009211c2c0048mr1295511ejd.49.1678533151605;
        Sat, 11 Mar 2023 03:12:31 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y25-20020a170906519900b008eb5b085075sm983791ejk.122.2023.03.11.03.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 03:12:31 -0800 (PST)
Message-ID: <e3c00116-5283-8c76-7414-66f36fb575fa@redhat.com>
Date:   Sat, 11 Mar 2023 12:12:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: x86-android-tablets: select PMIC_OPREGION
 to resolve a link error of intel_soc_pmic_exec_mipi_pmic_seq_element
Content-Language: en-US, nl
To:     Tom Rix <trix@redhat.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230310192915.2700069-1-trix@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230310192915.2700069-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/10/23 20:29, Tom Rix wrote:
> A rand config causes this link error
> drivers/platform/x86/x86-android-tablets/lenovo.o: In function `lenovo_yt3_init':
> lenovo.c:(.init.text+0x6c): undefined reference to `intel_soc_pmic_exec_mipi_pmic_seq_element'
> 
> The rand config has
> CONFIG_X86_ANDROID_TABLETS=y
> CONFIG_PMIC_OPREGION=n
> 
> PMIC_OPREGION should be selected to build the
> intel_soc_pmic_exec_mipi_pmic_seq_element symbol.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks, but this is a dup with:

https://patchwork.kernel.org/project/platform-driver-x86/patch/20230309094035.18736-1-hdegoede@redhat.com/

I just did not get around to pushing that out to pdx86/for-next yet.
I have just pushed this to pdx86/for-next to avoid further duplicate fixes.

FWIW, since all other users of PMIC_OPREGION use depends on, not select this
should have been a depends on too. Unless Kconfig symbols are explicitly
intended to be selected (typically these are hidden Kconfig symbols (1))
then you should usually use depends on. Mixing depends on and select leads
to Kconfig circular dependencies errors.

Regards,

Hans


1) A hidden Kconfig symbol is one which is e.g. just 'bool' not
'bool "Description of feature here"' these typically are libraries /

helpers.




> ---
>  drivers/platform/x86/x86-android-tablets/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/Kconfig b/drivers/platform/x86/x86-android-tablets/Kconfig
> index 2b3daca5380b..65980229d783 100644
> --- a/drivers/platform/x86/x86-android-tablets/Kconfig
> +++ b/drivers/platform/x86/x86-android-tablets/Kconfig
> @@ -6,6 +6,7 @@
>  config X86_ANDROID_TABLETS
>  	tristate "X86 Android tablet support"
>  	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB
> +	select PMIC_OPREGION
>  	help
>  	  X86 tablets which ship with Android as (part of) the factory image
>  	  typically have various problems with their DSDTs. The factory kernels

