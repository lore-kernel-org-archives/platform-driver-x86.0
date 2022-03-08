Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A10C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Mar 2022 15:34:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347813AbiCHPe7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Mar 2022 10:34:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243576AbiCHPe6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Mar 2022 10:34:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 74BB937A9E
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Mar 2022 07:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646753641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ov/RcC4X2RYiTsH1jcOCPtq7T3WBM4ndO7E3rePTrXk=;
        b=YDT5o2HqCQMcod80FKbW1Gt+7U/3vAHQHfTcOdM4RaAQTZLtUlusTE03AhoypOoF+B7qmC
        NvZyz4kPBQiSojulEgzUedZqYE7mnoZGUof4qI/uXuy0GR05AeJBX7F4S20ZxRStUIu9GX
        pVJf7gllStrfirIux/bmb5J1EQZpCuk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-5yr89Gf7O2atVZ2-GG59Dg-1; Tue, 08 Mar 2022 10:34:00 -0500
X-MC-Unique: 5yr89Gf7O2atVZ2-GG59Dg-1
Received: by mail-ed1-f69.google.com with SMTP id e10-20020a056402190a00b00410f20467abso10794856edz.14
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Mar 2022 07:34:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ov/RcC4X2RYiTsH1jcOCPtq7T3WBM4ndO7E3rePTrXk=;
        b=zd9vPSeVRmH8p/76ZboJOfs07HHaJjY/NLaeZFygaPQ9dsUlrrqlxtEnnl75e3Ak/a
         ItpLORfjPOMdRKeQAv89gyrOHy/a/kswzG2s+klg0pojswN9b3f91eAGaAfVJGz0mL5j
         Ea0epU3+P6yR6hpHLanXeqBCHv9BI0Q864cCzLXGjnt7ORgaG7m98+j4ASLYZkZGn7Kt
         Ktpkp/P+sEATGEUlNDdIFytc7LRP5SE1QYh+65PP26t2yRc/BoWjm1C9dMUJHCJHW2ps
         YFKu8d4wf1NZZU2tx3o+wbZkCcHmbziN/KrVjoEnuo42/NhNvzwUuApkBG8t9SlW7npx
         BstQ==
X-Gm-Message-State: AOAM533a9Ag45efO5LBN/k6IlJ2EMe9clA/0TJixD5o/sW+LDayzkf1U
        UEGvpe0qzy0gmzZ8oJzOI+Fna+47WpIxnywXD5pZhMAYQs3N5+645thHicp6UYESIfMyblJewvX
        ynkZ1kw3gS5oqNeKo3Hz037aggTYScbehog==
X-Received: by 2002:a17:906:52c7:b0:6ce:a880:50a3 with SMTP id w7-20020a17090652c700b006cea88050a3mr13523162ejn.437.1646753639341;
        Tue, 08 Mar 2022 07:33:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYBQgbvZzkQ7woMucxtbLEIqAeviAZnRl2MqAff8h29kjw+bUlITB/bAP/nDjFPrNsgqB5iw==
X-Received: by 2002:a17:906:52c7:b0:6ce:a880:50a3 with SMTP id w7-20020a17090652c700b006cea88050a3mr13523145ejn.437.1646753639141;
        Tue, 08 Mar 2022 07:33:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id f26-20020a50ee9a000000b004160c295356sm6055753edr.5.2022.03.08.07.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 07:33:58 -0800 (PST)
Message-ID: <a54aab27-e469-5220-273f-f844ceea8155@redhat.com>
Date:   Tue, 8 Mar 2022 16:33:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Depend on EFI and SPI
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>
References: <20220308152942.262130-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220308152942.262130-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/8/22 16:29, Hans de Goede wrote:
> The recently added support for Lenovo Yoga Tablet 2 tablets uses
> symbols from EFI and SPI add "depends on EFI && SPI" to the
> X86_ANDROID_TABLETS Kconfig entry.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0d51011d5d90..5d9dd70e4e0f 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1041,7 +1041,7 @@ config TOUCHSCREEN_DMI
>  
>  config X86_ANDROID_TABLETS
>  	tristate "X86 Android tablet support"
> -	depends on I2C && SERIAL_DEV_BUS && ACPI && GPIOLIB
> +	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB
>  	help
>  	  X86 tablets which ship with Android as (part of) the factory image
>  	  typically have various problems with their DSDTs. The factory kernels

