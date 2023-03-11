Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A322CC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Sat, 11 Mar 2023 11:07:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjCKLHw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 11 Mar 2023 06:07:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjCKLHv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Mar 2023 06:07:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E97125B9F
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Mar 2023 03:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678532823;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FbQqHGhH+ljVjXCzZ+9XvDPGWO2NdWGjYQr6UXpBppw=;
        b=CLn5MmtHARO/mTqFH461WNeSjSQVuQ1UJ7uktsdu+KlTPFGWg26IqkJurwFPrVuQzZNDIO
        y0NhVNDhZupYM7VTY6pO9Ois90x/NI0NBzGt04DSriUMvIoZ0ytkQPdFy673f1np7TDlZp
        0S60Nu8oayqxCmcQczHztRymWg1RCv0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-Oo7ghlKwNVqGpfAu1eUK7g-1; Sat, 11 Mar 2023 06:07:02 -0500
X-MC-Unique: Oo7ghlKwNVqGpfAu1eUK7g-1
Received: by mail-ed1-f72.google.com with SMTP id fi8-20020a056402550800b004a26cc7f6cbso10979928edb.4
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Mar 2023 03:07:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678532820;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FbQqHGhH+ljVjXCzZ+9XvDPGWO2NdWGjYQr6UXpBppw=;
        b=394vr+lNyVgGJWA686otCrl6osbywR4n60HauTiZOjqdEs0E6OGllm7SA1vjGipwgd
         0AXPpasZ96z9XlYeVT/uFNr3R5t0foZZolW78agh8gapPzB9CXiPkzhjzLtlM3G5B4dC
         u0FzZge2O0AtX10kjG8FyV2V0pcZA9WX8R0mpSapPGYe3n91GrXZk6ijvw6+HSZeNuAv
         3YtikBcYkV8oPEw02QqTx9g0CvH7svG+yb6fBDsAvCvFkCWzmG1Vb+MU1LWwyKxD4GVQ
         sLKXJHaGGUJnLG3OSZFl4UYUAIouLJ2Xuuc2jIdi6z+KtStJ0dCROqXGkwO7MstqSZh7
         N2yg==
X-Gm-Message-State: AO0yUKW2raY9AHrJGTecCLQ1bEl8jMcRTex3cIm8FkpKzm3DKt2yogkQ
        +rNQXi4fKgjMhQG5hgB+Yv6A6ydShYSi5b6/TvSVJi4dCGW2t+zlv9cylhCs3p/4ep20Hh2ZQ5x
        UDXUwzcA7ZkLemcy8vlFstRD4KRimwxoXV1Ik/QPtmA==
X-Received: by 2002:a17:907:7daa:b0:8b1:30da:b586 with SMTP id oz42-20020a1709077daa00b008b130dab586mr35162307ejc.49.1678532820663;
        Sat, 11 Mar 2023 03:07:00 -0800 (PST)
X-Google-Smtp-Source: AK7set+Zv67Lh0HAKveLNflBHxBYirrDwhlUoAg1BHcOtrZ+kv28bqKhiWyYiV+95NKsdSfAYYzkvw==
X-Received: by 2002:a17:907:7daa:b0:8b1:30da:b586 with SMTP id oz42-20020a1709077daa00b008b130dab586mr35162298ejc.49.1678532820403;
        Sat, 11 Mar 2023 03:07:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id rn2-20020a170906d92200b00921c608b737sm406568ejb.126.2023.03.11.03.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 03:06:59 -0800 (PST)
Message-ID: <089d973c-c878-3750-2b37-808213ac2f50@redhat.com>
Date:   Sat, 11 Mar 2023 12:06:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] platform/x86: x86-android-tablets: Add depends on
 PMIC_OPREGION
Content-Language: en-US, nl
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>, Tom Rix <trix@redhat.com>
References: <20230309094035.18736-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230309094035.18736-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/9/23 10:40, Hans de Goede wrote:
> Add a depends on PMIC_OPREGION to x86-android-tablets Kconfig to fix
> the following build error:
> 
> ERROR: modpost: "intel_soc_pmic_exec_mipi_pmic_seq_element"
>  [drivers/platform/x86/x86-android-tablets/x86-android-tablets.ko] undefined!
> 
> Fixes: 9b1d2662b8c5 ("platform/x86: x86-android-tablets: Add touchscreen support for Lenovo Yoga Tab 3 Pro YT3-X90F")
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303091711.howZNrIY-lkp@intel.com/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Add Fixes tag

I've pushed this out to the pdx86/for-next branch now.

Regards,

Hans




> ---
>  drivers/platform/x86/x86-android-tablets/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/Kconfig b/drivers/platform/x86/x86-android-tablets/Kconfig
> index 2b3daca5380b..6603461d4273 100644
> --- a/drivers/platform/x86/x86-android-tablets/Kconfig
> +++ b/drivers/platform/x86/x86-android-tablets/Kconfig
> @@ -5,7 +5,7 @@
>  
>  config X86_ANDROID_TABLETS
>  	tristate "X86 Android tablet support"
> -	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB
> +	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB && PMIC_OPREGION
>  	help
>  	  X86 tablets which ship with Android as (part of) the factory image
>  	  typically have various problems with their DSDTs. The factory kernels

