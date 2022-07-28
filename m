Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A199C19F2B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 18:33:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbiG1SdK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbiG1SdJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 14:33:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3EF6774DF5
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659033187;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AnwrS3QG5lQ/HFybxQGG7GTUMb3M7fOrNMLIdEswKn0=;
        b=fdz9HcNut5ODQsKFOknnIiizG5U60yfvz0yjYQtx1lXUHH6yEUPodzvXa9ItSklWbDuwHL
        YhCmlkAmN85c4CL88UWhTPQ6yVZyW752MZ75QMmq/+OfW2tsc1bSm1XMEeLkStLM6r4+qv
        JqNluMYQ4pau/4sPf6VqB61E8fV01dU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-bArS4yJENX6fpqwEpE7OpQ-1; Thu, 28 Jul 2022 14:33:05 -0400
X-MC-Unique: bArS4yJENX6fpqwEpE7OpQ-1
Received: by mail-ej1-f71.google.com with SMTP id hp13-20020a1709073e0d00b0072b812bc5e9so903884ejc.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AnwrS3QG5lQ/HFybxQGG7GTUMb3M7fOrNMLIdEswKn0=;
        b=N7IvRFIsLfiqCgYnVAlwBTxs85UbSDWdVaekxbfbXr2g0wM7KBvWaxd9EdYcW6LhH+
         +r99XIjeiF2LziqvNxS9W+apebDjhQoYd1xgdLK4ZIH26X3m8bQnXOWs6r6RALPNenE9
         jEGyo3jXRZ5wWl6zN4q2PV658TVM4KyeXaYLks4lzeetPAPpfD84VJKJs3/OD7yWDGoB
         7Go24Wnp06U1yogSW4Sozz6V6CN/+cVL9KxskgvXQcbaiv75iO1qD1CJRj3SgQ5cUbnG
         DsNlQWpqO15uA+7/OeQHeiDJOnD1g4eCNt7t3C9eDlIz+HeLaqtXzKDex6+9wnBm6rye
         OVwg==
X-Gm-Message-State: AJIora9Sgm4oEoeumz+P0lKXs4dQi5lezl2kXYldd8fkat8jXlJ3gh+2
        W4SfdON6kEkf47vqZ/MLB/bYRA+exrbmQUMICckDYJ+AYGIbaYkayBSCbtH53Lq/ooVfkDL/f2N
        Jg3X70sj9+0Dc/J/yvk+HYCXTd9Bb//MzPw==
X-Received: by 2002:a05:6402:64c:b0:43c:ea8e:85d6 with SMTP id u12-20020a056402064c00b0043cea8e85d6mr228272edx.269.1659033183292;
        Thu, 28 Jul 2022 11:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v6jMX+dL/aR+KCCQhisVrXzLNFfAbYhLOElpzO/t39tU0Nz9HTKclrOheDtnessZNd6m87uQ==
X-Received: by 2002:a05:6402:64c:b0:43c:ea8e:85d6 with SMTP id u12-20020a056402064c00b0043cea8e85d6mr228236edx.269.1659033182840;
        Thu, 28 Jul 2022 11:33:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id sy13-20020a1709076f0d00b00722d5b26ecesm670162ejc.205.2022.07.28.11.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 11:33:02 -0700 (PDT)
Message-ID: <5f0b98a5-1929-a78e-4d44-0bb2aec18b5a@redhat.com>
Date:   Thu, 28 Jul 2022 20:33:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] platform/x86: pmc_atom: Add DMI quirk for Lex 3I380A/CW
 boards
Content-Language: en-US
To:     "Matwey V. Kornilov" <matwey@sai.msu.ru>
Cc:     andriy.shevchenko@linux.intel.com, carlo@endlessm.com,
        davem@davemloft.net, hkallweit1@gmail.com, js@sig21.net,
        linux-clk@vger.kernel.org, linux-wireless@vger.kernel.org,
        matwey.kornilov@gmail.com, mturquette@baylibre.com,
        netdev@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
        sboyd@kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul.gortmaker@windriver.com, stable@vger.kernel.org
References: <20220727153232.13359-1-matwey@sai.msu.ru>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220727153232.13359-1-matwey@sai.msu.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/27/22 17:32, Matwey V. Kornilov wrote:
> Lex 3I380A/CW (Atom E3845) motherboards are equipped with dual Intel I211
> based 1Gbps copper ethernet:
> 
>      http://www.lex.com.tw/products/pdf/3I380A&3I380CW.pdf
> 
> This patch is to fix the issue with broken "LAN2" port. Before the
> patch, only one ethernet port is initialized:
> 
>      igb 0000:01:00.0: added PHC on eth0
>      igb 0000:01:00.0: Intel(R) Gigabit Ethernet Network Connection
>      igb 0000:01:00.0: eth0: (PCIe:2.5Gb/s:Width x1) 4c:02:89:10:02:e4
>      igb 0000:01:00.0: eth0: PBA No: FFFFFF-0FF
>      igb 0000:01:00.0: Using MSI-X interrupts. 2 rx queue(s), 2 tx queue(s)
>      igb: probe of 0000:02:00.0 failed with error -2
> 
> With this patch, both ethernet ports are available:
> 
>      igb 0000:01:00.0: added PHC on eth0
>      igb 0000:01:00.0: Intel(R) Gigabit Ethernet Network Connection
>      igb 0000:01:00.0: eth0: (PCIe:2.5Gb/s:Width x1) 4c:02:89:10:02:e4
>      igb 0000:01:00.0: eth0: PBA No: FFFFFF-0FF
>      igb 0000:01:00.0: Using MSI-X interrupts. 2 rx queue(s), 2 tx queue(s)
>      igb 0000:02:00.0: added PHC on eth1
>      igb 0000:02:00.0: Intel(R) Gigabit Ethernet Network Connection
>      igb 0000:02:00.0: eth1: (PCIe:2.5Gb/s:Width x1) 4c:02:89:10:02:e5
>      igb 0000:02:00.0: eth1: PBA No: FFFFFF-0FF
>      igb 0000:02:00.0: Using MSI-X interrupts. 2 rx queue(s), 2 tx queue(s)
> 
> The issue was observed at 3I380A board with BIOS version "A4 01/15/2016"
> and 3I380CW board with BIOS version "A3 09/29/2014".
> 
> Reference: https://lore.kernel.org/netdev/08c744e6-385b-8fcf-ecdf-1292b5869f94@redhat.com/
> Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
> Cc: <stable@vger.kernel.org> # v4.19+
> Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>


Thank you for the patch.

The last week I have received 2 different patches adding
a total of 3 new "Lex BayTrail" entries to critclk_systems[]
on top of the existing 2.

Looking at: https://www.lex.com.tw/products/embedded-ipc-board/
we can see that Lex BayTrail makes many embedded boards with
multiple ethernet boards and none of their products are battery
powered so we don't need to worry (too much) about power consumption
when suspended.

So instead of adding 3 new entries I've written a patch to
simply disable the turning off of the clocks on all
systems which have "Lex BayTrail" as their DMI sys_vendor:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=review-hans&id=c9d959fc32a5f9312282817052d8986614f2dc08

I've added a Reported-by tag to give you credit for the work
you have done on this.

I will send this alternative fix to Linus as part of
the other pdx86 patches for 5.21.

Regards,

Hans




> ---
>  drivers/platform/x86/pmc_atom.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index b8b1ed1406de..5dc82667907b 100644
> --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -388,6 +388,24 @@ static const struct dmi_system_id critclk_systems[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "CEC10 Family"),
>  		},
>  	},
> +	{
> +		/* pmc_plt_clk* - are used for ethernet controllers */
> +		.ident = "Lex 3I380A",
> +		.callback = dmi_callback,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "3I380A"),
> +		},
> +	},
> +	{
> +		/* pmc_plt_clk* - are used for ethernet controllers */
> +		.ident = "Lex 3I380CW",
> +		.callback = dmi_callback,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "3I380CW"),
> +		},
> +	},
>  	{
>  		/* pmc_plt_clk0 - 3 are used for the 4 ethernet controllers */
>  		.ident = "Lex 3I380D",

