Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5488C43461
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 18:37:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94B46206D4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 18:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h4fHomDn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgIQShp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 14:37:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51711 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728109AbgIQRFb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 13:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600362329;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ViRKiaHGNL6zjgr6AuF0d906JEay5J9deMU/dB7bn6A=;
        b=h4fHomDnOxa0czXo2skufg96fTBNf2i/0w/aoo7hUqSJMJHLFk69KGGYr+aI/A72eBz9Bx
        P5eqViD1lRjskLJGMVpjiYL80InYRhzreoM9Asj2zVniN1iLD/7ttqBmWLdcwIil9RqE0l
        R8wQbTnGBS/XE6eKjutPfbPKwd9/mfw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-Ru9B_aW2MGi8dtvgAF8Aag-1; Thu, 17 Sep 2020 13:05:27 -0400
X-MC-Unique: Ru9B_aW2MGi8dtvgAF8Aag-1
Received: by mail-ej1-f71.google.com with SMTP id i14so1153348ejc.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 10:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ViRKiaHGNL6zjgr6AuF0d906JEay5J9deMU/dB7bn6A=;
        b=OsYDveJgufkaGQANW8Dz01/VF0C8nzcBzLaw/Wr0CmCkFo98Ugg/BHP6B5xlkS/zKX
         eUHGl+M2XZ3cM3nzxJ2Mri2IDXQvSpr35sAQsI7Gca15i8/1xBesPQlsaoamMzSrO12x
         0xb1g3tLLKxWp2p7PhwPZGfSkaoVHx3QYhZN6XsuyEvp59zjTBp7/y48voeVCTklGxOa
         6J9Y4JXCdzqvam+dTfiqTnIxABya5tHR4tSQ6VLO/lbiNMKf2yUiHExE7/EKQzL+z9ZC
         6atVTBFyXh6JhmCJbJ4vI/L4xAgbiksugKdY2z1icTmJ0nZiykczpyfa+vwv6EzwYJsI
         37UQ==
X-Gm-Message-State: AOAM531tm7ut2EJEv4/cRlOwmC+KBCBgGXTLUtPANlh9shFSi37+o54D
        tEmvNxEQ9AsqreppSPxfCW4rsJHrXLLQbvyE3IeTzl8SKKtOSRsHiZ5LJ1bl1vtgSyBn/Y6RUCb
        Hh/AEfrYE51XyV+aYihPqfXQGYaXu1xuBrw==
X-Received: by 2002:a17:906:fb8c:: with SMTP id lr12mr33279661ejb.9.1600362325856;
        Thu, 17 Sep 2020 10:05:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUSg9ICNcbEeI+QynKZEArbMo/daqfzgQaqaCc2Y2LV3RyD5NkSKmKIzdOHFWq1X387N2LTg==
X-Received: by 2002:a17:906:fb8c:: with SMTP id lr12mr33279637ejb.9.1600362325653;
        Thu, 17 Sep 2020 10:05:25 -0700 (PDT)
Received: from x1.localdomain ([109.37.143.101])
        by smtp.gmail.com with ESMTPSA id w1sm206505eds.18.2020.09.17.10.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 10:05:25 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: fix kconfig dependency warning for
 FUJITSU_LAPTOP
To:     Necip Fazil Yildiran <fazilyildiran@gmail.com>, andy@infradead.org
Cc:     matan@svgalib.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, paul@pgazz.com, jeho@cs.utexas.edu
References: <20200917161652.147616-1-fazilyildiran@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <772f32e2-342f-bdbf-7753-2ee54efebaaf@redhat.com>
Date:   Thu, 17 Sep 2020 19:05:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917161652.147616-1-fazilyildiran@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/17/20 6:16 PM, Necip Fazil Yildiran wrote:
> When FUJITSU_LAPTOP is enabled and NEW_LEDS is disabled, it results in the
> following Kbuild warning:
> 
> WARNING: unmet direct dependencies detected for LEDS_CLASS
>    Depends on [n]: NEW_LEDS [=n]
>    Selected by [y]:
>    - FUJITSU_LAPTOP [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && ACPI [=y] && INPUT [=y] && BACKLIGHT_CLASS_DEVICE [=y] && (ACPI_VIDEO [=n] || ACPI_VIDEO [=n]=n)
> 
> The reason is that FUJITSU_LAPTOP selects LEDS_CLASS without depending on
> or selecting NEW_LEDS while LEDS_CLASS is subordinate to NEW_LEDS.
> 
> Honor the kconfig menu hierarchy to remove kconfig dependency warnings.
> 
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Fixes: d89bcc83e709 ("platform/x86: fujitsu-laptop: select LEDS_CLASS")
> Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>

Thank you, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/platform/x86/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 40219bba6801..3cd2b99628ba 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -469,6 +469,7 @@ config FUJITSU_LAPTOP
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	depends on ACPI_VIDEO || ACPI_VIDEO = n
>   	select INPUT_SPARSEKMAP
> +	select NEW_LEDS
>   	select LEDS_CLASS
>   	help
>   	  This is a driver for laptops built by Fujitsu:
> 

