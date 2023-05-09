Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C4AC7EE22
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 May 2023 09:30:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234876AbjEIJ37 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 May 2023 05:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235029AbjEIJ3z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2023 05:29:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E87E5
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 May 2023 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683624546;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P9XUZXA1pMSg9+rIsWnTqbriRFrdHmv0Ah3gWz9nrS4=;
        b=ELoCG/dkGg1mdU0z6PZzAGEwVBWGJlAt8LdlvYd3XQ8S/JESDbv0n04nBQaxAkQHwTVGvy
        hMv9QuciIoIS1cHwvlzikk2t8VWFOGAbeU0J9iPGp8KWvioWJeaTRCPvOaGB+zAQGzilKS
        FdiCf2Mv9UbS0jm690fG34aX04yso7A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-GQRSTOlgPcq95udQths0YQ-1; Tue, 09 May 2023 05:29:05 -0400
X-MC-Unique: GQRSTOlgPcq95udQths0YQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-50bca29a1deso6456684a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 May 2023 02:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683624544; x=1686216544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P9XUZXA1pMSg9+rIsWnTqbriRFrdHmv0Ah3gWz9nrS4=;
        b=HKN83p4t/hvvXXLu1WyJoeb96SCSmGlfpdfLug+VD0ANP5geBZCZn4yVcXeI16ux8g
         j/AN+XoNafPNapEBAs5ef42+kEt+zUGpTmw555NNJLIPN8168mHe86TFT0cpFEHLLNlN
         GAlU6jsNV99T58by5K+AeYJzIl/R43i4wjPzlcsAqRXL0AS7k2UW4TI+2gaqSqrc77qF
         uNEJK65RKRBIaG8pLH1Nes95+97aV2qy2Ab8J52loRxM+SuwxFp+/WRkL74sfGAJcOg3
         XxLzsG6Bt8yYUKzhHmKQ3Saio0xT1anbt09rV2K8fdwayOy/KzB98BRSvVpD0xKqeFTx
         Zkcg==
X-Gm-Message-State: AC+VfDzotarwJMouDDQ+JGrFiAisYClSVUIUaqGDclVdzgpLwTlMtfjD
        cFZCDbxqhCYeNFj9qbr3rnk4TzQjS5wM8aCGKlouUDEwsoDkaHbEP6KDvW6OatiqD5GMv3ASxAz
        FlCNlBuEqwuee+fmcVa8oWhYbSwn+EI1Cl9+uklrXvg==
X-Received: by 2002:aa7:df98:0:b0:50b:d669:ba6 with SMTP id b24-20020aa7df98000000b0050bd6690ba6mr9392948edy.42.1683624544265;
        Tue, 09 May 2023 02:29:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6jmx50DmPPJmmv7qgF5C7vDQkK5crOflzDQrt00GPMKCvsIzbJaa1Epqz9nm/JOlF5sfphIQ==
X-Received: by 2002:aa7:df98:0:b0:50b:d669:ba6 with SMTP id b24-20020aa7df98000000b0050bd6690ba6mr9392943edy.42.1683624544086;
        Tue, 09 May 2023 02:29:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q22-20020aa7da96000000b0050470aa444fsm537909eds.51.2023.05.09.02.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 02:29:03 -0700 (PDT)
Message-ID: <e4bd8701-7adf-0696-b108-e254838efcaf@redhat.com>
Date:   Tue, 9 May 2023 11:29:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] platform/x86: x86-android-tablets: Fix Bluetooth on
 Lenovo Yoga Book
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230429180230.97716-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230429180230.97716-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/29/23 20:02, Hans de Goede wrote:
> The Lenovo Yoga Book yb1-x90f/l has (another) bug in its DSDT where
> the UART resource for the BTH0 ACPI device contains
> "\\_SB.PCIO.URT1" as path to the UART.
> 
> Note that is with a letter 'O' instead of the number '0' which is wrong.
> 
> Add a x86_serdev_info entry to make the x86-android-tablets module
> manually setup the /sys/bus/serial device for the Bluetooth UART
> to fix Bluetooth not working due to this bug.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this series to my review-hans (soon to be for-next) branch now.

Regards,

Hans




> ---
>  drivers/platform/x86/x86-android-tablets/lenovo.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
> index 0297b4c43d3b..270c4712fa7c 100644
> --- a/drivers/platform/x86/x86-android-tablets/lenovo.c
> +++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
> @@ -147,6 +147,19 @@ static const struct platform_device_info lenovo_yb1_x90_pdevs[] __initconst = {
>  	},
>  };
>  
> +/*
> + * DSDT says UART path is "\\_SB.PCIO.URT1" with a letter 'O' instead of
> + * the number '0' add the link manually.
> + */
> +static const struct x86_serdev_info lenovo_yb1_x90_serdevs[] __initconst = {
> +	{
> +		.ctrl_hid = "8086228A",
> +		.ctrl_uid = "1",
> +		.ctrl_devname = "serial0",
> +		.serdev_hid = "BCM2E1A",
> +	},
> +};
> +
>  static struct gpiod_lookup_table lenovo_yb1_x90_goodix_gpios = {
>  	.dev_id = "i2c-goodix_ts",
>  	.table = {
> @@ -203,6 +216,8 @@ const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
>  	.i2c_client_count = ARRAY_SIZE(lenovo_yb1_x90_i2c_clients),
>  	.pdev_info = lenovo_yb1_x90_pdevs,
>  	.pdev_count = ARRAY_SIZE(lenovo_yb1_x90_pdevs),
> +	.serdev_info = lenovo_yb1_x90_serdevs,
> +	.serdev_count = ARRAY_SIZE(lenovo_yb1_x90_serdevs),
>  	.gpiod_lookup_tables = lenovo_yb1_x90_gpios,
>  	.init = lenovo_yb1_x90_init,
>  };

