Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BC3CA0EC8
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:07:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355897AbjIKWCR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236791AbjIKL0J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 07:26:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0405ACDD
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 04:25:18 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-EpeDcTNNNSqyMfxNxrkoaw-1; Mon, 11 Sep 2023 07:25:17 -0400
X-MC-Unique: EpeDcTNNNSqyMfxNxrkoaw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a348facbbso299875166b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 04:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694431516; x=1695036316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Iim/K20vnt05KkdZYOYBtAD92BDdr0wfxtmdMEpivQ=;
        b=np/Bt8Z5GUkx+6tvriiKNla96afCoW3VpcuQV0HnvNMkB9n+sZ8MLM0s085sz2aTCv
         +okMKfRBG0zttigwWH6zcS/cQqP2HmI+EnO6wwH+sda3pG6F0MqjNbWbTIoKfnfGykEI
         nbh2wUT+85uyGIHDnlej3oSDm7p94XW+8go3I/lSxjLgI+r24SUZXWGwYZvS/ObqgqWU
         0XWGt1pW3jNqP1k4Uh2PuyOIACkFqS4CY3wjQfflBhuiBfBBaJrM0khm/DSinxV+g8VG
         Ly4fJtwSizgpNfC5WY6he9kJW3DrWjg0zgMGvHEvS5k1qbusO71uJFmdCgXZRC/8uHlZ
         l5EA==
X-Gm-Message-State: AOJu0YwAI3CRYXqWUZas5EVm0GTFlB1Zxtd2mzIIlWg7EQKrWHm2pmte
        L/RcoK+qoAEbtuDY+Zmyoi5Rflnk+c2IZUdAYMPVIa6yVvZ0A4iDBXxiSNXouuQoRc7tNpWzqhH
        6meNfj1t/HhDG+VSljnUmx7MZfSxOTYIE5A==
X-Received: by 2002:a17:907:a073:b0:9a1:d400:39e5 with SMTP id ia19-20020a170907a07300b009a1d40039e5mr7153725ejc.4.1694431515986;
        Mon, 11 Sep 2023 04:25:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRmzBlFjuupO/WhzEW9QA8x/A7Crw88ZDujh/u8xJM8zhdS52wjhVtQr5s2VmPio2T37TxEA==
X-Received: by 2002:a17:907:a073:b0:9a1:d400:39e5 with SMTP id ia19-20020a170907a07300b009a1d40039e5mr7153710ejc.4.1694431515670;
        Mon, 11 Sep 2023 04:25:15 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id z20-20020a170906241400b009829d2e892csm5243509eja.15.2023.09.11.04.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:25:14 -0700 (PDT)
Message-ID: <f1ac222b-00ce-70cd-2d26-d66bc0b0ef70@redhat.com>
Date:   Mon, 11 Sep 2023 13:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] platform/mellanox: NVSW_SN2201 should depend on ACPI
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Andi Shyti <andi.shyti@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1693828363.git.geert+renesas@glider.be>
 <ec5a4071691ab08d58771b7732a9988e89779268.1693828363.git.geert+renesas@glider.be>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ec5a4071691ab08d58771b7732a9988e89779268.1693828363.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/4/23 14:00, Geert Uytterhoeven wrote:
> The only probing method supported by the Nvidia SN2201 platform driver
> is probing through an ACPI match table.  Hence add a dependency on
> ACPI, to prevent asking the user about this driver when configuring a
> kernel without ACPI support.
> 
> Fixes: 662f24826f954d49 ("platform/mellanox: Add support for new SN2201 system")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Note I'm only picking up PATCH 1/2. I expect 2/2 to be merged
through the i2c tree.

Regards,

Hans



> ---
>  drivers/platform/mellanox/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
> index 382793e73a60a8b3..30b50920b278c94b 100644
> --- a/drivers/platform/mellanox/Kconfig
> +++ b/drivers/platform/mellanox/Kconfig
> @@ -80,8 +80,8 @@ config MLXBF_PMC
>  
>  config NVSW_SN2201
>  	tristate "Nvidia SN2201 platform driver support"
> -	depends on HWMON
> -	depends on I2C
> +	depends on HWMON && I2C
> +	depends on ACPI || COMPILE_TEST
>  	select REGMAP_I2C
>  	help
>  	  This driver provides support for the Nvidia SN2201 platform.

