Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE36C433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 11:51:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0943E221F9
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 11:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbhADLvk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 06:51:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59185 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726503AbhADLvk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 06:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609761013;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lLWyljzUtO3IjuvG+qREE3T0k5+eV66pNsBKM4DgVb0=;
        b=VJtpu5s2ga2TUE4kZ8oSCvsxY6sDi6aZgPJIdNd2PC5/eNujVOGLRo/g4aHH8diOC+szAT
        spmmPdbTO6E0zg9dCPW9EAHKjqvCypjs9ddYMfmexzAjBygrk/saLNa/k8bmSv0InH0Tl6
        R067M1VZmnhBh7Rns1cctxizkVXO12g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-CbjSY1_bM-KBVm4jFQGc7g-1; Mon, 04 Jan 2021 06:50:11 -0500
X-MC-Unique: CbjSY1_bM-KBVm4jFQGc7g-1
Received: by mail-ej1-f70.google.com with SMTP id w6so6906347ejo.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jan 2021 03:50:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lLWyljzUtO3IjuvG+qREE3T0k5+eV66pNsBKM4DgVb0=;
        b=TYeV2tfUwngk46FtP8461io6h+bXLCpckiIbIzb1S0N/HC3X6/2OCxStlCFppSvgaK
         JvzDg49QbWMvvQp9tqnbf8zBNqc8BK5vI3ioBlO5TzobQzjjlv9Hd+A3fEhsWlKGpWpM
         WUne+nRXEa5Wu+tCELRgZpxxk23F5qWVf1Cg4+dBA0VSiVUycMX4EDMu0tp5oMBh3o3n
         5boj2svoyJ9maDO66RlmqHEuDoGDB0WygkwdR28/PphMTc47FAHWyvJLvlKMrmWYVdH/
         QwdeNB4grYgYVOAFilOHrUIBn0j9dd+EN695fm5yzRY5QODNx7H6oLB6DiZ/1QV4ZECi
         RFGQ==
X-Gm-Message-State: AOAM532UBs1F/Xy3h11ktGupE5cDNEWw3htz9YpXhyosiZuk4N+Q8oYb
        wACD/ZGRWbi495ulFEFCk+oTjILj/o3/GVKRnqqKrLKRFMsAjpTE5aAP3djCu4unZm/EIv4chJI
        mfLpJlE6A17Mhk4yAu6fKuUj6qfQcvsoLYw==
X-Received: by 2002:a17:906:c82c:: with SMTP id dd12mr67171616ejb.66.1609761010242;
        Mon, 04 Jan 2021 03:50:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzXmAVgRZc/iL7nLiwjHIdN8fMZY6cZJP4OE2raK2iWJrxuv0qaq5iAUv2emX0OnImviJHow==
X-Received: by 2002:a17:906:c82c:: with SMTP id dd12mr67171602ejb.66.1609761010042;
        Mon, 04 Jan 2021 03:50:10 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id cc8sm44561469edb.17.2021.01.04.03.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 03:50:09 -0800 (PST)
Subject: Re: [PATCH] platform/surface: SURFACE_PLATFORMS should depend on ACPI
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201216133752.1321978-1-geert@linux-m68k.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <faae612b-1e77-a40f-9449-f2d7fd2d33c4@redhat.com>
Date:   Mon, 4 Jan 2021 12:50:09 +0100
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

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

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

