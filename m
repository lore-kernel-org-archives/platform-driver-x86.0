Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90ECC4361B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 14:03:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 995E2233A0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 14:03:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgLPOD3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Dec 2020 09:03:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38501 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726332AbgLPOD2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Dec 2020 09:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608127320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sIT/U1zUcAUrkDXkv6VWKg26my/iL2ARrpTxUVfDaBY=;
        b=Do02I8EnxHfD/0TeQtmS6gfjHMxcM3fQnVVN6Z1zqvJUFnrVfYlPXf+WN3bkVA7c6DVxgr
        j70RfYU+wmYGStxeGiGRKpBA4zlMOID4TGaFnY9l9KOpXyayFF305l/HcRPJLDNMBIg15r
        rfkjPaT20Hc29gnZPZsobyYJfwhXxxA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-8I2vIjrHPFy7DJ4UvZGfww-1; Wed, 16 Dec 2020 09:01:58 -0500
X-MC-Unique: 8I2vIjrHPFy7DJ4UvZGfww-1
Received: by mail-ed1-f70.google.com with SMTP id f19so11759836edq.20
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Dec 2020 06:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sIT/U1zUcAUrkDXkv6VWKg26my/iL2ARrpTxUVfDaBY=;
        b=ofM0NMqtG//+6YH3vHmt8XgpxhavZbbec9zmDZpRx/amsyBAzeUnSSHEUKEW0VBuEd
         Cj70BGr6IpCWzB5JWWqFapPABP1rdPA2yR1kvSU7W3iv29ih0MpyNZfZcHMd8ja9/nl0
         MZ6uX1KVFUgWAW9xGTXpIfm7yjHUKCDHm8niYqtrlbI5OJTashWQfmeIPNgP+InGMpcD
         AwrEeK4BDwBtDTkWUvbnojNcE6uZRE+tqeCBSan9kHzV3/ZJtX42l3JGcA6ZaAH8A7HW
         PcsvNl0hUJ8pN91fd1OwEwKOC6NN4XZ5kmp+heiKUdDle1AE4X3KuI/pTGSX0c7K4kc4
         TJ1g==
X-Gm-Message-State: AOAM53273xF2CYRfdZrnvZFQkUayy0jcnvMJoUyd/vfigWkxgQq0LyET
        YA+GuLAZyRTVZa9PxMwSyE5PUgNMa/7L2k6W/lpyXqlgiWCMxqSpiP6fGdpxvTLTMs+ZXZjIP8g
        3mUSNsTDL91nZzPeqsogRBrX6aIq87K/t9g==
X-Received: by 2002:a17:906:f8d4:: with SMTP id lh20mr31195339ejb.442.1608127316799;
        Wed, 16 Dec 2020 06:01:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0Axzb73vQVIPuNbLIMIUfjTGEA8B8FRAq8n/DMjmv0ieDm2eccR281AAMjRXzok73L6ofkg==
X-Received: by 2002:a17:906:f8d4:: with SMTP id lh20mr31195324ejb.442.1608127316575;
        Wed, 16 Dec 2020 06:01:56 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id g18sm20649849edt.2.2020.12.16.06.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Dec 2020 06:01:55 -0800 (PST)
Subject: Re: [PATCH] platform/surface: SURFACE_PLATFORMS should depend on ACPI
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201216133752.1321978-1-geert@linux-m68k.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <aa101c72-2d15-efa8-5b44-479315e24a93@redhat.com>
Date:   Wed, 16 Dec 2020 15:01:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201216133752.1321978-1-geert@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/16/20 2:37 PM, Geert Uytterhoeven wrote:
> All Microsoft Surface platform-specific device drivers depend on ACPI,
> but the gatekeeper symbol SURFACE_PLATFORMS does not.  Hence when the
> user is configuring a kernel without ACPI support, he is still asked
> about Microsoft Surface drivers, even though this question is
> irrelevant.
> 
> Fix this by moving the dependency on ACPI from the individual driver
> symbols to SURFACE_PLATFORMS.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Maximilian, can I have your ack or reviewed-by for this
(assuming you agree with this change) ?

Regards,

Hans

> ---


>  drivers/platform/surface/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/surface/Kconfig b/drivers/platform/surface/Kconfig
> index 33040b0b3b799c2d..2c941cdac9eedc6f 100644
> --- a/drivers/platform/surface/Kconfig
> +++ b/drivers/platform/surface/Kconfig
> @@ -5,6 +5,7 @@
>  
>  menuconfig SURFACE_PLATFORMS
>  	bool "Microsoft Surface Platform-Specific Device Drivers"
> +	depends on ACPI
>  	default y
>  	help
>  	  Say Y here to get to see options for platform-specific device drivers
> @@ -29,20 +30,19 @@ config SURFACE3_WMI
>  
>  config SURFACE_3_BUTTON
>  	tristate "Power/home/volume buttons driver for Microsoft Surface 3 tablet"
> -	depends on ACPI && KEYBOARD_GPIO && I2C
> +	depends on KEYBOARD_GPIO && I2C
>  	help
>  	  This driver handles the power/home/volume buttons on the Microsoft Surface 3 tablet.
>  
>  config SURFACE_3_POWER_OPREGION
>  	tristate "Surface 3 battery platform operation region support"
> -	depends on ACPI && I2C
> +	depends on I2C
>  	help
>  	  This driver provides support for ACPI operation
>  	  region of the Surface 3 battery platform driver.
>  
>  config SURFACE_GPE
>  	tristate "Surface GPE/Lid Support Driver"
> -	depends on ACPI
>  	depends on DMI
>  	help
>  	  This driver marks the GPEs related to the ACPI lid device found on
> @@ -52,7 +52,7 @@ config SURFACE_GPE
>  
>  config SURFACE_PRO3_BUTTON
>  	tristate "Power/home/volume buttons driver for Microsoft Surface Pro 3/4 tablet"
> -	depends on ACPI && INPUT
> +	depends on INPUT
>  	help
>  	  This driver handles the power/home/volume buttons on the Microsoft Surface Pro 3/4 tablet.
>  
> 

