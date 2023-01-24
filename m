Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F3DC25B4E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Jan 2023 12:44:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233959AbjAXMof (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Jan 2023 07:44:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233952AbjAXMoe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Jan 2023 07:44:34 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A163B41B43
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jan 2023 04:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674564226;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JvA72lC2y7yA+g3ktJNsMpev3T0uMvRX2bOhVwYebJI=;
        b=aUJCrQjSLZA5DPSYcV3g1FvDSc03JP68OkVuBqRbjL0FSKpTN3Xd0tCU/4C8wU2e7wFPDG
        CRGYLSARcM5NgfRCixfuYix+puxTx6mqZZqctH2vOO27+p07wIqaee3NJel1BX5ielZ2Vg
        fmUEueS5OOWTzfbL6i2XAPsQr4v3dDA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-Rddj0LTqMN2QG7jMMr2B3Q-1; Tue, 24 Jan 2023 07:43:45 -0500
X-MC-Unique: Rddj0LTqMN2QG7jMMr2B3Q-1
Received: by mail-ed1-f71.google.com with SMTP id y2-20020a056402440200b0049e4d71f5dcso10628211eda.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jan 2023 04:43:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JvA72lC2y7yA+g3ktJNsMpev3T0uMvRX2bOhVwYebJI=;
        b=kIcv8lzqhXJuCyger5PFmyoEJ6o0MCT64voiAurfkeNm0tJxHB1ETgLX1uq5gVqsNg
         m4iOS7YeFDdOiOLYcJ6b6xIcD1D46wmltDhfXVgSCvm2j89zUUoqKtJ8VVrUhFawSxxU
         eh51p35RP9WE79GvOKVq/Z5T9SvsAuxY8+ZyxKL9lWVaHgDEcDwDUGGHUh/Ougxklypp
         wsppZIMMuTIKE6CbxPJVS+uxNrnagS0J012D6QIYk48R4SGIKr07drABfcTOmtlZ7ymX
         eAskF8+vIRGk7DSxPmn7BDABa2+RHOiQDnBkVkSbOP6tbnb3tBFEGiAb2XaILSCQUi56
         k/sw==
X-Gm-Message-State: AFqh2kooFq94iO3cKMaHFCdHnX6AtJzW6482fLeR8IeOZYhS4S/AZkOy
        BOpPAD5giE9B0mX7e+BuSlAH4PIeAkVcLgVQzWmrxeoFeMdcD0OPhhYzhwiX2yU9BOw+02h7Hf+
        Vh62KHhw5NrpeD9mAiVClkOKWhmnro/e/Kw==
X-Received: by 2002:a17:906:9f03:b0:877:962f:be0a with SMTP id fy3-20020a1709069f0300b00877962fbe0amr15452431ejc.37.1674564224281;
        Tue, 24 Jan 2023 04:43:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtck9VEMiadxtabJ8O0BcOlXlrYc6o9yw7xp1BvmU81Rwlyp1HSrONtYwjv37EYUPFunIpcPQ==
X-Received: by 2002:a17:906:9f03:b0:877:962f:be0a with SMTP id fy3-20020a1709069f0300b00877962fbe0amr15452422ejc.37.1674564224081;
        Tue, 24 Jan 2023 04:43:44 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t5-20020a170906268500b0073d796a1043sm839770ejc.123.2023.01.24.04.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 04:43:43 -0800 (PST)
Message-ID: <09ea7085-48c6-cf44-2a34-c7a43e4be9b8@redhat.com>
Date:   Tue, 24 Jan 2023 13:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: apple_gmux: Drop no longer used ACPI_VIDEO
 Kconfig dependency
Content-Language: en-US, nl
To:     Lukas Wunner <lukas@wunner.de>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20230123154512.852921-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230123154512.852921-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/23/23 16:45, Hans de Goede wrote:
> The apple_gmux code no longer uses any symbols from the ACPI_VIDEO code,
> so that dependency can be dropped.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 5692385e2d26..ec7c2b4e1721 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -214,7 +214,6 @@ config APPLE_GMUX
>  	depends on PNP
>  	depends on BACKLIGHT_CLASS_DEVICE
>  	depends on BACKLIGHT_APPLE=n || BACKLIGHT_APPLE
> -	depends on ACPI_VIDEO=n || ACPI_VIDEO
>  	help
>  	  This driver provides support for the gmux device found on many
>  	  Apple laptops, which controls the display mux for the hybrid

