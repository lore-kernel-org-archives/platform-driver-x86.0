Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A9BC38142
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Jan 2023 09:49:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233200AbjA0Js4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 27 Jan 2023 04:48:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232078AbjA0Jsk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Jan 2023 04:48:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68B22820E7
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jan 2023 01:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674812849;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zPvO5hCPuj5HXoU2KLCIKyuslLvkxuw/GDDgrq16R18=;
        b=P740As2cDYRauLLhtHuY1ggECDLqBLWPqG2lvWYQ/KQAmA3NcfgpQsCpaPfTb2ZrjdlQYm
        kaclDUHgpMvzxc+E4A6JSW+tPFHxxi9i0S3M2FgGdYrgAGoSNSw4U9ZzUwsFc1fbX+sYeS
        NpVGJzhIysn2GfacTZgKrIOLKGJI86s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-363-VQ6dkEmSM7KYJn5R0trkEw-1; Fri, 27 Jan 2023 04:47:28 -0500
X-MC-Unique: VQ6dkEmSM7KYJn5R0trkEw-1
Received: by mail-ej1-f72.google.com with SMTP id sb39-20020a1709076da700b0086b1cfb06f0so3107209ejc.4
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jan 2023 01:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPvO5hCPuj5HXoU2KLCIKyuslLvkxuw/GDDgrq16R18=;
        b=VTNjxiAPuyIkyuloiPyWxXLDOvU0WO+XjXeyXax+CuePHK1Tc/8y8p/bzDexaiEypt
         afYSaEdF+YVO3QTm5JU2NGNxxoVDeVyBXD/y81UMz33tM7MHTiThezIW4n5MXzFZA6VJ
         KHLcA1pC1WAEZAXFblNcYwjG7rTuaG1ZcAzv8K3XC6odKbHIttTNtODcMMe+eFKoVPDi
         bDESiLKEiQNzMK08SdqP5TuUPQLhfYaBPNO4w9VeIEXtXYKyTjq62Ks4MsXNHBURBeUI
         8brftUuRmxhRofTAUu3+VUYUbCRXaa8uqkyzBHtmjOX2C0owHvldTopTeCJ2jiXViNnW
         /Cxw==
X-Gm-Message-State: AO0yUKU4cQNj97POP+qSQoBM8kymHrahOUo/prPfOsCBZgw1rr4X4rAU
        vaydY+alGC+acEdQq3qcyhArQ5GoYQNEyX9+hKPbf0VBgPRGKQchMaPvhqFVZn6NWRRiZmkRMc+
        6nZeGR2JB5MTkW5eXZMbcgGnQWbwx28vTNg==
X-Received: by 2002:a50:ed82:0:b0:4a2:1f2:ac07 with SMTP id h2-20020a50ed82000000b004a201f2ac07mr1402067edr.10.1674812847085;
        Fri, 27 Jan 2023 01:47:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+Gikoz+rewTlYADpShw9ZnVnOPDQX6YB6eJeB19KO6mjSjomQveMq8OHPZu62BGytpb7pWIQ==
X-Received: by 2002:a50:ed82:0:b0:4a2:1f2:ac07 with SMTP id h2-20020a50ed82000000b004a201f2ac07mr1402054edr.10.1674812846925;
        Fri, 27 Jan 2023 01:47:26 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e24-20020a17090681d800b0087bda70d3efsm431545ejx.118.2023.01.27.01.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 01:47:26 -0800 (PST)
Message-ID: <06bbd154-0777-11d5-f9db-65f6f701628d@redhat.com>
Date:   Fri, 27 Jan 2023 10:47:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86/amd: pmc: add CONFIG_SERIO dependency
Content-Language: en-US, nl
To:     Arnd Bergmann <arnd@kernel.org>, Mark Gross <markgross@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230127093950.2368575-1-arnd@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230127093950.2368575-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/27/23 10:39, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Using the serio subsystem now requires the code to be reachable:
> 
> x86_64-linux-ld: drivers/platform/x86/amd/pmc.o: in function `amd_pmc_suspend_handler':
> pmc.c:(.text+0x86c): undefined reference to `serio_bus'
> 
> Add the usual dependency: as other users of serio use 'select'
> rather than 'depends on', use the same here.
> 
> Fixes: 8e60615e8932 ("platform/x86/amd: pmc: Disable IRQ1 wakeup for RN/CZN")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks Arnd, I'll include this in my next fixes pull-req to Linus.

Regards,

Hans


> ---
>  drivers/platform/x86/amd/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index a825af8126c8..2ce8cb2170df 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -8,6 +8,7 @@ source "drivers/platform/x86/amd/pmf/Kconfig"
>  config AMD_PMC
>  	tristate "AMD SoC PMC driver"
>  	depends on ACPI && PCI && RTC_CLASS
> +	select SERIO
>  	help
>  	  The driver provides support for AMD Power Management Controller
>  	  primarily responsible for S2Idle transactions that are driven from

